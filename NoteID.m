clc
clear all

%****************************
%
%Filename: NoteID.m
%
%Author: Brett Garberman
%Created: May 27th, 2019
%MATLAB R2016a
%
%Description: Finds the dominant frequency in a .wav and matches to a
%musical note.
%
%****************************

[y, Fs] = audioread('tubegarden.wav');
yL = y(1:length(y)-1,1)';
%yR = y(1:length(y)-1,2)';

yFFT = abs(fft(yL,Fs*2));
yFFT = yFFT(1:length(yFFT)/2);

[maxVal, freqIn] = peakfreq(yFFT);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Frequency List Initiazation

noteList = {'A', 'A#/Bb', 'B', 'C', 'C#/Db', 'D', 'D#/Eb', 'E', 'F', 'F#/Gb', 'G', 'G#/Ab'};
Oct0 = [27.5 29.135 30.868 32.703 34.648 36.708 38.891 41.203 43.654 46.249 48.999 51.193];
Oct1 = 2*Oct0;
Oct2 = 2*Oct1;
Oct3 = 2*Oct2;
Oct4 = 2*Oct3;
Oct5 = 2*Oct4;
Oct6 = 2*Oct5;
Oct7 = 2*Oct6;

AllFreqs = [Oct0; Oct1; Oct2; Oct3; Oct4; Oct5; Oct6; Oct7]; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Note Identifier

minError = 100;
tic
for i = 1:8
    for j = 1:12
        noteFreq = AllFreqs(i,j);
        error = abs(noteFreq-freqIn);
        if error < minError;
            minError = error;
            note = noteList(j);
        end
    end
end
toc

note
freqIn

datacursormode on
dcm = datacursormode(gcf);
set(dcm,'UpdateFcn',@myupdatefcn)
  
plot(1:20000,yFFT(1:20000));
title('Input Frequency Spectrum')
xlabel('Frequency (Hz)')
ylabel('Magnitude')