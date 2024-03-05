import pygame
from second import create_array, create_roads
from classes import Road,Intersection,Vehicle,Point
import random


FPS=60
def draw_lines(screen, Roads):
    # Draw lines parallel to y-axis using x-coordinates
    for road in Roads:
        x=road.x_coords
        y=road.y_coords
        if(y==0):
            pygame.draw.line(screen, (255, 255, 255), (x, 0), (x, screen.get_height()))
        else:
            pygame.draw.line(screen, (255, 255, 255), (0, y), (screen.get_width(), y))


def draw_point(screen, point):
    pygame.draw.circle(screen, (255, 0, 0), (point.x_coords, point.y_coords), 5)

def create_vehicles(intersections):
    vehicles=[]
    print("Vechicles:")
    for i in range(10):
        intsec=random.choice(intersections)
        vehicle=Vehicle(intsec,30/FPS, Point(intsec.x_coords,intsec.y_coords))
        #vehicle.set_cordinates(intsec.x_coords,intsec.y_coords)
        vehicles.append(vehicle)
        print(f"{vehicle.co_ordinate.x_coords},{vehicle.co_ordinate.y_coords}", end="")
        print(f"({vehicle.to.x_coords},{vehicle.to.y_coords})")
        #print(vehicle.to)
    print('\n')
    return vehicles

# Example usage:
pygame.init()
screen = pygame.display.set_mode((800, 800))
pygame.display.set_caption("Lines Drawing Example")



coords = create_array(10,800)


Roads = create_roads(coords)

intersections=[]
for road in Roads:
    for road1 in Roads:
        if(road.x_coords!=0 and road1.y_coords!=0):
            intersections.append(Intersection(road.x_coords,road1.y_coords))
print("INtersections:")
for i in intersections:
    print({i.x_coords,i.y_coords})
print('\n')


for i in intersections:
    i.set_neighbors(intersections)
    for j in i.neighbors:
        if(j!=None):
            print(f"({j.x_coords},{j.y_coords})", end=" ")
        else:
            print("None", end=" ")
    print('\n')
    


vehicles=create_vehicles(intersections)



def move_vehicle(vehicles):
    return True

running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    screen.fill((0, 0, 0))
    draw_lines(screen, Roads)
    #vehicles=create_vehicles(intersections)
    for v in vehicles:
        draw_point(screen,v.co_ordinate)
        v.move()


    move_vehicle(vehicles)
    pygame.display.flip()
    pygame.time.Clock().tick(FPS)



pygame.quit()
