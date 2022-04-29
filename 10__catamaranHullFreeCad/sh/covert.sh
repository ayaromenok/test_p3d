# always show DXF import dialog
# inkscape  --export-plain-svg ../dxf/profileTest01_00.dxf --export-filename=../svg/profileTest01_00.svg

python3 /usr/share/inkscape/extensions/dxf_input.py --scale=1 ../dxf/profileTest01_00.dxf  > ../svg/profileTest01_00.svg
