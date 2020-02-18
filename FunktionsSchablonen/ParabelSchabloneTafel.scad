// Tafel Schablone für die Parabel
//
// Ähnlich wie die kleine zum zeichnen auf Papier, hier jedoch nur
// ein 2D Modell für die Fräse.
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
include <Parabel.scad>


// Skalierungen
s=100;                // Längeneinheit der Schablone 1 dm, scad mm
d=1.5;                // Dicke der Schablone


//----------------------------------------------------
// 2D Schablone erzeugen


// Jetzt noch den vertieften Text in der Oberfläche
// Von oben mit d/2 in die Schablone versenken
difference() {
  // Schablone selbst
  color("red"){schablone2D( s, "Allerta Stencil" );}

  // Hochschul Logo platzieren
  translate(v=[-30,590,0]){
    rotate(90){
      scale(4){    
        hs_ansbach("Allerta Stencil");
      }
    }
  }
  // Mich selbst verewigen
  translate(v=[80,590,0]){
    rotate(90){
      color("black"){text(text="(C) Moog",halign="right", font="Allerta Stencil", size=40 );}
    }
  }
}

// Die Ecken der Quadrate im Logo verbinden.
// An dem Logo lässt sich die Schablone gut halten.
color("red") {
  translate(v=[-30,590,0]){
    rotate(90){
      scale(4){    
       hs_ansbach_fraese();
      }
    }
  }
}



