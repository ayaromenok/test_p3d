include <../../../../p3d/lib/lib2.scad>

assembly();
//topCenter();

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
       
        topCenter(13,0,0, 90,0,90);
        
        topMotor(110,117,11.5, dir=0);
        topMotor(110,-117,11.5, dir=1);
        topIdle(-100,117,11.5,dir=1);
        topIdle(-100,-117,11.5, my=1, dir=0);
        //chassis
        color("yellow"){
            MGN12H(0,0,0,   90,0,90, length=200);
            MGN12H(0,113,0,   90,0,0, length=200);
            MGN12H(0,-113,0,   -90,0,0, length=200);
            }//color
        color("darkgreen"){
            yCube(200,20,20,    0,127,0);        
            yCube(200,20,20,    0,-127,0);
            yCube(20,234,20,    110,0,0);
            yCube(20,234,20,    -110,0,0);
        }//color
        driveBelt();
    }//transform
}//module

module driveBelt(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        color("blue"){
            yCube(1,80,10, 13,60,20);
            yCube(1,80,10, -13,-60,20);
            yCube(80,1,10, -60,-105,20);
            yCube(1,220,10, -113,10,20, 0,0,4);
            yCube(260,1,10, 15,125,20);
            yCube(120,1,10, 80,105,20);
        }//blue
        
        color("red"){
            yCube(1,80,10, 13,-60,30);
            yCube(1,80,10, -13,60,30);
            yCube(80,1,10, -60,105,30);
            yCube(1,220,10, -113,-10,30, 0,0,-4);
            yCube(260,1,10, 15,-125,30);
            yCube(120,1,10, 80,-105,30);
        }//red
    }//transform
}//module
    
module topIdle(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, dir=0){
    translate([px,py,pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        yCube(40,40,3);
        if (dir){
            yCyl(5,10,  -15,3,7.5, clr="blue");
            yCyl(5,10,  0,-17,17.5, clr="red");
        } else{
            yCyl(5,10,  -15,3,17.5, clr="red");
            yCyl(5,10,  0,-17,7.5, clr="blue");        
        }
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


module MGN12H(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=100){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        yCube(length,12,8);
        difference(){
            yCube(45.4,27,8,    0,0,5);
            yCyl(1.5,20,    10,10,0);
            yCyl(1.5,20,    10,-10,0);
            yCyl(1.5,20,    -10,10,0);
            yCyl(1.5,20,    -10,-10,0);
        }//diff
    }//transform
}//module    

module topCenter(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        difference(){
            yCube(45.46,27,8);
            //holes for connectors
            yCyl(1.8,20,    10,10,0);
            yCyl(1.8,20,    10,-10,0);
            yCyl(1.8,20,    -10,10,0);
            yCyl(1.8,20,    -10,-10,0);
        }//diff
        yCube(50,3,40,  0,10,-10);
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

