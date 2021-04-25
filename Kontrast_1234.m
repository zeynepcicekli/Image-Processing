%% MB0047 Bilgisayarda Grafik Arasýnav Ödevi 
%% 1.1 Kontrast (Cubuk)
cubuk=imread('cubuk.png'); %%resim dosyasý bir matrise aktarýlýr.
figure, imshow(cubuk); %resim olarak görüntelenir.
title('Cubuk Resminin Orijinal Hali');
%% Griye Çevirme (Çubuk)
cubuk2=rgb2gray(cubuk); %%resim griye çevirilir.
figure, imshow(cubuk2); %resim olarak görüntelenir.
title('Cubuk Griye Çevirilmiþ Hali');
figure, imhist(cubuk2); %histogram olarak görüntelenir.
title('Gri Histogram')
%% Kontrast Ayarlama (Çubuk)
a=50; b=200; c=5; d=250; %histogram deðerleri geniþletildi

[m,n]=size(cubuk2);
yenicubuk=cubuk2;
for x=1:m
    for y=1:n
        yenicubuk(x,y)=((d-c)/(b-a))*(cubuk2(x,y)-a)+c;
    end
end
figure, imshow(yenicubuk);
figure, imhist(yenicubuk);
title('Kontrastý Arttýrýlmýþ Hali');
%% 1.2 Kontrast (lowcont)
lowcont=imread('lowcontrast.png'); %%resim dosyasý bir matrise aktarýlýr.
figure, imshow(lowcont); %resim olarak görüntelenir.
title('Cubuk Resminin Orijinal Hali');
%% Griye Çevirme (lowcont)
lowcont2=rgb2gray(lowcont); %%resim griye çevirilir.
figure, imshow(lowcont2); 
title('lowcont Griye Çevirilmiþ Hali');
figure, imhist(lowcont2);
title('Gri Histogram')
%% Kontrast Ayarlama (lowcont)
a=40; b=200; c=5; d=250; %histogram deðerleri geniþletildi


[m,n]=size(lowcont2)
yenilowcont=lowcont2;
for x=1:m
    for y=1:n
        yenilowcont(x,y)=((d-c)/(b-a))*(lowcont2(x,y)-a)+c;
    end
end
figure, imhist(yenilowcont);
figure, imshow(yenilowcont);
title('Kontrastý Arttýrýlmýþ Hali');
%% 1.3 Kontrast (Tree)
tree=imread('snow_tree.png'); %%resim dosyasý bir matrise aktarýlýr.
figure, imshow(tree); %resim olarak görüntelenir.
title('Tree Resminin Orijinal Hali');
%% Griye Çevirme (Tree)
tree2=rgb2gray(tree); %%resim griye çevirilir.
figure, imshow(tree2); 
title('Tree Griye Çevirilmiþ Hali');
figure, imhist(tree2);
title('Gri Histogram')
%% Kontrast Ayarlama (Tree)
a=90; b=205; c=5; d=250; %histogram deðerleri geniþletildi


[m,n]=size(tree2)
yenitree=tree2;
for x=1:m
    for y=1:n
        yenitree(x,y)=((d-c)/(b-a))*(tree2(x,y)-a)+c;
    end
end
figure, imhist(yenitree);
figure, imshow(yenitree);
title('Kontrastý Arttýrýlmýþ Hali');
%% 1.4 Kontrast (Stone)
stone=imread('stone.png'); %%resim dosyasý bir matrise aktarýlýr.
figure, imshow(stone); %resim olarak görüntelenir.
title('Stone Resminin Orijinal Hali');
%% Griye Çevirme (Stone)
stone2=rgb2gray(stone); %%resim griye çevirilir.
figure, imshow(stone2); 
title('Griye Çevirilmiþ Hali');
figure, imhist(stone2);
title('Gri Histogram')

%% Kontrast Ayarlama (Stone)
a=150; b=250; c=5; d=250; %histogram deðerleri geniþletildi


[m,n]=size(stone2)
yenistone=stone2;
for x=1:m
    for y=1:n
        yenistone(x,y)=((d-c)/(b-a))*(stone2(x,y)-a)+c;
    end
end
figure, imhist(yenistone);
figure, imshow(yenistone);
