% Lokale Extrema
% Erstelle Oberfläche mit mehreren lokalen Extrema
%
% Dieses Octave Skript erzeugt mehrere LokaleExtrema?.dat Dateien. Es muss ausgeführt werden
% - bevor - die OpenSCAD Skripte laufen.
%
% Copyright 2019 bei Mathias Moog, Hochschule Ansbach, Deutschland, mathias.moog@hs-ansbach.de
%
% Dieser Code steht unter der Creative-Commons-Lizenz Namensnennung - Nicht-kommerziell - 
% Weitergabe unter gleichen Bedingungen 4.0 International. 
% Um eine Kopie dieser Lizenz zu sehen, besuchen Sie http://creativecommons.org/licenses/by-nc-sa/4.0/
%
% Diesen Code habe ich für die Verwendung in meinen Lehrveranstaltungen und für Studierende
% an der Hochschule Ansbach geschrieben. Ich kann nicht garantieren, dass er fehlerfrei funktioniert.
% Für Hinweise und Verbesserungsvorschläge bin ich dankbar.
%
% Ich selbst arbeite vorwiegend mit Octave, https://www.gnu.org/software/octave/, da dies freie 
% Software ist und sie auf jedem Rechner installiert werden kann. 
% Prinzipiell kann der Code auch auf Matlab laufen, aber ich habe es nie ausprobiert.

% Lade Funktionen nach
run ../MatheBegreifen

% Lade das Paket für die symbolischen Berechnung
pkg load symbolic;

% Vereinbare Symbolische Variablen
syms x y;
syms a1 a2 a3 b1 b2 b3 c1 c2 c3 c4 c5 c6

% Ansatz, eine Polynomfunktion
f(x,y) = 4+a1*x + a2*x^2 + a3*x^3 + x^4/100 + b1*y+b2*y^2+b3*y^3+y^4/100 ...
   +c1*x*y+c2*x*y^2+c3*x^2*y+c4*x^2*y^2+c5*x*y^3+c6*x^3*y
%Ableitungen
fx(x,y)  = diff(f,x)
fy(x,y)  = diff(f,y) 

% Gleichungen für die lokalen Extrema
% Zwei Maxima
gl1=f(3,3)==5;
gl2=fx(3,3)==0;
gl3=fy(3,3)==0;
gl4=f(-3,-3)==4;
gl5=fx(-3,-3)==0;
gl6=fy(-3,-3)==0;
% Zwei Minima
gl7=f(3,-2)==2;
gl8=fx(3,-2)==0;
gl9=fy(3,-2)==0;
gl10=f(-3,3)==1/2;
gl11=fx(-3,3)==0;
gl12=fy(-3,3)==0;

% Auflösen
[a1 a2 a3 b1 b2 b3 c1 c2 c3 c4 c5 c6] = solve(gl1,gl2,gl3,gl4,gl5,gl6,gl7,gl8,gl9,gl10,gl11,gl12, ...
 a1, a2, a3, b1, b2, b3, c1, c2, c3, c4, c5, c6)
% Parameter einsetzen 
g(x,y)=subs(f)

% In numerische Funktion verwandeln
h = function_handle(g);

% Zeichnen
r=4; % Quadrat
% Zeichne die Oberfläche
txy = linspace( -r, r, 81)'; 
[xx, yy] = meshgrid( txy, txy ); % ein Gitter in der x y Ebene erzeugen
zz = h(xx,yy);
mesh( txy, txy, zz );

% Speichere die Oberfläche
dlmwrite("LokaleExtremaO.dat",zz," ");

% Speicher die hier gewählten Einstellungen in einer Datei
fid = fopen("LokaleExtremaS.dat","w");
fprintf(fid,"d=%f; // Abstand der Punkte\n",mean(diff(txy)));
fprintf(fid,"r=%f; // Halbe Kanntelänge der Grundfläche\n",r);
fclose(fid);

% Erzeuge ein PNG der Formel
latex2png( ['f(x,y) = ' latex(f) ], 'LokaleExtremaF' );



