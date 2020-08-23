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
        hull()
        {
            translate([-t, 0, 0]) cube([t, p, p], false);
            translate([-t, 0, p]) cube([t, p, p], false);
            translate([-t, 2 * p, p]) cube([t, p, p], false);
        }
        hull()
        {
            translate([-t, -t, 0]) cube([t + p, t, p], false);
            translate([-t, -t, p]) cube([t + p, t, p], false);
            translate([p, -t, p]) cube([p, t, p], false);
            translate([-t, -2 * t, 2 * p]) cube([t + 2 * p, 10, t], false);
        }
        hull()
        {
            translate([-t, - 2 * t, 2 * p]) cube([t + p, t, p + t], false);
            translate([p, - 2 * t, 2 * p]) cube([p, t, 10], false);
        }
        translate([-t, -2 * t, 2 * p]) cube([t + p, 2 * t + 2 * p, p + t], false);
        translate([-t, 2 * p, 2 * p]) cube([t + p, p, t], false);
    }
    // Mounting screw holes
    translate([-t - 1, p/2, p/2]) rotate([0, 90, 0]) cylinder(t + 2, r2, r2);
    translate([-t - 1, p/2, p + p/2]) rotate([0, 90, 0]) cylinder(t + 2, r2, r2);
    translate([-t - 1, 2 * p + p/2, p + p/2]) rotate([0, 90, 0]) cylinder(t + 2, r2, r2);

    translate([-t, p/2, p/2]) rotate([0, 90, 0]) cylinder(3, r1, r2);
    translate([-t, p/2, p + p/2]) rotate([0, 90, 0]) cylinder(3, r1, r2);
    translate([-t, 2 * p + p/2, p + p/2]) rotate([0, 90, 0]) cylinder(3, r1, r2);

    translate([p/2, -t, p/2]) rotate([90, 0, 0]) cylinder(t, r1, r1);
    translate([p/2, -t, p + p/2]) rotate([90, 0, 0]) cylinder(t, r1, r1);
    translate([p + p/2, -t, p + p/2]) rotate([90, 0, 0]) cylinder(t, r1, r1);

    translate([p/2, -t + 3, p/2]) rotate([90, 0, 0]) cylinder(3.1, r2, r1);
    translate([p/2, -t + 3, p + p/2]) rotate([90, 0, 0]) cylinder(3.1, r2, r1);
    translate([p + p/2, -t + 3, p + p/2]) rotate([90, 0, 0]) cylinder(3.1, r2, r1);

    translate([p/2, 1, p/2]) rotate([90, 0, 0]) cylinder(3 * t, r2, r2);
    translate([p/2, 1, p + p/2]) rotate([90, 0, 0]) cylinder(3 * t, r2, r2);
    translate([p + p/2, 1, p + p/2]) rotate([90, 0, 0]) cylinder(3 * t, r2, r2);
    
    translate([p/2, 2 * p + p/2, 2 * p - 1]) cylinder(t + 2, r2, r2);
    translate([p/2, 2 * p + p/2, 2 * p + t - 3]) cylinder(3.1, r2, r1);
    
    // Tensioner screw cutout
    intersection()
    {
        translate([-t -1, p/2 - w/2, 2 * p]) cube([50, w, h], false);
        translate([-t -1, p/2, 2 * p + h/2]) rotate([0, 90, 0]) cylinder(50, w/2, w/2);
    }
    hull()
    {
        translate([12, p/2, 2 * p + p/2]) cylinder(p, 4.6, 4.6);
        translate([22, p/2, 2 * p + p/2]) cylinder(p, 4.6, 4.6);
    }
}
