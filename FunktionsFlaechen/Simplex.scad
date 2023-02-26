/* Lecture example, simplex algorithm.
   Convex set in x-y-plane, objective function in z-direction
   
   Copyright, 2022, Mathias Moog, Hochschule Ansbach, Deutschland, CC-BY-NC-SA
*/   

  
  
d =0.01;  // Dimension of the spheres arround the points
h=2;      // (half) depth of the inscription
$fn=3;    // low resultion of the spheres

// inscription of height h 
module mtext( t ) {
  linear_extrude(height=h) text( t );
}  

// create a small sphere arround the point p
module point( p ) {
  translate(p) sphere(d=d);
}

// convex hull of a point set ps
module convex_hull( ps ) {
  hull() {
    for( p=ps ) point(p);
    }
}

// outer points, specify the objective function 
outer_points = [ [0,0,0], [200,0,0], [200,0,280], [0,200,0], [0,200,160] ];

// convex set, projection on z=0
bottom_points = [ [0,0,0], [60,0,0], [70,30,0], [60,70,0], [20,100,0], [0,90,0] ];


difference() { // only for inscription
  intersection() {
  // objectiv function 
  convex_hull( outer_points );
  // restrictions
  hull() {
    convex_hull( bottom_points ); // bottom
    translate([0,0,200]) convex_hull( bottom_points ); // high enough ...
    }
  }
  // inscription on the sides
  translate([10,h/2,5]) rotate([90,0,0]) mtext("\u2192 x ");
  translate([50,h/2,20]) rotate([90,-90,0]) mtext("\u2192 z ");
  translate([-h/2,80,20]) rotate([90,-90,90]) mtext("\u2192 z ");
  translate([-h/2,20,10]) rotate([90,0,90]) mtext("\u2192 y ");
}
