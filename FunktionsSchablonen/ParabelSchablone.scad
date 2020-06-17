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

// Die Parabel Vorlage laden
use <Parabel.scad>


// Skalierungen
s=10;                 // Längeneinheit der Schablone 1 cm, scad mm
d=1.2;                // Dicke der Schablone
xmax=3;
font="Allerta Stencil";

// Erstelle die Schablone in 2D als Ebene mit Löchern für 
// die Achsen, Kerben auf den Rändern zum Messen und den
// Beschriftung x^2 und sqrt(x)
module schablone2D(  ) {
   difference() {
     // Umiss
     parabelUmriss( xmax=xmax, s=s );
     // Fenster ausschneiden
     parabelFenster( xmax=xmax, s=s);
     // Text ausschneiden
     fh=s*.8; // Texthöhe
     // x^2 basteln
     translate([-s*1.5,s*7.0]){ text(text="x", font=font, size=fh ); }; 
     translate([-s*.8 ,s*7.5]){ text(text="2", font=font, size=fh*0.7 ); };
     // Spiegelverkehrt sqrt(x) schreiben
     translate([s*.5,s*5.2]){ rotate([180,0,90]){ 
         text(text="sqrt(x)", font=font, size=fh ); }; };
   } // Ende Difference   
}



/* Extrudiere aus der schablone in 2D eine 2D Schablone mit abgescrägten 
   Kanten.
*/
module schablone3D() {
  //schraegeKanten( d, 0.05) schablone2D( ); 
  linear_extrude( d ) schablone2D();
}

//----------------------------------------------------
// Schablone erzeugen, mit Prägung in der Oberfläche


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
  translate(v=[8,45,d/2]){
    rotate(90){
      linear_extrude(height=d){ 
        color("black"){text(text="© Moog",halign="right", font="Liberation Sans", size=5 );}
      }
    }
  }
}



