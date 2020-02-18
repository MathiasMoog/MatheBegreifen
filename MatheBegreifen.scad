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
*/
module hs_ansbach() {
  a=6; // Kantenlänge Quadrate
  f="Liberation Sans"; // Font
  th=10; // Text Höhe
  tl=12; // Text Zeilenabstand
  color("black"){
  translate([0,tl]){ text(text="HOCHSCHULE",halign="right", font=f, size=th ); };
  translate([0,0] ){ text(text="ANSBACH",halign="right",font= f, size=th); };
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