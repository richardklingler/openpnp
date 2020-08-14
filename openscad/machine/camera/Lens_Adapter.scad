$fn = 100;

r1 = 14.3 / 2;
r2 = 12 / 2;

t = 1.6;
h = 6;

difference()
{
    union()
    {
        hull()
        {
            cylinder(4, r1 + t, r1 + t);
            translate([0, 0, 4]) cylinder(2, r2 + t, r2 + t);
        }
        translate([0, 0, 6]) cylinder(h, r2 + t, r2 + t);
    }
    hull()
    {
        cylinder(4, r1, r1);
        translate([0, 0, 4]) cylinder(2, r2, r2);
    }
    translate([0, 0, 6]) cylinder(h, r2, r2);
}
