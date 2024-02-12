include <../../../../p3d/lib/lib2.scad>

jalousie();

module jalousie(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        height = 30;
       //*
        difference(){
            union(){
                yCube(32.6,25.6,1.6, -0.6,0,0);
                yCube(33.8,3.6, height, 0,14.6,(height/2-0.8));
                yCube(33.8,3.6,height, 0,-14.6,(height/2-0.8));
                yCube(1.6, 27, height,   16.1,0,(height/2-0.8));
            }//union
            yCube(2.1, 28, height,   -15,0,(height/2+0.2));
        }//difference
        //*/
       yCube(1.6, 27.5,height,   -35,0,0.8, 0,90,0);
    }//transform
}//module

