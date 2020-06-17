// Rolle für die Kosinus Schablone
// Die Rolle rollt den Kosinus hinunter.
// 
// Copyright, CC-BY-NC-SA, 2020, Mathias Moog, 
// mathias.moog@hs-ansbach.de, Hochschule Ansbach, Deutschland, 
//
// Dieses Produkt steht unter der Creative-Commons-Lizenz 
// Namensnennung - Nicht-kommerziell - 
// Weitergabe unter gleichen Bedingungen 4.0 International. 
// Um eine Kopie dieser Lizenz zu sehen, besuchen Sie
// http://creativecommons.org/licenses/by-nc-sa/4.0/

// Etwas feiner als normal
$fs=0.1;
$fa=0.1;

// Voreinstellungen
R=5;
r=2;
d=2.2;

// unterer Zylinder
cylinder(h=d,r=R,center=true);
// Achse
translate([0,0,d])cylinder(h=3*d,r=r,center=true);
// oberer Zylinder
translate([0,0,2*d]) cylinder(h=d,r=R,center=true);