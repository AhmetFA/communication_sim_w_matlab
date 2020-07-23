Fs = 44100                    % Sampling frequency
T = 1/Fs                     % Sample time
L = 3161538                     % Length of signal
t = (0:L-1)*T                % Time vector

s = transpose(data) %message signal
NFFT = 2^nextpow2(L); % Next power of 2 from length of signal
S = fft(s,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);

plot(f,2*abs(S(1:NFFT/2+1))) 
xlabel('Frequency (Hz)')
ylabel('|S(f)|')

ss=lowpassfilter(s,4000,44100)
plot(Fs*t(1:50),ss(1:50))
xlabel('time (milliseconds)')
title('Filtered Signal')

SS = fft(ss,NFFT)/L
plot(f,2*abs(SS(1:NFFT/2+1)))
xlabel('Frequency (Hz)')
ylabel('|SS(f)|')

sm = modulation(ss,10000,'dsbsc')

r  = white_noise(0.01,sm)

sd = demodulation(r,10000,'coh')
plot(Fs*t(1:50),sd(1:50))
xlabel('time (milliseconds)')
title('Demodulated Signal')

sr=lowpassfilter(sd,4000,44100)
plot(Fs*t(1:50),ss(1:50))
xlabel('time (milliseconds)')
title('Demodulated Signal After the Filter')

SR = fft(sr,NFFT)/L
plot(f,2*abs(SR(1:NFFT/2+1)))
xlabel('Frequency (Hz)')
ylabel('|SR(f)|')
