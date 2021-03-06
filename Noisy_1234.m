%% 1. Fotoğraf
noisy1=imread('noisy1.png');  %resim dosyası bir matrise aktarılır.
noisy11=rgb2gray(noisy1); %resim griye çevirilir.
figure, imshow(noisy11); title('Griye Çevrilmiş'); %resim olarak görüntelenir.
%%
noisy12=medfilt2(noisy11,[5,5]); %medyan filtresi uygulandı.
figure, imshow(noisy12); title('5*5 medyan'); %resim olarak görüntelenir.
%% 2. Fotoğraf
noisy2=imread('noisy2.png'); %resim dosyası bir matrise aktarılır.
noisy21=rgb2gray(noisy2); %resim griye çevirilir.
figure, imshow(noisy21); title('Griye Çevrilmiş'); %resim olarak görüntelenir.
%%
noisy=wiener2(noisy21,[5,5]); %wiener filtresi uygulandı.
figure, imshow(noisy); title('5*5 Wiener'); %resim olarak görüntelenir.
%% 3. Fotoğraf
noisy3=imread('noisy3.png'); %resim dosyası bir matrise aktarılır.
noisy31=rgb2gray(noisy3); %resim griye çevirilir.
figure, imshow(noisy31); title('Griye Çevrilmiş'); %resim olarak görüntelenir
%%
h=ones(5,5)/25; %ortalama filtresi kullanıldı.
I2=imfilter(noisy31,h);
figure, imshow(I2); %resim olarak görüntelenir
%% 4. Fotoğraf
noisy4=imread('noisy4.png'); %resim dosyası bir matrise aktarılır.
noisy41=rgb2gray(noisy4);  %resim griye çevirilir.
figure, imshow(noisy41); title('Griye Çevrilmiş'); %resim olarak görüntelenir.
%%
noisy42=wiener2(noisy41,[4,4]);  %wiener filtresi uygulandı.
figure, imshow(noisy42); title('4*4 Wiener'); %resim olarak görüntelenir.
%%