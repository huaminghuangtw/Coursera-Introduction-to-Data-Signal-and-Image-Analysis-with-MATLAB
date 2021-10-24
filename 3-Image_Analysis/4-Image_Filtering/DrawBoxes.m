function DrawBoxes(boxr, boxc, color)
    if (nargin < 3)
        color = 'r';
    end
    verts_boxc = 7*[-1, 1, 1,-1, -1];
    verts_boxr = 7*[-1,-1, 1, 1, -1];
    hold on;
    for i = 1 : length(boxr)
        plot(verts_boxc + boxc(i), verts_boxr + boxr(i), color);
    end     
end