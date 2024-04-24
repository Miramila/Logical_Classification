train_file_path = './dataset/train.csv'
test_file_path = './dataset/test_answer.csv'

import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.metrics import f1_score, accuracy_score, precision_score, recall_score
from baseline import get_pred

baseline_results = {}

data = pd.read_csv(test_file_path)
data['text'] = data['context'] + ' ' + data['Answer']
data.rename(columns={'Label': 'label'}, inplace=True)
data.drop(columns=['context', 'Answer'], inplace=True)
labels = np.array(data.label.tolist())
seed = 42
rand_ids = np.random.RandomState(seed).permutation(len(labels))
predicted_labels = labels[rand_ids]
baseline_results['random'] = {'f1': f1_score(labels, predicted_labels), 
                              'accuracy': accuracy_score(labels, predicted_labels), 
                              'precision': precision_score(labels, predicted_labels), 
                              'recall': recall_score(labels, predicted_labels)}

predicted_labels2 = np.array([0]*len(labels))
baseline_results['most_frequent'] = {'f1': f1_score(labels, predicted_labels2), 
                                   'accuracy': accuracy_score(labels, predicted_labels2), 
                                   'precision': precision_score(labels, predicted_labels2), 
                                   'recall': recall_score(labels, predicted_labels2)}

predicted_labels3 = get_pred(train_file_path, test_file_path)
baseline_results['logistic_regression'] = {'f1': f1_score(labels, predicted_labels3),
                                         'accuracy': accuracy_score(labels, predicted_labels3),
                                         'precision': precision_score(labels, predicted_labels3),
                                         'recall': recall_score(labels, predicted_labels3)}

baseline_results_df = pd.DataFrame(baseline_results).T
stacked = baseline_results_df.stack().reset_index()
stacked.columns = ['model', 'metric', 'value']
stacked.to_csv('./results/baseline_results.csv', index=False)
sns.barplot(x='model', y='value', hue='metric', data=stacked)
plt.savefig('./results/baseline_results.png')