%% 1. Foto�raf
noisy1=imread('noisy1.png');  %resim dosyas� bir matrise aktar�l�r.
noisy11=rgb2gray(noisy1); %resim griye �evirilir.
figure, imshow(noisy11); title('Griye �evrilmi�'); %resim olarak g�r�ntelenir.
%%
noisy12=medfilt2(noisy11,[5,5]); %medyan filtresi uyguland�.
figure, imshow(noisy12); title('5*5 medyan'); %resim olarak g�r�ntelenir.
%% 2. Foto�raf
noisy2=imread('noisy2.png'); %resim dosyas� bir matrise aktar�l�r.
noisy21=rgb2gray(noisy2); %resim griye �evirilir.
figure, imshow(noisy21); title('Griye �evrilmi�'); %resim olarak g�r�ntelenir.
%%
noisy=wiener2(noisy21,[5,5]); %wiener filtresi uyguland�.
figure, imshow(noisy); title('5*5 Wiener'); %resim olarak g�r�ntelenir.
%% 3. Foto�raf
noisy3=imread('noisy3.png'); %resim dosyas� bir matrise aktar�l�r.
noisy31=rgb2gray(noisy3); %resim griye �evirilir.
figure, imshow(noisy31); title('Griye �evrilmi�'); %resim olarak g�r�ntelenir
%%
h=ones(5,5)/25; %ortalama filtresi kullan�ld�.
I2=imfilter(noisy31,h);
figure, imshow(I2); %resim olarak g�r�ntelenir
%% 4. Foto�raf
noisy4=imread('noisy4.png'); %resim dosyas� bir matrise aktar�l�r.
noisy41=rgb2gray(noisy4);  %resim griye �evirilir.
figure, imshow(noisy41); title('Griye �evrilmi�'); %resim olarak g�r�ntelenir.
%%
noisy42=wiener2(noisy41,[4,4]);  %wiener filtresi uyguland�.
figure, imshow(noisy42); title('4*4 Wiener'); %resim olarak g�r�ntelenir.
%%