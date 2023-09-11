// Viertel Rotations Paraboloid - Lagrange
// Erstelle Volumenmodell eines viertel Roationsparaboloid bestehend aus drei Teilen. 
// 
// In der Mitte eine Scheibe entsprechend der Einschränkung in Lagrange
//
// Beispiel für lokale Optima mit Lagrange
//  f(x,y) =  x^2 + y^2 
// Nebenbedinung
//  g(x,y) = x + y
//  g(x,y) = 1
//
//
// Zuerst muss das Octave Skript RotParaVol.m laufen und die
// RotParaVol.dat Datei (Höheninformationen) erstellen.
//
// Copyright, CC-BY-NC-SA, 2023, Mathias Moog, 
// mathias.moog@hs-ansbach.de, Hochschule Ansbach, Deutschland, 
//
// Dieses Produkt steht unter der Creative-Commons-Lizenz 
// Namensnennung - Nicht-kommerziell - 
// Weitergabe unter gleichen Bedingungen 4.0 International. 
// Um eine Kopie dieser Lizenz zu sehen, besuchen Sie
// http://creativecommons.org/licenses/by-nc-sa/4.0/

// Skalierungsfaktor
// e/(n-1) entspricht der Einheit 1 cm (e=10 mm)
e = 50;
s = e/40;
l = 10; // Laenge Verbindungsstreben

h=2;      // (half) depth of the inscription
E=2*e;

// Diverse Vorlagen laden
include <../MatheBegreifen.scad>


// inscription of height h 
module mtext( t ) {
  linear_extrude(height=h) text( t );
}  


module para() {
rotate([0,0,-45]) difference() {
  // Erzeuge aus den Oberflächen RotParaVol.dat 
  scale([s,s,e]) surface(file = "RotParaVol.dat", center = false);
  // Schneide unten 
  translate([-1,-1,-E-.5]) cube([E,E,E]);
  // inscription on the sides
  translate([e/2-h,h/2,5]) rotate([90,0,0]) mtext("\u2192 x ");
  translate([h/2,e,5]) rotate([90,0,-90]) mtext(" y \u2190");
  // Objective function and constraint on rear side
  translate([e-h/2,3,25]) rotate([90,0,90])   linear_extrude(h) scale(0.5) import("RotParaLagrangeF.svg");
  translate([e-h/2,3,10]) rotate([90,0,90]) linear_extrude(h) scale(0.5) import("RotParaLagrangeG.svg");
  // Hochschule
  translate(v=[9,e-h/2,5]) rotate([90,0,180]) linear_extrude(height=h){
        scale(0.4) hs_ansbach();
        scale(0.6) translate([-e,30,0]) { text(text="© Moog", font="Liberation Sans" ); }
    } 
  }
}

// Verbindungsstreben
// f = 0 für Strebe, f= 0.1 ... 0.2 für Löcher als zusätzlicher Platz.
module halterung(f) {
  translate([e/sqrt(2)-h,e/3-f,e/3-f]) cube([l+3*f,l/2+2*f,l/2+2*f]);
  translate([e/sqrt(2)-h,-e/3-f,e/3-f]) cube([l+3*f,l/2+2*f,l/2+2*f]);
}

// Hinterer Teil
module hinten() {
difference() {
  para();
  translate([-E+e/sqrt(2)+h/2,-e,-e]) cube([E,E,4*E]);
  halterung(0.25);
}
}

// Vorderer Teil
module vorne() {
difference() {
  para();
  translate([e/sqrt(2)-h/2,-e,-e]) cube([E,E,4*E]);
}
halterung(0);
}

module mitte() {
  difference() {
  para();
  translate([-E+e/sqrt(2)-h/2,-e,-e]) cube([E,E,4*E]);
  translate([e/sqrt(2)+h/2,-e,-e]) cube([E,E,4*E]);
  halterung(0.25);
}
}

// Einen der drei Teile einkommentieren
//vorne();
//mitte();
hinten();
