$fn = 100;

h = 150;
p = 20;
t = 5;

pcbw = 84.5;
pcbl = 110;

lcdw = 80;
lcdh = 54.5;

dispw = 75;
disph = 42;

r3 = 5.5 / 2;
r4 = 11 / 2;

difference()
{
    union()
    {
        cube([pcbw, lcdh + 2 * t, t + 1], false);
    }
    translate([(pcbw - lcdw) / 2, t/2 + t, 3]) cube([lcdw, lcdh, 3]);
    translate([(pcbw - dispw) / 2, 18, -1]) cube([dispw, disph, t + 3]);
    
}
translate([0, 3.5, 3.5])
rotate([45, 0, 0])
difference()
{
    union()
    {
        translate([0, -t, 0]) cube([pcbw, t, t + p], false);
    }
    translate([p/2, -t - 1, p/2 + t]) rotate([-90, 0, 0]) cylinder(t + 2, r3, r3);
    translate([pcbw - p/2, -t - 1, p/2 + t]) rotate([-90, 0, 0]) cylinder(t + 2, r3, r3);
}
