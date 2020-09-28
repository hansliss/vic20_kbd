$fn=256;

module standoff() {
    difference() {
        cylinder(r=2.5, h=1.5);
        translate([0, 0, -0.01])
            cylinder(r=1.8, h=1.52);
    }
}


for (x = [0:5]) {
    for (y = [0:5]) {
        translate([x * 6, y * 6, 0])
            standoff();
    }
}