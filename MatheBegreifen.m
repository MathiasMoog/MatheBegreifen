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
%  name   - Name der zu erzeugenden PNG Datei, ohne Endung. Es wird ein gleichnamiges .tex und .pdf File erzeugt
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
  fprintf(fid,"\\documentclass{standalone}\n\\begin{document}\n\\begin{math}\n");
  fwrite(fid,formel); % Keine Backslashs kaputt machen
  fprintf(fid,"\n\\end{math}\n\\end{document}\n");
  fclose(fid);
  % Übersetze Latex Datei, es entsteht <name>.pdf
  system( [ "pdflatex " name ] );
  % Konvertiere in ein png mit ImageMagic convert
  system( [ "convert -density 600 " name ".pdf -quality 100 " name ".png" ]);
  % Räume auf falls gewünscht
  if (aufraeumen)
    delete( [name ".tex"] );
    delete( [name ".aux"] );
    delete( [name ".log"] );
    delete( [name ".pdf"] );
  endif 
endfunction