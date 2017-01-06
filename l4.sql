CREATE DATABASE 'e:/voenkomat2.fdb' USER 'SYSDBA' PASSWORD 'masterkey' DEFAULT CHARACTER SET CYRL;
COMMIT;
CONNECT 'e:/voenkomat2.fdb' USER 'SYSDBA' PASSWORD 'masterkey';


CREATE TABLE AddrHome(ah_id INT PRIMARY KEY, RegAddres VARCHAR(50) NOT NULL, FactAddres VARCHAR(50) NOT NULL);
COMMIT;
CREATE TABLE RelShip(RelShip_id INT PRIMARY KEY, RelshipStatus VARCHAR(16) NOT NULL);
COMMIT;
CREATE TABLE RecState(RecSt_id INT PRIMARY KEY, StateRS VARCHAR(16), DateFrom DATE NOT NULL, DateTo DATE NOT NULL);
COMMIT;
CREATE TABLE SocStName(SocStName_id INT PRIMARY KEY, StateName VARCHAR(25));
COMMIT;
CREATE TABLE SocState(SocSt_id INT PRIMARY KEY, StateSS_id INT REFERENCES SocStName(SocStName_id), DateFrom DATE NOT NULL, DateTo DATE NOT NULL);
COMMIT;
CREATE TABLE Status(status_id INT PRIMARY KEY, SocSt_id INT REFERENCES SocState(SocSt_id), RecSt_id INT REFERENCES RecState(RecSt_id));
COMMIT;
CREATE TABLE PrivateData(pd_id INT PRIMARY KEY, fname VARCHAR(16) NOT NULL, name VARCHAR(16) NOT NULL, surname VARCHAR(16) NOT NULL, Birthday DATE NOT NULL, RelShip_id INT REFERENCES RelShip(RelShip_id), NumChild INT, AddrHome_id INT REFERENCES AddrHome(ah_id), PhoneNumber VARCHAR(11) NOT NULL);
COMMIT;

CREATE TABLE Ranks(id_rank INT PRIMARY KEY, name_rank VARCHAR(50) NOT NULL);
COMMIT;
CREATE TABLE Division(id_division INT PRIMARY KEY, name_division VARCHAR(100) NOT NULL);
COMMIT;
CREATE TABLE Action(id_action INT PRIMARY KEY, name_action VARCHAR(20) NOT NULL);
COMMIT;
CREATE TABLE MillitaryData(millitary_id INT PRIMARY KEY, action INT REFERENCES Action(id_action), ranks INT REFERENCES Ranks(id_rank), mil_division INT REFERENCES Division(id_division), Date_From DATE NOT NULL, Date_To DATE NOT NULL);
COMMIT;
CREATE TABLE Prizyvnik(pr_id INT PRIMARY KEY, PrivateData_id INT REFERENCES PrivateData(pd_id),father_id INT REFERENCES PrivateData(pd_id),mother_id INT REFERENCES PrivateData(pd_id), MillitaryData_id INT REFERENCES MillitaryData(millitary_id),  Status_id INT REFERENCES Status(status_id));
COMMIT;
CREATE TABLE StoryPrizyvnik(id_strory INT PRIMARY KEY, pr_id INT REFERENCES Prizyvnik(pr_id), reason VARCHAR(50) NOT NULL, DateFrom DATE NOT NULL, DateTo DATE NOT NULL);
COMMIT;

CREATE TABLE PostDoctor(PostD_id INT PRIMARY KEY, PostDoc VARCHAR(32) NOT NULL);
COMMIT;
CREATE TABLE Groupp(group_id INT PRIMARY KEY, NameGroup VARCHAR(2) NOT NULL);
COMMIT;
CREATE TABLE ListDoctor(ListDoc_id INT PRIMARY KEY, FullName VARCHAR(64) NOT NULL);
COMMIT;
CREATE TABLE Doctor(doc_id INT PRIMARY KEY, NameDoc_id INT REFERENCES ListDoctor(ListDoc_id), PostDoc_id INT REFERENCES PostDoctor(PostD_id), note VARCHAR(100) NOT NULL);
COMMIT;
CREATE TABLE MedicalData(md_id INT PRIMARY KEY, pr_id INT REFERENCES Prizyvnik(pr_id), medical_date DATE NOT NULL, ther_id INT REFERENCES Doctor(doc_id), ent_id INT REFERENCES Doctor(doc_id), surg_id INT REFERENCES Doctor(doc_id), ocul_id INT REFERENCES Doctor(doc_id), derm_id INT REFERENCES Doctor(doc_id), neur_id INT REFERENCES Doctor(doc_id), psych_id INT REFERENCES Doctor(doc_id), glav_id INT REFERENCES Doctor(doc_id), group_id INT REFERENCES Groupp(group_id));
COMMIT;






INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (1, 'SPB, yl. Lenina, d.13, kv.57','SPB, yl. Polevaya, d.15, kv.168');
INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (2, 'Len. obl. Tosno, yl. Molodcova, d.10, kv. 80','SPB, Nevskyi pr-t, d.110, kv.15');
INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (3, 'SPB, yl. Proletarskaya, d.20, kv. 15','SPB, yl. Vasileostrovskaya, d.60, kv.45');
INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (4, 'SPB, yl. Vasileostrovskaya, d.62, kv.55','SPB, yl. Sitcevaya, d.1, kv.31');
INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (5, 'SPB, yl. Budapeshtskaya, d.13, kv.14','SPB, yl. Krasnoarmeyskaya, d.33, kv.17');
INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (6, 'SPB, yl. Very Sluckoy, d.14, kv.57','SPB, yl. Buxaretskaya, d.12, kv.56');
INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (7, 'SPB, yl. Volodarskogo, d.14, kv.45','SPB, yl. Шостаковича, d.14, kv.85');
INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (8, 'SPB, pr-t Engelsa, d.48, kv.15','SPB, пр-т Engelsa, d.48, kv.15');
INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (9, 'SPB, yl. Pushkina, d.17, kv. 78','SPB, yl. Kolotushkina, d.17, kv. 78');
INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (10, 'SPB, yl. Tverskaya, d.10, kv. 23','SPB, yl. Tverskaya, d.10, kv.23');
INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (11, 'SPB, yl. Volodarskogo, d.22, kv. 33','SPB, yl. Volodarskogo, d.22, kv. 33');
INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (12, 'SPB, yl. Nekrasova, d.7, kv. 19','SPB, yl. Mixailova, d.10, kv.44');


INSERT INTO RelShip(RelShip_id, RelshipStatus) VALUES (1, 'Jenat');
INSERT INTO RelShip(RelShip_id, RelshipStatus) VALUES (2, 'Xolost');
INSERT INTO RelShip(RelShip_id, RelshipStatus) VALUES (3, 'Razveden');
INSERT INTO RelShip(RelShip_id, RelshipStatus) VALUES (4, 'Vdovec');
INSERT INTO RelShip(RelShip_id, RelshipStatus) VALUES (5, 'Zamujem');
INSERT INTO RelShip(RelShip_id, RelshipStatus) VALUES (6, 'Ne zamujem');
INSERT INTO RelShip(RelShip_id, RelshipStatus) VALUES (7, 'Razvedena');
INSERT INTO RelShip(RelShip_id, RelshipStatus) VALUES (8, 'Vdova');


INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (1, 'Petrov', 'Ivan', 'Vladimirovich', '02.06.1970', 1, 2, 1, '89223694152');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (2, 'Petrova', 'Nataliya', 'Viktorovna', '10.09.1975',5, 2, 1, '86547856985');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (3, 'Ivanov', 'Petr', 'Nikolaevich', '25.03.1980', 1, 1, 2, '89323695652');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (4, 'Ivanova', 'Marina', 'Georgievna', '13.06.1979', 5, 1, 2, '89223654152');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (5, 'Mironov', 'Nikolay', 'Konstantinovich', '11.06.1981', 1, 1, 3, '89223826552');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (6, 'Mironova', 'Elena', 'Viktorovna', '22.05.1975', 5, 1, 3, '89223694152');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (7, 'Ermakov', 'Mihail', 'Aleksandrovna', '18.07.1977', 1, 1, 4, '89223694332');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (8, 'Ermakova', 'Evgeniya', 'Pavlovna', '18.09.1979', 5, 1, 4, '89223456152');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (9, 'Sidorov', 'Viktor', 'Anatolievich', '12.06.1966', 1, 1, 5, '89223654672');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (10, 'Sidorova', 'Nataliya', 'Mihailovna', '13.06.1970', 5, 1, 5, '89234784152');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (11, 'Vasiliev', 'Aleksey', 'Evgenievich', '22.10.1960', 1, 1, 6, '89223694152');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (12, 'Vasilieva', 'Inna', 'Petrovna', '16.06.1969', 5, 1, 6, '89212394342');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (13, 'Shubin', 'Nikita', 'Vladimirovich', '12.06.1970', 1, 1, 7, '89323695652');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (14, 'Shubina', 'Anna', 'Viktorovna', '15.06.1969', 5, 1, 7, '89223654152');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (15, 'Alekseev', 'Anatoliy', 'Borisovich', '16.03.1978', 1, 1, 8, '89223876552');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (16, 'Alekseeva', 'Kseniya', 'Petrovna', '16.02.1972', 5, 1, 8, '89223694152');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (17, 'Kirillov', 'Boris', 'Pavlovich', '18.07.1973', 4, 1,9,'89219876537');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (18, 'Ryabinov', 'Andrey', 'Viktorovna', '22.02.1980', 4, 2, 10, '89223456152');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (19, 'Ivanova', 'Irina', 'Viktorovna', '22.05.1985', 8, 1, 11, '89223655672');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (20, 'Semenova', 'Anastasiya', 'Sergeevna', '18.08.1983', 8, 1, 12, '89234788152');

INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (21, 'Petrov', 'Ivan', 'Ivanovich', '12.01.1995', 2, 0, 1, '89223694152');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (22, 'Ivanov', 'Aleksandr', 'Petrovich', '13.02.1995', 2, 0, 2, '86547856985');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (23, 'Mironov', 'Petr', 'Nikolaevich', '14.03.1996', 2, 0, 3, '89323695652');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (24, 'Ermakov', 'Sergey', 'Mihailovich', '15.05.1994', 2, 0, 4, '89223654152');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (25, 'Sidorov', 'Nikolay', 'Viktorovich', '16.05.1995', 2, 0, 5, '89223876552');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (26, 'Vasiliev', 'Evgeniy', 'Alekseevich', '17.06.1995', 2, 0, 6, '89223694152');
INSERT INTO PrivateData(pd_id, fname, name, surname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (27, 'Shubin', 'Mihail', 'Nikitich', '18.07.1992', 2, 0, 7, '89223694332');


INSERT INTO RecState(RecSt_id, StateRS, DateFrom, DateTo) VALUES (1, 'Slujil', '01.07.2013', '01.07.2014');
INSERT INTO RecState(RecSt_id, StateRS, DateFrom, DateTo) VALUES (2, 'Slujil', '01.06.2013', '01.06.2014');
INSERT INTO RecState(RecSt_id, StateRS, DateFrom, DateTo) VALUES (3, 'Slujit', '01.05.2016', '01.05.2017');
INSERT INTO RecState(RecSt_id, StateRS, DateFrom, DateTo) VALUES (4, 'Otsrochka', '01.09.2013', '01.09.2017');
INSERT INTO RecState(RecSt_id, StateRS, DateFrom, DateTo) VALUES (5, 'Otsrochka', '01.09.2013', '01.09.2017');
INSERT INTO RecState(RecSt_id, StateRS, DateFrom, DateTo) VALUES (6, 'Otsrochka', '01.09.2014', '01.09.2018');
INSERT INTO RecState(RecSt_id, StateRS, DateFrom, DateTo) VALUES (7, 'Slujit', '01.06.2016', '01.06.2017');


INSERT INTO SocStName(SocStName_id, StateName) VALUES (1, 'Shkolinik');
INSERT INTO SocStName(SocStName_id, StateName) VALUES (2, 'Student');
INSERT INTO SocStName(SocStName_id, StateName) VALUES (3, 'Rabochiy');
INSERT INTO SocStName(SocStName_id, StateName) VALUES (4, 'Bezrabotnyiy');
INSERT INTO SocStName(SocStName_id, StateName) VALUES (5, 'Pensioner');
INSERT INTO SocStName(SocStName_id, StateName) VALUES (6, 'Voennyi');
INSERT INTO SocStName(SocStName_id, StateName) VALUES (7, 'Prizyvnik-srochnik');
INSERT INTO SocStName(SocStName_id, StateName) VALUES (8, 'Prizyvnik-kontraktnik');


INSERT INTO SocState(SocSt_id, StateSS_id, DateFrom, DateTo) VALUES (1, 2, '01.09.2014', '01.09.2018');
INSERT INTO SocState(SocSt_id, StateSS_id, DateFrom, DateTo) VALUES (2, 2, '01.09.2014', '01.09.2018');
INSERT INTO SocState(SocSt_id, StateSS_id, DateFrom, DateTo) VALUES (3, 7, '01.05.2016', '01.05.2017');
INSERT INTO SocState(SocSt_id, StateSS_id, DateFrom, DateTo) VALUES (4, 4, '01.09.2013', '01.09.2017');
INSERT INTO SocState(SocSt_id, StateSS_id, DateFrom, DateTo) VALUES (5, 2, '01.09.2013', '01.09.2017');
INSERT INTO SocState(SocSt_id, StateSS_id, DateFrom, DateTo) VALUES (6, 2, '01.09.2014', '01.09.2018');
INSERT INTO SocState(SocSt_id, StateSS_id, DateFrom, DateTo) VALUES (7, 7, '01.06.2016', '01.06.2017');



INSERT INTO Status(status_id, SocSt_id, RecSt_id) VALUES (1, 1, 1);
INSERT INTO Status(status_id, SocSt_id, RecSt_id) VALUES (2, 2, 2);
INSERT INTO Status(status_id, SocSt_id, RecSt_id) VALUES (3, 3, 3);
INSERT INTO Status(status_id, SocSt_id, RecSt_id) VALUES (4, 4, 4);
INSERT INTO Status(status_id, SocSt_id, RecSt_id) VALUES (5, 5, 5);
INSERT INTO Status(status_id, SocSt_id, RecSt_id) VALUES (6, 6, 6);
INSERT INTO Status(status_id, SocSt_id, RecSt_id) VALUES (7, 7, 7);


INSERT INTO Ranks(id_rank, name_rank) VALUES (1, 'Ryadovoi');
INSERT INTO Ranks(id_rank, name_rank) VALUES (2, 'Efreitor');
INSERT INTO Ranks(id_rank, name_rank) VALUES (3, 'Ml. serjant');
INSERT INTO Ranks(id_rank, name_rank) VALUES (4, 'Serjant');
INSERT INTO Ranks(id_rank, name_rank) VALUES (5, 'St. serjant');
INSERT INTO Ranks(id_rank, name_rank) VALUES (6, 'Starshina');
INSERT INTO Ranks(id_rank, name_rank) VALUES (7, 'Leitinant ');
INSERT INTO Ranks(id_rank, name_rank) VALUES (8, 'St. leitinant ');
INSERT INTO Ranks(id_rank, name_rank) VALUES (9, 'Kapitan');
INSERT INTO Ranks(id_rank, name_rank) VALUES (10, 'Mayor');
INSERT INTO Ranks(id_rank, name_rank) VALUES (11, 'Podpolkovnik');
INSERT INTO Ranks(id_rank, name_rank) VALUES (12, 'Polkovnik');
INSERT INTO Ranks(id_rank, name_rank) VALUES (13, 'General-mayor');
INSERT INTO Ranks(id_rank, name_rank) VALUES (14, 'General-leitinant');
INSERT INTO Ranks(id_rank, name_rank) VALUES (15, 'General-polkovnik');
INSERT INTO Ranks(id_rank, name_rank) VALUES (16, 'General-armii');
INSERT INTO Ranks(id_rank, name_rank) VALUES (17, 'Marshal RF');

INSERT INTO Action(id_action, name_action) VALUES (1, 'Prizyv');
INSERT INTO Action(id_action, name_action) VALUES (2, 'Kontrakt');

INSERT INTO Division(id_division, name_division) VALUES (1, '25741');
INSERT INTO Division(id_division, name_division) VALUES (2, '17645');
INSERT INTO Division(id_division, name_division) VALUES (3, '98536');
INSERT INTO Division(id_division, name_division) VALUES (5, '12312');
INSERT INTO Division(id_division, name_division) VALUES (6, '23523');
INSERT INTO Division(id_division, name_division) VALUES (7, '65454');
INSERT INTO Division(id_division, name_division) VALUES (8, '23528');
INSERT INTO Division(id_division, name_division) VALUES (9, '73468');
INSERT INTO Division(id_division, name_division) VALUES (10, '24328');


INSERT INTO MillitaryData(millitary_id, action, ranks, mil_division, Date_From, Date_To) VALUES (1, 1, 1, 2, '01.07.2013', '01.07.2014');
INSERT INTO MillitaryData(millitary_id, action, ranks, mil_division, Date_From, Date_To) VALUES (2, 1, 2, 5, '01.07.2013', '01.07.2014');
INSERT INTO MillitaryData(millitary_id, action, ranks, mil_division, Date_From, Date_To) VALUES (3, 1, 1, 6, '01.05.2014', '01.05.2015');
INSERT INTO MillitaryData(millitary_id, action, ranks, mil_division, Date_From, Date_To) VALUES (4, 1, 1, 7, '01.06.2014', '01.06.2015');
INSERT INTO MillitaryData(millitary_id, action, ranks, mil_division, Date_From, Date_To) VALUES (5, 1, 1, 8, '01.04.2010', '01.04.2011');
INSERT INTO MillitaryData(millitary_id, action, ranks, mil_division, Date_From, Date_To) VALUES (6, 1, 1, 2, '01.09.2009', '01.09.2010');
INSERT INTO MillitaryData(millitary_id, action, ranks, mil_division, Date_From, Date_To) VALUES (7, 1, 1, 1, '01.03.2009', '01.03.2010');
commit;
INSERT INTO Prizyvnik(pr_id,  PrivateData_id, MillitaryData_id, Status_id, father_id, mother_id) VALUES (1, 21, 1, 1, 1, 2);
INSERT INTO Prizyvnik(pr_id,  PrivateData_id, MillitaryData_id, Status_id, father_id, mother_id) VALUES (2, 22, 2, 2, 3, 4);
INSERT INTO Prizyvnik(pr_id,  PrivateData_id, MillitaryData_id, Status_id, father_id, mother_id) VALUES (3, 23, 3, 3, 5, 6);
INSERT INTO Prizyvnik(pr_id,  PrivateData_id, MillitaryData_id, Status_id, father_id, mother_id) VALUES (4, 24, 4, 4, 7, 8);
INSERT INTO Prizyvnik(pr_id,  PrivateData_id, MillitaryData_id, Status_id, father_id, mother_id) VALUES (5, 25, 5, 5, 9, 10);
INSERT INTO Prizyvnik(pr_id,  PrivateData_id, MillitaryData_id, Status_id, father_id, mother_id) VALUES (6, 26, 6, 6, 11, 12);
INSERT INTO Prizyvnik(pr_id,  PrivateData_id, MillitaryData_id, Status_id, father_id, mother_id) VALUES (7, 27, 7, 7, 13, 14);


INSERT INTO StoryPrizyvnik(id_strory, pr_id, reason, DateFrom, DateTo) VALUES (1, 1, 'Shkola', '15.03.2011', '07.06.2013');
INSERT INTO StoryPrizyvnik(id_strory, pr_id, reason, DateFrom, DateTo) VALUES (2, 2, 'Shkola', '15.03.2011', '28.05.2013');
INSERT INTO StoryPrizyvnik(id_strory, pr_id, reason, DateFrom, DateTo) VALUES (3, 3, 'Shkola', '14.03.2009', '28.05.2013');
INSERT INTO StoryPrizyvnik(id_strory, pr_id, reason, DateFrom, DateTo) VALUES (4, 3, 'Po bolezni', '28.05.2013', '28.04.2014');
INSERT INTO StoryPrizyvnik(id_strory, pr_id, reason, DateFrom, DateTo) VALUES (5, 4, 'Univer', '01.09.2013', '01.09.2017');
INSERT INTO StoryPrizyvnik(id_strory, pr_id, reason, DateFrom, DateTo) VALUES (6, 5, 'Univer', '01.09.2013', '01.09.2017');
INSERT INTO StoryPrizyvnik(id_strory, pr_id, reason, DateFrom, DateTo) VALUES (7, 6, 'Univer', '01.09.2013', '01.09.2018');
INSERT INTO StoryPrizyvnik(id_strory, pr_id, reason, DateFrom, DateTo) VALUES (8, 7, 'Shkola', '15.03.2008', '27.05.2012');
INSERT INTO StoryPrizyvnik(id_strory, pr_id, reason, DateFrom, DateTo) VALUES (9, 7, 'Po bolezni', '27.05.2012', '27.05.2014');
INSERT INTO StoryPrizyvnik(id_strory, pr_id, reason, DateFrom, DateTo) VALUES (10, 4, 'Shkola', '15.03.2011', '25.05.2013');
INSERT INTO StoryPrizyvnik(id_strory, pr_id, reason, DateFrom, DateTo) VALUES (11, 5, 'Shkola', '15.04.2011', '27.05.2013');



INSERT INTO PostDoctor(PostD_id, PostDoc) VALUES (1, 'Terapevt');
INSERT INTO PostDoctor(PostD_id, PostDoc) VALUES (2, 'Lor');
INSERT INTO PostDoctor(PostD_id, PostDoc) VALUES (3, 'Xirurg');
INSERT INTO PostDoctor(PostD_id, PostDoc) VALUES (4, 'Okulist');
INSERT INTO PostDoctor(PostD_id, PostDoc) VALUES (5, 'Dermatolog');
INSERT INTO PostDoctor(PostD_id, PostDoc) VALUES (6, 'Nevrolog');
INSERT INTO PostDoctor(PostD_id, PostDoc) VALUES (7, 'Psixoterapevt');
INSERT INTO PostDoctor(PostD_id, PostDoc) VALUES (8, 'Glavnyi vrach');

INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (1,'Vyatkin Igor Vladimirovich');
INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (2,'Jmurkil Ivan Petrovich');
INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (3,'Smirnov Aleksandr Kirrilovich');
INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (4,'Igoraev Nikita Vladimirovich');
INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (5,'Lukin Vladimir Aleksandrovich');
INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (6,'Ivanov Andrey Georgievich');
INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (7,'Jukov Aleksandr Stepanovich');
INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (8,'Petrov Igor Nikolaevich');
INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (9,'Ivanov Ivan Ivanovich');
INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (10,'Petrov Petr Petrovich');
INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (11,'Berkova Natalia Nikolaevna');
INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (12,'Marishko Lydmila Petrovna');


INSERT INTO Groupp(group_id, NameGroup) VALUES (1, 'A1');
INSERT INTO Groupp(group_id, NameGroup) VALUES (2, 'A2');
INSERT INTO Groupp(group_id, NameGroup) VALUES (3, 'B1');
INSERT INTO Groupp(group_id, NameGroup) VALUES (4, 'B2');
INSERT INTO Groupp(group_id, NameGroup) VALUES (5, 'B3');
INSERT INTO Groupp(group_id, NameGroup) VALUES (6, 'B4');
INSERT INTO Groupp(group_id, NameGroup) VALUES (7, 'V');
INSERT INTO Groupp(group_id, NameGroup) VALUES (8, 'G');
INSERT INTO Groupp(group_id, NameGroup) VALUES (9, 'D');

INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (1, 1, 1, 'Jalob net');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (2, 2, 2, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (3, 3, 3, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (4, 4, 4, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (5, 5, 5, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (6, 6, 6, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (7, 7, 7, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (8, 8, 8, 'Goden, A1');

INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (9, 1, 1, 'Jalob net');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (10, 2, 2, 'Ploxoy slux');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (11, 3, 3, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (12, 4, 4, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (13, 5, 5, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (14, 6, 6, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (15, 7, 7, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (16, 8, 8, 'Goden, B1');

INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (17, 1, 1, 'Jalob net');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (18, 11, 2, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (19, 3, 3, 'Krivoy pozvonochnik');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (20, 4, 4, 'Zrenie -1');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (21, 5, 5, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (22, 6, 6, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (23, 7, 7, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (24, 8, 8, 'Goden, B2');

INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (25, 1, 1, 'Jalob net');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (26, 2, 2, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (27, 3, 3, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (28, 4, 4, 'zrenie -1');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (29, 5, 5, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (30, 6, 6, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (31, 7, 7, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (32, 8, 8, 'Goden, A2');

INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (33, 1, 1, 'Bessonitca');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (34, 2, 2, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (35, 3, 3, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (36, 4, 4, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (37, 5, 5, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (38, 6, 6, 'Nevroz levogo glaza');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (39, 7, 7, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (40, 8, 8, 'Goden, B3');

INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (41, 1, 1, 'Jalob net');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (42, 2, 2, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (43, 3, 3, 'Xromaet levaya noga');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (44, 4, 4, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (45, 5, 5, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (46, 6, 6, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (47, 7, 7, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (48, 8, 8, 'Goden, B4');

INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (49, 1, 1, 'Jalob net');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (50, 2, 2, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (51, 3, 3, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (52, 4, 4, 'Zrenie -3');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (53, 5, 5, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (54, 6, 6, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (55, 7, 7, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (56, 8, 8, 'Goden, B1');

INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (57, 1, 1, 'Jalob net');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (58, 2, 2, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (59, 3, 3, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (60, 4, 4, 'Zrenie -4');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (61, 5, 5, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (62, 6, 6, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (63, 7, 7, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (64, 8, 8, 'Goden, B2');

INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (65, 1, 1, 'Jalob net');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (66, 2, 2, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (67, 3, 3, 'Ploskostopie');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (68, 4, 4, 'Zrenie -3');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (69, 5, 5, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (70, 6, 6, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (71, 7, 7, 'Zdorov');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (72, 8, 8, 'Goden, B3');



INSERT INTO MedicalData(md_id, pr_id, medical_date, ther_id, ent_id, surg_id, ocul_id, derm_id, neur_id, psych_id, glav_id, group_id) VALUES (1, 1, '10.10.2012', 1, 2, 3, 4, 5, 6, 7, 8, 1);
INSERT INTO MedicalData(md_id, pr_id, medical_date, ther_id, ent_id, surg_id, ocul_id, derm_id, neur_id, psych_id, glav_id, group_id) VALUES (2, 2, '10.10.2013', 9, 10, 11, 12, 13, 14, 15, 16, 3);
INSERT INTO MedicalData(md_id, pr_id, medical_date, ther_id, ent_id, surg_id, ocul_id, derm_id, neur_id, psych_id, glav_id, group_id) VALUES (3, 3, '15.09.2012', 17, 18, 19, 20, 21, 22, 23, 24, 4);
INSERT INTO MedicalData(md_id, pr_id, medical_date, ther_id, ent_id, surg_id, ocul_id, derm_id, neur_id, psych_id, glav_id, group_id) VALUES (4, 4, '10.10.2014', 25, 26, 27, 28, 29, 30, 31, 32, 2);
INSERT INTO MedicalData(md_id, pr_id, medical_date, ther_id, ent_id, surg_id, ocul_id, derm_id, neur_id, psych_id, glav_id, group_id) VALUES (5, 5, '12.09.2014', 33, 34, 35, 36, 37, 38, 39, 40, 5);
INSERT INTO MedicalData(md_id, pr_id, medical_date, ther_id, ent_id, surg_id, ocul_id, derm_id, neur_id, psych_id, glav_id, group_id) VALUES (6, 6, '10.10.2008', 41, 42, 43, 44, 45, 46, 47, 48, 6);
INSERT INTO MedicalData(md_id, pr_id, medical_date, ther_id, ent_id, surg_id, ocul_id, derm_id, neur_id, psych_id, glav_id, group_id) VALUES (7, 7, '23.10.2008', 49, 50, 51, 52, 53, 54, 55, 56, 3);
INSERT INTO MedicalData(md_id, pr_id, medical_date, ther_id, ent_id, surg_id, ocul_id, derm_id, neur_id, psych_id, glav_id, group_id) VALUES (8, 1, '27.09.2013', 57, 58, 59, 60, 61, 62, 63, 64, 4);
INSERT INTO MedicalData(md_id, pr_id, medical_date, ther_id, ent_id, surg_id, ocul_id, derm_id, neur_id, psych_id, glav_id, group_id) VALUES (9, 2, '05.11.2014', 65, 66, 67, 68, 69, 70, 71, 72, 5);
COMMIT;
