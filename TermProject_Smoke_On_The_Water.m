% By Mikhail Smirnov and Yousef Ahmed (Group 6)

% This program generates and plays the song, "Smoke On The Water" by Deep
% Purple and later plots the time and frequency domain components, as well
% as the spectrogram

FS=8000; % sampling frequency (8 KHz)

% Scale, 0.5 seconds = quarter note

%-----------------------NOTES-------------------------------------------
% Smoke on the water consists of 4 notes with varying rhythms,
% G, Bb, C, and Db

G4_half_dotted = sin(2*pi*392.00*(0:0.000125:1.25)); % Dotted half note
G4_quarter = sin(2*pi*392.00*(0:0.000125:0.5)); % Quarter note
G4_eighth = sin(2*pi*392.00*(0:0.000125:0.25)); % Eighth note

Bb4_quarter = sin(2*pi*466.16*(0:0.000125:0.5)); % Quarter note
Bb4_eighth = sin(2*pi*466.16*(0:0.000125:0.25)); % Eighth note

C5_quarter_dotted = sin(2*pi*523.25*(0:0.000125:0.75)); % Dotted quarter note
C5_half_dotted = sin(2*pi*523.25*(0:0.000125:0.75)); % Dotted half note

Db5_eighth = sin(2*pi*554.37*(0:0.000125:0.25)); % Eighth note

rest_eighth = 0*(0:0.000125:0.25); % Eighth note rest
%-----------------------------------------------------------------------


% Full song  0.5s      0.5s            0.75s          0.25s      0.25s        0.25s        0.25s        0.25s      0.75s            0.25s       0.5s          0.5s           0.75s         0.25s          0.25s       0.25s       1.25s  
song = [G4_quarter, Bb4_quarter, C5_quarter_dotted, G4_eighth, rest_eighth, Bb4_eighth, rest_eighth, Db5_eighth, C5_half_dotted, rest_eighth, G4_quarter, Bb4_quarter, C5_quarter_dotted, Bb4_eighth, rest_eighth, G4_eighth, G4_half_dotted];
% Entire song length is 7.75s

% Writes the song into a .wav file
audiowrite('SmokeOnTheWater.wav', song, FS) % Output the final music notes as a .wav
sound(song, FS)

%-----------------------------------Plotting------------------------------
h = zeros(17,1); % Vector for each note plot

% Plots each note with their respective colors
[epoint, h(1)] = draw_note(G4_quarter,0,'b');
[epoint, h(2)] = draw_note(Bb4_quarter,epoint,'g');
[epoint, h(3)] = draw_note(C5_quarter_dotted,epoint,'m');
[epoint, h(4)] = draw_note(G4_eighth,epoint,'b');
[epoint, h(5)] = draw_note(rest_eighth,epoint,'k');
[epoint, h(6)] = draw_note(Bb4_eighth,epoint,'g');
[epoint, h(7)] = draw_note(rest_eighth,epoint,'k');
[epoint, h(8)] = draw_note(Db5_eighth,epoint,'r');
[epoint, h(9)] = draw_note(C5_half_dotted,epoint,'m');
[epoint, h(10)] = draw_note(rest_eighth,epoint,'k');
[epoint, h(11)] = draw_note(G4_quarter,epoint,'b');
[epoint, h(12)] = draw_note(Bb4_quarter,epoint,'g');
[epoint, h(13)] = draw_note(C5_quarter_dotted,epoint,'m');
[epoint, h(14)] = draw_note(Bb4_eighth,epoint,'g');
[epoint, h(15)] = draw_note(rest_eighth,epoint,'k');
[epoint, h(16)] = draw_note(G4_eighth,epoint,'b');
[epoint, h(17)] = draw_note(G4_half_dotted,epoint,'b');

% Since FS is sampling frequencies (samples taken over the entire duration),
% Length of song in seconds is length(song) / FS
N = length(song);
t = linspace(0, N/FS, N);

% Plots entire song showing each different note
figure(1)
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14);
xlim([0 N]);
ylim([-3 3]);
xlabel('Samples');
ylabel('Amplitude');
title('Song Plotted by Note for Each Sample');
legend(h([1 2 3 8 5]),'G','Bb','C','Db','Rest'); % Labels each of the 5 different notes



% Reads .wav song file
[y,Fs] = audioread('SmokeOnTheWater.wav');

Y = fft(y,N);               % Fourier transform of y
F = ((0:1/N:1-1/N)*Fs);     % Frequency vector
magnitudeY = abs(Y);        % Magnitude of the FFT


% Plots entire song in time domain
figure(2)
plot(t,y);
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14);
xlabel('Time [s]');
ylabel('Amplitude');
title('Song Plotted in Time Domain');

% Plots magnitude of FFT of song in frequency domain
figure(3);
plot(F, magnitudeY);
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14);
xlabel('Frequency [Hz]');
ylabel('Magnitude [dB]');
title('Magnitude Spectrum in Frequency Domain');

% Plots spectrogram
[s2,f,t2]=spectrogram(y,[],N-8,F,Fs);
figure(4);
spectrogram(y,[],[],[],Fs,'yaxis')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14);
xlabel('Time [s]');
title('Spectrogram in Frequency & Time');
