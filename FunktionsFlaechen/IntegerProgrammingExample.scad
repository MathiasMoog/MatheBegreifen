/* Veranschaulichung des Vorlesungsbeispiels
   Quelle: Wikipedia
   
   Zur Visualisierung die "color" Zeilen alle einkommentieren. Nur Vorschau (F5) mit Farbe.
   
   Zur Erzeugung der einzelenn STL Dateien jweils nur eine Farbe einkommentieren. 
   
   Copyright, 2026, Mathias Moog, Hochschule Ansbach, Deutschland, CC-BY-NC-SA
 */
 
// Skalierung
S = 40;

d =0.01;  // Dimension of the spheres arround the points
$fn=3;    // low resultion of the spheres


// Punkte, beachte z=y
// Sortierung x dann y
P = [ [0,0], [0,1], 
      [1,0], [1,2],
      [1.8,2.8],
      [2,0], [2,2], [2,8/3],
      [2.4,2.4],
      [8/3,2],
      [4,0] ];
 
// create a small sphere arround the point p
module point( p ) {
  translate(S*p) sphere(d=d);
}


// Schneide in x und y Richtung
module cut(u=[0,0],o=[4,4]) {
  hull() {  
    for (p=P) 
      if (p[0]>=u[0] && p[1]>=u[1] && 
          p[0]<=o[0] && p[1]<=o[1]) {
           echo( p );
           point( [p[0],p[1],0] );
           point( [p[0],p[1],p[1]] ); 
          }
      }  
}

// Alles
//cut();

// x<=1
color("yellow") cut( u=[0,0], o=[1,4]);
// 1<=x<=2, y<=2
color("green") cut( u=[1,0], o=[2,2]);
// 1<=x<=2, y>=2
color("blue") cut( u=[1,2], o=[2,4]);
// x>=2, y<=2
color("orange") cut( u=[2,0], o=[4,2]);
// x>=2, y>=2
color("red") cut( u=[2,2], o=[4,4]);

    