$fn = 100;
// profiles
tGT2_2=0;

bw = 11.5;

difference()
{
    union()
    {
        cube([20, 12, 8], false);
    }
    translate([-2, 3.35, 6]) belt_len(profile = tGT2_2, belt_width = 8, len = 100);
    translate([-2.2, 3.5, 6]) belt_len(profile = tGT2_2, belt_width = 8, len = 100);
    translate([-1.9, 3.5, 6]) belt_len(profile = tGT2_2, belt_width = 8, len = 100);
    
    translate([5, 8, -1]) cylinder(8, 1.7, 1.7);
    translate([5, 8, 4]) cylinder(8, 3.25, 3.25, $fn = 6);
    translate([15, 8, -1]) cylinder(8, 1.7, 1.7);
    translate([15, 8, 4]) cylinder(8, 3.25, 3.25, $fn = 6);
}


//Outer Module
module belt_len(profile = tGT2_2, belt_width = 6, len = 10){
	_belt_len(prf=profile,len = len,bwdth = belt_width);
}

//inner module
module _belt_len(prf = -1, len = 10, bwdth = 5) {

	n=ceil(len/tpitch[prf]);

	translate ([0,0,-bwdth/2]) intersection() {
		union(){
			for( i = [0:n]) {
				draw_tooth(prf,i,bwdth);
			}
		translate([-1,-bk_thick[prf],0])cube([len+1,bk_thick[prf],bwdth]);
		}
	translate([0,-bk_thick[prf],0])cube([len,max_h[prf]+bk_thick[prf],bwdth]);
	}
}

module draw_tooth(prf,i,bwdth) {
	translate([tpitch[prf]*i,0,0])
	linear_extrude(height=bwdth) polygon(pf_GT2_2);
}

/************************************
 *				DATA TABLES					*
 ************************************/
tpitch = [2,2.5,5,10,2.032];
bk_thick=[0.6,0.6,1,2,0.64];
max_h=[0.76447, 0.699911, 1.189895, 2.499784, 0.508035];

pf_GT2_2=  [[ 0.747183,-0.5     ],[ 0.747183, 0       ],[ 0.647876, 0.037218],
				[ 0.598311, 0.130528],[ 0.578556, 0.238423],[ 0.547158, 0.343077],
				[ 0.504649, 0.443762],[ 0.451556, 0.53975 ],[ 0.358229, 0.636924],
				[ 0.2484  , 0.707276],[ 0.127259, 0.750044],[ 0       , 0.76447 ],
				[-0.127259, 0.750044],[-0.2484  , 0.707276],[-0.358229, 0.636924],
				[-0.451556, 0.53975 ],[-0.504797, 0.443762],[-0.547291, 0.343077],
				[-0.578605, 0.238423],[-0.598311, 0.130528],[-0.648009, 0.037218],
				[-0.747183, 0       ],[-0.747183,-0.5]];
