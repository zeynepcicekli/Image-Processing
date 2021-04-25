%% Morfoloji-3
%% Alan 
morfo3 = imread('morfoloji3.jpg'); %orijinal resim.
figure,imshow(morfo3); %resim olarak görüntelenir.
%%
morfo31=rgb2gray(morfo3) %resim griye çevirildi.
figure,imshow(morfo31);%resim olarak görüntelenir.
%%
morf32=imbinarize(morfo31); %resim ikili görüntüye çevirildi.
figure, imshow(morf32);%resim olarak görüntelenir.
%%
morf33=imcomplement(morf32); %resmin tersi alýndý.
figure, imshow(morf33);%resim olarak görüntelenir.
%%
ye1=strel('disk',4) %resim aþýndýrýldý. 
morf34=imerode(morf33, ye1);
figure, imshow(morf34) %resim olarak görüntelenir.
%%
morf35=imdilate(morf34,ye1); %resim genleþtirildi.
figure, imshow(morf35) %resim olarak görüntelenir.
%%
etiket = bwlabel(morf35);%etiket matrisi oluþturuldu.
%%
oznitelik = regionprops(etiket,'All');  % etiket matrisinden öznitelikler çýkartýldý.
%%
alanlar = [oznitelik.Area];  % tüm nesnelerin alan deðerleri ayri bir matrise alýndý.
%%
[enb, indb] = max(alanlar);  % en buyuk nesnenin alaný ve indis numarasý.
[enk, indk] = min(alanlar);% en kucuk nesnenin alaný ve indis numarasý.
figure,imshow(oznitelik(indb).Image);
figure,imshow(oznitelik(indk).Image);
%%
enkucukler = find(alanlar==enk);   % birden fazla en küçük alan varsa indis numaralarý.
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
morf36 = bwpropfilt(morf35,'area',[20 80]); % alaný 20-80 arasý olanlar
figure,imshow(morf36);
%%
figure(10);  % 10. pencere aktif hale getirildi
for i=1:length(oznitelik)  % bilgi structýnýn eleman sayýsý kadar döngü
    if (oznitelik(i).Area< ortalama)
    text(oznitelik(i).Centroid(1),oznitelik(i).Centroid(2),int2str(i));   %nesne merkezinin x,y koordinatlarý alindi. i degeri stringe cevirilip merkeze yazildi  
    rectangle('Position',oznitelik(i).BoundingBox,'EdgeColor','g');
    text(oznitelik(i).Centroid(1),oznitelik(i).Centroid(2)-10,int2str(oznitelik(i).Area));%pencere üzerine i. elemanýn boundindbox koordinatý olan dörtgenler çizildi
    end
end

