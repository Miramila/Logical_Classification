import pandas as pd
from transformers import Trainer, TrainingArguments
from transformers import DataCollatorWithPadding, AutoTokenizer, AutoModelForSequenceClassification
import torch
import numpy as np
from tqdm import tqdm
from datasets import load_dataset
from collections import defaultdict
from datasets import load_metric
from datasets import Dataset, DatasetDict

from transformers import EvalPrediction
from sklearn.metrics import precision_recall_fscore_support

# import torch
torch.manual_seed(42)
np.random.seed(42)

train_df = pd.read_csv('./dataset/train.csv', sep='\t')
test_df = pd.read_csv('./dataset/dev.csv', sep='\t')
dev_df =  pd.read_csv('./dataset/test.csv', sep='\t')

train_df.rename(columns={'Label': 'labels'}, inplace=True)
test_df.rename(columns={'Label': 'labels'}, inplace=True)
dev_df.rename(columns={'Label': 'labels'}, inplace=True)



train_dataset = Dataset.from_pandas(train_df)
test_dataset = Dataset.from_pandas(test_df)
dev_dataset = Dataset.from_pandas(dev_df)

dataset_dict = DatasetDict({'train': train_dataset, 'test': test_dataset, 'dev': dev_dataset})

# %% [markdown]
# # Task 3.2 Preparing the Data
# 
# Once we have our Dataset created, we need to turn it into features and labels so we can train the model with it.
# 
# ## Task 3.2.1 Tokezing
# 
# Pre-trained language models are each associated with a specific method for tokenizing data, much like how in Homework 1 you write the `tokenize` function that turns strings into discrete features. Huggingface has a fast [`tokenizers`]() package that we will use here through the [`AutoTokenizer`]() class.
# 
# On Huggingface, each model is associated with a particular unique string. For example, the original BERT model is `bert-based-uncased`. You can use this string to look up the corresponding tokenizer with `AutoTokenizer`
# 
# Be sure to set the `model_max_length` argument to indicate what's the maximum length sequence this model can handle.
# 

# %%
# NOTE: you can use this smaller model if you want to get started
# model_name = 'microsoft/MiniLM-L12-H384-uncased'
model_name = "google-bert/bert-base-cased"

# TODO: Load the tokenizer using AutoTokenizer
tokenizer = AutoTokenizer.from_pretrained(model_name)

# %% [markdown]
# ## Task 3.2.2 Converting the labels 
# 
# Each label needs to also be associated with an ID (starting at 0). In 3.2.2, we'll do a _very simple_ pass and **use only one label column** (you'll use more columns later). Your tasks are
# 
# - Create a list of the labels in the dataset.  For Task 3.2.2, *this list should contains only a single label* (for now)
# - Create a mapping from ID to label, and the reverse 
# 

# %%
labels = train_df['labels'].unique()
id2label = {i: label for i, label in enumerate(labels)}
label2id = {label: i for i, label in enumerate(labels)}

# %% [markdown]
# ## Task 3.2.3: Preprocessing the data
# 
# Models are typically fine-tuned using _batches_ rather than single instances. For the attention-based classifier in Homework 2 Part 2, we used a batch size of 1 because of the key challenge in batching over sequences: texts have different lengths, but all items in a batch need to be the same length. 
# 
# Here, we'll use a function to _create_ batches of the same length by padding them with extra tokens typically labeled as `[PAD]`. The underlying model code knows to avoid doing computation with these tokens so they don't have any effect on the text, other than making the tensors all the same size; if you're curious, look around for details of the "attention mask" to see how the "[PAD]" token gets ignored (you'll also see this in the tokenized dataset object too!).
# 
# One of the big reasons we use a `Dataset` is that it supports easy preprocessing to turn the text into IDs and do this truncation for us. We'll define the function below that says how to transform the instances and then call `map` on the dataset to get the preprocessed/tokenized data back out.
# 
# **Important Note**: One key hyperparameter to deal with is the maximum length of the sequence. If you recall from our attention, the attention mechanism is $O(n^2)$ for the length $n$ of a sequence. This means long sequences get very expensive in the kinds of models we'll use here. Since all the items in a batch get padded to the length of either the longest sequence in a batch or the maximum length of the model, one long sequence can mean we use a lot more memory just to hold empty [PAD] tokens. As a result, often we can truncate very long sequences to make them fit in memory, under the assumption that the extra tokens aren't that informative. In the code below, we use the longest sequence in a batch which hopefully helps keep things smaller. However, in your projects, you may explore other truncation strategies.

# %%
def tokenize_function(examples, padding="longest", truncation=True):

    ### TODO: Tokenize the text using the tokenizer using the 
    # specified function arguments
    return tokenizer(examples['text'], padding=padding, truncation=truncation)

# TODO: Call .map on the dataset to tokenize the data
tokenized_datasets = dataset_dict.map(tokenize_function, batched=True)

# %%
# Let's see what all got added to the tokenized_datasets
tokenized_datasets

# %%
# Let's take a look at what we have
example = tokenized_datasets['train'][0]

# We can reverse the tokenization to see the original text too
tokenizer.decode(example['input_ids'])

# %% [markdown]
# ### Decide on where the computation will be
# 
# The deep learning library under all the huggingface code is `torch` which is a set of libraries for doing matrix math quickly. Different hardware have different capabilities for how to do math so torch lets you specify where you want to do the computation with the `device` argument. GPUs are designed to do fast matrix multiplication and so are ideal for our purposes. As you might have noticed in homework 2, `torch` can change the device though and will run just fine (but slower) on the GPU. The code snippet below shows how to choose the device.
# 
# **Important Note:** When doing the computation both the data and the parameters need to be on the same device. This means if you move the pre-trained model to the GPU but the data is sitting on the CPU, the model can't see the data (or vice-versa). This is why you'll see a lot of `something.to(device)` to everything is on the same device.

# %%
# check if gpu is available
# device = 'cpu' 
# if torch.mps.is_available():
#     device = 'mps'
# if torch.cuda.is_available():
#     device = 'cuda'
# print(f"Using '{device}' device")

# %% [markdown]
# ## Task 3.3.1: Getting the model and `Trainer` setup
# 
# Now it's time to bring in the model. Just like with the tokenizer, we can use huggingface's `AutoModelFor[TASK_TYPE]` to load the model for the appropriate task type. In this case, we want to classify a sequence of tokens, so we'll use the `AutoModelForSequenceClassification` class but there are many other options after "For" that you can check out (e.g., for your course project)
# 
# In this case, we need to specify how many classes/labels there are in our data.
# Calculate that from the data above and provide it as an argument when loading the parameters for the pre-trained model we specified.

# %%
# TODO: Load Pre-trained model from HuggingFace Model Hub
model = AutoModelForSequenceClassification.from_pretrained(model_name, num_labels=len(labels))

# %%
## Let's see how many parameters we are going to be changing

def print_trainable_parameters(model):
    """
    Prints the number of trainable parameters in the model.
    """
    trainable_params = 0
    all_param = 0
    for _, param in model.named_parameters():
        all_param += param.numel()
        if param.requires_grad:
            trainable_params += param.numel()
    print(
        f"trainable params: {trainable_params} || all params: {all_param} || trainable%: {100 * trainable_params / all_param}"
    )

print_trainable_parameters(model)

# %% [markdown]
# ## Task 3.3.2 Setting up the training arguments
# 
# There are a lot of options when you fine-tune a model! In homework 2, you saw a few of these when we set the learning rate and number of epochs. When using the huggingface `Trainer` class, we specify all of the training arguments at once in a [`TrainingArguments`](https://huggingface.co/docs/transformers/v4.38.2/en/main_classes/trainer#transformers.TrainingArguments) object. There are a _lot_ of arguments you can specify and for the most part, you do not need to set all of them. Reading that class's documentation can be overwhelming, so don't worry if you don't know what all of them mean.
# 
# Here are a few useful arguments that you'll need to set:
# - `output_dir` - where to save the models. This directory can get very large if you save all the checkpoints!
# - `overwrite_output_dir` - whether to overwrite the previously saved models
# - `learning_rate` - use 2e-5,
# - `per_device_train_batch_size` - how many items per batch. You usually want this to be a power of 2 due to how computers work. Common sizes with GPUs are between 64 and 256, but it will depend a lot on how much memory the GPU has (and how big your sequences are). 
# - `per_device_eval_batch_size` - same as above, but because you're not doing gradient descent on these (just eval), there's less "stuff" needed in memory and this can be a bit larger.
# - `do_eval` - whether do evaluate on the development/validation data periodically during training
# - `seed` - the random seed to use. Use 12345
# - `evaluation_strategy` - when to evaluate the model during training. "epoch" evaluates after the end of every epoch, while "steps" evaluates every `eval_steps`. If you have a very large dataset, you probably want to use "steps" so that you can get periodic updates on how the model is doing. Even though our dataset is relatively small, let's use "steps".
# - `eval_steps` - how many steps between an evaluation on the dev data. For this assignment, use 50 so we can see how our model trains. In real-world scenarios, you'll often have this larger (e.g., 1000) so that you're not spending more of your GPU time evaluating instead of training
# - `save_strategy` - how over to save your model's parameters during training. This is either "epoch" or "steps", where `save_steps` is used. The logic for setting the argument is similar to that for `evaluation_strategy`. Because our dataset is relatively small, use "steps".
# - `save_steps` - how many steps between saving the model's parameters. Typically you set this the same as `eval_steps` which we'll do here.
# - `num_train_epochs` - how many epochs to train for. Use 10 for now.
# - `logging_dir` - where to save the log files.
# - `load_best_model_at_end` -  Whether or not to load the best model found during training at the end of training. When this option is enabled, the best checkpoint will always be saved. This is kind of a sneakily-important argument. If you set this to `True`, the `Trainer` will automatically keep track of what the best model is so far (checked at every `save_strategy`) so you always have a copy of the parameters on disk in the checkpoint file for the best version. If you don't set this, you might keep training and never save your best model! Set this to `True`.
# - `metric_for_best_model` - another important argument: this says how we should define our "best" model in terms of a metric. We could use loss on the training data with "loss", but since we have an evaluation dataset, we'll choose based on performance on that model. When looking at the metrics on the dev/evaluation/validation dataset, all of the metrics get prefixed with "eval_". In this case, use "eval_f1"
# - `greater_is_better` - if we're setting `metric_for_best_model` we need to tell the `Trainer` which direction is better, e.g., lower is better for "loss" but greater is better for metrics like "f1". 
# - `report_to` - the `Trainer` code is hooked into common logging libraries. We'll use `wandb` like in Homework 2. You might not even need to do anything for it to log but you'll need to make sure you can get plots showing up on Weights & Biases for the homework.
# 
# Here are a few useful arguments you won't need here but you might want to try or explore later:
# - `fp16` - Most floating-point computation is done with 32 bits. However, some modern GPUs and even CPUs can support floating-point operations with fewer bits. These operations are faster, though less precise. Because of the sheer number of calculations, it's often useful to prioritize speed and you can turn on 16-bit floating point by setting `fp16=True`. There are a bunch of other options like this if you're curious (good office hours discussion too).
# - `gradient_accumulation_steps` - For complex NLP tasks, sometimes we only have enough GPU memory for very small batches (e.g., 2 or 4 items). However, we can simulate big batches by asking the trainer to _accumulate_ (i.e., sum) the gradients across batches before taking the update step, which allows us to have arbitrarily large "accumulated batches". 
# - `lr_scheduler_type` - In our previous homework, our SGD/AdamW optimizers all used the same learning rate at each step. But our model gets better every step, so sometimes we might want to be able to make smaller updates so we don't change too much and make the model worse. This argument lets you choose different learning rate [schedulers](https://huggingface.co/docs/transformers/v4.38.2/en/main_classes/optimizer_schedules#transformers.SchedulerType) that will dynamically change the learning rate based on how training is going.
# 

# %%
# NOTE: when debugging the evaluation code, feel free to turn down the eval_steps
# to a small number so that training evaluates right away.

training_args = TrainingArguments(
    output_dir='./results',
    overwrite_output_dir=True,
    learning_rate=2e-5,
    per_device_train_batch_size=64,
    per_device_eval_batch_size=64,
    do_eval=True,
    seed = 12345,
    evaluation_strategy='steps',
    eval_steps=50,
    save_strategy='steps',
    save_steps=50,
    num_train_epochs=10,
    logging_dir='./logs',
    load_best_model_at_end=True,
    metric_for_best_model='eval_f1',
    greater_is_better=True,
    report_to='wandb'
)

# %% [markdown]
# ## Task 3.3.3 Defining some evaluation metrics
# 
# How good is our model? We'll need to provide the `Trainer` some function that given some predictions, can evaluate how good the predictions are. When the `Trainer` instance calls this function, it will pass in a tuple that contains the logits of the model's predictions. These are the unnormalized weights for each of the labels (the logit is the inverse function of the sigmoid). We _could_ normalize these back with a softmax, but instead, we can simply figure out which dimension's value is largest and say that's the dimension label.
# 
# The `compute_metrics` function can return a dictionary that maps a metric name to its value. This will let us track multiple metrics over time. All of these metrics also get recorded with `wandb` by `Trainer` too so we'll see how the model trains. **Important Note:** When the `Trainer` class evaluates on the development data, the key names for the matrics get prefixed with "eval_", so if we reported a dictionary with "f1" as a key, we'd see a corresponding metric of "eval_f1" in our logs.
# 
# For our model, we'll compute binary F1. This only keeps track of the positive class, which is appropriate in our case where we want to know whether the model is good at finding a model in terms of its precision and recall. Use the `sklearn` to calculate these.
# 
# **NOTE:** Earlier we had to convert all the labels/classes into IDs starting from 0 and this code helps explain why--each of the classes has its own dimension!
# 
# **NOTE:** The labels we get in the `eval_pred` tuple are the same labels that we specified in our dataset. `Trainer` looks for this column so that it can pass it through the `AutoModel` and have it reported here!

# %%
# Define the metric to use for evaluation

def compute_metrics(eval_pred: EvalPrediction):
    # TODO: 
    # 1. Get the logits and labels from the eval_pred
    # 2. Compute the predictions from the logits
    # 3. Calculate binary precision, recal, and F1
    # 4. Return the values as a dictionary with key names for
    #    indicating the metric
    logits = eval_pred.predictions
    labels = eval_pred.label_ids
    preds = np.argmax(logits, axis=1)
    precision, recall, f1, _ = precision_recall_fscore_support(labels, preds, average='binary')
    return {
        'eval_precision': precision,
        'eval_recall': recall,
        'eval_f1': f1
    }

# %% [markdown]
# ## Task 3.3.4: Setup the `Trainer`
# 
# Finally! Let's specify the `Trainer` that's going to run the training. Most of our arguments and hyperparameters have already been specified in the `TrainingArguments` but there are still a few things we need to specify:
# 
# - `model` - A pre-trained model to fine-tune
# - `args` - the `TrainingArguments` we just defined
# - `train_dataset` - the training portion of the tokenized dataset
# - `eval_dataset` - the portion of the tokenized dataset that we'll use during training to evaluate 
# - `tokenizer` - the tokenizer model used to turn text into sequences
# - `compute_metrics` - the `compute_metrics` function we just defined.
# 

# %%
# TODO: Fill in the Trainer object's arguments
trainer = Trainer(
    model=model,
    args=training_args,
    train_dataset=tokenized_datasets['train'],
    eval_dataset=tokenized_datasets['dev'],
    tokenizer=tokenizer,
    compute_metrics=compute_metrics
)

# %%
# Now let's train!
trainer.train() # 

# %%
# Once we finish training, we can evaluate the model on the dev set. Note that
# since we specified the trainer to load the best model at the end, the 
# trainer will automatically load the best model for us to use here.
trainer.evaluate()

# %%
# TODO: Use the trainer to predict() on the test set and then score the predictions
test_preds = trainer.predict(tokenized_datasets['test'])
print(test_preds.metrics)