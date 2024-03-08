include <../../../../p3d/lib/lib2.scad>

support(0,0,0, 270,0,90);

module support(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        difference(){
            union(){
                yCube(120,20,20);
                difference(){
                    yCube(114,40,15,     0,-23,9, -30,0,0);      
                    yCube(120,40,20,     0,-25,20, 0,0,0);      
                }//difference
            }//union
            yCyl(3.4,30);
            yCyl(1.8,100,  50,0,0, 90,0,0);
            yCyl(1.8,100,  -50,0,0, 90,0,0);
            //yCyl(1.8,100,  50,0,0, 90,0,0);
            
        }//difference
        difference(){
            yCube(50,20,10,     68,0 ,20, 0,-60,0);        
            yCyl(1.8,100,  78,0,38, 90,0,0);
        }//difference
        difference() {
            yCube(50,20,10,     -68,0,20, 0,60,0);
            yCyl(1.8,100,  -78,0,38, 90,0,0);
        }//difference
        
    }//transform
}//module

