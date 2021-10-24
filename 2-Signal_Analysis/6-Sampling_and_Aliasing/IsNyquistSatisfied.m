function [y,Fs_min] = IsNyquistSatisfied(fmax,Fs)
    Fs_min = 2*fmax;
    if (Fs > Fs_min)
        y = true;
    else
        y = false;
    end
end