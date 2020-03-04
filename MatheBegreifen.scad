// Mathe begreifen - diverse häufig benötigte Funktionen
// 
// Copyright, CC-BY-NC-SA, 2020, Mathias Moog, 
// mathias.moog@hs-ansbach.de, Hochschule Ansbach, Deutschland, 
//
// Dieses Produkt steht unter der Creative-Commons-Lizenz 
// Namensnennung - Nicht-kommerziell - 
// Weitergabe unter gleichen Bedingungen 4.0 International. 
// Um eine Kopie dieser Lizenz zu sehen, besuchen Sie
// http://creativecommons.org/licenses/by-nc-sa/4.0/

/* Hochschul Logo der Hochschule Ansbach.
   Als Fläche, Text von x=0 nach links, rechts von x=0 die vier quadrate
   
   Die voreingestellte Schriftart "Liberation Sans" wird mit OpenSCAD geliefert.
   Zum Fräsen eignet sich besser ein Stencil Font.
   Ich verwende "Allerta Stencil": https://www.1001freefonts.com/allerta-stencil.font, OLF Lizenz
*/
module hs_ansbach(font="Liberation Sans") {
  a=6; // Kantenlänge Quadrate
  th=10; // Text Höhe
  tl=12; // Text Zeilenabstand
  color("black"){
  translate([0,tl]){ text(text="HOCHSCHULE",halign="right", font=font, size=th ); };
  translate([0,0] ){ text(text="ANSBACH",halign="right",font= font, size=th); };
  }
  // Renering Problem wenn size=a
  color("green"){
  translate( [-0.5*a,2*tl]) { square( size=a*.99 ); }
  }
  color("blue"){
  translate( [1.5*a,2*tl]) { square( size=a*.99 ); }
  translate( [0.5*a,2*tl+a]) { square( size=a*.99 ); }
  translate( [0.5*a,2*tl-a]) { square( size=a*.99 ); }
  }
}

// Verbinde die Quadrate für die Fräse
// Fräsbares Logo, dafür ist ein Stencil Font notwendig.
module hs_ansbach_fraese(font="Allerta Stencil") {    
 a=6; // Kantenlänge Quadrate
 tl=12; // Text Zeilenabstand
    
 difference(){
   // Das Logo
   hs_ansbach(font);
   // Quadrate miteinander verbinden 
   translate( [0.5*a,2*tl]) { rotate(45){square( size=a*.3, center=true );} }
   translate( [0.5*a,2*tl+a]) { rotate(45){square( size=a*.3, center=true );} }
   translate( [1.5*a,2*tl]) { rotate(45){square( size=a*.3, center=true );} }
   translate( [1.5*a,2*tl+a]) { rotate(45){square( size=a*.3, center=true );} }
  }
}



// Nur zum Probieren einkommentieren
//hs_ansbach();
//hs_ansbach( "Allerta Stencil" );
//hs_ansbach_fraese();
//include <test.scad>;
//test_formel(20);