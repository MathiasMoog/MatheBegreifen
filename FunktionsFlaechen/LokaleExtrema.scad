// Lokale Extrema
// Beispiel einer Funktion mit mehreren lokalen Extrema
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
// LokaleExtrema.m erzeugen LokaleExtrema?.dat

// Diverse Vorlagen laden
include <../MatheBegreifen.scad>


// Einstellung, mit Octave Abgleichen
include <LokaleExtremaS.dat>
// Skalierung
sxy = 15; // Längeneinheit in x,y Richtung 
sz  = 5;  // Längeneinheit in z Richtung 
h   = 2;  // Tiefe des Reliefs der Beschriftung

difference() {
  // Die Fläche  
  scale([sxy*d,sxy*d,sz]) {
    surface(file = "LokaleExtremaO.dat", center = true);
  }
  // An den Rand ...
  // Das Logo der Hochschule und meinen Namen
  // Achtung, nach Ändern der Skalierung die Größen der Schriften anpassen.
  translate(v=[0,-r*sxy,5]){
    scale(0.5) { rotate([90,0,0]){ linear_extrude(height=h){
        hs_ansbach();
        translate([60,0,0]) { text(text="© Moog", font="Liberation Sans" ); }
    } } }
  }
  // Jetzt noch die Beschriftung der Funktion abziehen
  // Hm, der Text ist zu filigran für den 3D Drucker
  // Und das rendern dauert ewig
  //translate(v=[r*sxy-h,-r*sxy+5,5]) rotate([90,0,90]){
  // linear_extrude( height=h+1 ) scale(0.22) import("LokaleExtremaF.svg");
  //} 
}

