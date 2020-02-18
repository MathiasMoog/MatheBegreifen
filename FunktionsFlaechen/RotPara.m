% Rotations Paraboloid
% Erstelle Oberfl�che mit konstanter Dicke in Normalenrichtung.
%
% Dieses Octave Skript erzeugt mehrere RotPara?.dat Dateien. Es muss ausgef�hrt werden
% - bevor - die OpenSCAD Skripte laufen.
%
% Copyright 2019 bei Mathias Moog, Hochschule Ansbach, Deutschland, mathias.moog@hs-ansbach.de
%
% Dieser Code steht unter der Creative-Commons-Lizenz Namensnennung - Nicht-kommerziell - 
% Weitergabe unter gleichen Bedingungen 4.0 International. 
% Um eine Kopie dieser Lizenz zu sehen, besuchen Sie http://creativecommons.org/licenses/by-nc-sa/4.0/
%
% Diesen Code habe ich f�r die Verwendung in meinen Lehrveranstaltungen und f�r Studierende
% an der Hochschule Ansbach geschrieben. Ich kann nicht garantieren, dass er fehlerfrei funktioniert.
% F�r Hinweise und Verbesserungsvorschl�ge bin ich dankbar.
%
% Ich selbst arbeite vorwiegend mit Octave, https://www.gnu.org/software/octave/, da dies freie 
% Software ist und sie auf jedem Rechner installiert werden kann. 
% Prinzipiell kann der Code auch auf Matlab laufen, aber ich habe es nie ausprobiert.

% Globale Variablen
global f d;

% Die Funktion, hier ein Rotationsparaboloid
f=@(x,y)25-x.^2-y.^2;

% Die Dicke der Oberfl�che in cm
d=0.3;

% Berechne nach "unten" zeigende Normale mit der L�nge d
function n=dnf(x,y)
  global d;
  fx=-2*x;
  fy=-2*y;
  n=cross([1,0,fx],[0,1,fy]);
  n*=-d/norm(n);
endfunction

% Untere Begrenzung der Fl�che
function z=fu(x,y)
  global f;
  n=dnf(x,y);
  g=@(z)norm([n(1),n(2),f(x-n(1),y-n(2))+n(3)-z]);
  z=fminsearch(g,f(x,y)-n(3));
endfunction

% Zeichne die Oberfl�che
txy = linspace( -4, 4, 41)'; 
[xx, yy] = meshgrid( txy, txy ); % ein Gitter in der x y Ebene erzeugen
% Die z werte f�r jeden Punkt im Gitter ausrechnen
zz = f(xx,yy);
mesh( txy, txy, zz )
hold on;
% Die Vektoren zeichnen
##nx=zeros(size(xx));
##ny=zeros(size(xx));
##nz=zeros(size(xx));
##for ix=1:length(txy)
##  for iy=1:length(txy)
##    n = dnf(xx(ix,iy),yy(ix,iy));
##    nx(ix,iy)=n(1);
##    ny(ix,iy)=n(2);
##    nz(ix,iy)=n(3);
##  endfor
##endfor
##quiver3( xx,yy,zz, nx,ny,nz )
% Die untere Schicht zeichnen
zu=zeros(size(xx));
for ix=1:length(txy)
  for iy=1:length(txy)
    zu(ix,iy) = fu(xx(ix,iy),yy(ix,iy));
  endfor
endfor
mesh( txy, txy, zu )

hold off;

% Speichere die Oberfl�chen
% Die dat Dateien enthalten die Oberfl�chen Informationen f�r OpenSCAD
d=mean(diff(txy))
n=length(txy)
dlmwrite("RotParaO.dat",zz," ");
dlmwrite("RotParaU.dat",zu," ");