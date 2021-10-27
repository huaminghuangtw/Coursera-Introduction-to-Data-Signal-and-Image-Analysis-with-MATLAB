load nodetraffic.mat;

round(mean(nodetraffic))
round(std(nodetraffic))

% Method I
tic
count1 = 0;
for i = 1 : length(nodetraffic)
    if (standard_deviation_distance(nodetraffic, nodetraffic(i)) > 6)
        count1 = count1 + 1;
    end
end
count1
toc

%% Method II
tic
A = arrayfun(@(x) standard_deviation_distance(nodetraffic, x), nodetraffic);
count2 = length(A(A > 6)) % Or: count2 = sum(A > 6)
toc

% Method III
tic
A = (nodetraffic - mean(nodetraffic)) ./ std(nodetraffic);
count3 = sum(A > 6)
toc

% Answer
% 1) 24
% 2) 9829
% 3) 14009