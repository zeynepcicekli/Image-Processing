morf2=imread('Morfoloji2.PNG');  %orijinal görüntü
figure, imshow(morf2); %resim olarak görüntelenir.
%%
morf21=rgb2gray(morf2); %griye çevrildi.
figure, imshow(morf21); %resim olarak görüntelenir.
%%
morf22=imbinarize(morf21); %ikili görüntüye çevrildi.
figure, imshow(morf22); %resim olarak görüntelenir.
%%
morf23=imcomplement(morf22); %görüntünün tersi alýndý
figure, imshow(morf23) %resim olarak görüntelenir.
%%
morf24=imfill(morf23,'holes'); %boþluklar dolduruldu
figure, imshow(morf24); %resim olarak görüntelenir.
%%
morf25=strel('disk', 1) %görüntü aþýndýrýldý
morf25=imerode(morf24, morf25)
figure, imshow(morf25) %resim olarak görüntelenir.
%%
label=bwlabel(morf25); %etiketlendirildi
%%
number=max(max(label)) % kac nesne olduðu en buyuk etiket deðeri ile bulundu
%%
objects=bwconncomp(morf25); % nesneler bir structa kaydedildi
%%
info=regionprops(morf25, 'Basic');
%%
[centers, radii, metric]=imfindcircles(morf25,[6,50],'Sensitivity',0.60); %yuvarlýk tespiti
%%
[label, numberOfObjcts]=bwlabel(morf25); 
Cevre=regionprops(label,'Perimeter','Area');%Þekillerin çevrelerini ve alanlarýný bulduk.
daire=[Cevre.Perimeter].^2 ./(4*pi*[Cevre.Area]);%Þekillerin yuvarlaklýðýna baktýk.
elips=0;
dortgen=0;
ucgen=0;
%%
for x=1:numberOfObjcts %nesneleri kontrol ettik
    if daire(x)<1.15;
    elips=elips+1;
elseif  daire(x)<1.53;
    dortgen=dortgen+1;
else ucgen=ucgen+1;
    end
end
elips=elips-length(centers);
disp("Daire Sayýsý:"+length(centers));
disp("Elips Sayýsý:"+elips);
disp("Dörtgen Sayýsý:"+dortgen);
disp("Üçgen Sayýsý:"+ucgen);
disp("Toplam Obje Sayýsý Sayýsý:"+numberOfObjcts);
%%
figure(6);
for i=1:length(info) % bilgi structýnýn eleman sayýsý kadar döngü
    text(info(i).Centroid(1), info(i).Centroid(2), int2str(i))  %nesne merkezinin x,y koordinatlarý 
    rectangle('Position', info(i).BoundingBox,'EdgeColor','g'); %i. BoundingBox koordinatý olan dörtgenler çizildi.
end