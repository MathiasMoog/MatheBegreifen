# Mathematik begreifen #

3D druckbare und fräsbare Objekte für den Mathematik Unterricht.

## Warum und wozu ##

An der [Hochschule Ansbach](https://www.hs-ansbach.de "Hochschule Ansbach") unterrichte ich in den Ingenieur Studiengängen Mathematik. So schön wie die Mathematik auch ist, bleibt sie doch für viele Studierende abstrakt. Damit die Studierenden Funktionen und mathematische Objekte im wahren und besten Sinne "begreifen" können, habe ich einige mathematische Objekte für den 3D Druck aufbereitet.

Selbst virtuell in einer 3D Darstellung, z.B. mit der von mir in der Lehre eingesetzten [GNU Octave](https://octave.org/ "GNU Octave") Software bleibt es virtuell. Die gedruckten Objekte können jedoch wirklich in die Hand genommen und genutzt werden.

Außerdem basteln Ingenieure - und auch manche Mathematiker - gerne. So macht es hoffentlich nicht nur dem Dozenten sondern auch den Studierenden Freude.

## Verwendete Software ##

Die Zeichnungen habe ich mit [OpenSCAD ](https://www.openscad.org/ "OpenSCAD") erstellt. 
Aufwändige mathematische Berechnungen, wie z.B. Oberflächen Berechnungen erledige ich vorab mit [GNU Octave](https://octave.org/ "GNU Octave"). Falls OpenSCAD eine .dat Datei vermisst, dann muss zuerst das entsprechende Octave Skript ausgeführt werden.

Die druckbaren Objekte habe ich an der Hochschule Ansbach auf [Ultimaker](https://ultimaker.com/ "Ultimaker") Druckern oder daheim auf meinem privaten [Creality](https://creality.com/ "Creality") Ender 3 pro gedruckt.  

Den gcode für die Drucker erzeuge ich immer mit [Cura](https://ultimaker.com/software/ultimaker-cura "Cura"). Für die Schablonen muss eine sehr gute Qualität verwendet werden, damit die Schriften herauskommen. Die Funktionsflächen können in einer groben Auflösung gedruckt werden, dann geht es etwas schneller. Für viele der Objekte habe ich Cura den Support aktiviert.

An einzelnen Stellen habe ich Formeln als Relief gedruckt. Die Erzeugung dieser Reliefs läuft über Octave, Latex ( ich verwende [MikTex](https://miktex.org/ "MikTex")) und [ImageMagick](https://imagemagick.org/ "ImageMagick"). Die so entstandene Bild (png) Datei importiere ich in OpenSCAD. 

## Überblick ##

Im Stammverzeichnis liegt nur eine SCAD Datei, die allgemeine Definitionen enthält. Sie wird für die meisten Objekte benötigt.

* FunktionsFlaechen - Flächen die durch Funktionen über der Ebene erzeugt werden
* FunktionsSchablonen - Schablonen zum Zeichnen von Funktionen
* Technik - Kleine technische Objekte, die in der Ingenieurmathematik als Anwendung vorkommen


### Schablonen ###

Für einige Funktionen wie Sinus und Parabeln gibt es die Schablonen schon lange zu kaufen. Andere sind kaum zu bekommen.

Aus den Zeichnungen können 3D gedruckte Schablonen zum zeichnen auf Papier (Einheit 1 cm) und mit der Fräse große Schablonen zum zeichnen an der Tafel (Einheit 10 cm) erzeugt werden.

Viele Schablonen besitzen Beschriftungen von beiden Seiten, damit kann die Funktion und ihre Umkehrfunktion gezeichnet werden.

### Funktionsflächen ###

Funktionsflächen wie z.B. Rotationsparaboloide oder Flächen mit Sattelpunkten werden durch die 3D Objekte begreifbar.

Einige sind zerlegbar, so z.B der Roationsparaboloid, der damit auch als Parabel Schablone einsetzbar ist.

Diese Objekte sind in der Regel mit der Einheit von 1 cm erstellt und so gewählt, dass die auf einem "normalen" 3D Drucker gedruckt werden können.

### Technik ###

Beispiele aus der Technik, die in der Ingenieur Mathematik vorkommen, wie z.B. Abrollkurven.

## Nachwort ##

Mein Dank gilt den Kollegen, Labormitarbeiter und Studierenden die mich mit Ideen und in der praktischen Umsetzung unterstützt haben.

Für Verbesserungsvorschläge, Erweiterungen und Links zu anderen passenden Objekten für den Mathematik Unterricht bin ich dankbar.

Vermutlich sind in den Tiefen des Netzes noch weitere ähnliche Projekte zu finden. Aber als ich danach suchte habe ich leider kein passendes Projekt gefunden. Für entsprechende Links bin ich dankbar, dann brauche ich nicht alles selber zu zeichnen.

Die OpenSCAD und Octave Skripte lassen sich aus meiner Sicht am besten mit git verwalten. Daher liegt dieses Archiv auch auf [GitHub](https://github.com/MathiasMoog "GitHub, Mathias Moog"). Ausgewählte 3D Objekte habe ich zusätzlich auf [Thingiverse](https://www.thingiverse.com/Moogi/about "Thingiverse, Mathias Moog") als STL veröffentlicht. Dort sind die STLs schön visualisiert und ich habe einige Fotos hochgeladen.



