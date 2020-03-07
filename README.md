# vic20_kbd
A Cherry MX based keyboard for the VIC-20/C64, using the same matrix/interface, and aiming for the same form factor.

SHIFT LOCK is implemented with a flip-flop instead of a toggling switch.

The anti-ghosting diodes are probably not really needed, I just thought it SHOULD have them. Have fun soldering!

I use a normal 2.54mm pitch single-row pin header socket for the keyboard connector, with the cables soldered on, secured with shrink tubing and hot glue. This seems sturdy enough. Plug pin #2, the key pin, with something.

Print the stem adapters from CBMKeyAdapter.scad on an FDM printer using a .25mm nozzle. A resin printer produces better results, but the material is typically much too brittle for this kind of thing.
