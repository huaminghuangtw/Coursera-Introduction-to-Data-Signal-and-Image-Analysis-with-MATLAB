T = 100; % seconds
t = 0:T;
f = 1/100;
a = 2*pi*f;
for i = 1 : 50
    phs = i/50;
    y = cos(a*t + 2*pi*phs);
    plot(t, y, 'o');
    xlabel('t (seconds)');
    ylabel(['cos(a*t + 2\pi*', sprintf(' %1.2f)', phs)]);
    drawnow;
end