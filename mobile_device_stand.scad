hook = 14;
plate_w = 2;
plate_h = 60;
plate_d = 40;
gap = 20;


$fn=30;

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

	translate([hook-plate_w*2,hook/2,plate_w*2])
		rotate([0,90,0])
		cylinder(r=1.5,h=5);

}





translate([hook-plate_w+hook-plate_w*2,0,0])
	cube([plate_w, plate_h, plate_d]);

translate([hook-plate_w+hook-plate_w*2, plate_h, plate_d/2-gap/2+0.5])
	cube([plate_w,gap/2,gap-1]);

translate([hook+hook/2-plate_w, plate_h+hook/2 ,0])
	cylinder(r=hook/2-plate_w-0.5, h=plate_d);
