$fn = 100;

l = 190;
w = 98;
e = 40;

h = 108;
p = 20;

o = 180;

t = 5;
t1 = 1.3;

cw = 28;
ch = 47.5;
ct = 18;
cb = 4;

r = 2;
r3 = 5.5 / 2;
r4 = 11 / 2;

difference()
{
    union()
    {
        // Back plate
        cube([l + e, w + 2 * t, t], false);

        // Cover mounting
        translate([2 * t, (h - w) / 2 + t, t]) cylinder(8, 5, 5);
        translate([2 * t, (h + w) / 2 - t, t]) cylinder(8, 5, 5);
        translate([l + e - 2 * t, (h - w) / 2 + t, t]) cylinder(8, 5, 5);
        translate([l + e - 2 * t, (h + w) / 2 - t, t]) cylinder(8, 5, 5);
    }
    // Cover screw holes
    translate([2 * t, (h - w) / 2 + t, -1]) cylinder(t + 10, 2, 2);
    translate([2 * t, (h + w) / 2 - t, -1]) cylinder(t + 10, 2, 2);
    translate([l + e - 2 * t, (h - w) / 2 + t, -1]) cylinder(t + 10, 2, 2);
    translate([l + e - 2 * t, (h + w) / 2 - t, -1]) cylinder(t + 10, 2, 2);

    translate([2 * t, (h - w) / 2 + t, -0.01]) cylinder(4, 3.5, 3.5);
    translate([2 * t, (h + w) / 2 - t, -0.01]) cylinder(4, 3.5, 3.5);
    translate([l + e - 2 * t, (h - w) / 2 + t, -0.01]) cylinder(4, 3.5, 3.5);
    translate([l + e - 2 * t, (h + w) / 2 - t, -0.01]) cylinder(4, 3.5, 3.5);

    // Ventilation slots
    for(i=[0:6])
    {
        translate([40, 20 + i * 10, -1]) cube([110, 5, 10], false);
    }
    // AC connector cutout
    translate([o + e/2 - cw/2, (w - ch + 2 * r) / 2, 0])
    hull()
    {
        translate([r, r, -1]) cylinder(t + 2, r, r);
        translate([cw - r, r, -1]) cylinder(t + 2, r, r);
        translate([r, ch - cb - r, -1]) cylinder(t + 2, r, r);
        translate([cw/2 - ct/2 + r, ch - r, -1]) cylinder(t + 2, r, r);
        translate([cw/2 + ct/2 - r, ch - r, -1]) cylinder(t + 2, r, r);
        translate([cw - r, ch - cb - r, -1]) cylinder(t + 2, r, r);

    }
    translate([o + e/2 - cw/2 - 2, (w - ch + 2 * r) / 2 + 4, t1]) cube([2, 10, t], false);
    translate([o + e/2 - cw/2 - 2, (w - ch + 2 * r) / 2 + 32, t1]) cube([2, 10, t], false);
    translate([o + e/2 - cw/2 - 2 + 30, (w - ch + 2 * r) / 2 + 4, t1]) cube([2, 10, t], false);
    translate([o + e/2 - cw/2 - 2 + 30, (w - ch + 2 * r) / 2 + 32, t1]) cube([2, 10, t], false);
}
