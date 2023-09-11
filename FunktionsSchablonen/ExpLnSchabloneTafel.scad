// Schablone für die Exponential und Logarithmus Funktion
//
// Große Schablone zum Fräsen für die Tafel
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

// Skalierungen
s=100;               // Längeneinheit der Schablone 1 cm, scad mm
xmin=-2;            // x (y=exp(x)) Intervall in cm
xmax=2;
ymin=exp(xmin);     // y (y=exp(x)) Intervall in cm
ymax=exp(xmax);
d=1.5;              // Dicke der Schablone
f="Allerta Stencil"; // Stencil Font, sonst Problem mit dem e

// Die benötigten Basis Module nachladen
include <ExpLnSchabloneModule.scad>

// Schrift komplett durchfräsen
module innen() {
  schablone2Dinnen();
  // Hochschul Logo platzieren
  translate(v=[-.3*s,5*s]){
    rotate(90){
      scale(0.04*s){    
          hs_ansbach_fraese(f);
        }
      }
  }
  // Mich selbst verewigen
  translate(v=[.8*s,5*s]){
    rotate(90){
        color("black"){text(text="(c) Moog",halign="right", font=f, size=.4*s );}
      }
  }
}

//----------------------------------------------------
/* Schablone erzeugen
   Eine der beiden (Außen oder innen) einkommentieren,
   erzeugen lassen, als svg speichern. 
*/


// Markierung damit die Exporte für Innen und Außen
// sich genau übereinander platzieren lassen
translate([s*xmin,0]) square(5);

// Außenkontur
schablone2Dumriss();
// Durchbrüche im inneren
//innen();