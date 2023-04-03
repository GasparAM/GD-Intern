# Given a list of integers. Remove duplicates from the list and create a tuple. 
# Find the minimum and maximum number.

arr = [1, 1, 3, 6, 88, 9, 3, 1]

def remDup():
    newarr= []
    for i in arr:
        if i not in newarr:
            newarr.append(i)
    newarr = tuple(newarr)
    arr.sort()
    print(f"{newarr}, Max num: {arr[-1]}, Min num: {arr[0]}")

remDup()