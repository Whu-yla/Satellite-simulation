clear;clc;close all;
a=26560;                                          % ????????.
e=0.02;    
temp=0;%????????????????????
%e???????.
E=[0:0.1:2*pi];
x=a*(cos(E)-e);
y=a*sqrt((1-e^2))*sin(E);
z=0*E;
timenow=0;%?????
global SatellitePosition
global ttum
SatellitePosition=ones(24,4);
figure(1);
drawearth(0);   
ttum=ones(24,4);
hold on;
DtoR=2*pi/360;
A1=[32.8  92.8  152.8  212.6  272.8  332.8];
draw_satellite_orbit;                                                            
ctable=[10 50 160 260;                                  %?????
        80 180 220 320;
        10 130 250 340;
        50 150 170 300;
        100 210 310 340;
        120 140 240 350;];
    simple=1;
     for k=1:6
        A=A1(k)*DtoR;                                %?????
        B=55*DtoR;                                   %????
        for m=1:4
            C=ctable(k,m)*DtoR+timenow*2*pi/24;         %?????
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
    L1=length(E);    R312=R1*R2*R3;
    Ans=R312*[x;y;z;];
    x1=Ans(1,:);
    y1=Ans(2,:);
    z1=Ans(3,:);
   drawsatellite(x1,y1,z1,k);                              
    temp=temp+1;
    SatellitePosition(temp,:)=[x1 y1 z1 1];
    ttum(temp,:)=[x1 y1 z1 1];
    hold on;
        end
     end
 %??????????????????????????????????90?,???????????.
     earthcenterpos=[0 0 0];
     userposition=[6400  3352  5410];               %?????????
     for k=1:24
         temp=SatellitePosition(k,1:3)-userposition;
         Dist1=temp*temp';
         temp=userposition-earthcenterpos;
         Dist2=temp*temp';
         temp=SatellitePosition(k,1:3)-earthcenterpos;
         Dist3=temp*temp';
         jiajiao=acos((Dist2+Dist3-Dist1)/2/sqrt(Dist3)/sqrt(Dist2));
         if(jiajiao>=pi/2)
             SatellitePosition(k,4)=0;
             %ttum(k,:)=SatellitePosition(k,1:3);
         end
     end
   %  ttum     
     figure(2)
    drawearth(0);                                     
     hold on;
     draw_satellite_orbit;  
         j=1;
      for k=1:6
          for m=1:4
         if(SatellitePosition(j,4)==1)
             tempx=SatellitePosition(j,1);
             tempy=SatellitePosition(j,2);
             tempz=SatellitePosition(j,3);
             drawsatellite(tempx,tempy,tempz,k);            
         end
          j=j+1;
          end
      end
     tempx=userposition(1);
     tempy=userposition(2);
     tempz=userposition(3);
     cube=100;
     boxplot3(tempx,tempy,tempz,cube,cube,cube,6); %???????? 
