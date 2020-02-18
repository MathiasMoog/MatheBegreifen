// Sattelpunkt als 3D Objekt, Funktionn f(x,y)=-x^2+y^2
// 
// Copyright, CC-BY-NC-SA, 2020, Mathias Moog, 
// mathias.moog@hs-ansbach.de, Hochschule Ansbach, Deutschland, 
//
// Dieses Produkt steht unter der Creative-Commons-Lizenz 
// Namensnennung - Nicht-kommerziell - 
// Weitergabe unter gleichen Bedingungen 4.0 International. 
// Um eine Kopie dieser Lizenz zu sehen, besuchen Sie
// http://creativecommons.org/licenses/by-nc-sa/4.0/

// Achtung: Zuerst die Oberflächen mit Octave erzeugen
/// Sattel.m erzeugen Sattel?.dat

// Einstellung, mit Octave Abgleichen
include <SattelS.dat>
// Skalierung
s = 10;

intersection() {    
  scale([s*d,s*d,s]) {
    translate([0,0,-zmin]){
      difference(){
        surface(file = "SattelO.dat", center = true);
        surface(file = "SattelU.dat", center = true);
      }
    }
  }
  cylinder(r=s*(r+d),h=s*(zmax-zmin));
}

