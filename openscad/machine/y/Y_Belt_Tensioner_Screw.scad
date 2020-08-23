use <threads-library-by-cuiso-v1.scad>

difference()
{
    $fn = 100;

    r = 5.2 / 2;


    hr = 9;
    dr = 19;

    union()
    {
        translate([0, 0, 9]) intersection()
        {
            rotate([-90, 0, 0]) thread_for_screw(diameter=30, length=40);
            translate([0, 20, 0]) cube([30, 40, 18], true);
        }
    }
    // Cut out for GT2 roller
    translate([0, 25, 4.5])
    hull()
    {
        cylinder(9, dr / 2, dr / 2);
        translate([0, 50, 0]) cylinder(9, dr / 2, dr / 2);
    }
    translate([0, 30, -1]) cylinder(30, r, r);
}
