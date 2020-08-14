// Total view of the three layers
// Not for printing but for visiaulisation

translate([0, 0, 10]) color([0, 1, 1, 0.5])  include <Tool_Changer_Top.scad>;

translate([0, 0, 5]) color([0, 1, 0.2, 0.5]) include <Tool_Changer_Middle.scad>;

translate([0, 0, 0]) color([0, 0.5, 1, 0.5])  include <Tool_Changer_Bottom.scad>;

translate([0, 0, -32]) color([1, 0.8, 0, 0.5]) include <Tool_Changer_Mount.scad>
