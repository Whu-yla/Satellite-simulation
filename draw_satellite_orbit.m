function draw_satellite_orbit
a=26560;% ????????.
e=0.02;%e???????.
E=[0:0.1:2*pi];
x=a*(cos(E)-e);
y=a*sqrt((1-e^2))*sin(E);
z=0*E;
DtoR=2*pi/360;
A1=[32.8  92.8  152.8  212.6  272.8  332.8];%??????.
for k=1:6
    A=A1(k)*DtoR;%??????
    B=55*DtoR;%?????
    C=pi/100;%?????
    %???6???????
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
    plot3c(x1,y1,z1,k);
    boxplot3(0,0,0,200,200,200,7); 
    hold on;
  axis equal;
  axis off;
end
