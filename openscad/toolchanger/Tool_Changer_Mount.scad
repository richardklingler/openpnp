difference()
{
    $fn = 100;

    // Radius of nozzle tip where to hold
    r = 12 / 2;

    // Width of nozzle holder
    w = 20;
    // Border
    b = 15;
    // Distance between nozzles
    d = 15;
    h = 27;

    nozzles = 6;

    union()
    {
        cube([w, nozzles * d + 2 * b, h], false);
    }
    // Slot for nozzle slit
    for(i = [1:nozzles])
    {
        hull()
        {
            translate([10, b + d/2 + (i - 1) * d, h - 10]) cylinder(h + 2, r, r);
            translate([w + 10, b + d/2 + (i - 1) * d, h - 10]) cylinder(h + 2, r, r);
        }
    }
    // Screw holes for holding all layers together
    for(i = [1:nozzles - 1])
    {
        translate([w - 17, b + d + (i - 1) * d, h - 10]) cylinder(11, 1.6, 1.6);
        hull()
        {
            translate([w - 17, b + d + (i - 1) * d, h - 6]) cylinder(2.5, 3.3, 3.3, $fn = 6);
            translate([-5, b + d + (i - 1) * d, h - 6]) cylinder(2.5, 3.3, 3.3, $fn = 6);
        }
    }
    translate([w / 2, b / 2, -1]) cylinder(h + 2, 2.2, 2.2);
    translate([w / 2, nozzles * d + 2 * b - b / 2, -1]) cylinder(h + 2, 2.2, 2.2);
}
