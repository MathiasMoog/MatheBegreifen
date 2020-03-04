// Tafel Schablone für die Parabel
//
// Ähnlich wie die kleine zum zeichnen auf Papier, hier jedoch nur
// ein 2D Modell für die Fräse.
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
include <Parabel.scad>


// Skalierungen
s=100;   // Längeneinheit der Schablone 1 dm, scad mm
fd = 0;  // Durchmesser des Fräsers, An Kante entlang fräsen


//----------------------------------------------------
// 2D Schablone erzeugen


// Jetzt noch den vertieften Text in der Oberfläche
// Von oben mit d/2 in die Schablone versenken
offset( r=fd/2, delta=fd/2 ) difference() {
  // Schablone selbst
  color("red"){schablone2D( s, "Allerta Stencil" );}

  // Hochschul Logo (fräsbar) platzieren
  translate(v=[-30*s/100,590*s/100,0]) rotate(90) scale(4*s/100){    
    hs_ansbach_fraese("Allerta Stencil");
  }
  // Mich selbst verewigen
  translate(v=[80*s/100,590*s/100,0]) rotate(90) color("black"){
    text(text="(C) Moog",halign="right", font="Allerta Stencil", size=40*s/100 );}
}


