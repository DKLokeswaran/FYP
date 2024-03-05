import random

class Road:
    def __init__(self, x_coords, y_coords):
        self.x_coords = x_coords
        self.y_coords = y_coords

class Point:
    def __init__(self, x_coords, y_coords):
        self.x_coords = x_coords
        self.y_coords = y_coords
    def reassign(self,point):
        self.x_coords = point.x_coords
        self.y_coords = point.y_coords
    def update(self,x,y):
        self.x_coords  =self.x_coords+ x
        self.y_coords  = self.y_coords+ y
    #def move()



class Vehicle:
    def __init__(self, From , speed,co_ordinate):
        self.From=From
        self.speed = speed
        self.set_destination()
        self.co_ordinate=co_ordinate
    
    def set_destination(self):
        self.to=None
        while(self.to==None):
            self.to=random.choice(self.From.neighbors)

    def move(self):
        if(self.From.x_coords==self.to.x_coords):
            self.co_ordinate.update(0,self.speed)
        if(self.From.y_coords==self.to.y_coords):
            self.co_ordinate.update(self.speed,0)


class Intersection:
    def __init__(self, x_coords, y_coords):
        self.x_coords = x_coords
        self.y_coords = y_coords
    def set_neighbors(self,Intersections):
        self.neighbors=[None]*4
        self.visited=[False]*4
        for i in Intersections:
            if(i!=self):
                if(i.x_coords==self.x_coords):
                    if(i.y_coords>self.y_coords):
                        if((self.neighbors[0]==None) or self.neighbors[0].y_coords>i.y_coords):
                            self.neighbors[0]=i
                    else:
                        if((self.neighbors[2]==None) or self.neighbors[2].y_coords<i.y_coords):
                            self.neighbors[2]=i
                elif(i.y_coords==self.y_coords):
                    if(i.x_coords>self.x_coords):
                        if((self.neighbors[1]==None) or self.neighbors[1].x_coords>i.x_coords):
                            self.neighbors[1]=i
                    else:
                        if((self.neighbors[3]==None) or self.neighbors[3].x_coords>i.x_coords):
                            self.neighbors[3]=i