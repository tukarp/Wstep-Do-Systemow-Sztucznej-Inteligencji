# Importowanie bibliotek
import numpy as np
from collections import Counter


# Klasa węzła
class Node:
    # Konstruktor
    def __init__(self, feature=None, threshold=0.0, left=None, right=None, *, value=None):
        self.feature = feature          # Cecha
        self.threshold = threshold      # Próg podziału
        self.left = left                # Lewy podwęzeł
        self.right = right              # Prawy podwęzeł
        self.value = value              # Wartość węzła


    # Metoda sprawdzająca czy węzeł jest liściem
    def is_leaf_node(self):
        return self.value is not None  # Sprawdzenie czy wartość węzła nie jest pusta


# Klasa drzewa decyzyjnego
class DecisionTree:
    # Konstruktor
    def __init__(self, min_samples_split=2, max_depth=100, n_features=None):
        self.min_samples_split = min_samples_split  # Minimalna liczba próbek do podziału
        self.max_depth = max_depth                  # Maksymalna głębokość drzewa
        self.n_features = n_features                # Liczba cech do podziału
        self.root = None                            # Korzeń drzewa


    # Metoda dopasowania drzewa do danych
    def fit(self, X, y):
        self.n_features = X.shape[1] if self.n_features is None else min(self.n_features, X.shape[1])  # Sprawdzenie czy liczba cech do podziału jest większa od liczby cech w danych
        self.root = self._grow_tree(X, y)  # Budowanie drzewa od korzenia


    # Metoda budowania drzewa
    def _grow_tree(self, X, y, depth=0):
        num_samples, num_features = X.shape  # Pobranie liczby próbek i liczby cech
        num_labels = len(np.unique(y))  # Pobranie liczby etykiet
        if (depth >= self.max_depth  # Sprawdzenie czy głębokość drzewa jest większa lub równa maksymalnej głębokości
                or num_labels == 1  # Sprawdzenie czy liczba etykiet jest równa 1
                or num_samples < self.min_samples_split):  # Sprawdzenie czy liczba próbek jest mniejsza od minimalnej liczby próbek do podziału
            counter = Counter(y)  # Obliczenie liczby wystąpień etykiet
            leaf_value = counter.most_common(1)[0][0]  # Pobranie najczęściej występującej etykiety
            return Node(value=leaf_value)  # Utworzenie liścia
        best_feature, best_threshold = self._best_split(X, y)  # Wybór najlepszego podziału
        left_indices, right_indices = self._split(X[:, best_feature], best_threshold)  # Podział danych
        left_subtree = self._grow_tree(X[left_indices], y[left_indices], depth + 1)  # Budowa lewego poddrzewa
        right_subtree = self._grow_tree(X[right_indices], y[right_indices], depth + 1)  # Budowa prawego poddrzewa
        return Node(feature=best_feature, threshold=best_threshold, left=left_subtree, right=right_subtree)  # Utworzenie węzła


    # Metoda przewidywania klas
    def _best_split(self, X, y):
        best_information_gain = -1  # Inicjalizacja najlepszego zysku informacji
        best_threshold = None  # Inicjalizacja najlepszego progu podziału
        best_feature = None  # Inicjalizacja najlepszej cechy
        features = np.random.choice(X.shape[1], self.n_features, replace=False)  # Wybór losowych cech
        for feature in features:  # Iteracja po cechach
            X_column = X[:, feature]  # Pobranie cechy
            thresholds = np.unique(X_column)  # Pobranie progów podziału
            for threshold in thresholds:  # Iteracja po progach podziału
                information_gain = self._information_gain(y, X_column, threshold)  # Obliczenie zysku informacji
                if information_gain > best_information_gain:  # Sprawdzenie czy zysk informacji jest większy od najlepszego zysku informacji
                    best_information_gain = information_gain  # Aktualizacja najlepszego zysku informacji
                    best_threshold = threshold  # Aktualizacja najlepszego progu podziału
                    best_feature = feature  # Aktualizacja najlepszej cechy
        return best_feature, best_threshold  # Zwrócenie najlepszej cechy i najlepszego progu podziału


    # Metoda obliczania zysku informacji
    def _information_gain(self, y, feature_values, threshold):
        entropy = self._entropy(y)  # Obliczenie entropii
        left_indices, right_indices = self._split(feature_values, threshold)  # Podział danych
        # Obliczenie zysku informacji
        information_gain = entropy - (((len(left_indices) / len(y)) * self._entropy(y[left_indices])) +
                                      ((len(right_indices) / len(y)) * self._entropy(y[right_indices])))
        return information_gain  # Zwrócenie zysku informacji


    # Metoda podziału danych
    def _split(self, X_column, split_threshold):
        left_indices = np.argwhere(X_column <= split_threshold).flatten()  # Indeksy próbek w lewym podwęźle
        right_indices = np.argwhere(X_column > split_threshold).flatten()  # Indeksy próbek w prawym podwęźle
        return left_indices, right_indices  # Zwrócenie indeksów próbek w lewym i prawym podwęźle


    # Metoda obliczania entropii
    def _entropy(self, y):
        hist = np.bincount(y)  # Obliczenie liczby wystąpień każdej klasy
        probabilities = (hist / len(y))  # Obliczenie prawdopodobieństwa wystąpienia każdej klasy
        entropy = -np.sum([probability * np.log2(probability) for probability in probabilities if probability > 0])  # Obliczenie entropii
        return entropy  # Zwrócenie entropii


    # Metoda przechodzenia przez drzewo
    def _traverse_tree(self, x, node):
        if node.is_leaf_node():  # Sprawdzenie czy węzeł jest liściem
            return node.value  # Zwrócenie wartości węzła
        if x[node.feature] <= node.threshold:  # Sprawdzenie czy wartość cechy jest mniejsza lub równa progu podziału
            return self._traverse_tree(x, node.left)  # Wywołanie metody dla lewego podwęzła
        return self._traverse_tree(x, node.right)  # Wywołanie metody dla prawego podwęzła


    # Metoda przewidywania klas
    def predict(self, X):
        return np.array([self._traverse_tree(x, self.root) for x in X])  # Zwrócenie przewidzianych klas

