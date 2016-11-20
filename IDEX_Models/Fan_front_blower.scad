nozzle_w_t=1.2;
duct_w_t=nozzle_w_t;
nozzle_x =20;
nozzle_z= 6;
nozzle_y=5;
nozzle_taper_l=16;
duct_w=25;
duct_w2=38;
duct_h=20;
noz_a=20;
duct_a=-15;
duct_ir=32/2;
duct_depth=11;
m3r=1.75;
mount_c_h=6+duct_w_t+1;
mount_c_offset=duct_w/2+14;
mount_c_off_y=4;

nozzle_off_y=30;


module nozzle(right=1){
    difference(){
        //nozzle
        union(){
            hull(){
                rotate([noz_a,0,0])
                translate([0,0,0])
                    cube([nozzle_x,0.1,nozzle_z],center=true);
                translate([0,nozzle_y,0])
                    cube([nozzle_x,0.1,nozzle_z],center=true);
            }
            //fan interface
            hull(){
                translate([0,nozzle_y,0])
                    cube([nozzle_x,0.1,nozzle_z],center=true);
                translate([0,nozzle_taper_l-2,(nozzle_z-duct_h)/2])
                        cube([duct_w+nozzle_w_t*2,0.1,duct_h+nozzle_w_t*2],center=true);
                translate([(duct_w-duct_w2)/2,nozzle_taper_l+duct_depth,(nozzle_z-duct_h)/2])
                        cube([duct_w2+nozzle_w_t*2,0.1,duct_h+nozzle_w_t*2],center=true);            
            }
            //screw hole meat
            hull(){
                translate([-mount_c_offset,nozzle_taper_l+duct_depth-(m3r+2),-(duct_h-nozzle_z)/2-duct_h/2+mount_c_h/2-duct_w_t])
                cylinder(r=m3r+2, h=mount_c_h,center=true,$fn=20);
                translate([0,nozzle_taper_l+duct_depth-(m3r+2),-(duct_h-nozzle_z)/2-duct_h/2+mount_c_h/2-duct_w_t])
                cube([0.1,m3r*2+4,mount_c_h],center=true);
            }
            if(right){
                hull(){
                    translate([17,nozzle_taper_l+duct_depth-(m3r+2),-(duct_h-nozzle_z)/2])
                    cylinder(r=m3r+2, h=duct_h+duct_w_t*2,center=true,$fn=20);
                    translate([0,nozzle_taper_l+duct_depth-(m3r+2),-(duct_h-nozzle_z)/2])
                    cube([0.1,m3r*2+4,duct_h+duct_w_t*2],center=true);
                }
            }
        }      
        //nozzle cutout
        hull(){
            translate([0,-1,0])
            rotate([noz_a,0,0])
                cube([nozzle_x-nozzle_w_t*2,0.11,nozzle_z-nozzle_w_t*2],center=true);
            translate([0,nozzle_y+0.01,0])
                cube([nozzle_x-nozzle_w_t*2,0.11,nozzle_z-nozzle_w_t*2],center=true);

        }
        //fan interface cutout      
        hull(){
          translate([0,nozzle_y-0.01,0])
                cube([nozzle_x-nozzle_w_t*2,0.11,nozzle_z-nozzle_w_t*2],center=true);
            translate([0,nozzle_taper_l-0.01,(nozzle_z-duct_h)/2])
                    cube([duct_w,0.1,duct_h],center=true);
            translate([(duct_w-duct_w2)/2,nozzle_taper_l+duct_depth+0.01,(nozzle_z-duct_h)/2])
                    cube([duct_w2,0.1,duct_h],center=true);            
        }
        //screw hole
                translate([-mount_c_offset,nozzle_taper_l+duct_depth-(m3r+2),-(duct_h-nozzle_z)/2-duct_h/2+mount_c_h/2-duct_w_t])
                cylinder(r=m3r, h=mount_c_h+0.1,center=true,$fn=12);
            if(right){
                translate([17,nozzle_taper_l+duct_depth-(m3r+2),-(duct_h-nozzle_z)/2])
                cylinder(r=m3r, h=duct_h+duct_w_t*2+0.1,center=true,$fn=20);
            }        
        //cutout
       translate([-mount_c_offset,nozzle_taper_l+duct_depth-(m3r+2)+3,-(duct_h-nozzle_z)/2+mount_c_h/2])
        cube([12,12,duct_h-mount_c_h+duct_w_t*2+0.1],center=true);
        //cutout
        translate([duct_w/2,nozzle_taper_l+duct_depth-(m3r+2)+3,-(duct_h-nozzle_z)/2])
        cube([10,8,3],center=true); 
    }
    //vane
    hull(){
        rotate([noz_a,0,0])
        cube([0.8,0.1,nozzle_z],center=true);
        translate([0,nozzle_y,0])
            cube([0.8,0.1,nozzle_z],center=true);
    }
    hull(){
        translate([0,nozzle_y,0])
            cube([0.8,0.1,nozzle_z],center=true);
        translate([0,nozzle_taper_l-2,(nozzle_z-duct_h)/2])
            cube([0.8,0.1,duct_h+nozzle_w_t*2],center=true);
    }
    #hull(){
        translate([0,nozzle_taper_l-2,(nozzle_z-duct_h)/2])
            cube([0.8,0.1,duct_h+nozzle_w_t*2],center=true);
        translate([(duct_w-duct_w2)/2+4,nozzle_taper_l+duct_depth-8,(nozzle_z-duct_h)/2])
            cube([0.8,0.1,duct_h+nozzle_w_t*2],center=true);
    }
}

mount_x=9;
mount_y=8;
mount_z=34;
mount_off_y=7;
mount_off_x=-42;
mount_off_z=-mount_z/2+mount_c_offset-2;
m3hr=3.2;
m3hh=4;
m3hz=7;

module mountL(){
        union(){
            //mount to carriage
            translate([mount_off_x,mount_off_y,mount_off_z])
            difference(){
               hull(){
                    translate([0,0,-(mount_z)/2])
                        rotate([0,90,0])
                            cylinder(r=mount_y/2, h=mount_x,center=true);
                    translate([0,0,(mount_z)/2+5])
                        rotate([0,90,0])
                            cylinder(r=mount_y/2, h=mount_x,center=true);
                }

                translate([0,0,-m3hz-5])
                hull(){
                    translate([-mount_x/2+m3hh/2-0.01,0,-(m3hz)/2])
                        rotate([0,90,0])
                            cylinder(r=m3hr, h=m3hh,center=true);
                    translate([-mount_x/2+m3hh/2-0.01,0,(m3hz)/2])
                        rotate([0,90,0])
                            cylinder(r=m3hr, h=m3hh,center=true);
                }
                translate([0,0,m3hz-5])
                hull(){
                    translate([-mount_x/2+m3hh/2-0.01,0,-(m3hz)/2])
                        rotate([0,90,0])
                            cylinder(r=m3hr, h=m3hh,center=true);
                    translate([-mount_x/2+m3hh/2-0.01,0,(m3hz)/2])
                        rotate([0,90,0])
                            cylinder(r=m3hr, h=m3hh,center=true);
                }
                translate([0,0,-m3hz-5])
                hull(){
                    translate([0,0,-(m3hz)/2])
                        rotate([0,90,0])
                            cylinder(r=m3r, h=mount_x+0.1,center=true);
                    translate([0,0,(m3hz)/2])
                        rotate([0,90,0])
                            cylinder(r=m3r, h=mount_x+0.1,center=true);
                }
                translate([0,0,m3hz-5])
                hull(){
                    translate([0,0,-(m3hz)/2])
                        rotate([0,90,0])
                            cylinder(r=m3r, h=mount_x+0.1,center=true);
                    translate([0,0,(m3hz)/2])
                        rotate([0,90,0])
                            cylinder(r=m3r, h=mount_x+0.1,center=true);
                }
                    translate([0,-mount_y/2-1.8,(mount_z)/2-12])
                        cube([10,4,mount_z+20],center=true);
            }
            //mount to fan

            translate([0,nozzle_off_y,+13])
                rotate([duct_a,0,0])
                   translate([-mount_c_offset,nozzle_taper_l+duct_depth-(m3r+2),(nozzle_z-duct_h)/2+duct_h/2+duct_w_t+mount_c_h/2])
                        difference(){
                        translate([0,17.5,0])
                            hull(){
                                translate([0,-44/2,0])
                                    cylinder(r=5, h=5,center=true);
                                translate([0,37.5/2,0])
                                    cylinder(r=5, h=5,center=true);
                            }   
                        translate([0,0,0])
                            cylinder(r=m3r, h=5+0.1,center=true); 
                        translate([0,35,0])
                            cylinder(r=m3r, h=5+0.1,center=true); 
                    }
            
          
            difference(){
                union(){
                    hull(){
                        translate([mount_off_x,mount_off_y,mount_off_z])
                            translate([0,0,(mount_z)/2+5])
                                rotate([0,90,0])
                                    cylinder(r=mount_y/2, h=mount_x,center=true);
                        translate([mount_off_x,mount_off_y,mount_off_z])
                            translate([0,0,(mount_z)/2-5])
                                rotate([0,90,0])
                                    cylinder(r=mount_y/2, h=mount_x,center=true);
                        #translate([mount_off_x,mount_off_y,mount_off_z])
                            translate([0,nozzle_off_y+12,(mount_z)/2-9.25])
                                rotate([0,90,0])
                                    cylinder(r=2.5, h=mount_x,center=true);
                    }
                    hull(){
                        translate([mount_off_x,mount_off_y,mount_off_z])
                            translate([0,nozzle_off_y+12,(mount_z)/2-9.25]){
                                rotate([0,90,0])
                                    cylinder(r=2.5, h=mount_x,center=true);
                                translate([2,0,0])
                                rotate([duct_a,0,0])
                                    cylinder(r=5, h=5,center=true);
                            }
                        translate([0,nozzle_off_y,+13])
                            rotate([duct_a,0,0])
                                translate([-mount_c_offset,nozzle_taper_l+duct_depth-(m3r+2),(nozzle_z-duct_h)/2+duct_h/2+duct_w_t+mount_c_h/2])
                                    translate([0,-44/2+17.5,0])
                                        cylinder(r=5, h=5,center=true);
                    }
                }
                translate([0,nozzle_off_y,+13])
                    rotate([duct_a,0,0])
                       translate([-mount_c_offset,nozzle_taper_l+duct_depth-(m3r+2),(nozzle_z-duct_h)/2+duct_h/2+duct_w_t+mount_c_h/2]){
                                    cylinder(r=m3r, h=12,center=true);
                                    translate([0,0,-7.51])
                                        cube([12,20,10],center=true);
                                    translate([0,0,+7.51])
                                        cube([50,20,10],center=true);
                       }

                    translate([mount_off_x,mount_off_y,mount_off_z])
                        translate([9.5,0,(mount_z)/2+8])
                            cube([10,12,16],center=true);
                    translate([mount_off_x,mount_off_y,mount_off_z])
                        translate([0,-mount_y/2-1.5,(mount_z)/2-12])
                            cube([10,4,mount_z+20],center=true);

            }
        }
}
mount_off_xR =-23.5;
module mountR(){
        union(){
            //mount to carriage
            translate([mount_off_xR,mount_off_y,mount_off_z])rotate([0,0,180])
            difference(){
               hull(){
                    translate([0,0,-(mount_z)/2])
                        rotate([0,90,0])
                            cylinder(r=mount_y/2, h=mount_x,center=true);
                    translate([0,0,(mount_z)/2+5])
                        rotate([0,90,0])
                            cylinder(r=mount_y/2, h=mount_x,center=true);
                }

                translate([0,0,-m3hz-5])
                hull(){
                    translate([-mount_x/2+m3hh/2-0.01,0,-(m3hz)/2])
                        rotate([0,90,0])
                            cylinder(r=m3hr, h=m3hh,center=true);
                    translate([-mount_x/2+m3hh/2-0.01,0,(m3hz)/2])
                        rotate([0,90,0])
                            cylinder(r=m3hr, h=m3hh,center=true);
                }
                translate([0,0,m3hz-5])
                hull(){
                    translate([-mount_x/2+m3hh/2-0.01,0,-(m3hz)/2])
                        rotate([0,90,0])
                            cylinder(r=m3hr, h=m3hh,center=true);
                    translate([-mount_x/2+m3hh/2-0.01,0,(m3hz)/2])
                        rotate([0,90,0])
                            cylinder(r=m3hr, h=m3hh,center=true);
                }
                translate([0,0,-m3hz-5])
                hull(){
                    translate([0,0,-(m3hz)/2])
                        rotate([0,90,0])
                            cylinder(r=m3r, h=mount_x+0.1,center=true);
                    translate([0,0,(m3hz)/2])
                        rotate([0,90,0])
                            cylinder(r=m3r, h=mount_x+0.1,center=true);
                }
                translate([0,0,m3hz-5])
                hull(){
                    translate([0,0,-(m3hz)/2])
                        rotate([0,90,0])
                            cylinder(r=m3r, h=mount_x+0.1,center=true);
                    translate([0,0,(m3hz)/2])
                        rotate([0,90,0])
                            cylinder(r=m3r, h=mount_x+0.1,center=true);
                }
                    translate([0,-mount_y/2-1.8,(mount_z)/2-12])
                        cube([10,4,mount_z+20],center=true);
            }
            //mount to fan

            translate([0,nozzle_off_y,+13])
                rotate([duct_a,0,0])
                   translate([-mount_c_offset,nozzle_taper_l+duct_depth-(m3r+2),(nozzle_z-duct_h)/2+duct_h/2+duct_w_t+mount_c_h/2])
                        difference(){
                            hull(){
                                translate([0,-3.5,0])
                                    cylinder(r=5, h=5,center=true);
                                translate([-43.5,-3.5,0])
                                    cylinder(r=5, h=5,center=true);
                            }    
                            translate([-43.5,-3.5,0])
                                cylinder(r=m3r, h=5+0.1,center=true); 
                            translate([0,-3.5,0])
                                cylinder(r=m3r, h=5+0.1,center=true); 
                    }
            
          
            difference(){
                union(){
                    translate([mount_off_xR,mount_off_y,mount_off_z])
                    hull(){
                            translate([0,0,(mount_z)/2+5])
                                rotate([0,90,0])
                                    cylinder(r=mount_y/2, h=mount_x,center=true);
                            translate([0,0,(mount_z)/2-5])
                                rotate([0,90,0])
                                    cylinder(r=mount_y/2, h=mount_x,center=true);
                            translate([0,nozzle_off_y+12,(mount_z)/2-8])
                                rotate([0,90,0])
                                    cylinder(r=2.5, h=mount_x,center=true);
                    }
                    hull(){
                        translate([mount_off_xR,mount_off_y,mount_off_z])
                            translate([0,nozzle_off_y+12,(mount_z)/2-8.5]){
                                translate([-0.5,1.5,0])
                                rotate([duct_a,0,0])
                                    cylinder(r=5, h=5,center=true);
                            }
                        translate([0,nozzle_off_y,+13])
                            rotate([duct_a,0,0])
                                translate([-mount_c_offset,nozzle_taper_l+duct_depth-(m3r+2),(nozzle_z-duct_h)/2+duct_h/2+duct_w_t+mount_c_h/2])
                                    translate([0,-3.5,0])
                                        cylinder(r=5, h=5,center=true);
                    }
                }
                translate([0,nozzle_off_y,+13])
                    rotate([duct_a,0,0])
                       translate([-mount_c_offset,nozzle_taper_l+duct_depth-(m3r+2)-3.5,(nozzle_z-duct_h)/2+duct_h/2+duct_w_t+mount_c_h/2]){
                                    cylinder(r=m3r, h=12,center=true);
                       }


                    translate([mount_off_xR,mount_off_y,mount_off_z])
                        translate([0,-mount_y/2-1.5,(mount_z)/2-12])
                            cube([10,4,mount_z+20],center=true);

            }
        }
}


//Left Assembly
if(0){
    mountL();
    translate([0,nozzle_off_y,0])
    rotate([duct_a,0,0])
    nozzle();
}
//Right Assembly
else if(0){
    mountR();
    translate([mount_off_xR-20,nozzle_off_y+7,41])
    rotate([duct_a,0,0])
    nozzle(1);
}
//Leftnozzle
else if(0) {
    rotate([-90,0,0])
    nozzle(0);

}
//Right nozzle
else if(0) {
    rotate([-90,0,0])
    nozzle(1);

}
else if (0){
    rotate([0,-90,0])
        mountL();
}
else if (1){
    rotate([0,90,0])
        mountR();
}


