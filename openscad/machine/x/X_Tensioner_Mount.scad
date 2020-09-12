$fn = 100;

w = 30;
h = 19;
s = 4.5;

p = 20;
t = 5;

r1 = 10.5 / 2;
r2 = 5.5 / 2;


difference()
{
    union()
    {
        // Plate at left side
        cube([t, 2 * p + t, 2 * p + t], false);
        // Top plate
        hull()
        {
            translate([0, p + t, 2 * p]) cube([2 * p + t, p, t], false);
            translate([0, 0, 2 * p]) cube([p + t, p, t], false);
        }
        translate([t, 0, 0]) cube([p, p + t, 2 * p], false);
    }
    // Mounting screw holes
    translate([- 1, 2 * p - t, p/2]) rotate([0, 90, 0]) cylinder(t + 2, r2, r2);
    translate([- 1, 2 * p - t, p + p/2]) rotate([0, 90, 0]) cylinder(t + 2, r2, r2);

    translate([0, 2 * p - t, p/2]) rotate([0, 90, 0]) cylinder(3, r1, r2);
    translate([0, 2 * p - t, p + p/2]) rotate([0, 90, 0]) cylinder(3, r1, r2);

    translate([p/2 + t, 2 * p - t, 2 * p - 1]) cylinder(t + 2, r2, r2);
    translate([p/2 + t, 2 * p - t, 2 * p + t - 3]) cylinder(3.1, r2, r1);

    translate([p/2 + t + p, 2 * p - t, 2 * p - 1]) cylinder(t + 2, r2, r2);
    translate([p/2 + t + p, 2 * p - t, 2 * p + t - 3]) cylinder(3.1, r2, r1);
    
    // Tensioner screw cutout
    translate([0, 3 * p + t, 10])
    rotate([90, 0, 0])
    intersection()
    {
        translate([-t -1, p/2 - w/2, 2 * p]) cube([50, w, h], false);
        translate([-t -1, p/2, 2 * p + h/2]) rotate([0, 90, 0]) cylinder(50, w/2, w/2);
    }
    hull()
    {
        translate([12, p/2, p]) rotate([90, 0, 0]) cylinder(p, 4.6, 4.6);
        translate([25, p/2, p]) rotate([90, 0, 0]) cylinder(p, 4.6, 4.6);
    }
}
