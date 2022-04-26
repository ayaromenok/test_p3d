include <../../../../p3d/lib/lib2.scad>


//catamaranHullBot(part=0, rx=180);
//catamaranHullBot(part=0, px=5,pz=-5,rx=180);
//catamaranHullTop(part=0);


module catamaranHullBot(px=0,py=0,pz=0, rx=0,ry=0,rz=0, sx=1,sy=1,sz=1, part=0){
    translate([px,py,pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){
        difference(){
            union(){
                difference(){
                    scale([1.54,0.8,1])
                        import("../stl/in/hull_complete.stl");
                    yCube(720,200,100,  360,0,96);
                }//difference
        
                translate([0,0,-184])
                scale([1,1,5])
                difference(){
                    scale([1.54,0.8,1])
                        import("../stl/in/hull_complete.stl");
                    yCube(720,200,100,  360,0,-4);
                    yCube(720,200,100,  360,0,105);
                }//difference        
            }//union
            yCube(800,150,150, part*178-400,0,74);   
            yCube(800,150,150, (part+1)*178+400,0,74);        
        }//difference                
    }//transform
}//module

module catamaranHullTop(px=0,py=0,pz=0, rx=0,ry=0,rz=0, part=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        difference(){
            union(){
                translate([0,0,36])
                difference(){
                    scale([1.54,0.8,1])
                        import("../stl/in/hull_complete.stl");
                    yCube(720,200,100,  360,0,5);
                }//difference
        
                difference(){
                    yMinkCubeSphere(470,70,18,5, 480,0,100);            
                    yCyl(5,20,  690,0,100);
                    for(i=[0:20:480]){
                        yCyl(0.8,20,    240+i,30,105);
                        yCyl(0.8,20,    240+i,10,105);
                        yCyl(0.8,20,    240+i,-10,105);
                        yCyl(0.8,20,    240+i,-30,105);
                    }//for
                }//difference
            }//union
            yCube(800,150,150, part*178-400,0,74);   
            yCube(800,150,150, (part+1)*178+400,0,74); 
        }//difference               
    }//transform
}//module
