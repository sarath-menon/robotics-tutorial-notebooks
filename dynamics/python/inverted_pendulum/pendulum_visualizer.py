import pygame
import math
import time

from visualizer import *
from objects import *
     
# pendulum parameters
angle = math.pi/4                # [rad]

length = 800
width = 400
visualizer = Visualizer(length, width);

# if True,shutdown_flag of while loop, and close pygame
shutdown_flag = False 

while not shutdown_flag:                              

    visualizer.set_angle(angle)    
    visualizer.set_cart_position([200,width/2]) 

    # draw the new frame
    visualizer.redraw()

    # event handler
    for event in pygame.event.get():      

        # shutdown when close button is pressed
        if event.type == pygame.QUIT:   shutdown_flag = True     
 
pygame.quit()