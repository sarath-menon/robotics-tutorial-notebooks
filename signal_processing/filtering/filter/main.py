import numpy as np
import matplotlib.pylab as plt
from scipy import signal as dsp

from enum import Enum

from plotter import *
from . import utils 

class Mode(Enum):
    continuous = 1
    discrete = 2
    
class Type(Enum):
    lowpass = 1
    highpass = 2
    bandpass = 3
    bandstop = 4
    notch = 5
        
class Synthesis(Enum):
    simple_first_order = 1
    
class Filter:

    def __init__(self,mode=Mode.continuous, type = Type.lowpass, Synthesis= Synthesis.simple_first_order, dt=None):
        self.Mode = mode
        self.Type = type
        self.Synthesis = Synthesis

        # input signal parameters
        self.dt = dt 
        self.sampling_rate = None 

        # time domain parameters
        self._rise_time = 0;
        self._overshoot = 0;
        self._rise_time = 0;

        # frequency domain parameters
        self._cutoff_freq_rad = 100;
        self._passband = 0
        self._stopband = 0

        self.filter = self.create_filter()

    def create_filter(self):
        print(self.Mode)

        match self.Mode:
            case Mode.continuous:
                if self.dt != None: 
                    raise Exception("dt should be None for continuous time filter")
                
            case Mode.discrete:
                if self.dt == None: 
                    raise Exception("dt should be specified for discrete time filter")
                else:
                    self.sampling_rate = 1 / self.dt
                
            case _:
                raise Exception("Unknown filter mode")

        # create filter
        match self.Type:
            case Type.lowpass:
                filter = self.create_lowpass_filter()
                print("creating lowpass filter")
                
            case Type.highpass:
                filter = self.create_highpass_filter()
                print("creating highpass filter")
                
            case _:
                raise Exception("Unknown filter type")

        return filter
                
    def create_lowpass_filter(self):
        omega_c = self._cutoff_freq_rad
        
        num = [omega_c]
        den = [1,omega_c]
        
        filter = dsp.TransferFunction(num, den)

        return filter

    def create_highpass_filter(self):
        omega_c = self._cutoff_freq_rad
        
        num = [omega_c, 0]
        den = [1,omega_c]
        
        filter = dsp.TransferFunction(num, den)

        return filter

    def magn_response(self):
        w_rad, mag, phase = self.filter.bode() 
        w_hz = utils.rad_per_sec_to_hz(w_rad)
        return w_hz, mag

    def plot_magn_response(self, amplitude_axis='normal', amplitude_input_unit='normal', freq_unit='Hz', freq_axis='linear'):
        w_hz, mag_db = self.magn_response()
        cutoff_freq_hz = self.get_cutoff_freq_hz()
        filter_plotter(w_hz, mag_db, cutoff_freq_hz , amplitude_axis=amplitude_axis, amplitude_input_unit=amplitude_input_unit, freq_unit=freq_unit, freq_axis=freq_axis)

        
    # setter functions
    def set_cutoff_freq_rad_per_sec(self, val):
        self._cutoff_freq_rad = val
        self.filter = self.create_filter()
        
    def set_cutoff_freq_hz(self, val):
        cutoff_freq_rad = utils.hz_to_rad_per_sec(val)
        self.set_cutoff_freq_rad_per_sec(cutoff_freq_rad)
        
    # getter method
    def get_cutoff_freq_hz(self):
        cutoff_freq_hz = utils.rad_per_sec_to_hz(self._cutoff_freq_rad)
        return cutoff_freq_hz

    def get_cutoff_freq_rad(self):
        return self._cutoff_freq_rad

    def get_passband(self):
        return self._passband

    def get_stopband(self):
        return self._stopband