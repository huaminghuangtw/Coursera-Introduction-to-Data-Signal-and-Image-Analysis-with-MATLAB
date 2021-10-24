% Even length y
Fs = 10;
yfft = [0 0 1 0 0 0 0 0 0 0]';
f = 0:5;
y = myifft(yfft,Fs,f);
t = 0 : 1/Fs : (length(y)-1)/Fs;
plot(t,y);
yEven = y' % = [0.1053    0.0831    0.0258   -0.0423   -0.0926 ...]

% Odd length y
Fs = 10;
yfft = [0 0 1 0 0 0 0 0 0]';
f = 0 : 10/9 : 40/9;
y = myifft(yfft,Fs,f);
t = 0 : 1/Fs : (length(y)-1)/Fs;
figure;
plot(t,y);
yOdd = y' % = [ 0.1176    0.0869    0.0109   -0.0709   -0.1156 ...]