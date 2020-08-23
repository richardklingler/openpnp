$fn = 100;

w = 54;
l = 60;
t = 6;

c2 = 51;
a2 = 45;

d = 45;

r = 6 / 2;
r1 = 4.3 / 2;
sr = 8 / 2;

r2 = 10 / 2;

hw = 54;

difference()
{
    union()
    {
        // Main slider block
        cube([w, l, t], false);
        
        // X-Rail holder
        translate([0, 20, t]) cube([w, 7, 40], false);

        hull()
        {
            translate([w / 2 - hw / 2, 22, t]) cube([hw, 5, 40], false);
            translate([w / 2 - hw / 2, 45, 0]) cube([hw, 15, t], false);
        }
    }
    // X-Rail mounting holes
    translate([10, 20 - 1, t + 10]) rotate([-90, 0, 0]) cylinder(40, r, r);
    translate([w - 10, 20 - 1, t + 10]) rotate([-90, 0, 0]) cylinder(40, r, r);
    translate([10, 20 - 1, t + 30]) rotate([-90, 0, 0]) cylinder(40, r, r);
    translate([w - 10, 20 - 1, t + 30]) rotate([-90, 0, 0]) cylinder(40, r, r);

    translate([10, 27, t + 10]) rotate([-90, 0, 0]) cylinder(40, r2, r2);
    translate([w - 10, 27, t + 10]) rotate([-90, 0, 0]) cylinder(40, r2, r2);
    translate([10, 27, t + 30]) rotate([-90, 0, 0]) cylinder(40, r2, r2);
    translate([w - 10, 27, t + 30]) rotate([-90, 0, 0]) cylinder(40, r2, r2);

    // Screw holes for GT2 holder
    translate([26.5, 5, -1]) cylinder(t + 2, 1.8, 1.8);
    translate([26.5, 15, -1]) cylinder(t + 2, 1.8, 1.8);
    translate([26.5, 5, 3]) cylinder(t + 2, 3, 3);
    translate([26.5, 15, 3]) cylinder(t + 2, 3, 3);

    // Screw holes
    translate([(w - d) / 2, (l - c2) / 2, -1]) cylinder(t + 2, r1, r1);

    translate([w - (w - d) / 2, (l - c2) / 2, -1]) cylinder(t + 2, r1, r1);

    translate([(w - d) / 2, l - (l - c2) / 2, -1]) cylinder(t + 2, r1, r1);

    translate([w - (w - d) / 2, l - (l - c2) / 2, -1]) cylinder(t + 2, r1, r1);

    // Holes for screw caps
    hull()
    {
        translate([(w - d) / 2, (l - c2) / 2, t - 4]) cylinder(t + 20, sr, sr);
        translate([(w - d) / 2 - 10, (l - c2) / 2, t - 4]) cylinder(t + 20, sr, sr);
        translate([(w - d) / 2, (l - c2) / 2 - 10, t - 4]) cylinder(t + 20, sr, sr);
    }
    hull()
    {
        translate([(w - d) / 2, l - (l - c2) / 2, t - 4]) cylinder(t + 20, sr, sr);
        translate([(w - d) / 2 - 10, l - (l - c2) / 2, t - 4]) cylinder(t + 20, sr, sr);
        translate([(w - d) / 2, l - (l - c2) / 2 + 10, t - 4]) cylinder(t + 20, sr, sr);
    }
    hull()
    {
        translate([w - (w - d) / 2, (l - c2) / 2, t - 4]) cylinder(t + 20, sr, sr);
        translate([w - (w - d) / 2 + 10, (l - c2) / 2, t - 4]) cylinder(t + 20, sr, sr);
        translate([w - (w - d) / 2, (l - c2) / 2 - 10, t - 4]) cylinder(t + 20, sr, sr);
    }
    hull()
    {
        translate([w - (w - d) / 2, l - (l - c2) / 2, t - 4]) cylinder(t + 20, sr, sr);
        translate([w - (w - d) / 2 + 10, l - (l - c2) / 2, t - 4]) cylinder(t + 20, sr, sr);
        translate([w - (w - d) / 2, l - (l - c2) / 2 + 10, t - 4]) cylinder(t + 20, sr, sr);
    }
}
