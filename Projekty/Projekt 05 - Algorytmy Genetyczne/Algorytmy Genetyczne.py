# Importowanie biblioteki
import random


# Funkcja kodująca wartość liczbową na jej reprezentację binarną w postaci łańcucha znaków
def encode_binary(x, num_bits):
    # Definicja działania funkcji zapisana w dokumentacji
    """Encode a decimal value into a binary string representation."""
    decimal_range = 10  # Zakres wartości liczbowych
    scaled_value = x / decimal_range  # Skalowanie wartości do zakresu [0, 1]
    encoded_value = int(scaled_value * (2 ** num_bits - 1))  # Zakodowanie wartości do postaci binarnej
    binary_string = bin(encoded_value)[2:].zfill(num_bits)  # Konwersja wartości binarnej na łańcuch znaków
    return binary_string  # Zwrócenie zakodowanej wartości


# Funkcja dekodująca wartość binarną w  na jej reprezentację liczbową
def decode_binary(binary_string):
    # Definicja działania funkcji w postaci łańcucha znaków zapisana w dokumentacji
    """Decode a binary string representation into a decimal value."""
    decimal_range = 10  # Zakres wartości liczbowych
    num_bits = len(binary_string)  # Liczba bitów w reprezentacji binarnej
    encoded_value = int(binary_string, 2)  # Konwersja łańcucha znaków na liczbę całkowitą
    scaled_value = encoded_value / (2 ** num_bits - 1)  # Skalowanie wartości do zakresu [0, 1]
    decoded_value = scaled_value * decimal_range  # Przeskalowanie wartości do pierwotnego zakresu [0, 10]
    return decoded_value  # Zwrócenie odkodowanej wartości


# Main
# Utworzenie zmiennych
number_of_bits = 0  # Liczba bitów w reprezentacji binarnej
number = 0          # Wartość liczby

# Wprowadzenie wartości liczbowej i liczby bitów w reprezentacji binarnej
number_of_bits = int(input("Enter number of bits: "))  # Wprowadzenie liczby bitów w reprezentacji binarnej
number = float(input("Enter number: "))  # Wprowadzenie wartości liczby

binary_string = encode_binary(number, number_of_bits)  # Zakodowanie wartości liczbowej na jej reprezentację binarną
decoded_x = decode_binary(binary_string)  # Dekodowanie wartości binarnej na jej reprezentację liczbową

print(f"Decoded binary string {binary_string} is {decoded_x}")  # Wyświetlenie zdekodowanej wartości binarnej
print(f"Binary representation of x: {number} is {binary_string}")  # Wyświetlenie zakodowanej wartości liczbowej
