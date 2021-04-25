morf4=imread('morfoloji4.jpg');  %resim dosyasý bir matrise aktarýlýr.
figure, imshow(morf4); %resim olarak görüntelenir.
%%
morf41=rgb2gray(morf4);  %resim griye çevrilir.
figure, imshow(morf41); %resim olarak görüntelenir.
%%
morf42=imbinarize(morf41);% ikili görüntüye çevrilir.
figure, imshow(morf42); %resim olarak görüntelenir.
%%
morf43=imcomplement(morf42); %tersi alýnýr
figure, imshow(morf43); %resim olarak görüntelenir.
%%
mye=strel('disk',4); 
morf44=imerode(morf43,mye); %aþýndýrýldý
figure, imshow(morf44)%resim olarak görüntelenir.
%%
mye1=strel('disk', 3);
morf45=imerode(morf44, mye1);
figure, imshow(morf45)%resim olarak görüntelenir.
%%
morf46=imdilate(morf45, mye); %aþýndýrýldý
figure, imshow(morf46)%resim olarak görüntelenir.
%%
mask= morf41;
mask(~morf46)=0
figure, imshow(mask) %resim olarak görüntelenir.
%%
label=bwlabel(morf46); %etiketlendi
%%
ozn=regionprops(morf46,'all'); %öznitelikler çýkarýldý
%%
kalan=false(size(morf46));
for i=1:length(ozn)  % bilgi structýnýn eleman sayýsý kadar döngü
    if(( ozn(i).MinorAxisLength)/(ozn(i).MajorAxisLength)< 0.8)
        kalan(ozn(i).PixelIdxList)=true;
    end
    text(ozn(i).Centroid(1),ozn(i).Centroid(2),int2str(i));
    rectangle('Position',ozn(i).BoundingBox,'EdgeColor','r');
end
morf47=bwpropfilt(morf46,'area',[0 700])
figure, imshow(kalan)
%%
ozn2=regionprops(kalan,morf41,'all');
kalan2=false(size(morf46));
for i=1:length(ozn2)  % bilgi structýnýn eleman sayýsý kadar döngü
    if((ozn2(i).MeanIntensity < 100 & ozn2(i).Area< 536 ))
        kalan2(ozn2(i).PixelIdxList)=true;
    end
end
figure, imshow(kalan2); %resim olarak görüntelenir.
%%
mask2=morf41;
mask2(~kalan2)=0;
figure, imshow(mask2) %maskelendi

