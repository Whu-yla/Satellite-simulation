function drawearth(time)
%time ???
%??????,???????????????
r=6400;
time=0;
j1=[0:pi/10:2*pi];
w1=[-pi/2:pi/10:pi/2];
L1=length(w1);
L2=length(j1);
for n=1:L1
    z=ones(L2,1);
    z=z*r*sin(w1(n));
    temp=r*cos(w1(n));
    x=temp*sin(j1);
    y=temp*cos(j1);
    plot3(x,y,z);
    hold on;
    grid;
end
%figure(3);
unit=ones(1,1);
z0=ones(1,1);
x0=ones(1,1);
y0=ones(1,1);

for n=1:L2
    %n=7;
    for m=1:L1
        temp=w1(m);
        temp2=j1(n)+time*pi/12;
        z=r*sin(temp);
        x=r*cos(temp)*sin(temp2);
        y=r*cos(temp)*cos(temp2);
        z1=unit*z;
        x1=unit*x;
        y1=unit*y;
        z0=[z0  z1];
        x0=[x0  x1];
        y0=[y0  y1];
    end
    z0(:,1)=[];
    x0(:,1)=[];
    y0(:,1)=[];
    plot3(x0,y0,z0);
    axis equal;
    axis off;
    hold on;
end
