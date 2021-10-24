t = [0:7];
rng(0); y = randn(size(t));
plot(t,y,'ko');
axis([-2 9 -3 7]);
xlabel('Days recording % \Deltastock value');
ylabel('% \Deltastock value');

t_interpolated = [0:0.01:7];
y_spline_int = interp1(t,y,t_interpolated,'spline');
hold on;
plot(t_interpolated,y_spline_int,'r');

t_extrapolated = [-2:0.01:9];
y_spline_ext = interp1(t,y,t_extrapolated,'spline');
plot(t_extrapolated,y_spline_ext,'r');

y_pchip = interp1(t,y,t_extrapolated,'pchip');
plot(t_extrapolated,y_pchip,'g');

y_lin = interp1(t,y,t_extrapolated,'linear');
plot(t_extrapolated,y_lin,'b');

legend('data','spline (interpolated)','spline (extrapolated)','pchip','linear');