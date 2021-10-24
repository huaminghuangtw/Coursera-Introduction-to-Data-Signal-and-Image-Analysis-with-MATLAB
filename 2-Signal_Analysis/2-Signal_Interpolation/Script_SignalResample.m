x = [1:0.5:5.5];
xFs = 2;
yFs = 4;
y = SignalResample(x, xFs, yFs);

x = [1:0.5:5.5];
xFs = 2;
yFs = 1;
y = SignalResample(x, xFs, yFs);