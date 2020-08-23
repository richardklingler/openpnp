$fn = 100;

$rm = 22.5 / 2;
$dm = 31;
$tm = 2.2;
$wm = 42;
$ma = 6 / 2;

$t = 5;

$r1 = 10.5 / 2;
$r2 = 5.5 / 2;

r3 = 4 / 2;
r4 = 6 / 2;

difference()
{
    union()
    {
        hull()
        {
            cube([60 + ($wm / 2 - 10) + $t, $t, 20], false);
            translate([40, 0, -40]) cube([31 + $t, $t, 60], false);
        }
        translate([60 - $wm / 2 - 10, - $wm, 20 - $t]) cube([$wm, $wm, $t], false);

        hull()
        {
            translate([60 - $wm / 2 - 10 - $t, - $wm, 20 - $t]) cube([$t, $wm, $t], false);
            translate([60 - $wm / 2 - 10 - $t, 0, - $t - 15]) cube([$t, $t, $t + 20], false);
        }
        hull()
        {
            translate([$wm + 29, - $wm, 20 - $t]) cube([$t, $wm + $t, $t], false);
            translate([$wm + 29, 0, - $t - 15]) cube([$t, $t, $t + 20], false);
        }
    }
    // Profile mount holes
    translate([10, -1, 10]) rotate([-90, 0, 0]) cylinder($t + 2, $r2, $r2);
    translate([10, -0.1, 10]) rotate([-90, 0, 0]) cylinder(3.1, $r1, $r2);

    translate([50, -1, 10]) rotate([-90, 0, 0]) cylinder($t + 2, $r2, $r2);
    translate([50, -0.1, 10]) rotate([-90, 0, 0]) cylinder(3.1, $r1, $r2);

    translate([50, -1, - 30]) rotate([-90, 0, 0]) cylinder($t + 2, $r2, $r2);
    translate([50, -0.1, - 30]) rotate([-90, 0, 0]) cylinder(3.1, $r1, $r2);

    // Motor cutout
    translate([60 - 10, - $wm / 2, 20 - $t - 1]) cylinder($tm + 1, $rm, $rm);
    translate([60 - 10, - $wm / 2, 20 - $t - 1]) cylinder($t + 2, $ma, $ma);
    // Motor screws
    translate([60 - 10 - $dm / 2, - $wm / 2 - $dm / 2, 20 - $t - 1]) cylinder($t + 2, r3, r3);
    translate([60 - 10 + $dm / 2, - $wm / 2 - $dm / 2, 20 - $t - 1]) cylinder($t + 2, r3, r3);
    translate([60 - 10 - $dm / 2, - $wm / 2 + $dm / 2, 20 - $t - 1]) cylinder($t + 2, r3, r3);
    translate([60 - 10 + $dm / 2, - $wm / 2 + $dm / 2, 20 - $t - 1]) cylinder($t + 2, r3, r3);

    translate([60 - 10 - $dm / 2, - $wm / 2 - $dm / 2, 20 - 2]) cylinder(2, r3, r4);
    translate([60 - 10 + $dm / 2, - $wm / 2 - $dm / 2, 20 - 2]) cylinder(2, r3, r4);
    translate([60 - 10 - $dm / 2, - $wm / 2 + $dm / 2, 20 - 2]) cylinder(2, r3, r4);
    translate([60 - 10 + $dm / 2, - $wm / 2 + $dm / 2, 20 - 2]) cylinder(2, r3, r4);
}
