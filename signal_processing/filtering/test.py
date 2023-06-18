import filter 

lowpass_filter = filter.Filter(type = filter.Type.lowpass)
lowpass_filter.set_cutoff_freq_hz(100)

lowpass_filter.plot_magn_response()

