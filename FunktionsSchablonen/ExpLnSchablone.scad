// Schablone für die Exponential und Logarithmus Funktion
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


// Skalierungen
s=10;               // Längeneinheit der Schablone 1 cm, scad mm
xmin=-2;            // x (y=exp(x)) Intervall in cm
xmax=2;
ymin=exp(xmin);     // y (y=exp(x)) Intervall in cm
ymax=exp(xmax);
d=1.5;              // Dicke der Schablone
f="Liberation Sans"; // Font

// Erstelle die Schablone in 2D als Ebene mit Löchern für 
// die Achsen, Kerben auf den Rändern zum Messen und den
// Beschriftung e^x und ln(x)
module schablone2D() {
   // die exp Funktion von xmin bis xmax in 0.1 mm Schritten
   points = [ [s*xmin,s*ymax], [s*xmin,s*ymin],
     for(x=[xmin:.1:xmax]) [s*x,s*exp(x)],
     [s*xmax,s*ymax] ];
   // Löcher in die Schablone  
   difference() {
     // Die Schablone selbst
     polygon(points);
     // Kerben auf der Linken Seite, 1 cm Abstand von der Ecke oben links
     for(y=[ymax-7:ymax-1]){
       p=[ [s*xmin,s*y-0.7], [s*xmin+1,s*y], [s*xmin,s*y+0.7] ];
       polygon( p );
     }
     // Kerben oben, 1 cm Abstand von der Ecke oben links
     for(x=[xmin+1:xmax-1]) {
       p=[ [s*x-0.7,s*ymax], [s*x,s*ymax-1], [s*x+0.5,s*ymax] ];
      polygon(p);
     }
     // Sichtfenster y-Achse
     translate( v=[0,20,0]) circle( r=1.3 );
     for(y=[1:6]) {
       polygon( [ [-0.7,s*y+3], [0.7,s*y+3], [0.7,s*y+7], [-0.7,s*y+7]]);
     }
     // Text ausschneiden
     fh=8; // Texthöhe
     translate([-15,60]){ text(text="e", font=f, size=fh ); }; // e^x basteln
     translate([-8,65]){ text(text="x", font=f, size=fh*0.7 ); };
     translate([5,55]){ rotate([180,0,90]){ // Spiegelverkehrt ln(x) schreiben
         text(text="ln(x)", font=f, size=fh*0.7 ); }; };
   } // Ende Difference
   // Das "e" reparieren, todo Font zum Fräsen suchen
   translate([-13.5,62]){ square([1,2]);}
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

//----------------------------------------------------
// Schablone erzeugen


// Jetzt noch den vertieften Text in der Oberfläche
// Von oben mit d/2 in die Schablone versenken
difference() {
  // Schablone selbst
  color("red"){schablone3D();}

  // Hochschul Logo platzieren
  translate(v=[-3,50,d/2]){
    rotate(90){
      linear_extrude(height=d){ 
        scale(0.4){    
          hs_ansbach();
        }
      }
    }
  }
  // Mich selbst verewigen
  translate(v=[8,50,d/2]){
    rotate(90){
      linear_extrude(height=d){ 
        color("black"){text(text="© Moog",halign="right", font=f, size=4 );}
      }
    }
  }
}


