$fn = 100;

// Vacuum pump radius
r = 60.5 / 2;
// Air inlet diameter
ra = 10 / 2;
// Thickness of pump mount
t = 5;
// Height of pump holder
h = 20;

// Rail mount width
w = 110;
// Rail screw radius
r1 = 10.5 / 2;
r2 = 5.5 / 2;


difference()
{
    union()
    {
        // Pump holder
        cylinder(h, r + t, r + t);
        
        // Rail mount
        translate([- w / 2, r, 0]) cube([w, t, h]);
    }
    // Cutout for pump
    translate([0, 0, t]) cylinder(h, r, r);
    translate([0, 0, -1]) cylinder(t + 2, ra, ra);
    
    // Rail mount screw holes
    translate([-45, r - 1, 10]) rotate([-90, 0, 0]) cylinder(t + 2, r2, r2);
    translate([-45, r - 0.1, 10]) rotate([-90, 0, 0]) cylinder(3.1, r1, r2);

    translate([45, r - 1, 10]) rotate([-90, 0, 0]) cylinder(t + 2, r2, r2);
    translate([45, r - 0.1, 10]) rotate([-90, 0, 0]) cylinder(3.1, r1, r2);
}
