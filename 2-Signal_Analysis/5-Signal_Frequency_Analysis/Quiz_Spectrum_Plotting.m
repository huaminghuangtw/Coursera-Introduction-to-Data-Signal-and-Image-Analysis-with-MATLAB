load crickets.mat;
soundsc(crickets, Fs);
[yfft, f] = myfft(crickets, Fs);
MagnitudeSpectrumPlot(yfft, f, '*');

% Answer
% VU