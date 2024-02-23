include <../../../../p3d/lib/lib2.scad>

plasticTube200x55mmHolder();

module plasticTube200x55mmHolder(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        difference(){
        yCube(170,30,8,    0,-10,0);
        
        yCyl(4.4,20, 76,0,0);
        yCube(8.8,20,20,   73,9,0, 0,0,20);
        yCube(8.8,20,20,   79,9,0, 0,0,-20);
        
        yCube(4.8,40,20,   -73,-30,0, 0,0,0);
        yCube(200,20,20,   38,-18,0, 0,0,0);
        }//difference
    }//transform
}//module

