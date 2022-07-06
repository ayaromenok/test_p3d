include <../../../../p3d/lib/lib2.scad>

schematicShipModel();

module schematicShipModel(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        //yCube(186,21.65,4.6, 0,0,4.6/2, clr="blue"); //bottom
        translate([-480,-57,0])
        color("blue")
        linear_extrude(height = 20)
            import(file = "../svg/01__hullTop.svg");
        translate([-480,-52,20])
        color("magenta")    
        linear_extrude(height = 20)
            import(file = "../svg/02__armament.svg");
        translate([-480,-61,20])
        color("yellow")    
        linear_extrude(height = 15)
            import(file = "../svg/03__superStructureTop.svg");
        translate([-480,-22,20])
        color("red")    
        linear_extrude(height = 40)
            import(file = "../svg/04__superStructure2Top.svg");
    }//transform
}//module

