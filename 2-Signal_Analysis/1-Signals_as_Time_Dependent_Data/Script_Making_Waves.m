% Creates an audio signal by combining 6 pure tones

% Define T, Fs, and f (vector of sound frequencies)
T = 3;
Fs = 44100; % sampling frequency
f = [330 247 208 165 123 82]; % Hz

% Compute time vector t (spans [0,3) seconds)
t = [0:1/Fs:T-(1/Fs)];

% Use a for-loop to construct y as a sum of cosines
y = 0;
for i = 1 : length(f)
    a = 2*pi*f(i);
    y = y + cos(a*t); % amplitude = 1, phase = 0
end
figure(1);
plot(t,y);
xlabel('t (seconds)');
ylabel('y(t)');

duration = length(y) / Fs;
fprintf("The audio signal will last for %.1f seconds.\n", duration);
soundsc(y,Fs);