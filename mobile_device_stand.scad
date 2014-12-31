include <Threaded/Thread_Library.scad>

hook = 14;
plate_w = 2;
plate_h = 60;
plate_d = 40;
gap = 20;




translate([hook-plate_w, (hook/2), 0])
	cube([plate_w, plate_h, plate_d]);

difference() {
	translate([hook/2, hook/2, 0])
		rotate_extrude(convexity = 5)
			translate([hook/2-plate_w,0,0])
				square([plate_w, plate_d]);

	translate([0,hook/2,-1])
		cube([hook*2, hook*2, plate_d+2]);
}

translate([hook-plate_w,plate_h,0])
difference() {
	translate([hook/2, hook/2, 0])
		rotate_extrude(convexity = 5)
			translate([hook/2-plate_w,0,0])
				square([plate_w, plate_d]);

	translate([-1, -1, plate_d/2-gap/2])
		cube([gap,gap,gap]);
}

translate([hook-plate_w+hook-plate_w*2,0,0])
	cube([plate_w, plate_h, plate_d]);

translate([hook-plate_w+hook-plate_w*2, plate_h, plate_d/2-gap/2+0.5])
	cube([plate_w,gap/2,gap-1]);

translate([hook+hook/2-plate_w, plate_h+hook/2 ,0])
	cylinder(r=hook/2-plate_w-0.5, h=plate_d);

translate([hook+hook/2-plate_w, plate_h+hook/2 ,plate_d])
trapezoidThread( 
	length=6,
	pitch=2,
	pitchRadius=hook/2-plate_w-1,
	threadHeightToPitch=0.5,
	profileRatio=0.5,
	threadAngle=30,
	RH=true,
	clearance=0.1,
	backlash=0.1,
	stepsPerTurn=24
	);

translate([35, hook,  0])
trapezoidNut(
	length=6, 				// axial length of the threaded rod 
	radius=hook/2, 				// outer radius of the nut	
	pitch=2, 				// axial distance from crest to crest
	pitchRadius=hook/2-plate_w-1, 			// radial distance from center to mid-profile
	threadHeightToPitch=0.5,	// ratio between the height of the profile and the pitch
						// std value for Acme or metric lead screw is 0.5
	profileRatio=0.5, 			// ratio between the lengths of the raised part of the profile and the pitch
						// std value for Acme or metric lead screw is 0.5
	threadAngle=30, 			// angle between the two faces of the thread 
						// std value for Acme is 29 or for metric lead screw is 30
	RH=true, 				// true/false the thread winds clockwise looking along shaft, i.e.follows the Right Hand Rule
	countersunk=0.5, 		// depth of 45 degree chamfered entries, normalized to pitch
	clearance=0.1, 			// radial clearance, normalized to thread height
	backlash=0.1, 			// axial clearance, normalized to pitch
	stepsPerTurn=24 			// number of slices to create per turn
	);

