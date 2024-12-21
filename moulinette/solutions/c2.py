def is_prime(n):
    """
    Assumes that n is a positive natural number
    """
    if n == 1:
        return False
    i = 2
    while i*i <= n:
        if n % i == 0:
            return False
        i += 1
    return True

def fizzbuzz(n: int):
    if n < 1:
        return
    for i in range(1, n+1):
        if is_prime(i):
            print("Fizz")
        else:
            print("Buzz")

if __name__ == "__main__":
    for i in range(1, 101):
        fizzbuzz(i)
    for i in range(-100, 1):
        fizzbuzz(i)