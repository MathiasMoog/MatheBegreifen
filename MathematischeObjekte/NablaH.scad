// Schablone für den Gradienten Nabla h
//
// Zum Erklären des Gradienten. Ein umgedrehter Stuhl oder eine Rucksack. Pfeil anlegen. Gradient zeigt in die Richtung des steilsten Anstiegs.
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
d=1.2;                // Dicke der Schablone in mm
font="Allerta Stencil";

// Erstelle die Schablone in 2D als Ebene 
module schablone2D(  ) {
   difference() {
     // Der Pfeil, von Hand gestaltet
     polygon([[-24,0],[-24,16],[-8,16],[-8,100],[-32,100],[0,150],[32,100],[8,100],[8,16],[24,16],[24,0]]);
     // Hochschul Logo platzieren
     translate([7,70]) rotate(90) scale(0.4) hs_ansbach_fraese();
     // Mein Copyright als Stencil.
     translate([15,5]) color("black"){
         text(text="(C) Moog",halign="right", font=font, size=5 );
      }
     // nabla h in oberes Dreieck, kein Stencil, im Stencil Font ist der Nabla Operator nicht dabei. Einfach ein komplett ausgefrästes dreieck.
     translate([15,110]) text(text="▼h",halign="right", font="Liberation Sans", size=15 );
   } // Ende Difference   
}

/* Extrudiere aus der schablone in 2D eine 2D Schablone mit abgescrägten 
   Kanten.
*/
schraegeKanten( d, 0.05) schablone2D( ); 


