include <../../../../p3d/lib/lib2.scad>

//plasticTube200x55mmHolder();
//plasticTube200x55mmHand(rz=45);
//plasticTube200x55mmArm(rz=45);
//testProfile04mm();
connector_7mm_front_plate();

module plasticTube200x55mmHolder(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        linear_extrude(10)
        import("../dxf/profile_bottom.dxf", $fn=30, layer=0);
    }//transform
}//module

module plasticTube200x55mmHand(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        linear_extrude(10)
        import("../dxf/profile_bottom.dxf", $fn=30, layer="middle");
    }//transform
}//module


module plasticTube200x55mmArm(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        linear_extrude(10)
        import("../dxf/profile_bottom.dxf", $fn=30, layer="end");
    }//transform
}//module


module testProfile04mm(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        linear_extrude(10)
        import("../dxf/profile_04mm.dxf", $fn=200, layer=0);
    }//transform
}//module


module connector_7mm_front_plate(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        linear_extrude(10)
        import("../dxf/profile_bottom.dxf", $fn=30, layer="connector_7mm_front_plate");
        translate([0,0,10])
        linear_extrude(20)
        import("../dxf/profile_bottom.dxf", $fn=30, layer="connector_7mm_front_plate_add");
    }//transform
}//module
