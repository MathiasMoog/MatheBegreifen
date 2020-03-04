// Tafel Schablone für die Parabel - Löcher im Inneren
//
// Ähnlich wie die kleine zum zeichnen auf Papier, hier jedoch nur
// ein 2D Modell für die Fräse.
// Hier werden nur die Innenkonturen erstellt. 
// Als svg exportieren und in Easel mit "Clear out a pocket" verarbeiten
// 
// Copyright, CC-BY-NC-SA, 2020, Mathias Moog, 
// mathias.moog@hs-ansbach.de, Hochschule Ansbach, Deutschland, 
//
// Dieses Produkt steht unter der Creative-Commons-Lizenz 
// Namensnennung - Nicht-kommerziell - 
// Weitergabe unter gleichen Bedingungen 4.0 International. 
// Um eine Kopie dieser Lizenz zu sehen, besuchen Sie
// http://creativecommons.org/licenses/by-nc-sa/4.0/

// Diverse Vorlagen laden
include <../MatheBegreifen.scad>

// Die Parabel Vorlage laden
use <Parabel.scad>

// Skalierungen
s=100;   // Längeneinheit der Schablone 1 dm, scad mm
xmax=2.5;
font = "Allerta Stencil";

// Zum probieren die difference Zeile und die letzte schliepende Klammer
// einkommentieren
//difference() { parabelUmriss( xmax=xmax, s=s );

// Fenster und Formel aussparen
color("black") {
  parabelFenster( xmax=xmax, s=s);
  parabelFormel( xmax=xmax, s=s);
}

// Hochschul Logo (fräsbar) platzieren
translate([-30*s/100,450*s/100]) rotate(90) scale(3.2 *s/100){    
    hs_ansbach_fraese(font);
}
// Mich selbst verewigen
translate([70*s/100,450*s/100]) rotate(90) color("black"){
    text(text="(C) Moog",halign="right", font=font, size=42*s/100 );
}
// Schluss von difference zum probieren ..
//}

// Damit Easel die Innen und Außenteile übereinander legt
// Ein kleines Rechteck unten Links
translate([-s*xmax,0]) square(10);
