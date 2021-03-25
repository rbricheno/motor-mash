module prism(l, w, h){
   polyhedron(
           points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
           faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
           );
}


// This is a simplified version of the main body of the motor housing

module motor() {
color("pink")

difference() {translate([0,-1.1,0]) rotate([90,0,0]) cylinder(h=15.1, d=12.2, center=true, $fn=60);


translate([-1,-1.1,8.125]) cube([20,15.1,6.15], center=true);

translate([-1,-1.1,-8.125])  cube([20,15.1,6.15], center=true);
}}




// These are the cutouts for the screw holes and the space for the nuts

module n20_mount_cutout() {

translate([25,-1.10,0])
{


translate([-8,5,0])
cylinder(h=40, d=2.1, center=true, $fn=20);

translate([8,5,0])
cylinder(h=40, d=2.1, center=true, $fn=20);

translate([-8,-5,0])
cylinder(h=40, d=2.1, center=true, $fn=20);

translate([8,-5,0])
cylinder(h=40, d=2.1, center=true, $fn=20);

translate([0,0,11.5]) {

translate([-8,5,0])
cube([5.5,5.5,10], center=true);

translate([8,5,0])
cube([5.5,5.5,10], center=true);

translate([-8,-5,0])
cube([5.5,5.5,10], center=true);

translate([8,-5,0])
cube([5.5,5.5,10], center=true);
}
}
}

//****************************************************************************

// Here begins the top part of the motor mount (the complicated bit)


// This is the little clamping feature that holds the front of the motor

difference() {
union() {
translate([25,7.3,5.5]) color("green") cube([12,1.7,2], center=true);

translate([32,7.3,3.25]) color("green") cube([2,1.7,6.5], center=true);

translate([18,7.3,3.25]) color("green") cube([2,1.7,6.5], center=true);

}

// This represents the first brass plate of the gearbox (the part which is being clamped)
translate([25,6.9,0.05]) color("pink") cube([12.2,0.92,10.1], center=true);

}


// This is a shaft that gets cut out to allow wires to pass through

module wire_shaft() {
translate([0,0,3])
rotate([0,0,-30])
cube([60,3,3], center=true);
}


// This is the large block which abuts the underside of the robot and supports the motor

difference() {
translate([22.5,-1.1,8.125 -2.5 ]) color("magenta") cube([26,15.1,6.25 + 5], center=true);
translate([25,0,0]) scale([1,2,1]) motor();

n20_mount_cutout();
wire_shaft();

}

// This is the other large block, that has the big M3 screws through it for attaching to the TT motor mount

difference() {
translate([5,0.15,0]) color("green") cube([10,18.3,22.5], center=true);

translate([5,0,9]) rotate([90,0,0]) cylinder(h=40, d=3.1, center=true, $fn=20);


translate([5,0,-9]) rotate([90,0,0]) cylinder(h=40, d=3.1, center=true, $fn=20);
wire_shaft();
}

// This is the little clip to hold the wires and provide a litle strain relief on the back

translate([-1.75,0,8])
cube([1.5,8,5],center=true);

translate([0,-3,8])
cube([2,2,5],center=true);

   translate([-0.3,3.3,10.5])
rotate([0,90,90])
   prism(5, 0.7, 0.7);

//****************************************************************************

// From here onwards is the bottom bracket

color("red")
difference() {
union() {
translate([25,0,0])
difference() {
translate([0,-1.1,0]) rotate([90,0,0]) cylinder(h=15.1, d=16.2, center=true, $fn=60);
translate([-1,-1.1,5]) cube([20,16,10], center=true);
translate([-1,-1.1,-11.5]) cube([20,16.1,10], center=true);
 scale([1,2,1]) motor();
}

translate([25,0,0])
difference() {
translate([0,-1.1,-1])
cube([21,15.1,2], center=true);
translate([0,-1.1,0]) rotate([90,0,0]) cylinder(h=16, d=12.2, center=true, $fn=60);
}

}

translate([25,-1.10,0])
{


translate([-8,5,0])
cylinder(h=40, d=2.1, center=true, $fn=20);

translate([8,5,0])
cylinder(h=40, d=2.1, center=true, $fn=20);

translate([-8,-5,0])
cylinder(h=40, d=2.1, center=true, $fn=20);

translate([8,-5,0])
cylinder(h=40, d=2.1, center=true, $fn=20);
}


translate([25,-1.10,-22])
{


translate([-8,5,0])
cylinder(h=40, d=5, center=true, $fn=20);

translate([8,5,0])
cylinder(h=40, d=5, center=true, $fn=20);

translate([-8,-5,0])
cylinder(h=40, d=5, center=true, $fn=20);

translate([8,-5,0])
cylinder(h=40, d=5, center=true, $fn=20);
}

}
