//dz=19.148
//dx=-11.545

mhole2zoffset=19.148;
mhole2xoffset=-11.545;
wipearmlength = 60; //52
wipezoffset=28.0;
t=2;
w=15;
mcmsr=2;
mcms_csinkr=3.5;
csink_d=w-5;
rbrt=5;//2+0.1; 
rbhldrt=4.2;//rbrt+2.3;
rbhldrl=7;
rbrl=15;//11.5;
rbrangle=10;
rbrzoffset=rbhldrt/2;
rbryoffset2=20; //nozzle center on Z in relation to side of the
rbryoffset1=24;
rbryco=20;
cnrl=10;

difference(){
    union(){

        hull(){
            translate([0,-wipezoffset,0])
                cube([t,t,w],center=true);
            translate([wipearmlength-t/2-5,-wipezoffset,rbryoffset2])
                cube([t,t,w],center=true);

        }

        hull(){
            translate([0,0,0])
                cylinder(h=w, r=5, $fn=30,center=true);
            translate([mhole2xoffset,mhole2zoffset,0])
                cylinder(h=w, r=5, $fn=30,center=true);
        }
        hull(){
            translate([0,-wipezoffset/2,0])
                cube([t,wipezoffset,w],center=true);
            translate([0,0,0])
                cylinder(h=w, r=5, $fn=30,center=true);
        }
        
        
        hull(){
            translate([t/2+cnrl/2,-wipezoffset,0])
               cube([cnrl,t,w],center=true);
            translate([t/2-0.1,-wipezoffset+(cnrl+t)/2+0.1,0])
               cube([0.01,cnrl,w],center=true);
        }
        //arm support
        /*
         hull(){
            translate([t/2+cnrl/2,-wipezoffset,0])
               cube([cnrl,0.4,w],center=true);
            translate([wipearmlength-t/2-5,-wipezoffset,rbryoffset2/2-w/2])
                #cube([t,0.6,rbryoffset2],center=true);
        }
        //arm with support
        hull(){
            translate([t/2+cnrl/2,-wipezoffset,0])
               cube([cnrl,t,w],center=true);
            translate([wipearmlength-t/2-rbhldrl-4,-wipezoffset,rbryoffset2])
                cube([t,t,w],center=true);
        }
        */
        //arm full lenght
        hull(){
            translate([t/2+cnrl/2,-wipezoffset,0])
               cube([cnrl,t,w],center=true);
            translate([wipearmlength-t/2-rbhldrl-4,-wipezoffset,rbryoffset2/2])
                cube([t,t,w+rbryoffset2],center=true);
        }
        //rubber holder
        hull(){
            translate([wipearmlength-t/2-rbhldrl-4,-wipezoffset,rbryoffset2/2])
                cube([t,t,w+rbryoffset2],center=true);
            translate([wipearmlength-t/2,-wipezoffset-rbrzoffset+t/2,rbryoffset2/2])
                cube([rbhldrl,rbhldrt,w+rbryoffset2],center=true);
        }

    }
    //mounting holes
    cylinder(h=w+1, r=mcmsr,center=true);
    translate([0,0,(w-csink_d)/2])
        cylinder(h=csink_d+0.1, r=mcms_csinkr,center=true);
    translate([mhole2xoffset,mhole2zoffset,0]){
        cylinder(h=w+1, r=mcmsr,center=true);
        translate([0,0,(w-csink_d)/2])
            cylinder(h=csink_d+0.1, r=mcms_csinkr,center=true);
    }
    /*
    //rubber cutout
    translate([wipearmlength+rbrl/2-rbhldrl/2,-wipezoffset-rbrzoffset/2+0.75,rbryoffset2/2])
        rotate([0,0,rbrangle])
        #cube([rbrl,rbrt,w+rbryoffset2+1],center=true);
    */
        //rubber cutout type 2
    translate([wipearmlength-rbhldrl/2,-wipezoffset-rbrt/2+1.5,rbryoffset2/2])
        #cube([rbrl,rbrt,rbryco],center=true);
    //rubber holes
    translate([wipearmlength-rbhldrl/2,-wipezoffset-rbrt/2+1.5,rbryoffset2/2])
    rotate([0,0,0])
    cylinder(h=w+rbryoffset2+1, r=1 ,center=true);
}