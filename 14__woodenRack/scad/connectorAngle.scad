include <../../../../p3d/lib/lib2.scad>

connectorAngle();

module connectorAngle(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        difference(){
            yPoly(p=[[70,0],[70,14],[10,70],[0,70],[0,0]], szz=4, px=10,py=-5,pz=10);
            yCyl(1.6,10,  20,0,15);
            yCyl(1.6,10,  50,0,15);
            yCyl(1.6,10,  75,0,15);
            yCyl(1.6,10,  16,30,14);
            yCyl(1.6,10,  16,60,14);
        }//diff
        difference(){
            yPoly(p=[[70,10],[70,24],[0,70],[0,0]], szz=4, px=14,py=-5,pz=14, ry=-90);        
            yCyl(1.6,10,  10,15,20, 0,90,0);
            yCyl(1.6,10,  10,15,50, 0,90,0);
            yCyl(1.6,10,  10,15,79, 0,90,0);
            
            yCyl(5.6,30,  18,30,24, 0,10,0);
            yCyl(5.6,30,  18,60,24, 0,10,0);
        }//diff        
        yPoly(p=[[70,0],[0,66],[0,0]], szz=4, px=14,py=5,pz=14, ry=-90, rz=-90);
        yPoly(p=[[30,10],[0,10],[0,0]], szz=4, px=44,py=-5,pz=14, ry=-90);        
        yPoly(p=[[15,10],[0,10],[0,0]], szz=4, px=64,py=-5,pz=14, ry=-90);        
        /*
        color("yellow"){
            yCube(100,10,20, 50,0,0);
            yCube(10,20,100, 5,15,0);
            yCube(10,100,20, 15,55,0);
        }//color
        */
    }//transform
}//module