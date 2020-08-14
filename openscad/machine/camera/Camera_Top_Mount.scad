$fn = 100;

t = 3;
pcb = 1.6;

// Inner/outer radius of LED ring
r1 = 49.5 / 2;
r2 = 34.3 / 2;

// Camera module width
cw = 38.5;
// Camera module screw distance
cs = 33.3;
sr = 2.5 / 2;
// Camera connector
cl = 11;
ch = 6;

difference()
{
    union()
    {
        hull()
        {
            translate([t, t, -5]) cylinder(11, t, t);
            translate([cw + t, t, -5]) cylinder(11, t, t);
            translate([cw + t, cw + t, -5]) cylinder(11, t, t);
            translate([t, cw + t, -5]) cylinder(11, t, t);
        }
        // LED ring holder
        hull()
        {
            translate([0, t + cw / 2 - 5, 2]) cube([t, 10, t], 0); 
            translate([t + cw / 2 - r1 - t + 1, t + cw / 2 - 5, 15]) cube([t, 10, 1], 0); 
        }
        hull()
        {
            translate([cw + t, t + cw / 2 - 5, 2]) cube([t, 10, t], 0); 
            translate([t + cw / 2 + r1 - 1, t + cw / 2 - 5, 15]) cube([t, 10, 1], 0); 
        }
        rotate([0, 0, 90])
        translate([0, -cw  - 2 * t, 0])
        hull()
        {
            translate([0, t + cw / 2 - 5, 2]) cube([t, 10, t], 0); 
            translate([t + cw / 2 - r1 - t + 1, t + cw / 2 - 5, 15]) cube([t, 10, 1], 0); 
        }
        rotate([0, 0, 90])
        translate([0, -cw  - 2 * t, 0])
        hull()
        {
            translate([cw + t, t + cw / 2 - 5, 2]) cube([t, 10, t], 0); 
            translate([t + cw / 2 + r1 - 1, t + cw / 2 - 5, 15]) cube([t, 10, 1], 0); 
        }
    }
    // Connector cut out
    hull()
    {
        translate([t + cw / 2 - cl / 2, t + cw - ch, -6]) cube([cl, ch, 2 * t + 7], false);
        translate([t + cw / 2 - (cl + 8) / 2, t + cw - ch - 1, -6]) cube([cl + 8, ch + 2, 6], false);
    }
    // Z-rail mount screw holes
    translate([cw + 2 * t + 1, t + cw/2 - 12, -1]) rotate([0, -90, 0]) cylinder(8, 1.5, 1.5);
    translate([cw + 2 * t + 1, t + cw/2 + 12, -1]) rotate([0, -90, 0]) cylinder(8, 1.5, 1.5);

    hull()
    {
        translate([cw + 2 * t + 2.5 - 5, t + cw/2 - 12, -1]) rotate([0, -90, 0]) cylinder(2.5, 3.3, 3.3, $fn = 6);
        translate([cw + 2 * t + 2.5 - 5, t + cw/2 - 12, -5]) rotate([0, -90, 0]) cylinder(2.5, 3.3, 3.3, $fn = 6);
    }
    hull()
    {
        translate([cw + 2 * t + 2.5 - 5, t + cw/2 + 12, -1]) rotate([0, -90, 0]) cylinder(2.5, 3.3, 3.3, $fn = 6);
        translate([cw + 2 * t + 2.5 - 5, t + cw/2 + 12, -5]) rotate([0, -90, 0]) cylinder(2.5, 3.3, 3.3, $fn = 6);
    }

    // Camera board cut-out
    translate([t, t, t]) cube([cw, cw, 2 * t], false);

    // Camera screws
    translate([t + (cw - cs) / 2, t + (cw - cs) / 2, -1]) cylinder(2 * t + 2, sr, sr);
    translate([t + cw / 2 + cs / 2, t + (cw - cs) / 2, -1]) cylinder(2 * t + 2, sr, sr);
    translate([t + cw / 2 + cs / 2, t + cw / 2 + cs / 2, -1]) cylinder(2 * t + 2, sr, sr);
    translate([t + (cw - cs) / 2, t + cw / 2 + cs / 2, -1]) cylinder(2 * t + 2, sr, sr);
    
    // LED ring
    hull()
    {
        translate([t + cw / 2, t + cw / 2, 13]) cylinder(pcb, r1, r1);
        translate([t + cw / 2, t + cw / 2, 30]) cylinder(1, r1 / 2, r1 / 2);
    }
}
difference()
{
    union()
    {
        // Camera screws
        translate([t + (cw - cs) / 2, t + (cw - cs) / 2, t]) cylinder(t - pcb, 4, 4);
        translate([t + cw / 2 + cs / 2, t + (cw - cs) / 2, t]) cylinder(t - pcb, 4, 4);
        translate([t + cw / 2 + cs / 2, t + cw / 2 + cs / 2, t]) cylinder(t - pcb, 4, 4);
        translate([t + (cw - cs) / 2, t + cw / 2 + cs / 2, t]) cylinder(t - pcb, 4, 4);
    }
    // Camera screws
    translate([t + (cw - cs) / 2, t + (cw - cs) / 2, -1]) cylinder(2 * t + 2, sr, sr);
    translate([t + cw / 2 + cs / 2, t + (cw - cs) / 2, -1]) cylinder(2 * t + 2, sr, sr);
    translate([t + cw / 2 + cs / 2, t + cw / 2 + cs / 2, -1]) cylinder(2 * t + 2, sr, sr);
    translate([t + (cw - cs) / 2, t + cw / 2 + cs / 2, -1]) cylinder(2 * t + 2, sr, sr);
}
