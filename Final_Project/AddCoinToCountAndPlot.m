function [coinvalue,x_plot,y_plot,col] = AddCoinToPlotAndCount(x,y,cls)
    % Initialize radians for defining x_plot and y_plot using cos and sin functions
    rads = 0 : 2*pi/32 : 2*pi;
    
    % Initialize parameters for radius and color of circle for each type of coin
    DimeRadius = 22; NickelRadius = 30; QuarterRadius = 40;
    DimeValue = 10; NickelValue = 5; QuarterValue = 25;

    % Use if-elseif statement to define x_plot, y_plot, col
    % When cls is 1, we found a dime
    if (cls == 1)
        coinvalue = DimeValue;
        x_plot = x + DimeRadius*cos(rads);
        y_plot = y + DimeRadius*sin(rads);
        col = 'r';
    % When cls is 2, we found a nickel
    elseif (cls == 2)
        coinvalue = NickelValue;
        x_plot = x + NickelRadius*cos(rads);
        y_plot = y + NickelRadius*sin(rads);
        col = 'g';
    % When cls is 3, we found a quarter
    elseif (cls == 3)
        coinvalue = QuarterValue;
        x_plot = x + QuarterRadius*cos(rads);
        y_plot = y + QuarterRadius*sin(rads);
        col = 'm';
    end

    plot(x_plot,y_plot,col);
end