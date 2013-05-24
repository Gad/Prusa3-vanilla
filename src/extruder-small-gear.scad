// PRUSA iteration3yy
// NEMA 17 extruder small gear
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org


include <inc/external_gear_script.scad>;

module small_gear()
{
  translate([30,0,0]) {
    difference() {
      rotate ([0,0,360*-1/20])
      gear(
        number_of_teeth=8,
        circular_pitch=335,
        rim_thickness=15,
        hub_thickness=17,
        hub_diameter=19,
        gear_thickness = 8,
        bore_diameter=5.4);
      translate([-3,3.2,9]) cube([6,3,9]);
      translate([0,0,9+3]) rotate([-90,0,0]) cylinder(r=1.5, h=20, $fn=10);
    }
  }
}

small_gear();
