function plot3c(x,y,z,color)
switch (color)
             case 0
               plot3(x,y,z,'w--');
             case 1
               plot3(x,y,z,'r--');
               case 2
               plot3(x,y,z,'g--');
               case 3
               plot3(x,y,z,'c--');
               case 4
               plot3(x,y,z,'m--');
               case 5
              plot3(x,y,z,'y--');
                case 6
               plot3(x,y,z,'b--');
                case 7
               plot3(x,y,z,'k--');
           otherwise
end
