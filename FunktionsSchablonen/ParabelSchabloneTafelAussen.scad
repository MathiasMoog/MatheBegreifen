// Tafel Schablone für die Parabel - Außenkontur
//
// Ähnlich wie die kleine zum zeichnen auf Papier, hier jedoch nur
// ein 2D Modell für die Fräse.
// Hier wird nur die Außenkontur erstellt. 
// Als svg exportieren und in Easel mit "Cut on shape path" verarbeiten
// 
// Copyright, CC-BY-NC-SA, 2020, Mathias Moog, 
// mathias.moog@hs-ansbach.de, Hochschule Ansbach, Deutschland, 
//
// Dieses Produkt steht unter der Creative-Commons-Lizenz 
// Namensnennung - Nicht-kommerziell - 
// Weitergabe unter gleichen Bedingungen 4.0 International. 
// Um eine Kopie dieser Lizenz zu sehen, besuchen Sie
// http://creativecommons.org/licenses/by-nc-sa/4.0/

// Diverse Vorlagen laden
include <../MatheBegreifen.scad>

// Die Parabel Vorlage laden
use <Parabel.scad>

// Skalierungen
s=100;   // Längeneinheit der Schablone 1 dm, scad mm
xmax=2.5;

parabelUmriss( xmax=xmax, s=s );