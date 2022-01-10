include <../../../../p3d/lib/lib2.scad>

//construction();
section_40x20();
section_40x20(20,11,10,  90,0,0);
section_40x20(-20,-10,11,  -90,0,0);
section_40x20(00,1,21,  180,0,0);

section_20x20_center(-0.4,1,10, 0,90,0);
section_20x20_center(19.6,1,10, 0,90,0);
section_20x20_center(-20.4,1,10, 0,90,0);
module construction(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        yCube(30,20,10);
    }//transform
}//module

module section(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        yCube(20,2,1,   0,9,0);
        yCube(20,2,1,   0,-9,0);
        yCube(1,20,1,   9.5,0,0);
        yCube(2,20,1,   -9,0,0);
        yCube(25,1,1,    0,0,0,  0,0,45);
        yCube(25,1,1,    0,0,0,  0,0,-45);
    }//transform
}//module

module section_40x20(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        linear_extrude(0.8)
            import("../dxf/40x20mm.dxf");
    }//transform
}//module

module section_20x20_center(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        linear_extrude(0.8)
            import("../dxf/20x20_center.dxf");
    }//transform
}//module