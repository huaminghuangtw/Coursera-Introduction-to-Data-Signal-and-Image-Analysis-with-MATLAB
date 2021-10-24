Fs = 1000;
freq_range = [100,200];

filt10 = fir1(10, freq_range/(Fs/2));
filt100 = fir1(100, freq_range/(Fs/2));
filt1000 = fir1(1000, freq_range/(Fs/2));

[yfft, f] = myfft(filt10, Fs);
MagnitudeSpectrumPlot(yfft, f, '*');
% check Y near X = 90
[~,i] = min(abs(f-90));
abs(yfft(i))

[yfft, f] = myfft(filt100, Fs);
MagnitudeSpectrumPlot(yfft, f, '*');
% check Y near X = 90
[~,i] = min(abs(f-90));
abs(yfft(i))

[yfft, f] = myfft(filt1000, Fs);
MagnitudeSpectrumPlot(yfft, f, '*');
% check Y near X = 90
[~,i] = min(abs(f-90));
abs(yfft(i))

% Answer
% 1) 0.7722
% 2) 0.0594
% 3) 6.8140e-04