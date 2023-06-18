from stringprep import b1_set
from matplotlib.animation import FuncAnimation
import matplotlib.pyplot as plt   # MATLAB plotting functions
from control.matlab import *  # MATLAB-like functions
import time

# Parameters defining the system
m = 250.0           # system mass
k = 40.0            # spring constant
b1 = 0           # damping constant
b2 = 300
b = list(range(b1, b2, 5))


# plot properties
font = {'family': 'avenir',
        'color':  'darkred',
        'weight': 'normal',
        'size': 14,
        }

xlim = 50
ylim = 0.04
fig = plt.figure()
plt.grid()


def plot_response(i):
    # first clear previous plot
    plt.clf()

    # System matrices
    A = [[0, 1.], [-k/m, -b[i]/m]]
    B = [[0], [1/m]]
    C = [[1., 0]]
    sys = ss(A, B, C, 0)

    # Step response for the system
    yout, T = step(sys)

    # Setting the axes
    plt.xlim([0, xlim])
    plt.ylim([0, ylim])

    # display system parameters
    plt.plot(T.T, yout.T)
    plt.title('Mass-Spring-Damper system - Modifying b', fontdict=font)
    plt.text(40., 0.34, "selva", fontdict=font)
    plt.xlabel('time (s)', fontdict=font)
    plt.ylabel('Displacement (m)', fontdict=font)
    plt.text(2, 0.65, r'$\cos(2 \pi t) \exp(-t)$', fontdict=font)


ani = FuncAnimation(fig, plot_response, frames=len(b), interval=100)
plt.show()
