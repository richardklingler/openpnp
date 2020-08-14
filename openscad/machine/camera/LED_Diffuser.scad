$fn = 100;

w = 59;
r = 30 / 2;
l = 10;

t = 2;

r1 = 38 / 2;
r2 = 48 / 2;

difference()
{
    union()
    {
        intersection()
        {
            translate([0, 0, -1]) cube([w, w, t + 1], false);
            translate([w/2, w/2, -1]) cylinder(t + 2, w/2 + 2, w/2 + 2);
        }
        hull()
        {
            translate([0, w/2 - l/2, t]) cube([t, l, 0.1], false);
            translate([1, w/2 - l/2, t + 3]) cube([t, l, 0.1], false);
        }
        rotate([0, 0, 90])
        translate([0, -w, 0])
        hull()
        {
            translate([0, w/2 - l/2, t]) cube([t, l, 0.1], false);
            translate([1, w/2 - l/2, t + 3]) cube([t, l, 0.1], false);
        }
        rotate([0, 0, 180])
        translate([-w, -w, 0])
        hull()
        {
            translate([0, w/2 - l/2, t]) cube([t, l, 0.1], false);
            translate([1, w/2 - l/2, t + 3]) cube([t, l, 0.1], false);
        }
        rotate([0, 0, 270])
        translate([-w, 0, 0])
        hull()
        {
            translate([0, w/2 - l/2, t]) cube([t, l, 0.1], false);
            translate([1, w/2 - l/2, t + 3]) cube([t, l, 0.1], false);
        }
    }
    translate([w/2, w/2, -2]) cylinder(r + 3, r, r);
    difference()
    {
        translate([w/2, w/2, 1]) cylinder(t, r2, r2);
        translate([w/2, w/2, 1]) cylinder(t, r1, r1);
    }
}
