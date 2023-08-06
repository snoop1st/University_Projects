import tensorflow as tf
import numpy as np
from tqdm import tqdm

def create_voc(m, n, k):
    (x_train, y_train), (x_test, y_test) = tf.keras.datasets.imdb.load_data(num_words = m, skip_top = n)

    word_index = tf.keras.datasets.imdb.get_word_index()
    index2word = dict((i + 3, word) for (word, i) in word_index.items())
    index2word[0] = '[pad]'
    index2word[1] = '[bos]'
    index2word[2] = '[oov]'
    x_train = np.array([' '.join([index2word[idx] for idx in text]) for text in x_train]) # pairnoyme ta x_train kai ta x_test
    x_test = np.array([' '.join([index2word[idx] for idx in text]) for text in x_test])

#    print("ytrain einai", y_train)
    #print("to x train einai", x_train)

    vocabulary = list() #ftiaxnoyme to lexilogio 
    for text in x_train:
        tokens = text.split()
        vocabulary.extend(tokens)
    vocabulary = set(vocabulary)
   # print(len(vocabulary))
    create_binary_vec(x_train, vocabulary, x_test, y_train, y_test)

def create_binary_vec(x_train, vocabulary, x_test, y_train, y_test): 
    x_train_binary = list()
    x_test_binary = list()
    for text in tqdm(x_train): #dhmioytgoyme pinaka me 0,1. An yparxei kapoia lexh sto lexilogio apothikeyoyme ston pinaka to 1, an den yparxei to 0.
        tokens = text.split()
        binary_vector = list()
        for vocab_token in vocabulary:
            if vocab_token in tokens:
                binary_vector.append(1)
            else:
                binary_vector.append(0)
        x_train_binary.append(binary_vector)

    x_train_binary = np.array(x_train_binary)
#    print("O x train binary einai:",x_train_binary)


    for text in tqdm(x_test): #antistoixa me to x_train
        tokens = text.split()
        binary_vector = list()
        for vocab_token in vocabulary:
            if vocab_token in tokens:
                binary_vector.append(1)
            else:
                binary_vector.append(0)
        x_test_binary.append(binary_vector)

    x_test_binary = np.array(x_test_binary)
#    print(x_train_binary.shape)
    class_priors, feature_probs, n_features = fit(x_train_binary, y_train) 
    predictions = predict(x_test_binary, class_priors, feature_probs, n_features)
    classification_report(y_test, predictions)

def fit(X, y): #synarthsh gia na ypologisoyme thn pithanothta ths kathe lexhs se kathe kathgoria
    n_samples, n_features = X.shape
#    print(n_features)
    probs = []
    #print(X.shape)
    
    # Metraei ta paradeigmata kathe kathgorias
    counts = np.bincount(y)
    # Ypologizei thn pithanothta gia kathe kathgoria
    prior_probs = counts / n_samples

    feature_probs = np.zeros((2, n_features)) #sthn arxh oles oi pithanothtes einai 0
    for c in range(2):
        for i in range(n_features):
            ''' H pithanothta mias lexhs na anhkei sthn thetikh kathgoria  (c)
            einai to athroisma twn deigmatwn opoy h kathgoria einai thetikh kai yparxei h sygkekrimenh lexh
            /
            to athroisma olwn twn deigmatwn poy h kathgoria einai thetikh
            '''
            feature_probs[c, i] = np.sum(X[y == c, i]+1) / (np.sum(y == c) + 2) 
    return prior_probs, feature_probs, n_features
    

def predict(test, prior_probs, feature_probs, n_features): 
    n_samples = test.shape[0]
    predictions = []
    for i in range(n_samples): #kritikes
        probs = prior_probs.copy()
        for c in range(2): #kathgories
            for j in range(n_features): #lexeis
                if test[i, j] == 1: #elegxoyme an yparxei kathe lexh se kritikh
                    probs[c] *= feature_probs[c, j]
                else:
                    probs[c] *= (1 - feature_probs[c, j])
        predictions.append(np.argmax(probs))
    return predictions 


def classification_report(y_test, predictions):
    accuracy = np.mean(predictions == y_test)
    print("Accuracy:", accuracy)
    cnt_pos = 0
    cnt = 0 
    fp = tp = fn = 0
    # calculate precision, recall, and F1 score
    for i in range(len(predictions)): 
        if predictions[i] == y_test[i] == 1:
            tp = tp + 1    
        elif predictions[i] == 1 and y_test[i] == 0:
            fp = fp + 1
        elif predictions[i] == 0 and y_test[i] == 1:
            fn = fn + 1
    precision = tp / (tp + fp)
    print("Precision:", precision)
    recall = tp / (tp + fn)
    print("Recall:", recall)
    f1 = 2 * (precision * recall) / (precision + recall)
    print("F1 Score:", f1)

create_voc(400,100, 200) 






  