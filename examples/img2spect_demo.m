% Garrett Scholtes
% January 2017 
% 
% Run this file to recreate the example audio files in the
% "outputs" folder. 
% 
% Note: this file will write .wav files - the files
% in there by default are .mp3 for the purpose of
% saving space in the repository (avoiding large binaries
% is generally desirable).

clear all;
close all;
addpath('../src');

% Audio sample rate 
Fs = 44100;

% Example #1
img = imread('inputs/daniel.png');
% Create an audio stream encoding the image in a spectrogram with:
%     a min frequency of 500 Hz,
%     a max frequency of 4000 Hz,
%     5 seconds in length  ,
%     a sample rate of 44100 Hz (a typical value),
%     and with the image colors inverted  
audio = img2spect(img,500,4000,5,Fs,1);
audiowrite('outputs/daniel.wav', audio, Fs);

% Example #2
img = imread('inputs/tetons.jpg');
audio = img2spect(img,500,4000,25,Fs,1);
audiowrite('outputs/tetons.wav', audio, Fs);