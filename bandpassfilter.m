function [s1] = bandpassfilter(s,fcutlow,fcuthigh,fs)
	fcut = [fcutlow,fcuthigh]
	[b,a] = butter(10,fcut/(fs/2),'bandpass')
	s1 = filtfilt(b,a,s)
end