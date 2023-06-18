import numpy as np
import scipy.linalg as la
from scipy.integrate import odeint

import matplotlib.pyplot as plt
import matplotlib.animation as anim
from matplotlib.patches import Rectangle
import pygame
import math
import time

from visualizer import *
from objects import *

import inverted_pendulum_on_cart

import matplotlib
matplotlib.use('TKAgg')

# Parameters

M = 10.         # mass of the cart
m = 80.			# mass of the system to be balanced
J = 100.		# moment of inertia of the system to be balanced	
ell = 1.		# distance from base to the center of mass of the object to be balanced
gamma = 0.01	# coefficient of viscous friction
c = 0.1         # coefficient of viscous friction
g = 9.8			# acceleration due to gravity

# Run simulation for tf seconds
tf = 10.  
dt = 0.01

# Initial conditions
x_0 = 0.
xdot_0 = 0.
theta_0 = 0.
thetadot_0 = 0.
IC = np.array([x_0, theta_0, xdot_0, thetadot_0])  # Initial condition

# Step input
f = 1.

# Run the simulation
t = np.arange(0., tf, step=dt )


trajectory = odeint(inverted_pendulum_on_cart.Model, IC, t, args=(M,m, J, g, ell, c, gamma, f),
               rtol=1e-4, atol=1e-5)


### -------------------------------------------------------------------------------
###			 Plot the results 
### -------------------------------------------------------------------------------

### -------------------------------------------------------------------------------
###			Visualizer
### -------------------------------------------------------------------------------

length = 800
width = 400
visualizer = Visualizer(length, width);

# if True,shutdown_flag of while loop, and close pygame
shutdown_flag = False 


for state in trajectory: 
    counter = 0

    if not shutdown_flag:   
        visualizer.set_cart_position([100*state[0] + length/2,width/2])  
        visualizer.set_angle(state[1])  
        
        counter += 1   

        # draw the new frame
        visualizer.redraw()

        time.sleep(dt)

        # event handler
        for event in pygame.event.get():      

            # shutdown when close button is pressed
            if event.type == pygame.QUIT:   shutdown_flag = True      
 
pygame.quit()