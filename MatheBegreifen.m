% Mathematik Begreifen
%
% Diverse Funktionen für Octave. Alle in einer Datei.
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

disp("Mathe Begreifen - Funktionen");

% Latex Formel in ein png verwandeln
% 
% Parameter
%  formel - Die Formel, in einfachen Hochkomma damit die backslashs nicht kaputt gehen.
%  name   - Name der zu erzeugenden PNG Datei, ohne Endung. Es wird ein 
%           gleichnamiges .tex und .pdf File erzeugt. Zusätzlich eine .scad Datei
%           die ein 2D Objekt der Schrift erstellen kann. Das geht schneller zur rendern.
%  aufraeumen - optionen, steht auf true, auf false setzen damit alle Zwischendateien erhalten bleiben
%
% Beispiel
%  In Octave: latex2png( 'f(x)=\sqrt{x+1}', 'test' )
%  In OpenSCAD: surface(file = "test.png" , invert = true);
%    Größe in x und y entsprechend den pixeln in test.png, Höhe 0 .. 100
%
function latex2png( formel, name, aufraeumen=true )
  %Erzeuge Latex Datei
  fid=fopen([name ".tex"],"w");
  fprintf(fid,["\\documentclass{standalone}\n\\standaloneconfig{border=0.5bp}\n" ...
   "\\begin{document}\n\\begin{math}\n"]);
  fwrite(fid,formel); % Keine Backslashs kaputt machen
  fprintf(fid,"\n\\end{math}\n\\end{document}\n");
  fclose(fid);
  % Übersetze Latex Datei, es entsteht <name>.pdf
  system( [ "pdflatex " name ] );
  % Konvertiere in ein png mit ImageMagic convert
  system( [ "convert -density 600 " name ".pdf -quality 100 " name ".png" ]);
  % Lese die PNG Datei wieder ein und erzeuge die scad Datei
  I=imread( [name ".png"] );
  fid = fopen([name ".scad"],"w");
  fprintf(fid,[
    "// Import einer Schrift als 2D Objekt\n"...
    "// Jeder Pixes ist ein Rechteck\n"...
    "// Die Höhe in mm kann angegeben werden\n"...
    "module %s_formel( height=10 ) {\n"],name);
  % Liste der Pixel mit Grauwert <128
  [i,j]=find(I<=128);
  i=size(I,1)+1-i; % Invertiere für die Darstellung
  fprintf(fid,"  p=[ ");
  fprintf(fid,"[%d,%d], ",[j,i]');
  fprintf(fid," ];\n");
  % Alle Pixel aus der Liste in Rechtecke verwandeln und skalieren
  fprintf(fid,"  scale( height/%d ) union() { \n", size(I,1) );
  % Teile die Schleife auf, maximal 9000 Elemente in einer Liste in openSCAD
  n=length(i);
  for k=0:9000:n
    fprintf(fid,...
      "    for (i=[%d:%d]) { translate(p[i]) square( size=1 ); };\n", ...
      k, min(k+9000,n)-1 );  
  endfor
  % Ende des Moduls und der Datei
  fprintf(fid,[ "  } // ende union\n}\n\n", ...
   "// Zum Testen folgende Zeile einkommentieren\n",...
   "// %s_formel( 20 );\n"],name);
  fclose(fid);
  % Räume auf falls gewünscht
  if (aufraeumen)
    delete( [name ".tex"] );
    delete( [name ".aux"] );
    delete( [name ".log"] );
    delete( [name ".pdf"] );
  endif 
endfunction