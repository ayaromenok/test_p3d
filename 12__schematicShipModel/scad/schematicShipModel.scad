include <../../../../p3d/lib/lib2.scad>

schematicShipModel();

module schematicShipModel(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        yCube(186,21.65,7.34, 0,0,-7.34/2); //bottom
        yCube(186,21.65,4.6, 0,0,4.6/2, clr="blue"); //bottom
        
    }//transform
}//module

