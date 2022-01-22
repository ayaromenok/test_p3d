include <../../../../p3d/lib/lib2.scad>

gearsNonRegular();

module gearsNonRegular(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        //yTube(4,1.8,5,  0,0,2.5);
        //scale([2,2,1])
        translate([0,0,0])
        rotate([0,0,-$t*360])
        linear_extrude(5)
            import("../dxf/d20_d60.dxf");
        
        translate([40,0,0])
        rotate([0,0,$t*360+90])
        linear_extrude(3)
            import("../dxf/d20_d60.dxf");
        
    }//transform
}//module

