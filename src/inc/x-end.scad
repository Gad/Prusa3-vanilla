// PRUSA iteration3
// X end prototype
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <bearing.scad>
rod_distance = 45;
m5_tolerance = 0.3;
//bearings
bearing_diameter = 15;
thinwall = 3;
bearing_size = bearing_diameter + 2 * thinwall;
tolerance = 0.15;
bearing_height = 52;
smooth_rod_diam=8;
smooth_rod_diam_tolerance=0.1;

module x_end_base() {
  // Main block
  height = 49;

  difference() {
    translate(v = [-15,-9-3.5/2,height/2]) cube(size = [18,39+3.5,height], center = true);
    // Top corners cutouts
    translate([-15+7,-20,51-2]) rotate([0,45,0]) translate([-15,-15,0]) cube([30,60,30]);
    translate([-15-18+11,-20,51-2]) rotate([0,-45,0]) translate([-15,-15,0]) cube([30,60,30]);
    // Bottom corners cutout
    translate([-15+7,-20,-19-2]) rotate([0,45,0]) translate([-15,-15,0]) cube([30,60,30]);
    translate([-15-18+11,-20,-19-2]) rotate([0,-45,0]) translate([-15,-15,0]) cube([30,60,30]);
  }

  // Bearing holder
  difference(){
    vertical_bearing_base(bearing_height);
        translate([-15-18+11,-20,51-2]) rotate([0,-45,0]) translate([-15,-15,0]) cube([30,60,30]);
  
  }
  // Nut trap
  // Cube
  translate(v = [-2-2-1,-17,2]) cube(size = [8+2,16,4], center = true);
  // Hexagon
  translate(v = [0,-17,0]) rotate([0,0,30]) cylinder(h = 4, r = 8, $fn = 6);
}

module x_end_holes() {
  vertical_bearing_holes(bearing_height-3.70);

  // Belt hole
  translate(v = [-1,0,-4])

  difference() {
    translate(v = [-5.5-10+1.5,-10,30]) cube(size = [10,46,28], center = true);

  	// Nice edges
  	translate(v = [-5.5-10+1.5,-10,30+23]) rotate([0,45,0]) cube(size = [10,46,28], center = true);
  	translate(v = [-5.5-10+1.5,-10,30+23]) rotate([0,-45,0]) cube(size = [10,46,28], center = true);
  	translate(v = [-5.5-10+1.5,-10,30-23]) rotate([0,45,0]) cube(size = [10,46,28], center = true);
  	translate(v = [-5.5-10+1.5,-10,30-23]) rotate([0,-45,0]) cube(size = [10,46,28], center = true);
      
      

}
translate(v = [-40,0,25]) rotate([0,0,45]) cube(size = [46,10,56], center = true);
  // Bottom pushfit rod
  translate(v = [-15,-41.5,2]) rotate(a = [-90,0,0]) pushfit_rod(smooth_rod_diam+smooth_rod_diam_tolerance,50);

  // Top pushfit rod
  translate(v = [-15,-41.5,rod_distance+2]) rotate(a = [-90,0,0]) pushfit_rod(smooth_rod_diam+smooth_rod_diam_tolerance,50);

  // Ziptie for holding smooth rods
  translate([-30,-28.5,8]) cube([30,3.5,2]);
  translate([-30,-28.5,49-6-1.9]) cube([30,3.5,2]);
  translate([-30,-14,49-6-1.9]) cube([30,3.5,2]);


  // Ziptie for holding bearings
  translate([-30,-14,bearing_height-2-16]) cube([30,2,4.5]);
  translate([-30,-14,2+12]) cube([30,2,4.5]);
  translate([-30,+12,bearing_height-2-16]) cube([30,2,4.5]);
  translate([-30,+12,2+12]) cube([30,2,4.5]);

  // Nut trap removed : leadswcrew is free! 
  translate(v = [0,-17,-0.5]) cylinder(h = 15, r = 5, $fn = 25);
  //translate(v = [0,-17,3]) rotate([0,0,30]) cylinder(h = 10, r=4.5+m5_tolerance/2, $fn = 6);
}

// Final prototype
module x_end_plain() {
  difference() {
    x_end_base();
    x_end_holes();
  }
  //embedded support for top bearing cap:
  translate(v = [-2-bearing_size/4,0,bearing_height-1.25 ]) cube(size = [bearing_size/2-2,bearing_size/2,tolerance*2], center = true) ;

}

x_end_plain();

module pushfit_rod(diameter,length) {
  cylinder(h = length, r = diameter/2, $fn = 30);
  /*difference() {
 	  translate(v = [0,-diameter/2.85,length/2]) rotate([0,0,45]) cube(size = [diameter/2,diameter/2,length], center = true);
 	  translate(v = [0,-diameter/4-diameter/2-0.4,length/2]) rotate([0,0,0]) cube(size = [diameter,diameter/2,length], center = true);
  }*/
  //translate(v=[0,-diameter/2-2,length/2]) cube(size = [diameter,1,length], center = true);
}

