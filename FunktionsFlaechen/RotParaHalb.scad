// Liegender halber Rotations Paraboloid.
// Für den 3D Druck. Die Obere Fläche entspricht einem Paraboloiden.
// Zwei dieser halben können aneinander gesteckt werden.
// 
// Copyright, CC-BY-NC-SA, 2020, Mathias Moog, 
// mathias.moog@hs-ansbach.de, Hochschule Ansbach, Deutschland, 
//
// Dieses Produkt steht unter der Creative-Commons-Lizenz 
// Namensnennung - Nicht-kommerziell - 
// Weitergabe unter gleichen Bedingungen 4.0 International. 
// Um eine Kopie dieser Lizenz zu sehen, besuchen Sie
// http://creativecommons.org/licenses/by-nc-sa/4.0/

// Lade die Grundform
include<RotPara.scad>;

/* Zwei Hälften können mit den Nasen - und den Nasenlöchern - 
   aneinander gesteckt werden.
*/
nase_r=1;   // Radius der Nase
nase_l=3;   // Länge der Nase

$fn=40;     // Damit es hübscher wird. 

/* Schneide den Rotationsparaboliden in der Mitte durch und lege ihn
   um. Schneide anschließend die Nasenlöcher aus
 */
module halber()  {
  difference() {
    // Halbiere Rotationsparboloid und lege um
    rotate([90,0,0]){
      intersection() {
        rot_para();
        translate([-10*(r+d),0,0]){
          cube([20*(r+d),20*(r+d),10*(r+d)*(r+d)]);
        }
      }
    }
    // Nasenlöcher, x>0
    for(y=[4,10]){
      translate([10*sqrt(r*r-y)-1.6*nase_r,-10*y,-nase_l/2]){ 
        cylinder(r=nase_r*1.2,h=nase_l*1.6);
      }
    }
  }

  // Nasen, x<0
  for(y=[4,10]){
    translate([-10*sqrt(r*r-y)+1.6*nase_r,-10*y,-nase_l]){ 
      cylinder(r=nase_r,h=nase_l);
    }
  }
} // Ende halber()

// Es wird einer Original und einer gespiegelt benötigt.
//halber();
mirror([1,0,0]) halber(); // An der y-z-Ebene gespiegelt
 