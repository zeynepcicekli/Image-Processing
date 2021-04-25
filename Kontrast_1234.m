%% MB0047 Bilgisayarda Grafik Aras�nav �devi 
%% 1.1 Kontrast (Cubuk)
cubuk=imread('cubuk.png'); %%resim dosyas� bir matrise aktar�l�r.
figure, imshow(cubuk); %resim olarak g�r�ntelenir.
title('Cubuk Resminin Orijinal Hali');
%% Griye �evirme (�ubuk)
cubuk2=rgb2gray(cubuk); %%resim griye �evirilir.
figure, imshow(cubuk2); %resim olarak g�r�ntelenir.
title('Cubuk Griye �evirilmi� Hali');
figure, imhist(cubuk2); %histogram olarak g�r�ntelenir.
title('Gri Histogram')
%% Kontrast Ayarlama (�ubuk)
a=50; b=200; c=5; d=250; %histogram de�erleri geni�letildi

[m,n]=size(cubuk2);
yenicubuk=cubuk2;
for x=1:m
    for y=1:n
        yenicubuk(x,y)=((d-c)/(b-a))*(cubuk2(x,y)-a)+c;
    end
end
figure, imshow(yenicubuk);
figure, imhist(yenicubuk);
title('Kontrast� Artt�r�lm�� Hali');
%% 1.2 Kontrast (lowcont)
lowcont=imread('lowcontrast.png'); %%resim dosyas� bir matrise aktar�l�r.
figure, imshow(lowcont); %resim olarak g�r�ntelenir.
title('Cubuk Resminin Orijinal Hali');
%% Griye �evirme (lowcont)
lowcont2=rgb2gray(lowcont); %%resim griye �evirilir.
figure, imshow(lowcont2); 
title('lowcont Griye �evirilmi� Hali');
figure, imhist(lowcont2);
title('Gri Histogram')
%% Kontrast Ayarlama (lowcont)
a=40; b=200; c=5; d=250; %histogram de�erleri geni�letildi


[m,n]=size(lowcont2)
yenilowcont=lowcont2;
for x=1:m
    for y=1:n
        yenilowcont(x,y)=((d-c)/(b-a))*(lowcont2(x,y)-a)+c;
    end
end
figure, imhist(yenilowcont);
figure, imshow(yenilowcont);
title('Kontrast� Artt�r�lm�� Hali');
%% 1.3 Kontrast (Tree)
tree=imread('snow_tree.png'); %%resim dosyas� bir matrise aktar�l�r.
figure, imshow(tree); %resim olarak g�r�ntelenir.
title('Tree Resminin Orijinal Hali');
%% Griye �evirme (Tree)
tree2=rgb2gray(tree); %%resim griye �evirilir.
figure, imshow(tree2); 
title('Tree Griye �evirilmi� Hali');
figure, imhist(tree2);
title('Gri Histogram')
%% Kontrast Ayarlama (Tree)
a=90; b=205; c=5; d=250; %histogram de�erleri geni�letildi


[m,n]=size(tree2)
yenitree=tree2;
for x=1:m
    for y=1:n
        yenitree(x,y)=((d-c)/(b-a))*(tree2(x,y)-a)+c;
    end
end
figure, imhist(yenitree);
figure, imshow(yenitree);
title('Kontrast� Artt�r�lm�� Hali');
%% 1.4 Kontrast (Stone)
stone=imread('stone.png'); %%resim dosyas� bir matrise aktar�l�r.
figure, imshow(stone); %resim olarak g�r�ntelenir.
title('Stone Resminin Orijinal Hali');
%% Griye �evirme (Stone)
stone2=rgb2gray(stone); %%resim griye �evirilir.
figure, imshow(stone2); 
title('Griye �evirilmi� Hali');
figure, imhist(stone2);
title('Gri Histogram')

%% Kontrast Ayarlama (Stone)
a=150; b=250; c=5; d=250; %histogram de�erleri geni�letildi


[m,n]=size(stone2)
yenistone=stone2;
for x=1:m
    for y=1:n
        yenistone(x,y)=((d-c)/(b-a))*(stone2(x,y)-a)+c;
    end
end
figure, imhist(yenistone);
figure, imshow(yenistone);
