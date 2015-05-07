# MipsUserTests
## von Kostronor

## Disclaimer:
In diesem Repository sind einige Tests für das Projekt 1 in Mips. Diese Tests wurden von Studenten erstellt und haben keine Garantie auf Korrektheit. Sie sind einzig und alleine eine Möglichkeit für euch, euer Programm mit weiteren Tests zu testen und mehr zu lernen. Diese Readme versucht, für alle Tests zu erklären, was getestet wird.

Tests:

 * `_unclean` bedeutet, dass Puffer schon Werte enthalten, welche Fehler erzeugen wenn sie nicht überschrieben werden.
 * `_bound` prüft auf Randwerte, die man oftmals vergisst. Dies sind beliebte Tests für nach der Abgabe. Und hier kann man sehr viel lernen, denn Testen von Software ist wichtig.
   * `_bound_int` testet (zahl mod MAX_INT) und schlägt zum Beispiel fehl, wenn du in deinem Programm nicht unsigned arbeitest. 
   * `_bound_min` testet eine Zahl mod einer größeren Zahl, so dass du nur den Rest bekommst.
   * `_bound_max` testet eine sehr große Zahl, wenn dies fehlschlägt, wird eine IBAN auch nicht in deinen Speicher passen.
 * `_conv` testet alle tests darauf, ob 'callee save' Konventionen eingehalten wurden.