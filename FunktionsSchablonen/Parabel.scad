// 2D Schablone für die Parabel
//
// Hier sind die Grundeinstellungen und die 2D Vorlage zu finden.
// Dieser Code wird für die "normale" Schablone und für große
// Schablone zum zeichnen an der Tafel verwendet.
// 
// Copyright, CC-BY-NC-SA, 2020, Mathias Moog, 
// mathias.moog@hs-ansbach.de, Hochschule Ansbach, Deutschland, 
//
// Dieses Produkt steht unter der Creative-Commons-Lizenz 
// Namensnennung - Nicht-kommerziell - 
// Weitergabe unter gleichen Bedingungen 4.0 International. 
// Um eine Kopie dieser Lizenz zu sehen, besuchen Sie
// http://creativecommons.org/licenses/by-nc-sa/4.0/


// Grundeinstellungen
xmin=-3;              // x (y=x*x) Intervall in cm
xmax=3;
ymin=pow(xmin,2);     // y (y=x*x) Intervall in cm
ymax=pow(xmax,2);

// Erstelle die Schablone in 2D als Ebene mit Löchern für 
// die Achsen, Kerben auf den Rändern zum Messen und den
// Beschriftung x^2 und sqrt(x)
// Parameter: Skalierung s, s=10 für Einheit 1cm (Papier) , s=100 für Einheit 1dm (Tafel)
module schablone2D( s=1, font="Liberation Sans" ) {
   // die quadrat Funktion von xmin bis xmax in 0.1 mm Schritten
   points = [ 
     for(x=[xmin:.1:xmax]) [s*x,s*pow(x,2)],
     [s*xmax,s*ymax] ];
   // Löcher in die Schablone  
   difference() {
     // Die Schablone selbst
     polygon(points);
     // Sichtfenster y-Achse
	 b=0.08;
     for(y=[1:8]) {
       polygon( [ [-s*b,s*(y+.3)], [s*b,s*(y+.3)], [s*b,s*(y+.7)], [-s*b,s*(y+.7)]]);
     }
     // Text ausschneiden
     fh=s*.8; // Texthöhe
     // x^2 basteln
     translate([-s*1.5,s*7.0]){ text(text="x", font=font, size=fh ); }; 
     translate([-s*.8 ,s*7.5]){ text(text="2", font=font, size=fh*0.7 ); };
     // Spiegelverkehrt sqrt(x) schreiben
     translate([s*.5,s*6.2]){ rotate([180,0,90]){ 
         text(text="sqrt(x)", font=font, size=fh*0.7 ); }; };
   } // Ende Difference   
}