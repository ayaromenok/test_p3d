include <../../../../p3d/lib/lib2.scad>

plasticTube();

module plasticTube(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        difference(){        
            union(){
                yCyl(20,86);
                //yCyl(30,10);
                yCone(30,30, 0,0,-28);
                yCone(30,30, 0,0,28, 180,0,0);
            }//union
        yCyl(10,90);
        yCyl(11.2,7, 0,0,40);
        yCyl(11.2,7, 0,0,-40);
        
        }//difference
    }//transform
}//module