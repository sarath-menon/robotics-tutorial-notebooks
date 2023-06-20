import numpy as np
import matplotlib.pylab as plt
from scipy import signal as dsp

def create_sin_wave(f, duration, sampling_rate):

    omega = 2*np.pi*f #rad/s
    t = np.arange(0,duration,1/sampling_rate)
    sin_wave = np.sin(omega*t);

    return sin_wave, t

def create_step_signal(step_time, step_amplitude, duration, sampling_rate):
    t = np.arange(-step_time,duration,1/sampling_rate)
    step_signal = np.heaviside(t, step_amplitude)
    
    # time-shift the signal
    t = t+step_time
    
    return step_signal,t