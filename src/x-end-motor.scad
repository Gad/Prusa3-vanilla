// PRUSA iteration3
// X end motor
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <inc/x-end.scad>
bearing_diameter = 15;
thinwall = 3;
bearing_size = bearing_diameter + 2 * thinwall;
tolerance = 0.15;
bearing_height = 52;
smooth_rod_diam=8;
smooth_rod_diam_tolerance=0.1;
module x_end_motor_base() {
  x_end_base();
  difference() {
    translate(v = [-15,31,26.5-2]) cube(size = [18,55,49], center = true);
  translate([-15+7,0,51-2]) rotate([0,45,0]) translate([-15,-15,0]) cube([30,60,30]);
    translate([-15-18+11,0,51-2]) rotate([0,-45,0]) translate([-15,-15,0]) cube([30,60,30]);
    // Bottom corners cutout
    translate([-15+7,10,-19-2]) rotate([0,45,0]) translate([-15,-15,0]) cube([30,60,30]);
    translate([-15-18+11,10,-19-2]) rotate([0,-45,0]) translate([-15,-15,0]) cube([30,60,30]);
  }
    translate(v = [-4,17,0]) {
        difference(){
            rotate([0,0,30]) cylinder(h = 4, r = 7, $fn = 6);
            translate(v = [3,-1,-1]) cylinder(h = 10, r = 1.5, $fn = 60);
        }
    }

}

module x_end_motor_holes() {
  x_end_holes();
  // Hexagon
  // Position to place
  translate(v = [-1,37,30.25-1.25]) {
    // Belt hole
    translate(v = [-14,1,0]) cube(size = [10,46,22], center = true);

    // Motor mounting holes
    translate(v = [20,-15.5,-15.5]) rotate(a = [0,-90,0]) rotate(a = [0,0,90]) cylinder(h = 70, r = 1.7, $fn = 10);
    translate(v = [3,-15.5,-15.5]) rotate(a = [0,-90,0]) rotate(a = [0,0,90]) cylinder(h = 10, r = 3.1, $fn = 15);

    translate(v = [20,-15.5,15.5]) rotate(a = [0,-90,0]) rotate(a = [0,0,90]) cylinder(h = 70, r = 1.7, $fn = 10);
    translate(v = [3,-15.5,15.5]) rotate(a = [0,-90,0]) rotate(a = [0,0,90]) cylinder(h = 10, r = 3.1, $fn = 15);

    translate(v = [20,15.5,-15.5]) rotate(a = [0,-90,0]) rotate(a = [0,0,90]) cylinder(h = 70, r = 1.7, $fn = 10);
    translate(v = [3-10,15.5,-15.5]) rotate(a = [0,-90,0]) rotate(a = [0,0,90]) cylinder(h = 10, r = 3.1, $fn = 15);
    translate(v = [3-10-2-3,15.5,-15.5+3.1]) cube([10,3.1*2,3.1*2], center = true);

    //translate(v=[20,15.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.7, $fn=10);
    //translate(v=[3.5,15.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=15);

    // Material saving cutout
    translate(v = [-10,12,10]) cube(size = [60,42,42], center = true);

    // Material saving cutout
    translate(v = [-10,40,-30]) rotate(a = [45,0,0])  cube(size = [60,42,42], center = true);

    // Motor shaft cutout
    translate(v = [0,0,0]) rotate(a = [0,-90,0]) rotate(a = [0,0,90]) cylinder(h = 70, r = 17, $fn = 6);

    translate(v = [-14,-8.5,-30]) cube([11,50,20]);
    translate([-15-2,-8.5,-19-7.75]) rotate([0,45,0]) cube([30,60,30]);
    translate(v = [0,15,-4-3.9]) rotate(a = [0,-90+45,0]) rotate(a = [0,0,90]) cylinder(h = 70, r = 17, $fn = 6);
  }
}

// Final part
module x_end_motor() {
  mirror([0,1,0]) difference(){
      
    x_end_motor_base();
    x_end_motor_holes();
  }
}

x_end_motor();
//embedded support for top bearing cap:
  translate(v = [-2-bearing_size/4,0,bearing_height-1.25 ]) cube(size = [bearing_size/2-2,bearing_size/2,tolerance*2], center = true) ;
