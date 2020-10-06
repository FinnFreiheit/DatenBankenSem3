create table Uni
(
    fach varchar(255) NOT NULL,
    note int NOT NULL,
    crdits int NOT NULL ,
    fachID int NOT NULL,
    PRIMARY KEY (fachID)
);

insert into Uni values ("Mathe",3.4,5,01);
insert into Uni values ("Elektronik",3,5,02);
insert into Uni values ("Digitaltechnik",3.0,5,03);
insert into Uni values ("Java",1,3,04);

SELECT * FROM Uni;
SELECT fach FROM Uni;
SELECT fach FROM Uni WHERE note < 3;
SELECT COUNT(fach) FROM Uni WHERE note >= 2;

SELECT COUNT(fach),crdits FROM Uni GROUP BY crdits;