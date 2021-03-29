difference() {
union() {
cylinder(r=13,h=1,center=true, $fn=120);

translate([0,0,3]) 
cylinder(r=1.5,h=7,center=true, $fn=120);

}
cylinder(r=0.625,h=20,center=true, $fn=12);


for ( i = [0 : 19] ){

rotate([0,0,18 * i]) translate([0,9.2,0]) cube([1.2,3.6,3], center=true);

}

}

