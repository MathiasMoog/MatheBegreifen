/* Rotiertes Dreieck.
   Vorlesungsbeispiel für die Integration in 
   Polar- bzw. Zylinderkoordinaten.
   
   Abmessungen wie in meiner Mathematik Vorlesung, jedoch um den Faktor 10 aufgebläht.
   Außerdem ist hier die große Auflagefläche unten, damit es sich gut drucken lässt.
*/

// schön rund
$fn=360;

faktor = 10; // Damit es begreibar wird
ri=1; // Radius des Lochs
ra=2; // Äußerer Radius
zu=0; // Z unten
zoi=1; // Z oben innen
zoa=0; // Z oben außen

// Erzeuge ein Dreieck mit folgenden Punkten
punkte = [ [ri,zu], [ra,zu], [ri,zoi] ];

// Rotiere das Dreieck, skaliere
scale([faktor,faktor,faktor]) rotate_extrude(angle=360) polygon(punkte);
