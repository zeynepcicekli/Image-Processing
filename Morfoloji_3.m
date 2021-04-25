%% Morfoloji-3
%% Alan 
morfo3 = imread('morfoloji3.jpg'); %orijinal resim.
figure,imshow(morfo3); %resim olarak g�r�ntelenir.
%%
morfo31=rgb2gray(morfo3) %resim griye �evirildi.
figure,imshow(morfo31);%resim olarak g�r�ntelenir.
%%
morf32=imbinarize(morfo31); %resim ikili g�r�nt�ye �evirildi.
figure, imshow(morf32);%resim olarak g�r�ntelenir.
%%
morf33=imcomplement(morf32); %resmin tersi al�nd�.
figure, imshow(morf33);%resim olarak g�r�ntelenir.
%%
ye1=strel('disk',4) %resim a��nd�r�ld�. 
morf34=imerode(morf33, ye1);
figure, imshow(morf34) %resim olarak g�r�ntelenir.
%%
morf35=imdilate(morf34,ye1); %resim genle�tirildi.
figure, imshow(morf35) %resim olarak g�r�ntelenir.
%%
etiket = bwlabel(morf35);%etiket matrisi olu�turuldu.
%%
oznitelik = regionprops(etiket,'All');  % etiket matrisinden �znitelikler ��kart�ld�.
%%
alanlar = [oznitelik.Area];  % t�m nesnelerin alan de�erleri ayri bir matrise al�nd�.
%%
[enb, indb] = max(alanlar);  % en buyuk nesnenin alan� ve indis numaras�.
[enk, indk] = min(alanlar);% en kucuk nesnenin alan� ve indis numaras�.
figure,imshow(oznitelik(indb).Image);
figure,imshow(oznitelik(indk).Image);
%%
enkucukler = find(alanlar==enk);   % birden fazla en k���k alan varsa indis numaralar�.
%%
figure(6);
for i=1:length(enkucukler)
   rectangle('Position',oznitelik(enkucukler(i)).BoundingBox,'EdgeColor','g');
end
%%
figure(6);
ortalama = mean(alanlar); %ortalama alan
for i=1:length(oznitelik)
    if(oznitelik(i).Area>ortalama) %ortalama alandan buyuk olan nesneler 
        rectangle('Position',oznitelik(i).BoundingBox,'EdgeColor','r');
    end
end
%%
morf36 = bwpropfilt(morf35,'area',[20 80]); % alan� 20-80 aras� olanlar
figure,imshow(morf36);
%%
figure(10);  % 10. pencere aktif hale getirildi
for i=1:length(oznitelik)  % bilgi struct�n�n eleman say�s� kadar d�ng�
    if (oznitelik(i).Area< ortalama)
    text(oznitelik(i).Centroid(1),oznitelik(i).Centroid(2),int2str(i));   %nesne merkezinin x,y koordinatlar� alindi. i degeri stringe cevirilip merkeze yazildi  
    rectangle('Position',oznitelik(i).BoundingBox,'EdgeColor','g');
    text(oznitelik(i).Centroid(1),oznitelik(i).Centroid(2)-10,int2str(oznitelik(i).Area));%pencere �zerine i. eleman�n boundindbox koordinat� olan d�rtgenler �izildi
    end
end

