// Abrollkurve
// Es werden zwei dieser Zahnräder benötigt.
// Die aufgedruckte Formel der Kardioide stimmt nur wenn der Stift genau auf
// Der Außenkante ansetzt und sich zwei Kreise mit Radius 1 abrollen.
//
// Es gibt noch eine Variante ohne Rand, dort überall gleiche Dicke, 
// versunkene Schrift. Hier dünner Boden mit durchgehender Schrift.
// 
// Copyright, CC-BY-NC-SA, 2020, Mathias Moog, 
// mathias.moog@hs-ansbach.de, Hochschule Ansbach, Deutschland, 
//
// Dieses Produkt steht unter der Creative-Commons-Lizenz 
// Namensnennung - Nicht-kommerziell - 
// Weitergabe unter gleichen Bedingungen 4.0 International. 
// Um eine Kopie dieser Lizenz zu sehen, besuchen Sie
// http://creativecommons.org/licenses/by-nc-sa/4.0/

// Achtung: Zuerst die Formel mit Octave erzeugen
// oder das Laden der AbrollkurveF.png Datei auskommentieren

// Druck auf Creality Ender 3, Dynamic Quality

// Diverse Vorlagen laden
include <../MatheBegreifen.scad>

ra=40;      // Äußerer Radius
ri=38;      // Innerer Radius
w=3;        // Winkel für einen halben Zahn
h=3.5;      // Höhe des Randes
b=1.0;      // Dicke des Bodens
f="Allerta Stencil"; // Stencil Font, sonst Problem mit dem e

// Ein Loch für den Bleistift, leicht konisch
// x - x Position
module loch( x ) {
  translate([x,0,0]) cylinder( h=h, r1=1.2, r2=2 );
}    

difference(){
  // Erzeuge ein einfaches Zahnrad
  linear_extrude(height=h) union() {
    for(x=[0:2*w:356]) {
      p=[ [0,0], [ri*cos(x-w),ri*sin(x-w)], [ra*cos(x),ra*sin(x)], [ri*cos(x+w),ri*sin(x+w)] ];
      polygon(p);
    }
  }
  // Lasse in der Mitte nur den Boden übrig
  translate([0,0,b]) cylinder(h=h,r=ri-3);
  // Abzüglich einer Reihe Löcher vom Zentrum nach links
  for( x=[0:10:ri-0.5] ) loch(-x);
  // Abzüglich eines Lochs ganz rechts am Rand
  loch(ri-2);
  
  // Hier keine Formel, die Latex Formel ist nicht fräsbar
 
  // Das Logo der Hochschule und die Beschriftung abziehen
  // Achtung, nach Ändern der Skalierung die Größen der Schriften anpassen.
  linear_extrude(height=h){
   translate([0,16,0]) text(text="(C) Moog", font=f, size=8, halign="center" ); 
   translate([0,5,0]) text(text="Abrollkurve", font=f, size=8, halign="center");
   translate([0,-13,0]) text( text="Hochschule", font=f, size=8, halign="center");
   translate([0,-24,0]) text( text="Ansbach", font=f, size=8, halign="center");
  }
}
