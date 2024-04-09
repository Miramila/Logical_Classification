import re
import torch
import pandas as pd
from scipy import sparse
from collections import Counter
from torch import nn, optim, sparse_csr_tensor
from torch.utils import data

class LogisticRegression(nn.Module):
    def __init__(self, n_features): 
        super().__init__()
        self.linear = nn.Linear(n_features, 1)
        self.sigmoid = nn.Sigmoid()
        
    def forward(self, x):
        output =  self.sigmoid(self.linear(x))
        binary_output = torch.where(output > 0.5, torch.tensor(1.0), torch.tensor(0.0))
        return binary_output

def tokenize(string):
    return string.split()

def better_tokenize(string):
    try:
        tokens = re.findall(r'\w+', string)
    except:
        tokens = []
    return [token.lower() for token in tokens]

def build_matrix(doc_list, tokenize_func=better_tokenize, 
                 min_word_freq=2, word_to_idx=None): 
    if not word_to_idx:
        word_cnt_all_docs = Counter()
        vocab = []
        for doc in doc_list:
            word_cnt_all_docs.update(tokenize_func(doc))
        vocab = [word for word, cnt in word_cnt_all_docs.items() if cnt >= min_word_freq]
        word_to_idx = {word: idx for idx, word in enumerate(vocab)}
        vocab = []
    indptr = [0]
    indices = []
    data = []
    for doc in doc_list:
        word_cnt = Counter(tokenize_func(doc))
        for word, cnt in word_cnt.items():
            if word in word_to_idx:
                indices.append(word_to_idx[word])
                data.append(cnt)
        indptr.append(len(indices))
    return sparse.csr_matrix((data, indices, indptr), shape=(len(doc_list), len(word_to_idx)), dtype=int), word_to_idx

def to_sparse_tensor(csr_sparse_matrix):
    return sparse_csr_tensor(csr_sparse_matrix.indptr, csr_sparse_matrix.indices, csr_sparse_matrix.data, 
                             size=csr_sparse_matrix.shape, dtype=torch.float32)

def get_pred(train_file_path='../dataset/train.csv', test_file_path='../dataset/test_answer.csv'): 
    train_set = pd.read_csv(train_file_path)
    train_set['text'] = train_set['context'] + ' ' + train_set['Answer']
    train_set.rename(columns={'Label': 'label'}, inplace=True)
    train_set.drop(columns=['context', 'Answer'], inplace=True)
    doc_list = train_set.text.values.flatten()
    np_sparse_matrix, word_to_idx = build_matrix(doc_list)
    torch_sparse_matrix = to_sparse_tensor(np_sparse_matrix)
    labels = pd.DataFrame(train_set.label).values
    labels = torch.tensor(labels, dtype=torch.float32, requires_grad=True)
    dataset = data.TensorDataset(torch_sparse_matrix, labels)
    dataloader = data.DataLoader(dataset, shuffle=True)

    test_set = pd.read_csv(test_file_path)
    test_set['text'] = test_set['context'] + ' ' + test_set['Answer']
    test_set.rename(columns={'Label': 'label'}, inplace=True)
    test_set.drop(columns=['context', 'Answer'], inplace=True)
    doc_list_test = test_set.text.values.flatten()
    np_sparse_matrix_test, word_to_idx = build_matrix(doc_list_test, word_to_idx=word_to_idx)
    torch_sparse_matrix_test = to_sparse_tensor(np_sparse_matrix_test)
    labels_test = pd.DataFrame(test_set.label).values
    labels_test = torch.tensor(labels_test, dtype=torch.float32)

    model = LogisticRegression(torch_sparse_matrix.size(1))
    criterion = nn.BCELoss()
    optimizer = optim.SGD(model.parameters(), lr=5e-5) #, momentum=0.9, weight_decay=0

    model.train()
    for i, train_data in enumerate(dataloader, 0):
        input, label = train_data
        optimizer.zero_grad()
        output = model(input)
        loss = criterion(output, label)
        loss.backward()
        optimizer.step()

    model.eval()
    tot_output = model(torch_sparse_matrix_test)
    preds = [(output > 0.5) for output in tot_output]
    return preds