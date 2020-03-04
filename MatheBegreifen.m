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

% Latex Formel in ein svg verwandeln
% 
% Parameter
%  formel - Die Formel, in einfachen Hochkomma damit die backslashs nicht kaputt gehen.
%  name   - Name der zu erzeugenden PNG Datei, ohne Endung. Es wird ein 
%           gleichnamiges .tex und .pdf File erzeugt. Zusätzlich eine .scad Datei
%           die ein 2D Objekt der Schrift erstellen kann. Das geht schneller zur rendern.
%  aufraeumen - optionen, steht auf true, auf false setzen damit alle Zwischendateien erhalten bleiben
%
% Beispiel
%  In Octave: latex2svg( 'f(x)=\sqrt{x+1}', 'test' )
%  In OpenSCAD: import("test.svg");
%    Die Schrift beginnt im ursprung, die Zeichenhöhe sind 10 mm
%
function latex2svg( formel, name, aufraeumen=true )
  %Erzeuge Latex Datei
  fid=fopen([name ".tex"],"w");
  fprintf(fid,["\\documentclass{standalone}\n\\standaloneconfig{border=0.5bp}\n" ...
   "\\begin{document}\n\\begin{math}\n"]);
  fwrite(fid,formel); % Keine Backslashs kaputt machen
  fprintf(fid,"\n\\end{math}\n\\end{document}\n");
  fclose(fid);
  % Übersetze Latex Datei, es entsteht <name>.pdf
  system( [ "pdflatex " name ] );
  % Konvertiere in ein svg mit dvisvgm
  system( [ "dvisvgm --pdf " name ".pdf" ]);
  % Verändere das SVG
  % - Schrift soll im Ursprung beginnen (viewBox anpassen)
  % - Schrift soll 10 mm hoch sein (pt -> mm)
  svg = fileread( [name ".svg"] );
  svg = strrep( svg, "pt'", "mm'" );
  svg = strrep( svg, "viewBox='0 -", "viewBox='0 " );
  % Hm filewrite gibt es leider nicht ..
  fid = fopen( [name ".svg"], "w" );
  fwrite( fid, svg );
  fclose( fid );
  
  % Räume auf falls gewünscht
  if (aufraeumen)
    delete( [name ".tex"] );
    delete( [name ".aux"] );
    delete( [name ".log"] );
    delete( [name ".pdf"] );
  endif 
endfunction  