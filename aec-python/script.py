for i in range(10):
    print(i**2)

dict = {1: 'dog', 2:'cat'}
print(dict[2])

i = 0
while i < 10:
    print(i**2)
    i+=1

for key in dict.keys():
    print(dict[key])

def is_even(n):
    if n % 2 == 0:
        print("True")
    else:
        print("False")

def is_odd(n):
    if n % 2 == 1:
        print("True")
    else:
        print("False")

is_even(3)
is_even(4)
is_odd(3)
is_odd(4)