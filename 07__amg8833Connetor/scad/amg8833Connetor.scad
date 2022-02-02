include <../../../../p3d/lib/lib2.scad>

amg8833Connetor();

module amg8833Connetor(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        difference(){
            union(){
                yMinkCubeCyl(100,46,6,3, -20,0,-1);
                yMinkCubeCyl(25,30,9,3, -80,-3,2.5);
            }//union
            yCyl(1.8,10,    10,20,0);
            yCyl(1.8,10,    10,-20,0);
            yCyl(1.8,10,    -10,20,0);
            yCyl(1.8,10,    -10,-20,0);
            yCyl(1.8,10,    -30,20,0);
            yCyl(1.8,10,    -30,-20,0);
            yCyl(1.8,10,    -50,20,0);
            yCyl(1.8,10,    -50,-20,0);
            yMinkCubeCyl(20,32,10,3, 10);
            yMinkCubeCyl(20,32,10,3, -13);
            yCube(36,26,5,  -48,0,2);
            yCube(36,12,15,  -73,0,8);
            yCube(36,8,15,  -78,0,8);
            yCyl(2,40,    -80,-10,7, 0,90,0);
            //holes
            yCyl(0.9,10,    -75,-14,4);
            yCyl(0.9,10,    -85,-14,4);
            yCyl(0.9,10,    -75,9,4);
            yCyl(0.9,10,    -85,9,4);
            yCyl(0.9,10,    -60,20,0);
            yCyl(0.9,10,    -40,20,0);
            yCyl(0.9,10,    -60,-20,0);
            yCyl(0.9,10,    -40,-20,0);
            yCyl(0.9,10,    -20,-20,0);
            yCyl(0.9,10,    0,-20,0);
            yCyl(0.9,10,    20,-20,0);            
            yCyl(0.9,10,    -20,20,0);
            yCyl(0.9,10,    0,20,0);
            yCyl(0.9,10,    20,20,0);
        }//difference
        
        translate([0,-5,0])
        difference(){
            yMinkCubeCyl(22,12,7,4, 28,6,9, 0,90);
            yCyl(0.9,10,    28,8,11-13.2/2, 0,90);
            yCyl(0.9,10,    28,8,11+13.2/2, 0,90);
            yCube(4,10,30, 32,1.5,12);
        }//difference
        
    }//transform
}//module

