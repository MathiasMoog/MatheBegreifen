// Abrollkurve
// Es werden zwei dieser Zahnräder benötigt.
// Die aufgedruckte Formel der Kardioide stimmt nur wenn der Stift genau auf
// Der Außenkante ansetzt und sich zwei Kreise abrollen.
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

// Diverse Vorlagen laden
include <../MatheBegreifen.scad>

ra=40;
ri=37;
w=4;
h=3;

difference(){
  // Erzeuge ein einfaches Zahnrad
  linear_extrude(height=h) union() {
    for(x=[0:2*w:356]) {
      p=[ [0,0], [ri*cos(x),ri*sin(x)], [ra*cos(x+w),ra*sin(x+w)], [ri*cos(x+2*w),ri*sin(x+2*w)] ];
      polygon(p);
    }
  }
  // Abzüglich eines Lochs
  translate([0,ri-6,0]) cylinder(h=h,r1=h,r2=2*h);
  
  // Abzüglich der Formel
  // Die Grafik wird mit dem Abrollkruve.scad Octave Skript erzeugt
  translate(v=[-ri+5,5,h-1]) scale(0.1) { 
   // Dafür muss die unterkante des PNG weg .. 
   translate([0,0,98]) intersection(){
     surface(file = "AbrollkurveF.png" , invert = true);
     translate([0,0,-98]){cube([1000,200,100]);}
   }
  }
 
  // Das Logo der Hochschule und eine Beschriftung
  // Achtung, nach Ändern der Skalierung die Größen der Schriften anpassen.
  translate([0,0,h-1]) linear_extrude(height=h){
   translate([-ri/2,ri/2,0]) text(text="Abrollkurve", font="Liberation Sans", size=6);
   translate(v=[ri/2,-ri/2,0]) scale(0.5) hs_ansbach();
   translate([-ri/2,-ri/2-10,0]) text(text="© Moog", font="Liberation Sans", size=6 ); 
  }
}