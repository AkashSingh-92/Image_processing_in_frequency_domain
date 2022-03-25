clc;
clear all;

f1=double(imread('cameraman.tif'));
F1=fft2(f1);

figure(1),imshow(uint8(f1))
figure(2),imagesc(log(1+abs(F1)))

[row,col]=size(f1);
for x=1:1:row
    for y=1:1:col
        f(x,y)=f1(x,y)*(-1)^(x+y);
    end
end

F=fft2(f);
figure(3),imagesc(log(1+abs(F)))

%%%%%%%%%%%%%%%%%%%%%%%%%%%

D0=35;
n=2;
for u=1:1:row
    for v=1:1:col
        D(u,v)=sqrt((u-row/2)^2+(v-col/2)^2);
        H(u,v)=1-(exp(-((D(u,v)*D(u,v))/(2*D0*D0))));
    end
end

figure(4), imshow(H)
figure(5), mesh(H)
%%%%%%%%%%%%%%%%%%%%%%%%%%

G=F.*H;
g=abs(ifft2(G));
figure(6), imshow(uint8(g))