module robot4()
{
    translate([8,13,2])
        rotate([0,0,45])
            cube([15,2,5], center=true);
    translate([-8,13,2])
        rotate([0,0,-45])
            cube([15,2,5], center=true);
    translate([-7,7,0])
        rotate([0,0,-45])
            cube([7,2,5], center=true);
    translate([7,7,0])
        rotate([0,0,45])
            cube([7,2,5], center=true);
	difference()
	{
		cube([30,30,5], center=true);
        // eyes
		translate([8,5,2])
        {
			cylinder(h=3, r=2.5, center=true, $fn=100);
        }
		translate([-8,5,2])
			cylinder(h=3, r=2.5, center=true, $fn=100);
        // mouth
        scale([1.5,1.3,1])
            translate([-7,-5,2])
                linear_extrude(height=4) 
                    polygon(points=[[0,0], [2,2.2], [4,-2.4], [6,2.1], [8,-2.8], [10,2.3], [12,-2.5], [14, 2.2], [14, .8], [12, -4.1], [10, .5], [8,-5.2], [6,.1], [4,-4.2], [2,.6], [0, -1.1] ]);
	}
    // ears
	translate([15,-2,-1])
        rotate([0,0,45])
            cube([6,6,2]);
	translate([-15,-2,-1])
        rotate([0,0,45])
            cube([6,6,2]);
    // nose
	translate([0,0,2])
        rotate([0,45,0])
        cube([4,4,4], center=true);
}

module robot3()
{
	difference()
	{
		cube([30,30,5], center=true);
        // eyes
		translate([8,5,2])
			cylinder(h=3, r=2.5, center=true, $fn=100);
		translate([-8,5,2])
			cylinder(h=3, r=2.5, center=true, $fn=100);
        // mouth
		union()
		{
            // right side of mouth
			translate([0,-9,2])
				cylinder(h=3, r=4, center=true, $fn=100);
		}
	}
    // ears
	translate([15,0,-1])
        cylinder(h=3, r=4, center=true, $fn=100);
	translate([-15,0,-1])
        cylinder(h=3, r=4, center=true, $fn=100);
    // nose
	translate([0,0,2])
        sphere(r=3, center=true, $fn=100);
}

module robot2()
{
	difference()
	{
		cube([30,30,5], center=true);
        // eyes
		translate([8,5,2])
			cylinder(h=3, r=2, center=true, $fn=100);
		translate([-8,5,2])
			cylinder(h=3, r=2, center=true, $fn=100);
        // mouth
		union()
		{
            // right side of mouth
			translate([8,-6.5,2])
				cylinder(h=3, r=2, center=true, $fn=100);
            // left side of mouth
			translate([-8,-6.5,2])
				cylinder(h=3, r=2, center=true, $fn=100);
            // center of mouth
			translate([0,-7,2])
				cube([15,3,3], center=true);
		}
	}
    // ears
	translate([0,0,-1])
		cube([38,6,3], center=true);
    // nose
    difference()
    {
        translate([0,0,0])
            rotate([0,90,90])
                cylinder(h=3, r=5, center=true, $fn=100);
        translate([0,0,-5])
            cube([30,30,5], center=true);
    }
    // antenna
    union()
    {
        translate([0,15,0])
            rotate([0,90,90])
                cylinder(h=15, r=1, center=true, $fn=100);
        translate([0,22,0])
            sphere(r=2, $fn=100);
    }
}

module robot()
{
	difference()
	{
		cube([30,30,5], center=true);
		translate([8,5,2])
			cylinder(h=3, r=3, center=true);
		translate([-8,5,2])
			cylinder(h=3, r=3, center=true);
		union()
		{
			translate([8,-7,2])
				cylinder(h=3, r=3, center=true);
			translate([-8,-7,2])
				cylinder(h=3, r=3, center=true);
			translate([0,-7,2])
				cube([15,6,3], center=true);
		}
	}
	translate([0,0,-1])
		cube([38,5,3], center=true);
}

module hanger()
{
	cube([10,30,5], center=true);
	translate([0,5,5])
		rotate([90,0,0])
			rotate([0,-90,0])
				difference()
				{
					cylinder(r=20, h=10, center=true);
					translate([-20,10,0])
						cylinder(r=30, h=10, center=true);
					translate([0,-15,0])
						cube([50,20,10], center=true);
				}
	translate([0,-5,20])
		rotate([0,90,0])
			cylinder(h=10, r=3, center=true);
}


robot4();
translate([0,-30,0])
    hanger();
