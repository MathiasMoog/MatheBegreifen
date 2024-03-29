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
f="Allerta Stencil"; // Stencil Font, sonst Problem mit dem e

$fn=30;

// Die benötigten Basis Module nachladen
include <ExpLnSchabloneModule.scad>

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
        // Hier kein Stencil Font, Allerta Stencil hat kein Copyright Zeichen
        color("black"){text(text="© Moog",halign="right", font="Liberation Sans", size=4 );}
      }
    }
  }
}
