%% Morfolojik ��lemler
%% 1. Ad�m
morf1=imread('Morfoloji1.PNG'); %resim dosyas� bir matrise aktar�l�r.
figure, imshow(morf1); %resim olarak g�r�ntelenir.
title('Orijinal G�r�nt�'); 
%%
morf2=rgb2gray(morf1); %griye �evrildi.
figure, imshow(morf2); title('Griye �evrilmi�'); %resim olarak g�r�ntelenir.
%%
morfb=imbinarize(morf2); %ikili g�r�nt�ye �evrildi.
figure, imshow(morfb); title('Binary G�r�nt�');%resim olarak g�r�ntelenir.
%%
morfb1=imcomplement(morfb); %g�r�nt�n�n tersi al�nd�
figure, imshow(morfb1); %resim olarak g�r�ntelenir.
%%
kapama=strel('disk', 4); %g�r�nt� a��nd�r�ld�
kapama1=imclose(morfb1, kapama); %kapama uyguland�
imshow(kapama1);
%%
acma=strel('disk',12);  %g�r�nt� a��nd�r�ld�
acma1=imopen(kapama1, acma); %a�ma uyguland�
imshow(acma1);
