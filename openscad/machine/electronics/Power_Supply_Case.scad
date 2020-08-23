$fn = 100;

l = 160;
w = 98;
e = 70;

h = 150;
p = 20;

t = 5;

r1 = 3.3 / 2;
r2 = 3.1;

r3 = 5.5 / 2;
r4 = 11 / 2;

r5 = 5.2;

difference()
{
    union()
    {
        // Back plate
        cube([l + e, h, t], false);
        // Power supply walls
        translate([0, (h - w) / 2  - t, t]) cube([l + e, t, 30], false);
        translate([0, (h + w) / 2, t]) cube([l + e, t, 30], false);
        translate([0, (h - w) / 2  - t, t]) cube([t, w + 2 * t, 30], false);
        translate([l + e - t, (h - w) / 2  - t, t]) cube([t, w + 2 * t, 30], false);

        // Cover mounting
        translate([2 * t, (h - w) / 2 + t, t]) cylinder(30, 8, 8);
        translate([2 * t, (h + w) / 2 - t, t]) cylinder(30, 8, 8);
        translate([l + e - 2 * t, (h - w) / 2 + t, t]) cylinder(30, 8, 8);
        translate([l + e - 2 * t, (h + w) / 2 - t, t]) cylinder(30, 8, 8);
    }
    // DC cable cutout
    translate([-1, h/2, 15]) rotate([0, 90, 0]) cylinder(t + 2, 6, 6);
    // Cover mounting holes
    translate([2 * t, (h - w) / 2 + t, 27]) cylinder(30, r5, r5);
    translate([2 * t, (h + w) / 2 - t, 27]) cylinder(30, r5, r5);
    translate([l + e - 2 * t, (h - w) / 2 + t, 27]) cylinder(30, r5, r5);
    translate([l + e - 2 * t, (h + w) / 2 - t, 27]) cylinder(30, r5, r5);

    translate([2 * t, (h - w) / 2 + t, 20]) cylinder(30, 2, 2);
    translate([2 * t, (h + w) / 2 - t, 20]) cylinder(30, 2, 2);
    translate([l + e - 2 * t, (h - w) / 2 + t, 20]) cylinder(30, 2, 2);
    translate([l + e - 2 * t, (h + w) / 2 - t, 20]) cylinder(30, 2, 2);

    // Rail mounting holes
    translate([p / 2, p / 2, -1]) cylinder(t + 2, r3, r3);
    translate([l + e - p / 2, p / 2, -1]) cylinder(t + 2, r3, r3);
    translate([(l + e) / 2, p / 2, -1]) cylinder(t + 2, r3, r3);
    translate([p / 2, h - p / 2, -1]) cylinder(t + 2, r3, r3);
    translate([l + e - p / 2, h - p / 2, -1]) cylinder(t + 2, r3, r3);
    translate([(l + e) / 2, h - p / 2, -1]) cylinder(t + 2, r3, r3);

    translate([p / 2, p / 2, t - 3]) cylinder(3, r3, r4);
    translate([l + e - p / 2, p / 2, t - 3]) cylinder(3, r3, r4);
    translate([(l + e) / 2, p / 2, t - 3]) cylinder(3, r3, r4);
    translate([p / 2, h - p / 2, t - 3]) cylinder(3, r3, r4);
    translate([l + e - p / 2, h - p / 2, t - 3]) cylinder(3, r3, r4);
    translate([(l + e) / 2, h - p / 2, t - 3]) cylinder(3, r3, r4);
    
    // Power supply mounting holes
    translate([e + 2, p - 1, t + 15]) rotate([-90, 0, 0]) cylinder(t + 2, r1, r1);
    translate([e + 2 + 117, p - 1, t + 6]) rotate([-90, 0, 0]) cylinder(t + 2, r1, r1);
    translate([e + 2 + 117, p - 1, t + 24]) rotate([-90, 0, 0]) cylinder(t + 2, r1, r1);

    translate([e + 2, p, t + 15]) rotate([-90, 0, 0]) cylinder(2, r2, r1);
    translate([e + 2 + 117, p, t + 6]) rotate([-90, 0, 0]) cylinder(2, r2, r1);
    translate([e + 2 + 117, p, t + 24]) rotate([-90, 0, 0]) cylinder(2, r2, r1);
}
