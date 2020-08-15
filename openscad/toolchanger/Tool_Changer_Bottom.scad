intersection()
{
    $fn = 100;

    // Radius of nozzle tip where to hold
    r = 3.6 / 2;
    or = 6.5 / 2;
    tr = 13 / 2;
    // Nozzle slot thickness
    s = 1;

    // Width of nozzle holder
    w = 20;
    // Border
    b = 15;
    // Distance between nozzles
    d = 15;
    h = 5;

    nozzles = 6;

    difference()
    {
        union()
        {
            cube([w, nozzles * d + 2 * b, h + s], false);
        }
        // Slot for nozzle slit
        for(i = [1:nozzles])
        {
            hull()
            {
                translate([10, b + d/2 + (i - 1) * d, -1]) cylinder(h + s + 2, r, r);
                translate([w + 10, b + d/2 + (i - 1) * d, -1]) cylinder(h + s + 2, r, r);
            }
//            hull()
            {
                translate([w, b + d/2 + (i - 1) * d, -1]) cylinder(h + s + 2, tr, tr);
                translate([w + 10, b + d/2 + (i - 1) * d, -1]) cylinder(h + s + 2, tr, tr);
            }
            translate([6, b + d/2 + (i - 1) * d - 5, s]) cube([10, 10, 0.2], false);
        }
        // Screw holes for holding all layers together
        for(i = [1:nozzles - 1])
        {
            translate([w - 17, b + d + (i - 1) * d, -1]) cylinder(h + s + 2, 1.6, 1.6);
        }

        translate([w / 2, b / 2, -1]) cylinder(h + s + 2, 2.2, 2.2);
        translate([w / 2, nozzles * d + 2 * b - b / 2, -1]) cylinder(h + s + 2, 2.2, 2.2);
    }
    translate([0, 0, 0]) cube([w, nozzles * d + 2 * b, s + 0.2], false);
}
