// Schablone für die Exponential und Logarithmus Funktion - Module
//
// Grundlegende Module für die Schablone. 
// Werden für die 3D Drucke und die gefrästen 
// Schablonen benötigt.
//
// Mit der Oberseite kann die Exponential Funktion gezeichnet werden.
// Die Unterseite wird für den Logarithmus verwendet.
//
// Die geraden Ränder besitzen ein cm Einteilung zum Zeichnen der 
// Achsen. Das runde Loch markiert den Punkt 2 (auf der y-Achse für die 
// Exponential Funktion und auf der x-Achse für den Logarithmus).
// 
// Copyright, CC-BY-NC-SA, 2020, Mathias Moog, 
// mathias.moog@hs-ansbach.de, Hochschule Ansbach, Deutschland, 
//
// Dieses Produkt steht unter der Creative-Commons-Lizenz 
// Namensnennung - Nicht-kommerziell - 
// Weitergabe unter gleichen Bedingungen 4.0 International. 
// Um eine Kopie dieser Lizenz zu sehen, besuchen Sie
// http://creativecommons.org/licenses/by-nc-sa/4.0/

// Diverse Vorlagen laden
include <../MatheBegreifen.scad>

// Umriss der Schablone
module schablone2Dumriss() {
   // die exp Funktion von xmin bis xmax in 0.1 mm Schritten
   points = [ [s*xmin,s*ymax], [s*xmin,s*ymin],
     for(x=[xmin:.1:xmax]) [s*x,s*exp(x)],
     [s*xmax,s*ymax] ];
   // Die Schablone selbst
     polygon(points);
}

// Beschriftung und Durchbrüche im inneren
module schablone2Dinnen() {
     // Kerben auf der Linken Seite, 1 cm Abstand von der Ecke oben links
     for(y=[ymax-7:ymax-1]){
       p=[ [s*xmin,s*y-0.07*s], [s*xmin+.1*s,s*y], [s*xmin,s*y+0.07*s] ];
       polygon( p );
     }
     // Kerben oben, 1 cm Abstand von der Ecke oben links
     for(x=[xmin+1:xmax-1]) {
       p=[ [s*x-0.07*s,s*ymax], [s*x,s*ymax-.1*s], [s*x+0.05*s,s*ymax] ];
      polygon(p);
     }
     // Sichtfenster y-Achse
     translate( v=[0,2*s,0]) circle( r=.13*s );
     for(y=[1:6]) {
       polygon( [ [-0.07*s,s*y+.3*s], [0.07*s,s*y+.3*s], [0.07*s,s*y+.7*s], [-0.07*s,s*y+.7*s]]);
     }
     // Text ausschneiden
     fh=0.8*s; // Texthöhe
     translate([-1.5*s,6*s]){ text(text="e", font=f, size=fh ); }; // e^x basteln
     translate([-.8*s,6.5*s]){ text(text="x", font=f, size=fh*0.7 ); };
     translate([.5*s,5.5*s]){ rotate([180,0,90]){ // Spiegelverkehrt ln(x) schreiben
         text(text="ln(x)", font=f, size=fh*0.7 ); }; };
}

// Erstelle die Schablone in 2D als Ebene mit Löchern für 
// die Achsen, Kerben auf den Rändern zum Messen und den
// Beschriftung e^x und ln(x)
module schablone2D() {
  // Löcher in die Schablone  
   difference() {
     // Die Schablone selbst
     schablone2Dumriss();
     // Durchbrüche
     schablone2Dinnen();
   }
}


/* Extrudiere aus der schablone in 2D eine 2D Schablone mit abgescrägten 
   Kanten.
   Schön wäre es wenn linear_extrude auch eine offset Option hätte,
   die ist auch schon in Arbeit:
     https://github.com/openscad/openscad/pull/2079
   Bis die fertig ist erzeuge viele kleine Scheiben mit offset. Im 3D Druck
   kommt das aufs gleiche hinaus.
*/
module schablone3D() {
  h=0.05;
  for(z=[0:h:d-h]){
    translate( v=[0,0,z]) {    
      linear_extrude(height=h){
        de=-abs(z-0.5*d);
        //echo(de);
        offset(delta=de){  
          schablone2D();
        }
      }
    }
  }
}




