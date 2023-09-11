/* Vorlesungsbeispiel, Koordinatensystem in 2D,

   Einmal normal drucken, und einmal an der x-Achse gespiegelt drucken.
   
   Copyright, 2023, Mathias Moog, Hochschule Ansbach, Deutschland, CC-BY-NC-SA
*/

d=2;
$fn=60;


// alles in 2D, x-y Ebene, nur etwas aufdicken ...
linear_extrude(d) {
  // Kreisbogen
  difference() {
    // Kreisbogen, außen
    translate([5,5]) circle(r=20);
    // Kreis innen
    translate([5,5]) circle(r=15);
    // Alles negative weg ... 
    translate([-45,-25]) square(50);
    translate([0,-20]) square(25);
    // Platz für Pfeil
    translate([0,17]) square(10);
  }
  // Spitze
  polygon( [[5,22], [5,23], [10,28], [10,17] ] );
  // x Pfeil 
  difference() {
    polygon( [[30,-15],[30,15],[50,0]] );
    translate([33,0]) rotate(-90) text( "x", size=10, halign="center");
  }
  // Schaft
  translate([0,-5]) scale([3,1]) square(10);
  // x Pfeil 
  difference() {
    polygon( [[-15,30],[15,30],[0,50]] );
    translate([0,33]) text( "y", size=10, halign="center");
  }
  // Schaft
  translate([-5,0]) scale([1,3]) square(10);
  // Verbinden
  translate([-5,-5]) square(10);
  
}




  
