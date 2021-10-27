function dist = standard_deviation_distance(v, x)  
    standard_deviation = std(v);
    dist = (x - mean(v)) ./ standard_deviation;
end