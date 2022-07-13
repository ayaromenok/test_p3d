include <../../../../p3d/lib/lib2.scad>
use <catamaranHullBoolean.scad>




catamaranHull(0,150,0, -90,179,0);
catamaranHull(0,-150,0,  -90,179,0, mz=1);

module catamaranHull(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        //catamaranHullBoolean4(0,200,0);
        import("../stl/tmp/left564_p0.stl");
        import("../stl/tmp/left564_p1.stl");
        import("../stl/tmp/left564_p2.stl");
        import("../stl/tmp/left564_p3.stl");
    }//ternsform
}//module