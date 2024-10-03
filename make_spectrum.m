function [Y_positive, freq_positive] = make_spectrum(signal, fs)

%Length of signal (how manny samples)
N = length(signal);


%fourier transform
Y = fft(signal);

%frequency resolution
delta_f = fs/N;


%frequency vector with length N, and frequency resolution fs/N
freq = (0:N-1)*delta_f;


%convert into column vector (if required)
Y = Y(:);
freq = freq(:);

% Take out the positive frequencies and Y-values (with physical meaning)
%matlab has the positive frequencies FIRST!!

if mod(N,2) == 0
    freq_positive = freq(1:N/2+1);
    Y_positive = Y(1:N/2+1);
else
    freq_positive = freq(1:floor(N/2)+1);
    Y_positive = Y(1:floor(N/2)+1);
end





