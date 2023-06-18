# State space: (x, x_dot, theta, theta_dot)
import numpy as np
import scipy.linalg as la

import matplotlib.pyplot as plt
import matplotlib.animation as anim
from matplotlib.patches import Rectangle

### -------------------------------------------------------------------------------
###		Dynamical model
### -------------------------------------------------------------------------------


# State space: (x, x_dot, theta, theta_dot)

def Model(q, t, M, g, ell, c, tau):
    """cart-pendulum ODE
    """
    dq = np.zeros(2)

    theta = q[0]
    thetadot = q[1]

    dq[0] = thetadot

    # Solve for second derivative by solving matrix equation
    dq[1] = (g*np.sin(theta)/ell) + (tau -c)/(M*ell**2) 

    return dq

### -------------------------------------------------------------------------------
###		Functions for plotting
### -------------------------------------------------------------------------------

def plotter(trajectory, t):
    # Plot the data
    fig, axs = plt.subplots(2,1)

    # plot the cart position
    axs[0].plot(t,trajectory[:,0])
    # plot the pendulum angle
    axs[1].plot(t,trajectory[:,1])

    # Format the plot
    axs[0].set_title("Pendulum angle")
    axs[0].set_ylabel('Angle [rad]')
    axs[0].set_xlabel('Time [s]')

    axs[1].set_title("Pendulum angular velocity ")
    axs[1].set_ylabel('Anglular velocuty [rad/s]')
    axs[1].set_xlabel('Time [s]')

    axs[0].set_position([0.125, 0.75, 0.775, 0.227])
    axs[1].set_position([0.125, 0.35, 0.775, 0.227])
