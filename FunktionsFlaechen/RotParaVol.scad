// Viertel Rotations Paraboloid - Volumen
// Erstelle Volumenmodell eines viertel Roationsparaboloid
//
// Beispiel für die Integration
//  \int_0^1 \int_0^1 x^2 + y^2 dy dx// 
//
// Zuerst muss das Octave Skript RotParaVol.m laufen und die
// RotParaVol.dat Datei (Höheninformationen) erstellen.
//
// Copyright, CC-BY-NC-SA, 2020, Mathias Moog, 
// mathias.moog@hs-ansbach.de, Hochschule Ansbach, Deutschland, 
//
// Dieses Produkt steht unter der Creative-Commons-Lizenz 
// Namensnennung - Nicht-kommerziell - 
// Weitergabe unter gleichen Bedingungen 4.0 International. 
// Um eine Kopie dieser Lizenz zu sehen, besuchen Sie
// http://creativecommons.org/licenses/by-nc-sa/4.0/

// Skalierungsfaktor
// e/(n-1) entspricht der Einheit 1 cm (e=10 mm)
e = 10;
s = e/40;

difference() {
// Erzeuge aus den Oberflächen RotParaVol.dat 
scale([s,s,e]) surface(file = "RotParaVol.dat", center = false);
// Schneide unten 
translate([-1,-1,-20.5]) cube([20,20,20]);
}
