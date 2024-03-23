#!/bin/bash
if [ "$1" != "" ]; then
    echo "Creating stucture for: $1"
else
    echo "Plz, use a prequired project name as s parameter to the scrip"
    exit
fi
git checkout -b $1
mkdir $1
cd $1
mkdir png
mkdir stl
mkdir dxf
mkdir scad
mkdir gcode
mkdir blend
git push --set-upstream origin $1
echo "dxf/*.dxf~" > .gitignore
cd scad
FNAME=${1##*_}".scad"
echo $FNAME
echo -e "include <../../../../p3d/lib/lib2.scad>\n\n${1##*_}();\n\nmodule ${1##*_}(px=0,py=0,pz=0, rx=0,ry=0,rz=0){\n    translate([px,py,pz])\n    rotate([rx,ry,rz]){\n        yCube(30,20,10);\n    }//transform\n}//module\n" > $FNAME
cd ..
echo -e "## main/readme" > readme.md
cd ..
ISSUE_NUM=$(echo $1| cut -d'_' -f 1)
echo "|[$ISSUE_NUM](https://github.com/ayaromenok/test_p3d/issues/$ISSUE_NUM) | ![$NAME](https://github.com/ayaromenok/test_p3d/blob/master/$1/png/$ISSUE_NUM.png) | NoK | comment |\n" >> README.md
echo "done"
