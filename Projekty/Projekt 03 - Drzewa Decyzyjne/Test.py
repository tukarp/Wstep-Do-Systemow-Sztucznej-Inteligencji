# Imoportowanie bibliotek
from sklearn.model_selection import train_test_split
from DecisionTree import DecisionTree
from sklearn import datasets
import numpy as np


# Metoda obliczania dokładności
def accuracy(y_true, y_pred):
    return np.sum(y_true == y_pred) / len(y_true)  # Zwrócenie dokładności


# Main
# Utworzenie zmiennych
data = datasets.load_iris()  # Wczytanie danych
X, y = data.data, data.target  # Podział danych na cechy i etykiety

X_train, X_test, y_train, y_test = train_test_split(  # Podział danych na zbiór uczący i testowy
    X, y, test_size=0.2, random_state=1234
)

clf = DecisionTree(max_depth=10)  # Utworzenie obiektu klasyfikatora
clf.fit(X_train, y_train)  # Dopasowanie klasyfikatora do danych
predictions = clf.predict(X_test)  # Przewidywanie klas

acc = accuracy(y_test, predictions)  # Obliczenie dokładności
print(acc)  # Wyświetlenie dokładności
