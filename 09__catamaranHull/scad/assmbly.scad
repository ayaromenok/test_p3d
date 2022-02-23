include <../../../../p3d/lib/lib2.scad>


catamaranAssmebly();
module catamaranAssmebly(px=0,py=0,pz=0, rx=0,ry=0,rz=0, part=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){        
        catamaranHull(0,150,0);
        catamaranHull(0,-150,0);
    }//translate
}//module

module catamaranHull(px=0,py=0,pz=0, rx=0,ry=0,rz=0, part=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){        
        import("../stl/catamaranHull_b0.stl");
        import("../stl/catamaranHull_b1.stl");
        import("../stl/catamaranHull_b2.stl");
        import("../stl/catamaranHull_b3.stl");
        
        import("../stl/catamaranHull_t0.stl");
        import("../stl/catamaranHull_t1.stl");
        import("../stl/catamaranHull_t2.stl");
        import("../stl/catamaranHull_t3.stl");
    }//translate
}//module