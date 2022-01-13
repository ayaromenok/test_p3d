include <../../../../p3d/lib/lib2.scad>
include <../../../../p3d/lib/lib2/ext/servo.scad>
//155x92x12
//rubber pipe - diam6mm, bottom 10mm
//ventHoleDoorTop(0,0,15, 180,0,0);
//ventHoleDoorTop();
//ventHoleDoorBot(showMetal=false, showRubber=false);
//ventHoleDoorArmP0(0,6,0);
//ventHoleDoorArmP1(0,-6,0, -90,0,0);
assembly();

module assembly(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        ventHoleDoorBot();
        ventHoleDoorTop(2,0,29, 180,11,0);
        ventHoleDoorArmP0(-40,0,7, 90,-45,0);
        ventHoleDoorArmP1(-39,0,23, 90,48,0);
    }//transform
}//module


module ventHoleDoorArmP0(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        difference(){
            yMinkCubeCyl(30,8,4,3);            
            yCyl(2.7,3, 11,0,1);
            yCyl(1,10, 11,0,1);
            yCyl(0.8,10, -11,0,1);
        }
    }//transform
}//module

module ventHoleDoorArmP1(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        difference(){
            yMinkCubeCyl(30,8,10,3.8);
            yCyl(1.5,12, 11,0,0);
            yCyl(6,5, 11,0,0);
            yCyl(1.6,12, -11,0,0);
            yCyl(6,5, -11,0,0);
            yCube(30,10,5, 0,-8,0, 0,0,40);
        }//difference
         
    }//transform
}//module
 
module ventHoleDoorBot(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=155, width=92, showRubber=true, showMetal=true){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        difference(){
            yCube(length,width,13);
            yCube(length-26,width-16,14,    -5,0,0);
            yCyl(7.5,width/2, (length/2-5),(width/2+3),9, 90,0,0);
            yCyl(7.5,width/2, (length/2-5),(-width/2-3),9, 90,0,0);
            yCube(2,50,4,   (-length/2+36),(-width/2),5);
        }//difference        
        if(showMetal){
            color("green"){
                servoSg90(-(length/2-25),-18,0, 90,0,180);        
            }//color
            //yMinkCubeCyl(24,7,4,2, -(length/2-21),0,0, 90,00,0);
        }
        difference(){
            yCube(40,30,13, (-length/2+22),-28,0);
            servoSg90_cut(-(length/2-25),-18,0,90,0,180);
            yCube(2,50,4,   (-length/2+36),(-width/2),5);
        }//difference
        
        
        yTube(5,0.8,6, (length/2-5),(width/4),9, 90,0,0);
        yTube(5,0.8,6, (length/2-5),(-width/4),9, 90,0,0);
        
        if(showRubber){
            color("darkblue"){
                yCyl(3,(length-15),  -5,(width/2-5),8, 0,90,0);
                yCyl(3,(length-15),  -5,(-width/2+5),8, 0,90,0);
                yCyl(3,(width-10),  (length/2-15),0,8, 90,0,0);
                yCyl(3,(width-10),  (-length/2+5),0,8, 90,0,0);
            }//color darkblue
        }//showRubber            
    }//transform
}//module


module ventHoleDoorTop(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=155, width=92){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        difference(){
            yMinkCubeSphere(length-2,width-2,9,2, 0,0,2.5);
            yCube(length-2,width-2,7, 0,0,9);
            yCube(length-26,width-12,14,    -5,0,9);
            yCyl(9,(width/2+8), (length/2-5),0,6, 90,0,0);
            
            yCyl(9,(width/2), (length/2-5),(width/2+10),6, 90,0,0);
            yCyl(9,(width/2), (length/2-5),(-width/2-10),6, 90,0,0);
            yCyl(1.5,width, (length/2-5),0,6, 90,0,0);    
        }//difference
        
        yTube(5,1.5,6, (length/2-5),(width/4)+7,6, 90,0,0);
        yTube(5,1.5,6, (length/2-5),(-width/4)-7,6, 90,0,0);
        //to servo
        yTube(5,0.8,4,  -(length/2-30),-1,7, 90,0,0);
        yCube(8,4,5,   -(length/2-30),-1,3);        
    }//transform
}//module
