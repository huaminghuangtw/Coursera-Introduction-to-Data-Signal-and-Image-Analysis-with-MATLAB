load nodetraffic.mat;

round(mean(nodetraffic))

round(std(nodetraffic))

count = 0;
for i = 1 : length(nodetraffic)
    if (standard_deviation_distance(nodetraffic, nodetraffic(i)) > 6)
        count = count + 1;
    end
end
count

% Answer
% 1) 24
% 2) 9829
% 3) 14009