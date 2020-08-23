use <threads-library-by-cuiso-v1.scad>

$fn = 100;

h = 25;
r = 42 / 2;

difference()
{
    union()
    {
        cylinder(h, r, r - 3);
    }
    for(i=[0:11])
    {
        rotate([0, -6, i * 30]) translate([r + 3, 0, -5]) cylinder(h + 10, 4, 4);
    }
    translate([0, 0, -2])
    intersection()
    {
        thread_for_nut(diameter=30, length=22, usrclearance=0.1);
        translate([0, 0, 1]) cylinder(20, 20, 20);
    }
}
