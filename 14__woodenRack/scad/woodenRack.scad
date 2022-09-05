include <../../../../p3d/lib/lib2.scad>

woodenRack();

module woodenRack(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        //yCube(1000,300,1000);
        //12x1000x100x10mm
        woodenRackHorizontal(0,0,250);
        woodenRackHorizontal(0,0,500);
        woodenRackHorizontal(0,0,750);
        woodenRackHorizontal(0,0,1000);
        
        woodenRackSide(510,0,0);
        woodenRackSide(-510,0,0);
        
        yCube(20,10,1420,   0,-155,500,  0,46,0);
        yCube(20,10,1420,   0,-155,500,  0,-46,0);
    }//transform
}//module

module woodenRackSide(px=0,py=0,pz=0, rx=0,ry=0,rz=0, height=1000,width=300,step=250){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        yCube(20,30,height,   0,(width/2-15),500);
        yCube(20,30,height,   0,-(width/2-15),500);
        
        for (i=[step:step:height+1]){
            yCube(20,width,30,  0,0,i);
        }//for
        yCube(10,20,width*1.35,   15,0,step*1.5,  45,0,0);
        yCube(10,20,width*1.35,   15,0,step*3.5,  -45,0,0);
        
    }//transform
}//module


module woodenRackHorizontal(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=1000,width=100,height=10){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        yCube(length,width,height,  0,0,0);
        yCube(length,width,height,  0,width,0);
        yCube(length,width,height,  0,-width,0);
    }//transform
}//module
