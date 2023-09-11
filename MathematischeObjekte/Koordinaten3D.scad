/* Vorlesungsbeispiel, Koordinatensystem in 3D,

   Einmal normal drucken, und einmal an der x-Achse gespiegelt drucken.
   
   Copyright, 2023, Mathias Moog, Hochschule Ansbach, Deutschland, CC-BY-NC-SA
*/

d=2;
$fn=60;

// Erzeude den Pfeil in x-Richtung 
// und einen gebogenen Pfeil in y-Richtung
module pfeil( achse ) {
  linear_extrude(d) {
  difference() {
    union() {
      // Spitze
      polygon( [[30,-10],[30,20],[50,5]] );
      // Kreisbogen, außen
      translate([0,5]) circle(r=20);
    }
    // Beschriftung
    translate([33,5]) rotate(-90) text( achse, size=10, halign="center");
    // Kreis innen
    translate([0,5]) circle(r=15);
    // Alles negative weg ... 
    translate([-50,-25]) square(50);
    translate([0,-25]) square(25);
    // Platz für Pfeil
    translate([-5,17]) square(10);
  }
  // Schaft
  scale([3,1]) square(10);
  // Pfeilspitze
  polygon( [[0,22.5], [5,28], [5,17] ] );
}
}

module koord3d() {
  pfeil( "x" );
  rotate([90,0,90]) pfeil( "y" );
  rotate([0,-90,-90]) pfeil( "z" );
}

//koord3d();

// Einfacherer Druck, z<0 abschneiden
intersection() {
  koord3d();
  translate([-100,-100,-200.1]) cube(200);
}  
