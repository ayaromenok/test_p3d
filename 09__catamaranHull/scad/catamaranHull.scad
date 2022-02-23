include <../../../../p3d/lib/lib2.scad>


catamaranHullBot(part=3);
//catamaranHullTop();


module catamaranHullBot(px=0,py=0,pz=0, rx=0,ry=0,rz=0, part=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
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
            yCube(800,150,150, part*178-400,0,75);   
            yCube(800,150,150, (part+1)*178+400,0,75);        
        }//difference                
    }//transform
}//module

module catamaranHullTop(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
    
        translate([0,0,36])
        difference(){
            scale([1.54,0.8,1])
                import("../stl/in/hull_complete.stl");
            yCube(720,200,100,  360,0,5);
        }//difference
        yMinkCubeSphere(470,70,18, 5, 480,0,100);
        //yCube(100,120,100,  550,00,100);
    }//transform
}//module
