%Hossein sheikhshoaie
%2D temperature distribution of fin.
clc;
clear all;
disp('This is written to show the temperature distribution of a simple fin.');
disp('We ignore the top part of the T_shaped fin,because of the large amount of h.');
disp('Af is the area of fin and l1 is the length of fin.');
disp('by entering the number of node you can set the accuracy of distribution.');
Af=input('please enter Af:');
l1=input('please enter l1:');
o=input('How many nodes do you have in any direction?');
t1=Af/l1;
teta=zeros(o+1,o+1);
tetab=100;
w=0;
for y=0:l1/o:l1
    w=w+1;
    k=0;
    for x=0:t1/o:t1
        k=k+1;
syms n 
q=4*tetab*sinh(((2*n+1)*pi/t1)*y)*sin(((2*n+1)*pi/t1)*x)/((2*n+1)*pi*sinh(((2*n+1)*pi/t1)*l1));
teta(w,k)=symsum(q,n,0,30);
    end
end
x=0:t1/o:t1;
y=l1:-l1/o:0;
[X,Y]=meshgrid(x,y);
contour(X,Y,teta,'ShowText','on');
hold on;
