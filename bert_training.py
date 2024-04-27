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

train_df = pd.read_csv('./dataset/train_merged_text.csv')
test_df = pd.read_csv('./dataset/test_merged_text.csv')
dev_df =  pd.read_csv('./dataset/dev_merged_text.csv')

train_df = train_df.rename(columns={'Label': 'labels'})
test_df = test_df.rename(columns={'Label': 'labels'})
dev_df = dev_df.rename(columns={'Label': 'labels'})


train_dataset = Dataset.from_pandas(train_df)
test_dataset = Dataset.from_pandas(test_df)
dev_dataset = Dataset.from_pandas(dev_df)

dataset_dict = DatasetDict({'train': train_dataset, 'test': test_dataset, 'dev': dev_dataset})

model_name = "google-bert/bert-base-cased"
tokenizer = AutoTokenizer.from_pretrained(model_name)

labels = train_df['labels'].unique()
id2label = {i: label for i, label in enumerate(labels)}
label2id = {label: i for i, label in enumerate(labels)}

def tokenize_function(examples, padding="longest", truncation=True):
    return tokenizer(examples['text'], padding=padding, truncation=truncation)


tokenized_datasets = dataset_dict.map(tokenize_function, batched=True)

model = AutoModelForSequenceClassification.from_pretrained(model_name, num_labels=len(labels))


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

training_args = TrainingArguments(
    output_dir='./results_bert',
    overwrite_output_dir=True,
    learning_rate=5e-6,
    per_device_train_batch_size=16,
    per_device_eval_batch_size=16,
    do_eval=True,
    seed = 12345,
    evaluation_strategy='epoch',
    save_strategy='epoch',
    num_train_epochs=10,
    logging_dir='./logs',
    load_best_model_at_end=True,
    metric_for_best_model='eval_f1',
    greater_is_better=True,
    report_to='wandb'
)


def compute_metrics(eval_pred: EvalPrediction):
    logits = eval_pred.predictions
    labels = eval_pred.label_ids
    preds = np.argmax(logits, axis=1)
    precision, recall, f1, _ = precision_recall_fscore_support(labels, preds, average='binary')
    return {
        'eval_precision': precision,
        'eval_recall': recall,
        'eval_f1': f1
    }

trainer = Trainer(
    model=model,
    args=training_args,
    train_dataset=tokenized_datasets['train'],
    eval_dataset=tokenized_datasets['dev'],
    tokenizer=tokenizer,
    compute_metrics=compute_metrics
)

trainer.train()
trainer.evaluate()
test_preds = trainer.predict(tokenized_datasets['test'])

# compare to the answer
test_preds = np.argmax(test_preds.predictions, axis=1)
test_answer = pd.read_csv('./dataset/test_answer.csv')['Label']
precision, recall, f1, _ = precision_recall_fscore_support(test_answer, test_preds, average='binary')
print(f"precision: {precision}, recall: {recall}, f1: {f1}")
