import numpy as np
import matplotlib.pylab as plt

def rad_per_sec_to_hz(val_rad):
    val_hz = val_rad / (2*np.pi)
    return val_hz
    
def hz_to_rad_per_sec(val_hz):
    val_rad_per_sec = 2 * np.pi * val_hz
    return val_rad_per_sec

# def filter_plotter(w_hz, mag, f_c, freq_unit):
#     fig = plt.figure(figsize=(8, 3))
    
#     plt.semilogx(w_hz, mag)    # Bode magnitude plot
    
#     # plot the cutoff frequency 
#     plt.axvline(x = f_c, color = 'b', label = 'cutoff freq', linestyle=':')
#     ax_list = fig.axes
#     ax = ax_list[0]
#     ax.text(f_c - 10 , -0.1, 'f_c', 
#             fontsize = 10, color ="green", transform=ax.get_xaxis_transform())
    
#     plt.ylabel("Amplitude (dB)")
#     plt.xlabel("Frequency (Hz)")
    
#     plt.grid()
#     plt.show()