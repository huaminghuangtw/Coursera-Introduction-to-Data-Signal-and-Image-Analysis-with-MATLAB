% Even length y
Fs = 10;
y = [0 0 0 0 1 0 0 0 0 0]'; 
[yfft, f] = myfft(y,Fs);
abs(yfft')

% Odd length y
Fs = 10;
y = [0 0 0 0 1 0 0 0 0]';
[yfft, f] = myfft(y,Fs);
abs(yfft')

f'   % You should get 0:10/9:40/9