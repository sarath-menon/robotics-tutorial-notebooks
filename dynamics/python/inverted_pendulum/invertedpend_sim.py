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

import inverted_pendulum

import matplotlib
matplotlib.use('TKAgg')

# Parameters

M = 1.			# mass of the system to be balanced
# J = 100.		# moment of inertia of the system to be balanced	
ell = 1.		# distance from base to the center of mass of the object to be balanced
c = 0.1         # coefficient of rotational damping
g = 9.8			# acceleration due to gravity

# Run simulation for tf seconds
tf = 10.  
dt = 0.01

# Initial conditions
theta_0 = 0.01
thetadot_0 = 0.
IC = np.array([theta_0, thetadot_0])  # Initial condition

# Step input
tau = 0.

# Run the simulation
t = np.arange(0., tf, step=dt )

# trajectory = odeint(inverted_pendulum.Model, IC, t, args=(m, J, g, ell, gamma, f),
#                rtol=1e-4, atol=1e-5)
trajectory = odeint(inverted_pendulum.Model, IC, t, args=(M, g, ell, c, tau),
               rtol=1e-4, atol=1e-5)



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
        visualizer.set_cart_position([length/2,(width/2)+100])  
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