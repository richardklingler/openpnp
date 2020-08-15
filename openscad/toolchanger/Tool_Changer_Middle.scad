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

    o = 0.6;
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
            translate([10, b + d/2 + (i - 1) * d, s]) cylinder(h + s + 2, or, or);
            hull()
            {
                translate([10, b + d/2 + (i - 1) * d, s]) cylinder(h + s + 2, or - o, or - o);
                translate([w + 10, b + d/2 + (i - 1) * d, s]) cylinder(h + s + 2, or - o, or - o);
            }
            hull()
            {
                translate([w, b + d/2 + (i - 1) * d, s]) cylinder(h + s + 2, tr, tr);
                translate([w + 10, b + d/2 + (i - 1) * d, s]) cylinder(h + s + 2, tr, tr);
            }
            hull()
            {
                translate([w - 3, b + d/2 + (i - 1) * d, -1]) cylinder(h + s + 2, or, or);
                translate([w + 10, b + d/2 + (i - 1) * d, -1]) cylinder(h + s + 2, or, or);
            }
            // Cut out for spring
            translate([15, b + d/2 + (i - 1) * d - 5, s]) cube([2, 10, 3], false);
            translate([6, b + d/2 + (i - 1) * d - 6, s]) cube([12, 2, 3], false);
            translate([6, b + d/2 + (i - 1) * d + 4, s]) cube([12, 2, 3], false);
            translate([6, b + d/2 + (i - 1) * d - 5, s + 1.6]) cube([10, 10, 3], false);
        }
        // Screw holes for holding all layers together
        for(i = [1:nozzles - 1])
        {
            translate([w - 17, b + d + (i - 1) * d, -1]) cylinder(h + s + 2, 1.6, 1.6);
        }
        // Holes for M4 mounting screws at both sides
        translate([w / 2, b / 2, -1]) cylinder(h + s + 2, 2.2, 2.2);
        translate([w / 2, nozzles * d + 2 * b - b / 2, -1]) cylinder(h + s + 2, 2.2, 2.2);
    }
    translate([0, 0, s]) cube([w, nozzles * d + 2 * b, h - 3], false);
}
