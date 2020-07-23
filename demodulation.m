function [sd]=demodulation(r,fc,dtype)
	
	switch dtype
		case 'coh'
	fs = 44100                    % Sampling frequency
	T = 1/fs                     % Sample time
	L = 3161538                     % Length of signal
	t = (0:L-1)*T  
	x = r.*cos(2*pi*fc*t)
	[b,a] = butter(5,fc*2/fs)  %simple coherent detector
	sd = filtfilt(b,a,x)
		case 'env'
	sd = abs(hilbert(r)) %takes envelope
		otherwise
	end
end