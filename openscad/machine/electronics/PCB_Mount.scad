$fn = 100;

h = 150;
p = 20;
t = 5;

pcbw = 84.5;
pcbl = 110;

sw = 76;
sl = 102;

r1 = 2.9 / 2;
r2 = 6.3 / 2;

r3 = 5.5 / 2;
r4 = 11 / 2;

difference()
{
    union()
    {
        cube([pcbw, t, h], false);
        // PCB mounting cylinders
        translate([pcbw / 2 - sw / 2, -3, h / 2 - sl / 2]) rotate([-90, 0, 0]) cylinder(3, 4, 4);
        translate([pcbw / 2 + sw / 2, -3, h / 2 - sl / 2]) rotate([-90, 0, 0]) cylinder(3, 4, 4);
        translate([pcbw / 2 - sw / 2, -3, h / 2 + sl / 2]) rotate([-90, 0, 0]) cylinder(3, 4, 4);
        translate([pcbw / 2 + sw / 2, -3, h / 2 + sl / 2]) rotate([-90, 0, 0]) cylinder(3, 4, 4);
    }
    hull()
    {
        translate([p, -1, p]) rotate([-90, 0, 0]) cylinder(t + 2, 4, 4);
        translate([pcbw - p, -1, p]) rotate([-90, 0, 0]) cylinder(t + 2, 4, 4);
        translate([pcbw - p, -1, h - p]) rotate([-90, 0, 0]) cylinder(t + 2, 4, 4);
        translate([p, -1, h - p]) rotate([-90, 0, 0]) cylinder(t + 2, 4, 4);
    }
    
    // PCB mounting holes
    translate([pcbw / 2 - sw / 2, -4, h / 2 - sl / 2]) rotate([-90, 0, 0]) cylinder(6, r1, r1);
    translate([pcbw / 2 + sw / 2, -4, h / 2 - sl / 2]) rotate([-90, 0, 0]) cylinder(6, r1, r1);
    translate([pcbw / 2 - sw / 2, -4, h / 2 + sl / 2]) rotate([-90, 0, 0]) cylinder(6, r1, r1);
    translate([pcbw / 2 + sw / 2, -4, h / 2 + sl / 2]) rotate([-90, 0, 0]) cylinder(6, r1, r1);
    
    // Rail mounting holes
    translate([p /2, -1, p / 2]) rotate([-90, 0, 0]) cylinder(t + 2, r3, r3);
    translate([pcbw - p /2, -1, p / 2]) rotate([-90, 0, 0]) cylinder(t + 2, r3, r3);
    translate([pcbw - p /2, -1, h - p / 2]) rotate([-90, 0, 0]) cylinder(t + 2, r3, r3);
    translate([p /2, -1, h - p / 2]) rotate([-90, 0, 0]) cylinder(t + 2, r3, r3);

    translate([p /2, -0.01, p / 2]) rotate([-90, 0, 0]) cylinder(3.01, r4, r3);
    translate([pcbw - p /2, -0.01, p / 2]) rotate([-90, 0, 0]) cylinder(3.01, r4, r3);
    translate([pcbw - p /2, -0.01, h - p / 2]) rotate([-90, 0, 0]) cylinder(3.01, r4, r3);
    translate([p /2, -0.01, h - p / 2]) rotate([-90, 0, 0]) cylinder(3.01, r4, r3);
}
