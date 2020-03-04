// Abrollkurve
// Es werden zwei dieser Zahnräder benötigt.
// Die aufgedruckte Formel der Kardioide stimmt nur wenn der Stift genau auf
// Der Außenkante ansetzt und sich zwei Kreise mit Radius 1 abrollen.
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
h=3;        // Höhe des Randes
f="Liberation Sans"; // Standard Schrift, auch nach Druck gut lesbar

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
    // Abzüglich einer Reihe Löcher vom Zentrum nach links
  for( x=[0:10:ri-0.5] ) loch(-x);
  // Abzüglich eines Lochs ganz rechts am Rand
  loch(ri-2);
  
  // Abzüglich der Formel
  // Die Grafik wird mit dem Abrollkruve.scad Octave Skript erzeugt
  translate(v=[-ri+5,5,h-0.3]) scale(0.1) { 
   // Dafür muss die unterkante des PNG weg .. 
   translate([0,0,98]) intersection(){
     surface(file = "AbrollkurveF.png" , invert = true);
     translate([0,0,-98]){cube([1000,200,100]);}
   }
  }
 
  // Das Logo der Hochschule und eine Beschriftung
  // Achtung, nach Ändern der Skalierung die Größen der Schriften anpassen.
  translate([0,0,h-0.3]) linear_extrude(height=h){
   translate([-ri/2,ri/2,0]) text(text="Abrollkurve", font=f, size=6);
   translate(v=[ri/2,-ri/2,0]) scale(0.5) hs_ansbach(f);
   translate([-ri/2,-ri/2-10,0]) text(text="© Moog", font=f, size=6 ); 
  }
}
