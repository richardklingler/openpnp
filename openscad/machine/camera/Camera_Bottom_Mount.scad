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

w = cw + 2 * t;
l = 60;

difference()
{
    union()
    {
        hull()
        {
            translate([- (l - w) / 2, (l - w) / 2, -2]) cylinder(3, 4.5, 4.5);
            translate([(l + w) / 2, (l - w) / 2, -2]) cylinder(3, 4.5, 4.5);
            translate([(l + w) / 2, w - (l - w) / 2, -2]) cylinder(3, 4.5, 4.5);
            translate([- (l - w) / 2, w - (l - w) / 2, -2]) cylinder(3, 4.5, 4.5);
        }
        hull()
        {
            translate([t, t, -2]) cylinder(8, t, t);
            translate([cw + t, t, -2]) cylinder(8, t, t);
            translate([cw + t, cw + t, -2]) cylinder(8, t, t);
            translate([t, cw + t, -2]) cylinder(8, t, t);
        }
        // LED ring holder
        hull()
        {
            translate([0, t + cw / 2 - 5, 2]) cube([t, 10, t], 0); 
            translate([t + cw / 2 - r1 - t + 1, t + cw / 2 - 5, 20]) cube([t, 10, 1], 0); 
        }
        hull()
        {
            translate([cw + t, t + cw / 2 - 5, 2]) cube([t, 10, t], 0); 
            translate([t + cw / 2 + r1 - 1, t + cw / 2 - 5, 20]) cube([t, 10, 1], 0); 
        }
        rotate([0, 0, 90])
        translate([0, -cw  - 2 * t, 0])
        hull()
        {
            translate([0, t + cw / 2 - 5, 2]) cube([t, 10, t], 0); 
            translate([t + cw / 2 - r1 - t + 1, t + cw / 2 - 5, 20]) cube([t, 10, 1], 0); 
        }
        rotate([0, 0, 90])
        translate([0, -cw  - 2 * t, 0])
        hull()
        {
            translate([cw + t, t + cw / 2 - 5, 2]) cube([t, 10, t], 0); 
            translate([t + cw / 2 + r1 - 1, t + cw / 2 - 5, 20]) cube([t, 10, 1], 0); 
        }
    }
    // Bottom rail mounts
    translate([- (l - w) / 2, (l - w) / 2, -6]) cylinder(12, 2.2, 2.2);
    translate([- (l - w) / 2 + 60, (l - w) / 2, -6]) cylinder(12, 2.2, 2.2);
    translate([(l + w) / 2, w - (l - w) / 2, -6]) cylinder(12, 2.2, 2.2);
    translate([- (l - w) / 2, w - (l - w) / 2, -6]) cylinder(12, 2.2, 2.2);

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
        translate([t + cw / 2, t + cw / 2, 13 + 5]) cylinder(pcb, r1, r1);
        translate([t + cw / 2, t + cw / 2, 30 + 5]) cylinder(1, r1 / 2, r1 / 2);
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
