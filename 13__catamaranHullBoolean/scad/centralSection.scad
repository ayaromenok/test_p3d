include <../../../../p3d/lib/lib2.scad>
include <../../../../p3d/lib/lib2/ext/motor.scad>


//catamaranBody(-150,0,0);
//shaftHolderEngine(0,0,0,    0,10,0);        
//shaftHolderBack(0,0,0, 0,-90,0);


module catamaranBody(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        //front(engine) holder
        shaftHolderEngine();        
        shaftHolderBack();
        
        color("blue")
        translate([-50,50,-60])
        rotate([0,-100,0]){
            yCyl(4.5,250,   0,0,0);
            yCyl(20,10,   0,0,140); //prop 40mm
            yCyl(6,35,   0,0,-140); //prop 40mm
            yCyl(16,32,   0,0,-160); //engine 2212 (14RxL28)
            }//translate
    }//transform
}//module        

module shaftHolderEngine(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
            difference(){
                union(){
                yMinkCubeSphere(80,50,60,10,   100,50,-20, 0,-10);        
                yCube(60,70,5, 100,50,-3.5);              
                //support for top connector
                yCyl(11.6,1, 128.5,25,-11.5, 0,90,0, $fn=3);
                yCyl(11.6,1, 100.5,25,-11.5, 0,90,0, $fn=3);
                yCyl(11.6,1, 70.5,25,-11.5, 0,90,0, $fn=3);
        
                yCyl(11.6,1, 128.5,75,-11.5, 0,90,0, $fn=3);
                yCyl(11.6,1, 100.5,75,-11.5, 0,90,0, $fn=3);
                yCyl(11.6,1, 70.5,75,-11.5, 0,90,0, $fn=3);
                }//union
            yCube(64,40,60,   100,50,-18,   0,-10,0);                
            yCyl(4.8,250,   -50,50,-60,  0,-100,0);
            yCube(50,9.6,50,   50,50,-15);  
            yCube(50,30,20,   50,50,-5);  
            yCyl(1,20,  63,60,-10);  
            yCyl(1,20,  63,40,-10);  
            
            yCube(100,100,20, 95,50,9);            
            yCube(20,100,100,   139,50,0);
        
            //connector top
            yCyl(2,20, 85,80,0);
            yCyl(2,20, 105,80,0);
            yCyl(2,20, 125,80,0, clr="red");    
            yCyl(2,20, 85,20,0);
            yCyl(2,20, 105,20,0);
            yCyl(2,20, 125,20,0, clr="red");    
            //front cover
            yCyl(1,20,  130,27.5,-10, 0,90,0);
            yCyl(1,20,  130,27.5,-30, 0,90,0);
            yCyl(1,20,  130,72.5,-10, 0,90,0);
            yCyl(1,20,  130,72.5,-30, 0,90,0);
        }//diff
        difference(){
        union(){
          translate([157,50,-23])
          rotate([45,-10,0])
          scale([2,1,1])
          blMotor2212_bot(0,0,0,  0,90,0);
          yCube(10,10,30, 128,35,-29, 0,-10,0, clr="green");
          yCube(10,10,30, 128,65,-29, 0,-10,0, clr="green");
        }//union
            yCube(20,100,100,   139,50,0);
        }//diff
        //supprot for engine mount
        yCube(3.5,20,8, 127.3,50,-40.5);
    }//transform
}//module            
module shaftHolderBack(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        //back holder    
        difference(){
            union(){
                yMinkCubeSphere(14,16,16,6,   -160,50,-79, 0,-10,0, sx=1.5);
                yMinkCubeCyl(5,5,76,2,   -160,35,-43, 16,0,0, sx=3.6);
                yMinkCubeCyl(5,5,76,2,   -160,65,-43, -16,0,0, sx=3.6);
                yCube(30,16,5, -155,20,-8);
                yCube(30,16,5, -155,80,-8);
            }//union
            yCyl(4.8,250,   -50,50,-60,  0,-100,0);            
            yCube(10,110,110,   -174,50,-50);
            
            yCyl(2,20,    -165, 20,-10);
            yCyl(2,20,    -145, 20,-10);
            yCyl(2,20,    -165, 80,-10);
            yCyl(2,20,    -145, 80,-10);
            
            yCyl(1.4,10, -160,50,-75);
        }//diff
        
    }//transform
}//module        