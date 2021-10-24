x = 1.2;
y = 4.1;
cls = 3;
[coinvalue, x_plot, y_plot,col] = AddCoinToPlotAndCount(x, y, cls);
figure;
plot(x_plot, y_plot, [col,'o-']);