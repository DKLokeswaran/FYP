import random
import math
from classes import Road

def create_array(size, max):
    array = [random.randint(0, max)]
    threshold=max/15  # Initialize array with a random number
    
    while len(array) < size:
        # Generate a random number
        num = random.randint(0, max)
        
        # Check if the difference between the new number and the last number in the array is greater than the threshold
        flag=True
        for i in array:
            if abs(num-i)<threshold:
                flag=False
                break
        if(flag):
            array.append(num)

        array.sort()
        #print(array)
    
    return array

#print(create_array(10,1000))

def create_roads(coords):
    roads = []
    for i in range(len(coords)):
        num = random.randint(0, 1)
        if(num==0):
            road= Road(0,coords[i])
        else:
            road= Road(coords[i],0)
        roads.append(road)
    return roads