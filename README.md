# Implementierung von Anwendungssystemen

##Projekt
Entwicklung einer wissenschaftlichen Aktivitäts-Tracking-App mit Webplattform

##Idee
Wissenschaftliches Online Tool zur Erhebung, Visualisierung und Analyse von Smartphone basierten Benutzeraktivitäten

##Implementierung

1. App
   - Dashboard
     - Starten und Stoppen einer Aktivität
     - Manuelle Eingabe von Aktivitäten
     - Aktivitätsverlauf, einfache Visualisierung von Aktivitäten
   - Aufnahme von Aktivitätsdaten in die Datenbank
     - Start, Endzeit und Art der Aktivität
     - Einfache Aktivitätsdaten, z.B.
       - Zurückgelegte Distanzen via Location Tracking
       - Anzahl Schritte (via Schrittzähler), usw.
   - Optional: Sensordaten von Smartphone und / oder Fitnesstracker, z.B.
     - Accelerometer, Gyroskop, Magnetometer, Heading
     - Puls (Fitnessarmband, Smartwatch etc.)
     - Viele Einzeldaten, sollten in einer .csv Datei abgelegt werden

2. Website
   - Dashboard auf der Startseite mit
     - (fiktiver) Studienbeschreibung
     - Neuigkeiten / aktuellen Hinweisen
     - (fiktiven) Informationen zur Studienteilnahme
     - Möglichkeit sich zu registrieren / als User teilzunehmens
   - Login-Bereich mit Passwort für Supervisoren / Admins
     - Verwaltung von Nutzern, Daten und Dashboard
     - Einfache Visualisierung von Daten

##Rollen

1. Regulärer Teilnehmer
     - App-basiert (kein Zugriff auf Login-Bereich der Webpage)
     - Registrierung / Identifikation mit gültiger Mail
     - Profil (optionale Zusatzinfos)
       - Geschlecht, Alter, usw.
     – Kann neue Aktivitäten starten und stoppen
       - Art der Aktivität (Fahrradfahren, Laufen, Wandern, ...)
       - Dauer der Aktivität
       - Aktivitätsdaten (Distanz, Schritte, Puls, usw.)
     - Manuelle Eingabe von Aktivitäten
2. Supervisor / Wissenschaftler
     - Nutzer mit erweiterten Rechten
       - Name, Mail, usw.
       - Universitätszugehörigkeit
       - Zugriff auf Login-Bereich der Webpage
     - Kann andere (reguläre) Nutzer
       - Anlegen, freischalten, sperren oder entfernen
     - Kann Aktivitätsdaten von Nutzern einsehen
       - Download von Daten, z.B. als Excel-Tabelle (.csv Datei)
     - Kann Neuigkeiten auf Dashboard
       - Posten, bearbeiten und löschen
3. Administrator
       - Nutzer mit Vollzugriff
       - Kann alle Nutzer (regulär, Supervisor und Admin)
         - Erstellen, bearbeiten, sperren und löschen
         - Supervisor / Admin-Berechtigungen zuweisen und entfernen
       - Kann Daten
         - Eingeben, bearbeiten und löschen
       - Kann Dashboard verwalten
       - Alles andere
         - Erstellen, bearbeiten und löschen
##Programmiersprache
  - Dart(Flutter)