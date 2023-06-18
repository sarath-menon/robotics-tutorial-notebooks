import numpy as np
import matplotlib.pylab as plt

def rad_per_sec_to_hz(val_rad):
    val_hz = val_rad / (2*np.pi)
    return val_hz
    
def hz_to_rad_per_sec(val_hz):
    val_rad_per_sec = 2 * np.pi * val_hz
    return val_rad_per_sec

