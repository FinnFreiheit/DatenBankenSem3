use uebungSchule;
show tables;

/*
    A) Geben Sie einer Liste aller Schüler aus,
    die ein Apple-Smartphone besitzen. Auszugeben sind der Schülername und der Name des Wohnorts.
*/

SELECT schueler.name
FROM schueler
INNER JOIN smartphones
ON schueler.idSmartphones=smartphones.id
WHERE marke ='Apple';

/*
    B1) Wir brauchen eine Liste mit den Namen aller Lehrer und der zugehörigen Schüler.
    Die Spalten sollen genau diese Überschrift haben: "Lehrername" / "Schülername".
    (Das wird etwas unübersichtlich, macht nichts.)
 */

SELECT lehrer.name AS Lehrername, schueler.name AS Schuelername
FROM (( lehrer
INNER JOIN lehrer_hat_schueler ON lehrer.id = lehrer_hat_schueler.idLehrer)
INNER JOIN schueler ON lehrer_hat_schueler.idSchueler = schueler.id);


/*
    B2) Wir brauchen eine Liste der Schüler von Frau Maier.
    Wir brauchen folgende Spalten: Schülername, Schülerwohnort
 */

SELECT schueler.name AS Schuelername, orte.name AS Schuelerwohnort
FROM ((( lehrer
INNER JOIN lehrer_hat_schueler ON lehrer.id = lehrer_hat_schueler.idLehrer)
INNER JOIN schueler ON lehrer_hat_schueler.idSchueler = schueler.id)
INNER JOIN orte ON schueler.idOrte = orte.id)
WHERE lehrer.name = 'Maier';

/*
    C) Geben Sie alle Schüler aus, die in Emmendingen wohnen.
    Folgende Spalten anzeigen: Schülername, Wohnort, Smartphonemarke.
 */

SELECT schueler.name AS Schuelername, orte.name AS Wohnort, smartphones.marke AS Smartphonemarke
FROM ((schueler
INNER JOIN orte ON schueler.idOrte = orte.id)
INNER JOIN smartphones ON schueler.idSmartphones = smartphones.id)
WHERE orte.name = 'Emmendingen';

/*
    D) Geben Sie alle Schüler aus, die in Emmendingen wohnen und bei Herrn Huber Unterricht haben.
    Ausgabe Schülername, Wohnort, Lehrername.
 */

SELECT lehrer.name AS Lehrername, schueler.name AS Schuelername, orte.name AS Wohnort
FROM (((lehrer
INNER JOIN lehrer_hat_schueler ON lehrer.id = lehrer_hat_schueler.idLehrer)
INNER JOIN schueler ON schueler.id = lehrer_hat_schueler.idSchueler)
INNER JOIN orte ON orte.id = schueler.idOrte)
WHERE lehrer.name = 'Huber'
AND orte.name = 'Emmendingen';
