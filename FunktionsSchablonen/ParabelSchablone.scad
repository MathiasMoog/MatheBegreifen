// Schablone für die Parabel
//
// Parabel Schablonen gibt es schon lange zu kaufen. Diese Schablone
// kann jedoch selbst gedruckt werden. 
// Im Faktor 10 vergrößert eignet sie sich auch für Vorführungen an 
// der Tafel.
// Die Oberseite ist mit x^2, die unter mit sqrt(x) beschriftet. Die
// Orientierung des Textes zeigt an wie die Schablone angelegt werden 
// muss.
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
s=10;                 // Längeneinheit der Schablone 1 cm, scad mm
xmin=-3;              // x (y=x*x) Intervall in cm
xmax=3;
ymin=pow(xmin,2);     // y (y=x*x) Intervall in cm
ymax=pow(xmax,2);
d=1.5;                // Dicke der Schablone
f="Liberation Sans";  // Font

// Erstelle die Schablone in 2D als Ebene mit Löchern für 
// die Achsen, Kerben auf den Rändern zum Messen und den
// Beschriftung x^2 und sqrt(x)
module schablone2D() {
   // die quadrat Funktion von xmin bis xmax in 0.1 mm Schritten
   points = [ 
     for(x=[xmin:.1:xmax]) [s*x,s*pow(x,2)],
     [s*xmax,s*ymax] ];
   // Löcher in die Schablone  
   difference() {
     // Die Schablone selbst
     polygon(points);
     // Sichtfenster y-Achse
     for(y=[1:8]) {
       polygon( [ [-0.7,s*y+3], [0.7,s*y+3], [0.7,s*y+7], [-0.7,s*y+7]]);
     }
     // Text ausschneiden
     fh=8; // Texthöhe
     // x^2 basteln
     translate([-15,70]){ text(text="x", font=f, size=fh ); }; 
     translate([-8,75]){ text(text="2", font=f, size=fh*0.7 ); };
     // Spiegelverkehrt sqrt(x) schreiben
     translate([5,65]){ rotate([180,0,90]){ 
         text(text="sqrt(x)", font=f, size=fh*0.7 ); }; };
   } // Ende Difference
   // Das "e" reparieren, todo Font zum Fräsen suchen
   translate([-13.5,72]){ square([1,2]);}
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
  translate(v=[-3,59,d/2]){
    rotate(90){
      linear_extrude(height=d){ 
        scale(0.4){    
          hs_ansbach();
        }
      }
    }
  }
  // Mich selbst verewigen
  translate(v=[8,59,d/2]){
    rotate(90){
      linear_extrude(height=d){ 
        color("black"){text(text="© Moog",halign="right", font=f, size=4 );}
      }
    }
  }
}


