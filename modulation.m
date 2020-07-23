
function [sm]= modulation(s,fc,mtype)
	fs = 44100
	%by usage of function modulate we are able to modulate our signal
	switch mtype
		case 'dsb'
	sm = modulate(s,fc,fs,'am')
		case 'dsbsc'
	sm = modulate(s,fc,fs,'amdsb-sc')
		case 'ssb'
	sm = modulate(s,fc,fs,'amssb')
		case 'fm'
	sm = modulate(s,fc,fs,'fm')
		otherwise
	end
end