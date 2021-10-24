T = 100; % seconds
t = 0:T;
f = 5/100;
a = 2*pi*f;
y = cos(a*t);
plot(t,y,'bx');
xlabel('t (seconds)');
ylabel('y(t)');

hold on;

t2 = 0:0.5:T;
y2 = cos(a*t2);
plot(t2,y2,'ro');

