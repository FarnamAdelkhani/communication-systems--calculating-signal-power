%% Using the PSD function and autocorrelation function, calculate the average power of x(t) and show that this value is same as the one obtained by simply calculating the Variance of x(t).


    % Sn=0 and Omega0=500pi

clc;
clear all;
close all;
Fs = 1000;          % Sampling frequency
Ts = 1/Fs;          % Sampling period
Wo=1500*pi          % Signal Frequency
Ph= pi/2            % Signal Phase
t = (0:Ts:8);       % Time axe
L = size(t,2);      % Total Number of Sample
Sn=0;               % Standard Deviation of AWGN
A=2;                % Amplitude
x = Sn*randn(size(t))+ A*cos(Wo*t+Ph);

nfft = 2^nextpow2(length(x));
Pxx = abs(fft(x,nfft)).^2/length(x)/Fs;
Hpsd = dspdata.psd(Pxx,'Fs',Fs,'SpectrumType','twosided');
figure;
plot(Hpsd);
axis([0 Fs-Fs/L -200 10]);
