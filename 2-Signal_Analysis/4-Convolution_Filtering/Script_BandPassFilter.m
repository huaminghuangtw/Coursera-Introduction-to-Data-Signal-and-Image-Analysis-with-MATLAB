Fs = 10;
x1 = repmat([1 0 -1 0],[1,10]);   % This is a 2.5 Hz signal
x2 = repmat([1 -1],[1,20]);       % This is a 5 Hz signal
x = x1 + x2;
freq_range = [2,3];               % filter out the 5 Hz but keep the 2.5 Hz component
W = 10;

y = BandPassFilter(x, Fs, freq_range, W);

% plot x1, x2, x=x1+x2, and BandPassFilter output
t = 0 : 1/Fs : (length(y)-1)/Fs;
plot(t(1:Fs),x1(1:Fs),'bo-');
hold on;
plot(t(1:Fs),x2(1:Fs),'r*-');
plot(t(1:Fs),x(1:Fs),'g');
plot(t(1:Fs),y(1:Fs),'m--', 'LineWidth', 2);
legend('x1-2.5Hz','x2-5.0Hz','x=x1+x2','output');