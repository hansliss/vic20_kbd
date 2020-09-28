$fn=256;

holeYDistance=114;
outerHoleXDistance=317;
innerHoleTopXDistance=102;
innerHoleBotXDistance=63.5;
shellScrewHoleDia=3;
shellScrewHeadDia=6;
shellScrewHoleBottomDia=5;
outerHoleXDistanceFromShell=40;
liftHeight=10;
mountHoleDistXRight=32;
mountHoleDistXLeft=11;
mountHoleYDist=92;
pcbYDistance=100;

translate([-63.2/2, holeYDistance/2, liftHeight])
    difference() {
        translate([0, 0, 2/2])
            cube([10, 15, 2], center=true);
        translate([0, 0, -0.01])
            cylinder(r=shellScrewHoleBottomDia/2, h=1.5);
        translate([0, 0, -0.01])
            cylinder(r=shellScrewHoleDia/2, h=3);
    }
    
translate([-63.2/2, pcbYDistance/2-1, 2-0.5])
    rotate([-10, 0, 0])
        translate([0, 0, liftHeight/2])
            cube([10, 2, liftHeight], center=true);

translate([63.2/2, holeYDistance/2, liftHeight])
    difference() {
        translate([0, 0, 2/2])
            cube([10, 15, 2], center=true);
        translate([0, 0, -0.01])
            cylinder(r=shellScrewHoleBottomDia/2, h=1.5);
        translate([0, 0, -0.01])
            cylinder(r=shellScrewHoleDia/2, h=3);
    }
    
translate([63.2/2, pcbYDistance/2-1, 2-0.5])
    rotate([-10, 0, 0])
        translate([0, 0, liftHeight/2])
            cube([10, 2, liftHeight], center=true);
    
translate([-101.4/2, -holeYDistance/2, liftHeight])
    difference() {
        translate([0, 0, 2/2])
            cube([10, 15, 2], center=true);
        translate([0, 0, -0.01])
            cylinder(r=shellScrewHoleBottomDia/2, h=1.5);
        translate([0, 0, -0.01])
            cylinder(r=shellScrewHoleDia/2, h=3);
    }

translate([-101.4/2, -pcbYDistance/2+1, 2-0.5])
    rotate([10, 0, 0])
        translate([0, 0, liftHeight/2])
            cube([10, 2, liftHeight], center=true);

translate([101.4/2, -holeYDistance/2, liftHeight])
    difference() {
        translate([0, 0, 2/2])
            cube([10, 15, 2], center=true);
        translate([0, 0, -0.01])
            cylinder(r=shellScrewHoleBottomDia/2, h=1.5);
        translate([0, 0, -0.01])
            cylinder(r=shellScrewHoleDia/2, h=3);
    }

translate([101.4/2, -pcbYDistance/2+1, 2-0.5])
    rotate([10, 0, 0])
        translate([0, 0, liftHeight/2])
            cube([10, 2, liftHeight], center=true);


difference() {
    translate([0, 0, 2/2])
        cube([101.4 + 20, pcbYDistance, 2], center=true);
    translate([63.2/2 - 34.2, mountHoleYDist/2, -0.01])
        cylinder(r=1.5, h=3);
    translate([14.36, mountHoleYDist/2 - 57, -0.01])
        cylinder(r=1.5, h=3);
}


