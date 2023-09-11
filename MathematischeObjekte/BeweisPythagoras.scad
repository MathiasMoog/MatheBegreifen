/* Geometrischer Beweis des Satz des Pythagoras

Gelbes Dreieck 8 mal drucken 
Grünes c-Quadrat 1 mal drucken
Rotes a-Quadrat 1 mal drucken
Blaues b-Quadrat 1 mal drucken
*/

// Größe des Dreiecks
a=30;
b=40;
c=50;
// Dicke der Platten
d=0.5;

color("yellow") translate([10,10]) linear_extrude(d) polygon([[0,0],[b,0],[0,a]]);

color("green") translate([-10-c,10]) linear_extrude(d) square(c);

color("red") translate([-10-a,-10-a]) linear_extrude(d) square(a);

color("blue") translate([10,-10-b]) linear_extrude(d) square(b);
