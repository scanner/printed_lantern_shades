//
// An attempt at making something that sorta kinda resembles a square
// Japanese paper lantern.. eh.
//
module octagon() {
    polygon(points=[[1,2.41], [-1,2.41], [-2.41,1], [-2.41,-1], [-1,-2.41],
                    [1,-2.41], [2.41,-1], [2.41,1], [0.99,2.39], [-0.99,2.39],
                    [-2.39,0.99], [-2.39,-0.99], [-0.99,-2.39], [0.99,-2.39],
                    [2.39,-0.99], [2.39,0.99]],
                    paths=[[0,1,2,3,4,5,6,7],[8,9,10,11,12,13,14,15]]);
}
module solid_octagon() {
    polygon(points=[[1,2.41], [-1,2.41], [-2.41,1], [-2.41,-1], [-1,-2.41],
                    [1,-2.41], [2.41,-1], [2.41,1]],
                    paths=[[0,1,2,3,4,5,6,7]]);
}


module lantern() {
    // The top of the lantern, with two holes cut out for the six pin connectors
    // to be fed into
    union() {
    difference() {
        linear_extrude(height = 0.5, center = false, convexity = 10, twist = 0) {
            // scale(v=[28,28,1]) {
            //     solid_octagon();
            // }
            scale(v=[16,16,1]) {
                solid_octagon();
            }
        }
        translate([0, -25, 0]) {
            cube([17,7,5], center = true);
        }
        translate([0, 25, 0]) {
            cube([17,7,5], center = true);
        }
    }

    // difference() {
        // height = 100
        linear_extrude(height = 145, center = false, convexity = 10,
                       twist = 90) {
            // properly full sized octagon for our lamp shades
            // scale(v=[28,28,1]) {
            //     octagon();
            // }
            // Sized for Carolyn's LED lamp test
            //
            scale(v=[16,16,1]) {
                octagon();
            }
        }
        // Truncate the lantern for quicker test prints..
        //
        // translate([0, 0, 70]) {
        // cube([110,110,100], center = true);
        // }
        // }
    }
}

//octagon(80,100);
lantern();
