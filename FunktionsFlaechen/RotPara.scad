// Rotations Paraboloid
// Grundform. Dieses Skript stellt nur das rot_para() Modul bereit.
// Es wird in den anderen RotPara* Skripten genutzt.
// 
// Copyright, CC-BY-NC-SA, 2020, Mathias Moog, 
// mathias.moog@hs-ansbach.de, Hochschule Ansbach, Deutschland, 
//
// Dieses Produkt steht unter der Creative-Commons-Lizenz 
// Namensnennung - Nicht-kommerziell - 
// Weitergabe unter gleichen Bedingungen 4.0 International. 
// Um eine Kopie dieser Lizenz zu sehen, besuchen Sie
// http://creativecommons.org/licenses/by-nc-sa/4.0/


// Einstellungen aus Octave
// todo, wie für Sattel* von Octave schreiben lassen und hier importieren
r=4;    // Radius in cm
d=0.2;  // Skalierungsfaktor für die Oberflächenpunkte
h=25;   // Höhe des Scheitelpunktes

// Erzeuge aus den Oberflächen RotPara?.dat einen Rotationsparaboloiden.
// Zentriert in x,y, beginnt mit z=0
module rot_para() {
  intersection() {    
    scale([d*10,d*10,10]) {
      translate([0,0,-(h-r*r)]){
        difference(){
          surface(file = "RotParaO.dat", center = true);
          surface(file = "RotParaU.dat", center = true);
        }
      }
    }
    cylinder(r=10*(r+2*d),h=10*r*r);
  }
}
