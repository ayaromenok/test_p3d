include <../../../../p3d/lib/lib2.scad>

amg8833Connetor();

module amg8833Connetor(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        difference(){
            yMinkCubeCyl(60,50,4,3);
            yCyl(1.8,10,    27,22,0);
            yCyl(1.8,10,    27,-22,0);
            yCyl(1.8,10,    -27,22,0);
            yCyl(1.8,10,    -27,-22,0);
            yMinkCubeCyl(20,40,5,3, 10);
            yMinkCubeCyl(20,40,5,3, -13);
        }//difference
        difference(){
            yMinkCubeCyl(22,12,7,4, 28,6,9, 0,90);
            yCyl(0.9,10,    28,8,11-13.2/2, 0,90);
            yCyl(0.9,10,    28,8,11+13.2/2, 0,90);
            yCube(4,10,30, 32,1.5,12);
        }//difference
        
    }//transform
}//module

