intersection()
{
    $fn = 100;

    // Radius of nozzle tip where to hold
    r = 3.5 / 2;
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
                translate([10, b + d/2 + (i - 1) * d, s]) cylinder(h + s + 2, or, or);
                translate([w + 10, b + d/2 + (i - 1) * d, s]) cylinder(h + s + 2, or, or);
            }
            hull()
            {
                translate([w, b + d/2 + (i - 1) * d, s]) cylinder(h + s + 2, tr, tr);
                translate([w + 10, b + d/2 + (i - 1) * d, s]) cylinder(h + s + 2, tr, tr);
            }
        }
        translate([w / 2, b / 2, -1]) cylinder(h + s + 2, 2.2, 2.2);
        translate([w / 2, nozzles * d + 2 * b - b / 2, -1]) cylinder(h + s + 2, 2.2, 2.2);

//        translate([w / 2, b / 2, h + s - 2]) cylinder(3.61, 5.2, 5.2);
//        translate([w / 2, nozzles * d + 2 * b - b / 2, h + s - 2]) cylinder(3.61, 5.2, 5.2);
    }
    translate([0, 0, h + s - 3]) cube([w, nozzles * d + 2 * b, h + s], false);
}
