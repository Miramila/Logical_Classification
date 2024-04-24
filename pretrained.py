import pandas as pd
from transformers import T5Tokenizer, T5ForConditionalGeneration
from sklearn.metrics import f1_score, accuracy_score, precision_score, recall_score

def get_prompt(df):
    context = df.context
    answer = df.Answer
    return f"""Given that "{context}", do you think this is logically correct: "{answer}".
Answer 1 if it is correct, otherwise answer 0. Your answer:"""

def get_answer(output):
    for char in output:
        if char in ['0', '1']:
            return int(char)

train = pd.read_csv('../dataset/test_answer.csv')

tokenizer = T5Tokenizer.from_pretrained('google/flan-t5-large')
model = T5ForConditionalGeneration.from_pretrained('google/flan-t5-large')
predictions = []
for i in range(len(train)):
    prompt = get_prompt(train.iloc[i])
    inputs = tokenizer(prompt, return_tensors='pt')
    outputs = model.generate(**inputs)
    output = tokenizer.decode(outputs[0])
    predictions.append(get_answer(output))

y_true = train['Label']
y_pred = predictions
f1 = f1_score(y_true, y_pred)
accuracy = accuracy_score(y_true, y_pred)
precision = precision_score(y_true, y_pred)
recall = recall_score(y_true, y_pred)
print(f'F1: {f1}, Accuracy: {accuracy}, Precision: {precision}, Recall: {recall}')