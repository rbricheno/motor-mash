difference() {
union() {
cylinder(r=13,h=1,center=true, $fn=120);

translate([0,0,3]) 
cylinder(r=1.5,h=7,center=true, $fn=120);

}
cylinder(r=0.625,h=20,center=true, $fn=12);


for ( i = [0 : 1] ){

rotate([0,0,180 * i]) intersection() {
translate([0,0,-10]) cube([20,20,20]);
difference() {
color("red") cylinder(r=11,h=2,center=true, $fn=120);
color("red") cylinder(r=7.4,h=3,center=true, $fn=120);
}
}

}

}

