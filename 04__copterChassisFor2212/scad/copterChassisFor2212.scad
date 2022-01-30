include <../../../../p3d/lib/lib2.scad>
include <../../../../p3d/lib/lib2/ext/motor.scad>
include <../../../../p3d/lib/lib2/ext/prop.scad>

//copterChassisFor2212_arm_top(0,0,15.5, 180,0,0);
copterChassisFor2212_arm(length=50);

module copterChassisFor2212_arm(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=50, showMetal=false){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        //yCube(30,20,10);
        yTube(10,1.5,5,    0,0,0);
        difference(){
            yCyl(10,10,          length,0,2.5);
            yCyl(0.8,10, length,5,0);
            yCyl(0.8,10, length,-5,0);
            yCyl(0.8,10, length+5,0,0);
            yCyl(0.8,10, length-5,0,0);
        }//difference
        difference(){
            yMinkCubeSphere(length-10,12,12,4, (length-10)/2+5,0,7.5, sz=1.69);
            yCube(length,6,12, (length-10)/2+5,0,12.5);
            yCube(length,12,10, (length-10)/2+5,0,18);
        }//difference
        
        blMotor2212_botX(length,0,29.5, 0,0,45, height=10, holesR=0.8);
        if(showMetal){
            blMotor2212(length,0,31.5);
        }//ifshowMetal        
    }//transform
}//module


module copterChassisFor2212_arm_top(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=50){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        //yCube(30,20,10);
        yTube(10,1.5,5,    0,0,0);        
        difference(){
            yMinkCubeSphere(length-10,12,12,4, (length-10)/2+5,0,7.5, sz=1.69);
            yCube(length,6,12, (length-10)/2+5,0,12.5);
            yCube(length,12,20, (length-10)/2+5,0,12.5);
        }//difference        
        
    }//transform
}//module

