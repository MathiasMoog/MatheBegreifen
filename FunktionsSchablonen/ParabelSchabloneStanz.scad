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
xmax=3;               // Maximaler x Wert
s=10;                 // Längeneinheit der Schablone 1 cm, scad mm
d=1.2;                // Dicke der Schablone in mm
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
    // x^2 und Wurzel Formel
    parabelFormel( xmax=xmax*0.97, s=s);
     // Hochschul Logo platzieren
     translate([-3,60]) rotate(90) scale(0.4) hs_ansbach_fraese();
     // Mich selbst verewigen
     translate([10,60]) rotate(90) color("black"){
         text(text="(C) Moog",halign="right", font=font, size=6 );
      }
   } // Ende Difference   
}

/* Extrudiere aus der schablone in 2D eine 2D Schablone mit abgescrägten 
   Kanten.
*/
schraegeKanten( d, 0.05) schablone2D( ); 


