// 2D Schablone für die Parabel - Innen und außen eine Parabel
//
// Nutzbar zum "kontrollieren" der Rotationsparaboloide und des
// Sattels
// 
// Copyright, CC-BY-NC-SA, 2020, Mathias Moog, 
// mathias.moog@hs-ansbach.de, Hochschule Ansbach, Deutschland, 
//
// Dieses Produkt steht unter der Creative-Commons-Lizenz 
// Namensnennung - Nicht-kommerziell - 
// Weitergabe unter gleichen Bedingungen 4.0 International. 
// Um eine Kopie dieser Lizenz zu sehen, besuchen Sie
// http://creativecommons.org/licenses/by-nc-sa/4.0/

// Auf meinem Ender 3 pro mit "Dynamic Quality" gedruckt.

use <../MatheBegreifen.scad>
use <Parabel.scad>

// Voreinstellungen 
s=10;
xi=3;
xa=3.5;

module schablone2D() {
  difference() {
    translate([0,-s*xa*xa,0]) parabelUmriss(xa, s);
    translate([0,-s*xi*xi,0]) parabelUmriss(xi,s);
    // Abhängig von xi und xa ggf. die Lage und Größe der Schrift anpassen
    translate([5,-s*xi*xi-7,0]) rotate(180) import( "ParabelSqr.svg" );
  }
}

schraegeKanten(1.6,0.1) { schablone2D(); }