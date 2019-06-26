close all; clear; clc;
%% Loading sound
t = 3;
[y,~] = audioread('bird.mp3');
inf = audioinfo('bird.mp3');
y = y(:,2);
Samples = inf.SampleRate*t;
N = (1:Samples)';
y = y(1:Samples);
%% Noise 
noise_f = 300;
noise = sin((2*pi*noise_f/inf.SampleRate).*N);
%% Adding noise to the signal
polluted_signal = noise+y;
%% Notch Filter
w0 = noise_f/(inf.SampleRate/2);
bw = w0/30;
[b,a] = iirnotch(w0,bw);
%% Filtering the signal
filtered = filter(b,a,polluted_signal);
sound(filtered)
%% Output
figure;
subplot(311); plot(y); title('Original Clip');
subplot(312); plot(polluted_signal); title('Noisy Clip');
subplot(313); plot(filtered); ylim([-0.4,0.4]);title('Filtered Clip');

figure;
[H,W] = freqz(b,a,1000);
subplot(211); plot(W,abs(H));xlim([0,0.5]);title('Magnitude');
subplot(212); plot(W,angle(H));xlim([0,0.5]); title('Phase');