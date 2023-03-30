# Given a list of integers. Remove duplicates from the list and create a tuple. 
# Find the minimum and maximum number.

arr = [1, 1, 3, 6, 88, 9, 3, 1]

def remDup():
    newarr= []
    maxnum = arr[0]
    minnum = arr[0]
    for i in arr:
        if i not in newarr:
            newarr.append(i)
        if i > maxnum:
            maxnum = i
        if i < minnum:
            minnum = i
    newarr = tuple(newarr)
    print(f"{newarr}, Max num: {maxnum}, Min num: {minnum}")

remDup()