load ReverseAudio.mat;

y = ReverseAudio(y_rev);
soundsc(y, Fs);
[~,index] = max(y);

function signal_rev = ReverseAudio(signal)
    [r,c] = size(signal);
    if (c == 1) % column vector
        signal_rev = flipud(signal);
    end
    if (r == 1) % row vector
        signal_rev = fliplr(signal);
    end
end

% Answer
% matlab or 143068