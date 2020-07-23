%Mean calculation
X=sum(x)/length(x)
Y=sum(y)/length(y)
%Variance of x
x1=x-X % X-E[X]
x_squ=x.*x %taking square
x_var=sum(x_squ)/length(x) %finding variance
%variance of y
y1=y-Y % Y-E[Y]
y_squ=y.*y %taking square
y_var=sum(y_squ)/length(y) %finding variance

%Cross correlation calculation
%Use the fact that FFT(corr(x, y)) = FFT(x) * conj(FFTy))
corr_xy = ifft(fft(x) .* conj(fft(y)))
%Cross covariance calculation 
%Covar=Corr*(varx*vary)^0.5
covar_xy = corr_xy*((x_var^0.5)*(y_var^0.5))

%Auto correlation of x
corr_xx = ifft(fft(x) .* conj(fft(x)))
%Auto covariance calculation 
%Covar=Corr*varx
covar_xx = corr_xx*x_var


%Auto correlation of y
corr_yy = ifft(fft(y) .* conj(fft(y)))
%Auto covariance calculation 
%Covar=Corr*vary
covar_yy = corr_yy*y_var


%%%%%PLOT%%%%
plot(corr_xy)
plot(covar_xy)
plot(corr_xx)
plot(covar_xx)
plot(corr_yy)
plot(covar_yy)
%PSD X
Fs = 1000
periodogram(x,rectwin(length(x)),length(x),Fs)
title('PSD of X')
%PSD Y
periodogram(y,rectwin(length(y)),length(y),Fs)
title('PSD of Y')
%draws the pdf of x
mean_x=mean(x);
max_x=max(x);
min_x=min(x);
std_x=std(x);
step_x=(max_x-min_x)/1000;
PDF_X=normpdf(min_x:step_x:max_x,mean_x,std_x);
plot(min_x:step_x:max_x,PDF_X);
title('PDF of X')
%draws the pdf of y
mean_y=mean(y);
max_y=max(y);
min_y=min(y);
std_y=std(y);
step_y=(max_y-min_y)/1000;
PDF_Y=normpdf(min_y:step_y:max_y,mean_y,std_y);
plot(min_y:step_y:max_y,PDF_Y);
title('PDF of Y')
