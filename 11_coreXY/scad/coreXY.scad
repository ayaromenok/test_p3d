include <../../../../p3d/lib/lib2.scad>

assembly();


module assembly(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
    
        topSide(0,100,0, 90,180,0);
        yCyl(5,10,  18,-100,29, clr="red");
        yCyl(5,10,  -18,-100,19, clr="blue");
        mirror([0,0,1])
        topSide(0,-100,0, -90,180,0);        
        yCyl(5,10,  18,100,19, clr="blue");
        yCyl(5,10,  -18,100,29, clr="red");
       
        
        topMotor(110,117,11.5, dir=0);
        topMotor(110,-117,11.5, dir=1);
        topIdle(-100,117,11.5);
        topIdle(-100,-117,11.5, my=1);
        //chassis
        color("darkgreen"){
            yCube(200,20,20,    0,127,0);        
            yCube(200,20,20,    0,-127,0);
            yCube(20,234,20,    110,0,0);
            yCube(20,234,20,    -110,0,0);
        }//color
    }//transform
}//module

module topIdle(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        yCube(40,40,3);
        yCyl(5,10,  -15,3,7.5, clr="blue");
        yCyl(5,10,  0,-17,17.5, clr="red");
    }//transform
}//module
module topMotor(px=0,py=0,pz=0, rx=0,ry=0,rz=0, dir=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        yCube(60,40,3,  20,0,0);
        yCube(42.3,42.3,40, 34,0,-20,clr="green");
        if (dir){
            yCyl(8,10,  34,0,10, clr="red");
        } else {
            yCyl(8,10,  34,0,10, clr="blue");
        }
        
    }//transform
}//module


//16.8mm MGN12H
module topSide(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        difference(){
            yCube(45.46,27,8);
            //holes for connectors
            yCyl(1.8,20,    10,10,0);
            yCyl(1.8,20,    10,-10,0);
            yCyl(1.8,20,    -10,10,0);
            yCyl(1.8,20,    -10,-10,0);
            //holes for xy
            yCyl(1.8,40,    18,0,0, 90,0,0);
            yCyl(1.8,40,    -18,0,0, 90,0,0);        
            yCyl(6,18,    19,8,0, 90,0,0);
            yCyl(6,18,    -19,8,0, 90,0,0);
        }//difference
        
        
        //translate([4,0,0])
        yCube(7,2.5,52,  5,10,30,  0,0,90);
        yCube(7,2.5,52,  5,-10,30,  0,0,90);
        difference(){
            
            union(){
                yCube(6.6,8.6,52,  10,0,30,  0,0,90);
                yCube(16.6,4.6,52,  6,0,30,  0,0,90);
            }//union
            yCube(12.6,8.6,54,  0,0,30,  0,0,90);
            yCube(12.6,8.6,54,  8,12,30,  0,0,-45);
            yCube(12.6,8.6,54,  8,-12,30,  0,0,45);
            
            yCyl(1.2,20,    10,0,18, 0,90,0);
            yCyl(1.2,20,    10,0,(18+25), 0,90,0);
        }//difference
        
    }//transform
}//module

