clear; clc;close all;
DtoR=2*pi/360;
jiaostep=360/24*DtoR;
 j=0;
    a=26560;% ????????.
e=0.02;%e???????.
E=[0:0.1:2*pi];
x=a*(cos(E)-e);
y=a*sqrt((1-e^2))*sin(E);
z=0*E;
    drawearth(0);
hold on;
for time=1:12 
    axis on; 
A1=32.8 ;%??????.
    A=A1*DtoR;%??????
    B=55*DtoR;%?????
    C=pi/100;%?????
    R1=[cos(A)  -sin(A)  0;
        sin(A)  cos(A)   0;
        0        0       1;];
    R2=[1         0       0;
        0        cos(B)  -sin(B);
        0        sin(B)   cos(B);];
    R3=[cos(C)    -sin(C)    0;
        sin(C)    cos(C)     0;
        0          0        1;];
    L1=length(E);
    R312=R1*R2*R3;
    Ans=R312*[x;y;z;];
    x1=Ans(1,:);
    y1=Ans(2,:);
    z1=Ans(3,:);
    plot3c(x1,y1,z1,2);
    hold on;
  axis equal;
  axis on;
  grid on;
ctable=10; 
        A=A1*DtoR;
        B=55*DtoR;
            C=ctable*DtoR+time*2*pi/24;         %?????
              x=a*(cos(C)-e);
y=a*sqrt((1-e^2))*sin(C);
z=0*C;
 R1=[cos(A)    -sin(A)       0;
      sin(A)    cos(A)       0;
        0           0       1;];
    R2=[1         0        0;
        0        cos(B)  -sin(B);
        0        sin(B)   cos(B);];
    R3=[cos(C)    -sin(C)     0;
        sin(C)    cos(C)      0;
        0          0        1;];
    L1=length(E);
    R312=R1*R2*R3;
    Ans=R312*[x;y;z;];
    x1=Ans(1,:);
    y1=Ans(2,:);
    z1=Ans(3,:);
    drawsatellite(x1,y1,z1,6);   
    M(time)=getframe;
    M(time+1) = getframe;
   end
axis on;            
