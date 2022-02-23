include <../../../../p3d/lib/lib2.scad>

wingSection();
//3016mm withou antitwist box
//3800mm with
module wingSection(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=80){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        profile(0,40,0);
        profile(0,0,0);
        profile(0,-40,0);
        
        yCube(5,length,1.21,    49,0,1.7, 0,-30,0);
        longeron(length,12.8, 15);         
        longeron(length,12.4, -15); 
        longeron(length,9.3, -50); 
        yCube(6,length,0.81,    -98,0,0.4);
        //for avoiding twist
        yCube(30,20,12.6, 0,0,6.3);
    }//transform
}//module
module longeron(length=60, height=13, px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        yCube(0.45,length,height,    0,0,height/2);
        yCyl(1,length,  0,0,0.5,  90,30,0, $fn=3);
        yCyl(1,length,  0,0,height-0.5,  90,90,0, $fn=3);
    }//transform
}//module

module profile(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        translate([50,0,0])
        rotate([90,0,180])
        linear_extrude(0.45)
            import("../dxf/profile_clark_y.dxf");
        translate([50,-0.205,0])
        rotate([90,0,180])
        linear_extrude(0.85)
            import("../dxf/profile_clark_y_08.dxf");
        translate([50,-0.405,0])
        rotate([90,0,180])
        linear_extrude(1.25)
            import("../dxf/profile_clark_y_12.dxf");
        yTube(5.35,4.5,1.25, 30,0,6, 90,0,0);
        yTube(5.35,4.5,1.25, -30,0,6, 90,0,0);
    }//transform
}//module

