%% Morfolojik Ýþlemler
%% 1. Adým
morf1=imread('Morfoloji1.PNG'); %resim dosyasý bir matrise aktarýlýr.
figure, imshow(morf1); %resim olarak görüntelenir.
title('Orijinal Görüntü'); 
%%
morf2=rgb2gray(morf1); %griye çevrildi.
figure, imshow(morf2); title('Griye Çevrilmiþ'); %resim olarak görüntelenir.
%%
morfb=imbinarize(morf2); %ikili görüntüye çevrildi.
figure, imshow(morfb); title('Binary Görüntü');%resim olarak görüntelenir.
%%
morfb1=imcomplement(morfb); %görüntünün tersi alýndý
figure, imshow(morfb1); %resim olarak görüntelenir.
%%
kapama=strel('disk', 4); %görüntü aþýndýrýldý
kapama1=imclose(morfb1, kapama); %kapama uygulandý
imshow(kapama1);
%%
acma=strel('disk',12);  %görüntü aþýndýrýldý
acma1=imopen(kapama1, acma); %açma uygulandý
imshow(acma1);
