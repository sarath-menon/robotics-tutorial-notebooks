import numpy as np
import matplotlib.pylab as plt
from scipy import signal as dsp
from scipy.fft import fft, fftfreq
from enum import Enum

def dB_to_normal(val):
    return 10.0 ** (val/20)

def normal_to_dB(val):
    return 20*np.log10(val)

def filter_plotter(w_hz, mag, cutoff_freq_hz, amplitude_axis='normal', amplitude_input_unit='normal', freq_unit='Hz', freq_axis='linear'):  
    '''
    Plots the frequency response of a filter 

    Parameters
    -----------

    w_hz: frequency vector in Hz
    mag: amplitude vector 
    cutoff_freq_hz: cutoff frequency in Hz
    amplitude_unit: unit for plotting amplitude (normal or dB)
    freq_unit: unit for plotting frequency (Hz or rad/s)
    freq_axis: 'linear' or 'log'
    
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
    
         
    #  Amplitude input unit
    if amplitude_input_unit =='normal':
        mag_dB = normal_to_dB(mag)
        mag_normal = mag
    elif amplitude_input_unit == 'dB':
        mag_normal = dB_to_normal(mag)
        mag_dB = mag
    else:
        raise Exception('Unknown amplitude input unit')
    
    #  Amplitude axis
    if amplitude_axis == 'normal':
        mag_plot = mag_normal
        plt.ylabel("Amplitude (normal)")

    elif amplitude_axis=='dB':
        mag_plot = mag_dB
        plt.ylabel("Amplitude (dB)")

    else:
        raise Exception('Unknown amplitude axis unit')


    # frequency axis
    if freq_axis=='linear':
        plt.plot(freq_vec, mag_plot) 

    elif freq_axis=='log':
        plt.semilogx(freq_vec, mag_plot) 
    else:
        raise Exception('Unknown frequency axis type') 
    
    # plot the cutoff frequency 
    plt.axvline(x = cutoff_freq, color = 'b', label = 'cutoff freq', linestyle=':')
    ax_list = fig.axes
    ax = ax_list[0]
    ax.text(cutoff_freq + 1 , +0.2, 'f_c', 
            fontsize = 10, color ="green", transform=ax.get_xaxis_transform())
    
    plt.grid()
    plt.show()

## bode magnitude plot

def plot_bode_magn(h_n, fs):

    '''
    Plots the bode magnitude of a discrete time transfer function

    Parameters
    -----------

    h_n: impulse response
    fs: sampling rate in Hz
    
    Returns
    ---------
    '''

    plt.figure()

    N = h_n.size
    dt = 1 / fs

    # frequency points
    x = np.linspace(0,fs, N)
    xf = fftfreq(N, dt)[:N//2]
    
    #perform fft
    yf = fft(h_n)

    # compute bode magnitude plot values
    magn = np.abs(yf[0:N//2])

    # plotting
    plt.plot(xf, magn)
    plt.grid()
    plt.show()
    
    