function [ audio ] = img2spect( img, minfreq, maxfreq, dur, Fs, invert)
% Take a black and white image and conceal 
% it in an audio signal (spectrogram image) 
% Input 
%     img     - B&W image data (2-D vector of numeric type, 0-255)
%     maxfreq - maximum frequency in spectrogram window  
%     dur     - duration (in seconds) of the output audio  
%     Fs      - sample rate of the output audio  
%     invert  - whether to invert the image (if 1 invert, if 0 don't)
% Output 
%     audio   - a vector containing audio samples which encode
%               the provided image as a spectrogram 
audio = zeros(1,dur*Fs);
imd = flipud(double(img)/256);
if invert
    imd = 1-imd;
end
[height, width] = size(img);

% We will need this for phase offset 
s = RandStream('mt19937ar','Seed',1);

% interpolation helpers
oldlin = linspace(0,dur,width);
newlin = linspace(0,dur,dur*Fs);

for row = 1:height
    amplitudes = interp1(oldlin, imd(row,:), newlin, 'pchip');
    freq = minfreq*(maxfreq/minfreq)^(row/height);
    % Generate frequency for this row, with random phase offset.
    % The phase offset is necessary to avoid unpleasant moiré
    % fringes in the final signal 
    signal = sin(2*pi*freq*(newlin+rand(s)));
    audio = audio + amplitudes.*signal;
end
audio = audio / max(max(audio),abs(min(audio)));

end

