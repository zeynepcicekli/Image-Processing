morf2=imread('Morfoloji2.PNG');  %orijinal g�r�nt�
figure, imshow(morf2); %resim olarak g�r�ntelenir.
%%
morf21=rgb2gray(morf2); %griye �evrildi.
figure, imshow(morf21); %resim olarak g�r�ntelenir.
%%
morf22=imbinarize(morf21); %ikili g�r�nt�ye �evrildi.
figure, imshow(morf22); %resim olarak g�r�ntelenir.
%%
morf23=imcomplement(morf22); %g�r�nt�n�n tersi al�nd�
figure, imshow(morf23) %resim olarak g�r�ntelenir.
%%
morf24=imfill(morf23,'holes'); %bo�luklar dolduruldu
figure, imshow(morf24); %resim olarak g�r�ntelenir.
%%
morf25=strel('disk', 1) %g�r�nt� a��nd�r�ld�
morf25=imerode(morf24, morf25)
figure, imshow(morf25) %resim olarak g�r�ntelenir.
%%
label=bwlabel(morf25); %etiketlendirildi
%%
number=max(max(label)) % kac nesne oldu�u en buyuk etiket de�eri ile bulundu
%%
objects=bwconncomp(morf25); % nesneler bir structa kaydedildi
%%
info=regionprops(morf25, 'Basic');
%%
[centers, radii, metric]=imfindcircles(morf25,[6,50],'Sensitivity',0.60); %yuvarl�k tespiti
%%
[label, numberOfObjcts]=bwlabel(morf25); 
Cevre=regionprops(label,'Perimeter','Area');%�ekillerin �evrelerini ve alanlar�n� bulduk.
daire=[Cevre.Perimeter].^2 ./(4*pi*[Cevre.Area]);%�ekillerin yuvarlakl���na bakt�k.
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
disp("Daire Say�s�:"+length(centers));
disp("Elips Say�s�:"+elips);
disp("D�rtgen Say�s�:"+dortgen);
disp("��gen Say�s�:"+ucgen);
disp("Toplam Obje Say�s� Say�s�:"+numberOfObjcts);
%%
figure(6);
for i=1:length(info) % bilgi struct�n�n eleman say�s� kadar d�ng�
    text(info(i).Centroid(1), info(i).Centroid(2), int2str(i))  %nesne merkezinin x,y koordinatlar� 
    rectangle('Position', info(i).BoundingBox,'EdgeColor','g'); %i. BoundingBox koordinat� olan d�rtgenler �izildi.
end