function [s1] = lowpassfilter(s,fcut,fs)
	[b,a] = butter(10,fcut/(fs/2),'low')%function butter gives transfer function of filter
	s1 = filtfilt(b,a,s) %filtfilt filters signal from beginning to end and end to beginning to miniminaze the distortion
end