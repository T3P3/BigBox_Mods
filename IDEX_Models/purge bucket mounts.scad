rubberL=40;
wallT=1.2;
rubberD=9;
bucketX=rubberL+wallT;
bucketY=30;
bucketZ=rubberD+20;
bucketZOff=5;
acrylicT=6.1;
acrylicCUD=15;
acrylicMT=2;
acrylicMX=acrylicCUD+10;
acrylicMY=bucketY;
acrylicMZOff=0.5;
acrylicX1Off=15;
m3r=1.5;
rubberT=2.5;
rubberClampT=2;



module acrylicMount(){
    difference(){
        //solid sahpes
        union(){
            hull(){
                cube([acrylicMX,acrylicMY+rubberClampT*2,acrylicT+acrylicMT*2],center=true);
                translate([-acrylicX1Off/2,-(acrylicMY+rubberClampT*2)/2+0.05,0])
                cube([acrylicMX+acrylicX1Off,0.1,acrylicT+acrylicMT*2],center=true);
            }
            translate([acrylicMX/2+bucketX/2,0,(acrylicT+acrylicMT*2)/2-bucketZ/2+bucketZOff])
                cube([bucketX,bucketY+rubberClampT*2,bucketZ],center=true);
        }
        //acrylic cutout
        translate([-acrylicMX/2+acrylicCUD/2,0,+acrylicMZOff])
            hull(){
                translate([-0.1,(acrylicMY+rubberClampT*2)/2,0])
                    #cube([acrylicCUD,0.1,acrylicT],center=true);
                translate([-acrylicX1Off-0.1,-(acrylicMY+rubberClampT*2)/2,0])
                    #cube([acrylicCUD,0.1,acrylicT],center=true);
            }
        translate([acrylicMX/2+bucketX/2,-rubberClampT,(acrylicT+acrylicMT*2)/2-bucketZ/2+wallT/2+0.1+bucketZOff])
            cube([bucketX-wallT,bucketY-wallT,bucketZ-wallT],center=true);
        translate([acrylicMX/2+bucketX/2,(bucketY+rubberClampT*2)/2-rubberClampT-wallT/2,(acrylicT+acrylicMT*2)/2-rubberD/2+0.1+bucketZOff])
            cube([bucketX-wallT,rubberT,rubberD],center=true);
        //Acrylic clamp holes
        translate([-acrylicMX/2+3,bucketY/2-5,-(acrylicT+acrylicMT)-0.1])
            cylinder(h=acrylicT+acrylicMT*2+0.1, r=m3r);
        translate([-acrylicMX/2+10-acrylicX1Off,-bucketY/2+5,-(acrylicT+acrylicMT)-0.1])
            cylinder(h=acrylicT+acrylicMT*2+0.1, r=m3r);
        //rubber holes
        for(i=[-1,+1]){
            translate([acrylicMX/2+bucketX/2+i*(bucketX/2-5),(bucketY+rubberClampT*2)/2+0.1,(acrylicT+acrylicMT*2)/2-rubberD/2+bucketZOff])
            rotate([90,0,0])
            cylinder(h=rubberClampT*2+rubberT, r=m3r);
        }
    }
 
}


acrylicMount();


//mirror() acrylicMount();







