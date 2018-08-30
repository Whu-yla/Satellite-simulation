function caluserposition=calculateuserposition(SatellitePosition) 
global SatellitePosition              
 %????????????????????satelliteposotion???????satelliteposotion??????????satelliteposition????global
r1=6400;                                                    %????
c=300000;
deltat=0.00001;
satelliteposnew=ones(1,3);
vissatnum=0;
calculateok=1;
for k=1:24
    if(SatellitePosition(k,4)==1)
        vissatnum=vissatnum+1;
        satelliteposnew=[satelliteposnew;SatellitePosition(k,1:3)];
    end%if
end%for
satelliteposnew(1,:)=[];
if(vissatnum<4)
    calculateok=0;
    caluserposition=[0 0 0 0];
    return
end
prange=ones(1,vissatnum);
userpos=SatellitePosition(25,1:3);
for n=1:vissatnum    prange(1,n)=sqrt((satelliteposnew(n,:)-userpos)*(satelliteposnew(n,:)-userpos)')+c*deltat;
end
calculaterecord=[0    0   0];
xyz0=[0 0 0];
deltat0=0;
wxyz=satelliteposnew;
Error=1000;
computertime=0;
while((Error>0.00001)&(computertime<1000))
    computertime=computertime+1;
    r=ones(1,vissatnum);
    for n=1:vissatnum
        r(1,n)=sqrt((wxyz(n,:)-xyz0)*(wxyz(n,:)-xyz0)')+deltat0*c;
    end
    deltap=r-prange;
    A=ones(vissatnum,3);
    for n=1:vissatnum
    A(n,:)=(wxyz(n,:)-xyz0)./r(1,n);
    end%for
    H=[A ones(vissatnum,1)];
    deltax=inv(H'*H)*H'*deltap';
    tempdeltax=deltax(1:3)
    Error=max(abs(tempdeltax));
    xyz0=xyz0+deltax(1:3,:)';
    if(computertime<1000)
        calculaterecord=[calculaterecord;xyz0];
    end
    deltat0=deltax(4,1)/(-c);
end%while
calculaterecord;
if(computertime==1000)
    caluserposition=[99999999999 99999999999 999999999999];
else
    caluserposition=[xyz0;calculaterecord];
end
