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

daniel = imread('inputs/daniel.png');
% imshow(daniel);
audio = img2spect(daniel,500,4000,5,Fs,1);
audiowrite('outputs/daniel.wav', audio, Fs);