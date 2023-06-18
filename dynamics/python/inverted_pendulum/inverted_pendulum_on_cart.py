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

def Model(q, t, M, m, J, g, ell, c, gamma, F):
    """cart-pendulum ODE
    """
    dq = np.zeros(4)

    x = q[0]
    theta = q[1]
    xdot = q[2]
    thetadot = q[3]

    dq[0] = xdot
    dq[1] = thetadot

    # Solve for second derivative by solving matrix equation
    M = np.array([[M+m, -m*ell*np.cos(theta)],
                  [-m*ell*np.cos(theta), J+m*ell**2]])
    C_1 = -(c*xdot + m*ell*np.sin(theta)*thetadot**2) + F
    C_2 = -(gamma*thetadot-m*g*ell*np.sin(theta))
    C = np.array([C_1,C_2])
    ddq = np.matmul(la.inv(M), C)

    dq[2] = ddq[0]
    dq[3] = ddq[1]
    return dq

### -------------------------------------------------------------------------------
###		Functions for plotting
### -------------------------------------------------------------------------------

def plotter(trajectory, t):
    fig, axs = plt.subplots(2,1)

    # plot the pendulum position
    axs[0].plot(t, trajectory[:,0])
    # plot the pendulum angle
    axs[1].plot(t, trajectory[:,1])
    
    # Format the plot
    axs[0].set_title("Pendulum angle")
    axs[0].set_ylabel('Angle [rad]')
    axs[0].set_xlabel('Time [s]')

    axs[1].set_title("Pendulum anglular velocity")
    axs[1].set_ylabel('Anglular velocity [rad/s]')
    axs[1].set_xlabel('Time [s]')

    axs[0].set_position([0.125, 0.65, 0.775, 0.227])
    axs[1].set_position([0.125, 0.25, 0.775, 0.227])
    plt.show()
