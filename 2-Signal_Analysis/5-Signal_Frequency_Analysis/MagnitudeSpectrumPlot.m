function MagnitudeSpectrumPlot(yfft, f, col)
    if (nargin < 3)
        col = 'b';
    end
    figure;
    plot(f, abs(yfft), col);
    xlabel('frequency (Hz)');
    ylabel('|Y(f)|');
    title('Magnitude Spectrum');
end