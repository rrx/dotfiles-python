import os

def main():
    current = os.getcwd()
    print(current)
    while current != "/":
        base, filename = os.path.split(current)
        current = base
        print(current)
