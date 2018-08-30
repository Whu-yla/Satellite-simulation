%??????????????????????????????????90?,???????????.
     earthcenterpos=[0 0 0];
     userposition=[6400  3352  5410];               %?????????
     for k=1:24
     SatellitePosition(k,:)=ttum(k,:);
     end
     for k=1:24
         temp=SatellitePosition(k,1:3)-userposition;
         Dist1=temp*temp';
         temp=userposition-earthcenterpos;
         Dist2=temp*temp';
         temp=SatellitePosition(k,1:3)-earthcenterpos;
         Dist3=temp*temp';
         jiajiao=acos((Dist3+Dist2-Dist1)/2/sqrt(Dist3)/sqrt(Dist2));
         if(jiajiao>=pi/2)
             SatellitePosition(k,4)=0;
         end
     end
     figure(1)
    drawearth(0);                             
     hold on;
     draw_satellite_orbit;  
      tempx=userposition(1);
     tempy=userposition(2);
     tempz=userposition(3);
         cube=55;
         boxplot3(tempx,tempy,tempz,cube,cube,cube,7);             
         hold on; %??????????????????
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
     hold on;
     SatellitePosition=[SatellitePosition;userposition 0];     
   %???caluserpos??????????.
     caluserpos=calculateuserposition(SatellitePosition); 
     [m,n]=size(caluserpos);
     for(k=3:m);
         tempx=caluserpos(k,1);
         tempy=caluserpos(k,2);
         tempz=caluserpos(k,3);
         cube=50;
         boxplot3(tempx,tempy,tempz,cube,cube,cube,0);             
         hold on;
     end
