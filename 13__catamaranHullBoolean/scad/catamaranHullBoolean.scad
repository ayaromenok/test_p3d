include <../../../../p3d/lib/lib2.scad>

catamaranHullBooleanFront(0,200,0);
catamaranHullBooleanBack(0,0,0);
module catamaranHullBooleanBack(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        rotate([90,0,0])
        rotate([0,90,0])
                //color("blue")
                linear_extrude(600, scale=0.9)
                polygon(points=[[12,0],[7,5],[11,60],[15,63],[42,130],[109.5,160],[126,0]]);
    }//transform
}//module

module catamaranHullBooleanFront(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        difference(){
            scale([3,1,1])
            rotate_extrude(angle=90, $fn=300 )
            translate([-200, 0, 0])       
            polygon(points=[[5,0],[0,5],[4,60],[8,63],[20,130],[106,190],[126,0]]);
            
            yTube(300,195,200,  0,0,18,  -55.2,0,0, 2.75,1,1, $fn=300);       
            
            yTube(400,195,300,  -50,-275,50,  6,0,0, 5,1,1, $fn=3000);       
        }//difference
    }//transform
}//module

module catamaranHullBoolean2(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        difference(){
            scale([3,1,1])
            rotate_extrude(angle=90, $fn=300 )
            translate([-200, 0, 0])       
            polygon(points=[[0,0],[3,50],[6,50],[12,100],[62,150],[82,0]]);
            
            yTube(300,195,200,  0,0,0,  -45,0,0, 2.7,1,1, $fn=90);       
            
            yTube(400,195,200,  -50,-320,50,  7.5,0,0, 5,1,1, $fn=90);       
        }//difference           
    }//transform
}//module
module catamaranHullBoolean(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
    /*
        intersection(){
            scale([2,1,1])
            rotate_extrude(angle=90, $fn=30 )
            translate([-200, 0, 0])            
            polygon(points=[[0,0],[3,50],[6,50],[12,100],[62,150],[82,0]]);
            yCube(400,100,200,   -200,-180,75, 7);
         }//intersection
            //scale([2,1,1])
            rotate_extrude(angle=90, $fn=30 )
            translate([0, 0, 0])
            polygon(points=[[0,0],[50,3],[50,6],[100,12],[150,62],[0,82]]);
            //polygon(points=[[0,0],[3,50],[6,50],[12,100],[62,150],[82,0]]);
      */      

            /*
            for(i=[1:1:89]){
                translate([0,0,i])
                linear_extrude(10, scale=cos(i), slices=1)
                translate([-82*cos(i),0,0])          
                scale([cos(i),cos(i),cos(i)])    
                polygon(points=[[0,0],[3,50],[6,50],[12,100],[62,150],[82,0]]);                
                }
                */
        //intersection(){        
        difference(){
        scale([1,3,1])
        rotate_extrude(angle=90, $fn=90)
        translate([5, 0, 0])     
        scale([1,2,1])
            square(10);
            
        yTube(30,17,50,  0,0,0,  0,-45,10, 1,3,1, $fn=90);    
        yCube(10,50,42, -2,25,20);
        }
        
        /*
        translate([0,0,-3])
        rotate([20,0,0])
        rotate_extrude(angle=90, $fn=30 )
        translate([7, -3, 0])     
        rotate([0,0,25])
        square(10);    
        //}*/
    }//transform
}//module

