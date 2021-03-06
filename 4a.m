%% Calculate and plot the two-sided power spectrum density PSD for x(t) in the range [0, (Fs- Fs/L)] where Fs is the Nyquist frequency.


  % Sn=0 and Omega0=500pi

clc;
clear all;
close all;
Fs = 1000;     % Sampling frequency
Ts = 1/Fs;     % Sampling period
Wo=500*pi      % Signal Frequency
Ph= pi/2       % Signal Phase
t = (0:Ts:8);  % Time axe
L = size(t,2); % Total Number of Sample
Sn=0;          % Standard Deviation of AWGN
A=2;           % Amplitude
x = Sn*randn(size(t))+ A*cos(Wo*t+Ph);

nfft = 2^nextpow2(length(x));
Pxx = abs(fft(x,nfft)).^2/length(x)/Fs;
Hpsd = dspdata.psd(Pxx,'Fs',Fs,'SpectrumType','twosided');
figure;
plot(Hpsd);
axis([0 Fs-Fs/L -200 10]);
