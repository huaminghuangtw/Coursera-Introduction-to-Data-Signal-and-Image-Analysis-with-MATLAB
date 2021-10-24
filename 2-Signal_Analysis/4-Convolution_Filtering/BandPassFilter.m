function y = BandPassFilter(x, Fs, freq_range, W)
    % Create the filter using 'fir1' (freq_range need to be divided by Fs/2 to convert to normalized frequencies)
    filter = fir1(W,freq_range/(Fs/2),'bandpass');
    
    % Apply the filter using 'conv'
    y = conv(x,filter,'same');
end