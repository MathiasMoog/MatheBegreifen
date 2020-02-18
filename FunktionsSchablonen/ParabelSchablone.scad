// Schablone für die Parabel
//
// Parabel Schablonen gibt es schon lange zu kaufen. Diese Schablone
// kann jedoch selbst gedruckt werden. 
// Im Faktor 10 vergrößert eignet sie sich auch für Vorführungen an 
// der Tafel.
// Die Oberseite ist mit x^2, die unter mit sqrt(x) beschriftet. Die
// Orientierung des Textes zeigt an wie die Schablone angelegt werden 
// muss.
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
s=10;                 // Längeneinheit der Schablone 1 cm, scad mm
d=1.5;                // Dicke der Schablone


/* Extrudiere aus der schablone in 2D eine 2D Schablone mit abgescrägten 
   Kanten.
   Schön wäre es wenn linear_extrude auch eine offset Option hätte,
   die ist auch schon in Arbeit:
     https://github.com/openscad/openscad/pull/2079
   Bis die fertig ist erzeuge viele kleine Scheiben mit offset. Im 3D Druck
   kommt das aufs gleiche hinaus.
*/
module schablone3D() {
  h=0.05;
  for(z=[0:h:d-h]){
    translate( v=[0,0,z]) {    
      linear_extrude(height=h){
        de=-abs(z-0.5*d);
        //echo(de);
        offset(delta=de){  
          schablone2D( s, font="Allerta Stencil" );
        }
      }
    }
  }
}

//----------------------------------------------------
// Schablone erzeugen


// Jetzt noch den vertieften Text in der Oberfläche
// Von oben mit d/2 in die Schablone versenken
difference() {
  // Schablone selbst
  color("red"){schablone3D();}

  // Hochschul Logo platzieren
  translate(v=[-3,59,d/2]){
    rotate(90){
      linear_extrude(height=d){ 
        scale(0.4){    
          hs_ansbach();
        }
      }
    }
  }
  // Mich selbst verewigen
  translate(v=[8,59,d/2]){
    rotate(90){
      linear_extrude(height=d){ 
        color("black"){text(text="© Moog",halign="right", font=f, size=4 );}
      }
    }
  }
}



