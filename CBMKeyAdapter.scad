/*
Key stem adapters for fitting VIC-20/C64 keycaps on Cherry MX keyswitches.
This will produce a complete set of adapters for a VIC-20 keyboard, including
double-stem ones for the 1 1/2U keys (function keys, CTRL, SHIFT, RESTORE).

The basic templates for the two stem types are supposed to be accurate in scale,
with scale factors added to provide add some space for actually fitting the
resulting adapters. You may need to experiment with the scale factors, depending
on your material's shrinkage factor. I developed this for ABS.

Print using a .25 nozzle, and *lift* the models a couple of mm above the buildplate,
to get supports added underneath! Make sure your slicer doesn't drop them straight
back down on the buildplate - there should be a setting for this.
*/

$fn=256;
cherrywidth=4;
cherrythickness=1.1;
cherryheight=3.5;
cherrybasewidth=7.2;
cherrybasedepth=5.5;
cherryTopThickness=1;
cbmwidth=4.6;
cbmthickness=1.4;
cbmheight=5;
cbmStemDist=9.4;
cbmPlateWidth=7;
cbmScaleFactor=0.999;
cherryScaleFactor=1.009;

module cherryStem() {
    union() {
        cube([cherrywidth, cherrythickness, cherryheight+1], center=true);
        cube([cherrythickness, cherrywidth, cherryheight+1], center=true);
    }
}

module cbmStem() {
    union() {
        cube([cbmwidth, cbmthickness, cbmheight], center=true);
        cube([cbmthickness, cbmwidth, cbmheight], center=true);
    }
}

module singleStem() {
    union() {
        difference() {
            cylinder(r=cherrybasedepth/2-0.1, h=cherryheight + cherryTopThickness);
            scale([cherryScaleFactor, cherryScaleFactor, 1])
                translate([0, 0, cherryheight/2-0.01])
                    cherryStem();
        }
        scale([cbmScaleFactor, cbmScaleFactor, cbmScaleFactor])
            translate([0, 0, cherryheight + 1 + cbmheight/2 - 0.01])
                cbmStem();
    }
}

module oneOneHalfStem() {
    union() {
        difference() {
            cylinder(r=cherrybasedepth/2-0.1, h=cherryheight + cherryTopThickness);
            scale([cherryScaleFactor, cherryScaleFactor, 1])
                translate([0, 0, cherryheight/2-0.01])
                    cherryStem();
        }
        translate([0, 0, cherryheight + cherryTopThickness/2])
            //minkowski() {
                cube([cbmStemDist + 2 * cbmwidth/2+2, cbmPlateWidth, cherryTopThickness + 0.02], center=true);
              //  sphere(0.5);
            //}
        translate([-cbmStemDist/2, 0, 0])
            scale([cbmScaleFactor, cbmScaleFactor, cbmScaleFactor])
                translate([0, 0, cherryheight + 1 + cbmheight/2 - 0.01])
                    cbmStem();
        translate([cbmStemDist/2, 0, 0])
            scale([cbmScaleFactor, cbmScaleFactor, cbmScaleFactor])
                translate([0, 0, cherryheight + 1 + cbmheight/2 - 0.01])
                    cbmStem();
    }
}

for (i = [0 : 63]) {
    x = (cherrybasedepth + 2) * (i % 8);
    y = (cherrybasedepth + 2) * floor(i / 8);
    translate([x, y, 2])
        singleStem();
}

for (i = [0 : 8]) {
    x = 2 * (cherrybasedepth + 4) * (i % 3) + cherrybasedepth + 2;
    y = (cherrybasedepth + 3) * (floor(i / 3)) + (cherrybasedepth + 2) * 8;
        translate([x, y, 2])
        oneOneHalfStem();
}
