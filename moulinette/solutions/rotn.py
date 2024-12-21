import sys

def rot_n(string: str, n: int) -> str:
    encoded = ''
    for char in string:
        if char.isalpha():
            offset = 65 if char.isupper() else 97
            encoded += chr((ord(char) - offset + n) % 26 + offset)
        else:
            encoded += char
    return encoded

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print('Usage: python rotn.py <string> <n>')
        sys.exit(1)
    print(rot_n(sys.argv[1], int(sys.argv[2])))