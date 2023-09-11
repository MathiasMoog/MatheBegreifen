% Viertel Rotations Paraboloid - Volumen
% Erstelle Volumenmodell eines viertel Roationsparaboloid
%
% Beispiel für die Integration
%  \int_0^1 \int_0^1 x^2 + y^2 dy dx
%
% Dieses Octave Skript erzeugt die RotParaVol.dat Datei. Es muss ausgeführt werden
% - bevor - die OpenSCAD Skripte laufen.
%
% Copyright 2021 bei Mathias Moog, Hochschule Ansbach, Deutschland, mathias.moog@hs-ansbach.de
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

% Die Funktion, hier ein Rotationsparaboloid
f=@(x,y)x.^2+y.^2;

% Zeichne die Oberfläche
txy = linspace( 0, 1, 41)';
[xx, yy] = meshgrid( txy, txy ); % ein Gitter in der x y Ebene erzeugen
% Die z werte für jeden Punkt im Gitter ausrechnen
zz = f(xx,yy);
mesh( txy, txy, zz )
hold on;

% Speichere die Oberfläche
dlmwrite("RotParaVol.dat",zz," ");

% Erzeuge ein svg der Formel
latex2svg( ['f(x,y) = x^2+y^2' ], 'RotParaLagrangeF' );
latex2svg( ['g(x,y) = x + y \stackrel{!}{=} 1' ], 'RotParaLagrangeG' );

