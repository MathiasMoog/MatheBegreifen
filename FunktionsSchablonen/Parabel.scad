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

function parabelPunkte( xmax=3, s=10 ) = [ 
    for(x=[-xmax:.1:xmax]) [s*x,s*pow(x,2)], 
    [s*xmax,s*xmax*xmax] 
  ];

module parabelUmriss( xmax=3, s=10 ) {
  polygon( parabelPunkte(xmax,s) );
}

module parabelFenster( xmax=3, s=10 ) {
  ymax = xmax*xmax;
  // Sichtfenster y-Achse
  b=0.08;
  for(y=[1:1:floor(xmax*xmax-1)]) {
    translate([-s*b,s*(y+.3)]) square( size=[s*2*b,s*0.4] );
  }  
}   

module parabelFormel( xmax=3, s=10 ) {
  ymax = xmax*xmax;
  // Beschriftungen der Funktionen
  fh = s*0.125*ymax;
  translate([-1.7*fh,s*ymax-1.2*fh]) scale( [fh/10.0,fh/10.0,1] ) import( "ParabelSqr.svg" );
  translate([0.5*fh,s*ymax-1.8*fh]) rotate([180,0,90]) scale( [fh/10.0,fh/10.0,1] ) import( "ParabelSqrt.svg" );
}   

module parabelStanz( xmax=3, s=10 ) {
  difference() {
    parabelUmriss( xmax=xmax, s=s );
    parabelFenster( xmax=xmax, s=s);
    parabelFormel( xmax=xmax, s=s);
  }
}   

// ausprobieren
//parabelUmriss();
parabelStanz(xmax=3);

