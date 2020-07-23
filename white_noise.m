function [ w ] = white_noise( No,sm )
	w=awgn(sm,No); %adds white noise zero mean gaussian
end