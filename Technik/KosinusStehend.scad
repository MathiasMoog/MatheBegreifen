// Kosinus Kurve - stehend
//
// Mit der Rolle kann der Kosinus "abgerollt" werden. Die Rolle bleibt
// im Minimum liegen.
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


s = 10;
xmin = 0;
xmax = 2*PI;
d=1.5;
font="Liberation Sans";

// Die Fläche für den Cosinus
module cos_flaeche() {
  points = [ [s*xmin,0], 
    for(x=[xmin:.1:xmax]) [s*x,s*(2+cos(x*180/PI))],
    [s*xmax,0]  ];
  rotate( [90,0,0] ) translate([0,0,-d/2]) linear_extrude( d ) {  
    polygon( points );
  }
}

// Die Füße
module fuesse() {
  b=5;
  l=20;
  h=2*d;
  for (x=[PI/4,7*PI/4]){
    translate([s*x-b/2,-l/2,0]) cube( [b,l,h] );
  }
}

// Die Beschriftung 
module beschriftung() {
  // Richtung - y
  rotate([90,0,0] ) translate([0,0,d/3]) linear_extrude( d ){
    // Hochschul Logo
    translate([50,d,0]) scale(0.3) hs_ansbach(font);
    // Die Funktion
    translate([d,10,0]) text( text="cos(x)", font=font, size=5);
  }
  // Rückseite
  mirror([1,0,0]) 
  rotate([90,0,0] ) translate([-s*xmax,0,-4*d/3]) linear_extrude( d ){
    // Die Funktion
    translate([d,10,0]) text( text="cos(x)", font=font, size=5);
    // Mein Name
    translate([20,2*d,0]) text(text="© Moog", font=font, size=5);
  }  
}

difference() {  
  union() { cos_flaeche(); fuesse(); }
  beschriftung();
}