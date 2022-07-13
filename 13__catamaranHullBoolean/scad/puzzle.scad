include <../../../../p3d/lib/lib2.scad>

puzzle_v0();

module puzzle_v0(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        difference(){
            yCube(10,20,20,     10,0,0);
            yCone(5,3,   6.45,0,0, 0,90,0);
            }//dif
        union(){            
            yCube(10,20,20,     -10,0,0);
            yCone(4.3,2.6,   -3.9,0,0, 0,90,0);        
            }//union
    }//ternsform
}//module