import numpy as np
import matplotlib.pylab as plt
from enum import Enum

def filter_plotter(w_hz, mag_db, cutoff_freq_hz, amplitude_unit='dB', freq_unit='Hz'):  
    '''
    Plots the frequency response of a filter 

    Parameters
    -----------

    w_hz: frequency vector in Hz
    mag_db: amplitude vector in dB
    cutoff_freq_hz: cutoff frequency in Hz
    amplitude_unit: unit for plotting amplitude (normal or dB)
    freq_unit: unit for plotting frequency (Hz or rad/s)
    
    Returns
    ---------
    '''
    
    fig = plt.figure(figsize=(8, 3))

    # frequency axis
    freq_vec = None
    
    if freq_unit=='Hz':
        freq_vec = w_hz
        cutoff_freq = cutoff_freq_hz
        plt.xlabel("Frequency (Hz)")

    elif freq_unit=='rad_per_sec':
        freq_vec = hz_to_rad_per_sec(w_hz)
        cutoff_freq = hz_to_rad_per_sec(cutoff_freq_hz)
        plt.xlabel("Frequency (rad/sec)")

    else:
        raise Exception('Unknown frequency unit')
    
         
    #  Amplitude axis
    if amplitude_unit=='dB':
        mag = mag_db
        plt.semilogx(freq_vec, mag)    
        plt.ylabel("Amplitude (dB)")

    elif amplitude_unit=='normal':
        mag = 10.0 ** (mag_db/20)
        plt.semilogx(freq_vec, mag)    
        plt.ylabel("Amplitude (normal)")

    else:
        raise Exception('Unknown amplitude unit')
    
    # plot the cutoff frequency 
    plt.axvline(x = cutoff_freq, color = 'b', label = 'cutoff freq', linestyle=':')
    ax_list = fig.axes
    ax = ax_list[0]
    ax.text(cutoff_freq + 1 , +0.2, 'f_c', 
            fontsize = 10, color ="green", transform=ax.get_xaxis_transform())
    
    plt.grid()
    plt.show()