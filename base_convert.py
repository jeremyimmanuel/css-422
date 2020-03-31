

def decToBase(num: int, base: int = 2) -> str:
    ans = ""
    while num != 0:
        val = num % base
        if val > 9:
            diff = val - 9
            val = chr(64 + diff)
        ans = str(val) + ans
        num //= base
    return f'{ans} base {base}'

def baseToDec(num, base: int = 2) -> str:
    if type(num) == 'int':
        num = str(num)
    ans = 0
    for i in range(len(num)):
        try:
            val = int(num[i])
        except:
            diff = ord(num[i]) - 64
            val = 9 + diff
        power = len(num) - 1 - i
        ans += val * (base ** power)
    return ans

def baseToBase(num, b1: int, b2: int) -> str:
    dec = baseToDec(num, b1)
    return decToBase(int(dec), b2)

def main():
    print(decToBase(73503, 17))

if __name__ == "__main__":
    main()