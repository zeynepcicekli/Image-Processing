morf4=imread('morfoloji4.jpg');  %resim dosyas� bir matrise aktar�l�r.
figure, imshow(morf4); %resim olarak g�r�ntelenir.
%%
morf41=rgb2gray(morf4);  %resim griye �evrilir.
figure, imshow(morf41); %resim olarak g�r�ntelenir.
%%
morf42=imbinarize(morf41);% ikili g�r�nt�ye �evrilir.
figure, imshow(morf42); %resim olarak g�r�ntelenir.
%%
morf43=imcomplement(morf42); %tersi al�n�r
figure, imshow(morf43); %resim olarak g�r�ntelenir.
%%
mye=strel('disk',4); 
morf44=imerode(morf43,mye); %a��nd�r�ld�
figure, imshow(morf44)%resim olarak g�r�ntelenir.
%%
mye1=strel('disk', 3);
morf45=imerode(morf44, mye1);
figure, imshow(morf45)%resim olarak g�r�ntelenir.
%%
morf46=imdilate(morf45, mye); %a��nd�r�ld�
figure, imshow(morf46)%resim olarak g�r�ntelenir.
%%
mask= morf41;
mask(~morf46)=0
figure, imshow(mask) %resim olarak g�r�ntelenir.
%%
label=bwlabel(morf46); %etiketlendi
%%
ozn=regionprops(morf46,'all'); %�znitelikler ��kar�ld�
%%
kalan=false(size(morf46));
for i=1:length(ozn)  % bilgi struct�n�n eleman say�s� kadar d�ng�
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
for i=1:length(ozn2)  % bilgi struct�n�n eleman say�s� kadar d�ng�
    if((ozn2(i).MeanIntensity < 100 & ozn2(i).Area< 536 ))
        kalan2(ozn2(i).PixelIdxList)=true;
    end
end
figure, imshow(kalan2); %resim olarak g�r�ntelenir.
%%
mask2=morf41;
mask2(~kalan2)=0;
figure, imshow(mask2) %maskelendi

