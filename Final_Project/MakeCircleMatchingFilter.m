function [filter,xc,yc] = MakeCircleMatchingFilter(diameter,W)
    % Initialize filter
    filter = zeros(W,W);
    
    % Define coordinates for the center of the W x W filter
    xc = (1 + W) / 2;
    yc = (1 + W) / 2;
    
    % Use nested for loops to check if each pixel lies in the foreground of the circle. If so, label it as foreground with a 1.
    for i = 1 : W
         for j = 1 : W
             if sqrt((j - xc)*(j - xc) + (i - yc)*(i - yc)) <= (diameter/2)
                 filter(i,j) = 1;
             end
         end
    end
end