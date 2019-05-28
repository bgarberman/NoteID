function [maxVal, maxIndex] = peakfreq(fft_in)
%Finds the maximum value in a matrix and its index.
%Used to find resonant frequency.
maxVal = 0;
maxIndex = 0;
for i = 1:length(fft_in);
    if fft_in(i)>maxVal
        maxVal = fft_in(i);
        maxIndex = i;
    end
end

end

