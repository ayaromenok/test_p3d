include <../../../../p3d/lib/lib2.scad>

//left
catamaranHullBoolean4(0,0,0, length=1199/2, section=3);
//right
//mirror([0,0,1])
//catamaranHullBoolean4(0,0,0, 180,0,0, length=1129/2, section=3);

module catamaranHullBoolean4(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=1199, section=0, section_length=150){
    _scale = length/1199;
    echo(_scale);
    translate([px,py,pz])
    rotate([rx,ry,rz])    
        {
        difference(){
            scale([_scale, _scale, _scale])
            union(){
                //------- front part
                difference(){
                    scale([2.3,1,1])
                    color("blue")
                    translate([0,100,0])
                    mirror([1,0,0])
                    rotate([0,0,-90])
                    rotate_extrude(angle=90, $fn=100)
                    translate([300,0,0])
                    rotate([0,0,90])
                        import("../svg/profile_01.svg");
                    //------ cut ---------
                    //top
                    yTube(400,195,300,  -50,-247.8,50,  7.8,0,0, 5,1,1, $fn=300);       
                    //side external      
                    yTube(300,195,200,  0,0,4.7,  -59,0,0, 2.75,1,1, $fn=300);     
                    //cut side internal
                    scale([2.3,1,1])
                    color("red")
                    translate([0,83.2,-24.1])
                    mirror([1,0,0])
                    rotate([0,-16.8,-90])
                    rotate_extrude(angle=90, $fn=100)
                    translate([300,0,0])
                    rotate([0,0,90])
                        import("../svg/profile_01_cut.svg");
                }//difference
                //------ back part
                translate([0,-193.4,0])
                mirror([0,0,1])
                rotate([0,90,0])           
                linear_extrude(670, scale=0.9)                
                    import("../svg/profile_01_back.svg");
                //------ connectors   
                chbConnector(0,-47,15, 90,0,0, length=200, height=10);
                chbConnector(400,-56,15, 90,0,0, length=200, height=8);
                chbConnector(650,-60,27.5, 90,90,0, length=55, height=16);
            }//union
            
            _ls = 1129*_scale;        
            _200s = 220*_scale;
            _p0=-529*_scale;
            _puzzle_step=40*_scale;
            translate([(_p0-_ls/2+section_length*section),-_200s/2+1,_200s/2-1]){
            
                difference(){
                    yCube(_ls,_200s,_200s);
                    for (i=[0:_puzzle_step:_200s/3])
                        for (j=[-_200s/3:_puzzle_step:0])
                            yCone(5,3,   _ls/2-1.2,i,j, 0,90,180);
                }//difference
                union(){
                    yCube(_ls,_200s,_200s, _ls+section_length,0,0);
                    for (i=[0:_puzzle_step:_200s/3])
                        for (j=[-_200s/3:_puzzle_step:0])
                            yCone(4.6,2.8,   _ls/2+section_length-1.2,i,j, 0,90,180);
                }//union
            }//translate
        }//difference
    }//transform
}//module

module chbConnector(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=210, width=30, height=5){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        difference(){
            yCube(length,width,height, 0,0,0);
            for(i=[-(length/2):20:(length/2)]){
                yCyl(1,height+10,  i+10,10,0);
                yCyl(1,height+10,  i+10,-10,0);
            }//for
        }//difference
    }//transform
}//module

module catamaranHullBooleanBack(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        rotate([90,0,0])
        rotate([0,90,0])
                //color("blue")
                linear_extrude(600, scale=0.9)
                translate([-100, 0, 0])   
                polygon(points=[[12,0],[7,5],[11,60],[15,63],[42,130],[109.5,160],[126,0]]);
                chbConnector(300,24,15, 90,0,0, length=600, height =8);
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
            yTube(400,195,300,  -50,-275,50,  6,0,0, 5,1,1, $fn=300);       
        }//difference
        chbConnector(-100,-76,15, 90,0,0, length=200, height =8);
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

