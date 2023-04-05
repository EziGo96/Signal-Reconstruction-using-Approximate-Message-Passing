clc;clear;close all;
X=imread('Amazing-Mountain-Animal_-Brown-Bear.png');
X=rgb2gray(X);
imgSize  = size(X);
imgSize2 = 2.^nextpow2(imgSize(1:2));
if ~isequal(imgSize, imgSize2)  % Are dimensions a power of 2?
    X = imresize(X, imgSize2, 'lanczos3');
end
X=double(X);
imshow(X);
%compression methods
compmthd=["ezw","spiht" ,"stw", "wdr" ,"aswdr", "spiht_3d", "lvl_mmc", "gbl_mmc_f", "gbl_mmc_h"];
sed=zeros(1,length(compmthd));
for i=1:length(compmthd)
    X_compress = wcompress('c',X,'X.wtc',compmthd(i));
    X_compress = wcompress('u','X.wtc','plot');
    delete('X.wtc')
    sed(1,i)=mean(mean((X-X_compress).^2));
end

%squared error distortion table
T=[compmthd;sed];

% Based on these results we can see that Global Thresholding of Coefficients and Hoffman
% Coding, Thresholding of Coefficients and Fixed Encoding, and Set Partitioning give the most
% distorted image. The best methods that give the lowest distortion are Adaptively Scanned
% Wavelet Difference Reduction, Wavelet Difference Reduction, and Embedded Zerotree Wavelet.

    