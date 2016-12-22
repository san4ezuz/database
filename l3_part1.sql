CREATE DATABASE 'e:/voenkomat.fdb' USER 'SYSDBA' PASSWORD 'masterkey' DEFAULT CHARACTER SET CYRL;
COMMIT;
CONNECT 'e:/voenkomat.fdb' USER 'SYSDBA' PASSWORD 'masterkey';


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
CREATE TABLE PrivateData(pd_id INT PRIMARY KEY, name VARCHAR(16) NOT NULL, surname VARCHAR(16) NOT NULL, Fname VARCHAR(16) NOT NULL, Birthday DATE NOT NULL, RelShip_id INT REFERENCES RelShip(RelShip_id), NumChild INT, AddrHome_id INT REFERENCES AddrHome(ah_id), PhoneNumber VARCHAR(11) NOT NULL);
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





INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (1, 'СПБ, ул. Ленина, д.13, кв.57','СПБ, ул. Полевая, д.15, кв.168');
INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (2, 'Лен.обл., г.Тосно, ул. Молодцова, д.10, кв. 80','СПБ, Невский пр-т, д.110, кв.15');
INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (3, 'СПБ, ул. Пролетарская, д.20, кв. 15','СПБ, ул. Василеостровская, д.60, кв.45');
INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (4, 'СПБ, ул. Василеостровская, д.62, кв.55','СПБ, ул. Ситцевая, д.1, кв.31');
INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (5, 'СПБ, ул. Будапештская, д.13, кв.14','СПБ, ул. Красноармеская, д.33, кв.17');
INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (6, 'СПБ, ул. Веры Слуцкой, д.14, кв.57','СПБ, ул. Бухарестская, д.12, кв.56');
INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (7, 'СПБ, ул. Володарского, д.14, кв.45','СПБ, ул. Шостаковича, д.14, кв.85');
INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (8, 'СПБ, пр-т Энгельса, д.48, кв.15','СПБ, пр-т Энгельса, д.48, кв.15');
INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (9, 'СПБ, ул. Пушкина, д.17, кв. 78','СПБ, ул. Колотушкина, д.17, кв. 78');
INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (10, 'СПБ, ул. Тверская, д.10, кв 23','СПБ, ул. Тверская, д.10, кв.23');
INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (11, 'СПБ, ул. Володарского, д.22, кв. 33','СПБ, ул. Володарского, д.22, кв. 33');
INSERT INTO AddrHome(ah_id, RegAddres, FactAddres) VALUES (12, 'СПБ, ул. Некрасова, д.7, кв 19','СПБ, ул. Михайлова, д.10, кв.44');


INSERT INTO RelShip(RelShip_id, RelshipStatus) VALUES (1, 'Jenat');
INSERT INTO RelShip(RelShip_id, RelshipStatus) VALUES (2, 'Xolost');
INSERT INTO RelShip(RelShip_id, RelshipStatus) VALUES (3, 'Razveden');
INSERT INTO RelShip(RelShip_id, RelshipStatus) VALUES (4, 'Vdovec');
INSERT INTO RelShip(RelShip_id, RelshipStatus) VALUES (5, 'Zamujem');
INSERT INTO RelShip(RelShip_id, RelshipStatus) VALUES (6, 'Ne zamujem');
INSERT INTO RelShip(RelShip_id, RelshipStatus) VALUES (7, 'Razvedena');
INSERT INTO RelShip(RelShip_id, RelshipStatus) VALUES (8, 'Vdova');


INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (1, 'Petrov', 'Ivan', 'Vladimirovich', '02.06.1970', 1, 2, 1, '89223694152');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (2, 'Petrova', 'Nataliya', 'Viktorovna', '10.09.1975',5, 2, 1, '86547856985');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (3, 'Ivanov', 'Petr', 'Nikolaevich', '25.03.1980', 1, 1, 2, '89323695652');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (4, 'Ivanova', 'Marina', 'Georgievna', '13.06.1979', 5, 1, 2, '89223654152');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (5, 'Mironov', 'Nikolay', 'Konstantinovich', '11.06.1981', 1, 1, 3, '89223826552');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (6, 'Mironova', 'Elena', 'Viktorovna', '22.05.1975', 5, 1, 3, '89223694152');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (7, 'Ermakov', 'Mihail', 'Aleksandrovna', '18.07.1977', 1, 1, 4, '89223694332');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (8, 'Ermakova', 'Evgeniya', 'Pavlovna', '18.09.1979', 5, 1, 4, '89223456152');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (9, 'Sidorov', 'Viktor', 'Anatolievich', '12.06.1966', 1, 1, 5, '89223654672');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (10, 'Sidorova', 'Nataliya', 'Mihailovna', '13.06.1970', 5, 1, 5, '89234784152');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (11, 'Vasiliev', 'Aleksey', 'Evgenievich', '22.10.1960', 1, 1, 6, '89223694152');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (12, 'Vasilieva', 'Inna', 'Petrovna', '16.06.1969', 5, 1, 6, '89212394342');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (13, 'Shubin', 'Nikita', 'Vladimirovich', '12.06.1970', 1, 1, 7, '89323695652');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (14, 'Shubina', 'Anna', 'Viktorovna', '15.06.1969', 5, 1, 7, '89223654152');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (15, 'Alekseev', 'Anatoliy', 'Borisovich', '16.03.1978', 1, 1, 8, '89223876552');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (16, 'Alekseeva', 'Kseniya', 'Petrovna', '16.02.1972', 5, 1, 8, '89223694152');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (17, 'Kirillov', 'Boris', 'Pavlovich', '18.07.1973', 4, 1,9,'89219876537');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (18, 'Ryabinov', 'Andrey', 'Viktorovna', '22.02.1980', 4, 2, 10, '89223456152');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (19, 'Ivanova', 'Irina', 'Viktorovna', '22.05.1985', 8, 1, 11, '89223655672');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (20, 'Semenova', 'Анастасия', 'Сергеевна', '18.08.1983', 8, 1, 12, '89234788152');

INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (21, 'Petrov', 'Ivan', 'Ivanovich', '12.01.1995', 2, 0, 1, '89223694152');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (22, 'Ivanov', 'Aleksandr', 'Petrovich', '13.02.1995', 2, 0, 2, '86547856985');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (23, 'Mironov', 'Petr', 'Nikolaevich', '14.03.1996', 2, 0, 3, '89323695652');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (24, 'Ermakov', 'Sergey', 'Mihailovich', '15.05.1994', 2, 0, 4, '89223654152');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (25, 'Sidorov', 'Nikolay', 'Viktorovich', '16.05.1995', 2, 0, 5, '89223876552');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (26, 'Vasiliev', 'Evgeniy', 'Alekseevich', '17.06.1995', 2, 0, 6, '89223694152');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (27, 'Shubin', 'Mihail', 'Nikitich', '18.07.1995', 2, 0, 7, '89223694332');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (28, 'Alekseev', 'Aleksey', 'Anatolievich', '19.08.1995', 2, 0, 8, '89223456152');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (29, 'Kirillov', 'Nikolay', 'Borisovich', '20.10.1996', 2, 0, 9, '89223654672');
INSERT INTO PrivateData(pd_id, name, surname, Fname, Birthday, RelShip_id, NumChild, AddrHome_id, PhoneNumber) VALUES (30, 'Ryabinov', 'Viktor', 'Andreeevich', '21.11.1995', 2, 0, 10, '89234784152');

INSERT INTO RecState(RecSt_id, StateRS, DateFrom, DateTo) VALUES (1, 'Slujil', '01.07.2013', '01.07.2014');
INSERT INTO RecState(RecSt_id, StateRS, DateFrom, DateTo) VALUES (2, 'Slujil', '01.06.2013', '01.06.2014');
INSERT INTO RecState(RecSt_id, StateRS, DateFrom, DateTo) VALUES (3, 'Slujit', '01.05.2016', '01.05.2017');
INSERT INTO RecState(RecSt_id, StateRS, DateFrom, DateTo) VALUES (4, 'Otsrochka', '01.09.2013', '01.09.2017');
INSERT INTO RecState(RecSt_id, StateRS, DateFrom, DateTo) VALUES (5, 'Otsrochka', '01.09.2013', '01.09.2017');
INSERT INTO RecState(RecSt_id, StateRS, DateFrom, DateTo) VALUES (6, 'Otsrochka', '01.09.2014', '01.09.2018');
INSERT INTO RecState(RecSt_id, StateRS, DateFrom, DateTo) VALUES (7, 'Slujit', '01.06.2016', '01.06.2017');
INSERT INTO RecState(RecSt_id, StateRS, DateFrom, DateTo) VALUES (8, 'Slujil', '01.04.2014', '01.04.2015');
INSERT INTO RecState(RecSt_id, StateRS, DateFrom, DateTo) VALUES (9, 'Slujil', '01.09.2015', '01.09.2016');
INSERT INTO RecState(RecSt_id, StateRS, DateFrom, DateTo) VALUES (10, 'Slujil', '01.03.2013', '01.03.2014');

INSERT INTO SocStName(SocStName_id, StateName) VALUES (1, 'Shkolinik');
INSERT INTO SocStName(SocStName_id, StateName) VALUES (2, 'Student');
INSERT INTO SocStName(SocStName_id, StateName) VALUES (3, 'Rabochiy');
INSERT INTO SocStName(SocStName_id, StateName) VALUES (4, 'Bezrabotnyiy');
INSERT INTO SocStName(SocStName_id, StateName) VALUES (5, 'Pensioner');
INSERT INTO SocStName(SocStName_id, StateName) VALUES (6, 'Voennyi');
INSERT INTO SocStName(SocStName_id, StateName) VALUES (7, 'Prizyvnik-srochnik');
INSERT INTO SocStName(SocStName_id, StateName) VALUES (8, 'Prizyvnik-kontraktnik');


INSERT INTO SocState(SocSt_id, StateSS_id, DateFrom, DateTo) VALUES (1, 2, '01.09.2014', '01.09.2018');
INSERT INTO SocState(SocSt_id, StateSS_id, DateFrom, DateTo) VALUES (2, 2, '01.09.2013', '01.09.2017');
INSERT INTO SocState(SocSt_id, StateSS_id, DateFrom, DateTo) VALUES (3, 7, '01.05.2016', '01.05.2017');
INSERT INTO SocState(SocSt_id, StateSS_id, DateFrom, DateTo) VALUES (4, 1, '01.09.2007', '01.09.2016');
INSERT INTO SocState(SocSt_id, StateSS_id, DateFrom, DateTo) VALUES (5, 1, '01.09.2006', '01.09.2017');
INSERT INTO SocState(SocSt_id, StateSS_id, DateFrom, DateTo) VALUES (6, 1, '01.09.2008', '01.09.2017');
INSERT INTO SocState(SocSt_id, StateSS_id, DateFrom, DateTo) VALUES (7, 7, '01.06.2016', '01.06.2017');
INSERT INTO SocState(SocSt_id, StateSS_id, DateFrom, DateTo) VALUES (8, 2, '01.09.2013', '01.09.2017');
INSERT INTO SocState(SocSt_id, StateSS_id, DateFrom, DateTo) VALUES (9, 2, '01.09.2012', '01.09.2017');
INSERT INTO SocState(SocSt_id, StateSS_id, DateFrom, DateTo) VALUES (10, 2, '01.09.2012', '01.09.2017');


INSERT INTO Status(status_id, SocSt_id, RecSt_id) VALUES (1, 1, 1);
INSERT INTO Status(status_id, SocSt_id, RecSt_id) VALUES (2, 2, 2);
INSERT INTO Status(status_id, SocSt_id, RecSt_id) VALUES (3, 3, 3);
INSERT INTO Status(status_id, SocSt_id, RecSt_id) VALUES (4, 4, 4);
INSERT INTO Status(status_id, SocSt_id, RecSt_id) VALUES (5, 5, 5);
INSERT INTO Status(status_id, SocSt_id, RecSt_id) VALUES (6, 6, 6);
INSERT INTO Status(status_id, SocSt_id, RecSt_id) VALUES (7, 7, 7);
INSERT INTO Status(status_id, SocSt_id, RecSt_id) VALUES (8, 8, 8);
INSERT INTO Status(status_id, SocSt_id, RecSt_id) VALUES (9, 9, 9);
INSERT INTO Status(status_id, SocSt_id, RecSt_id) VALUES (10, 10, 10);


INSERT INTO Ranks(id_rank, name_rank) VALUES (1, 'Рядовой');
INSERT INTO Ranks(id_rank, name_rank) VALUES (2, 'Ефрейтор');
INSERT INTO Ranks(id_rank, name_rank) VALUES (3, 'Мл. сержант');
INSERT INTO Ranks(id_rank, name_rank) VALUES (4, 'Сержант');
INSERT INTO Ranks(id_rank, name_rank) VALUES (5, 'Ст. сержант');
INSERT INTO Ranks(id_rank, name_rank) VALUES (6, 'Старшина');
INSERT INTO Ranks(id_rank, name_rank) VALUES (7, 'Лейтенант ');
INSERT INTO Ranks(id_rank, name_rank) VALUES (8, 'Ст. лейтенант ');
INSERT INTO Ranks(id_rank, name_rank) VALUES (9, 'Капитан');
INSERT INTO Ranks(id_rank, name_rank) VALUES (10, 'Майор');
INSERT INTO Ranks(id_rank, name_rank) VALUES (11, 'Подполковник');
INSERT INTO Ranks(id_rank, name_rank) VALUES (12, 'Полковник');
INSERT INTO Ranks(id_rank, name_rank) VALUES (13, 'Генерал-майор');
INSERT INTO Ranks(id_rank, name_rank) VALUES (14, 'Генерал-лейтенант');
INSERT INTO Ranks(id_rank, name_rank) VALUES (15, 'Генерал-полковник');
INSERT INTO Ranks(id_rank, name_rank) VALUES (16, 'Генерал-армии');
INSERT INTO Ranks(id_rank, name_rank) VALUES (17, 'Маршал РФ');

INSERT INTO Action(id_action, name_action) VALUES (1, 'Prizyv');
INSERT INTO Action(id_action, name_action) VALUES (2, 'Kontrakt');

INSERT INTO Division(id_division, name_division) VALUES (1, '25741 Московская обл., г.Ногинск,ул. Правды, 8');
INSERT INTO Division(id_division, name_division) VALUES (2, '17645 Амурская обл., Октябрьский район, п. Катько');
INSERT INTO Division(id_division, name_division) VALUES (3, '98536 Алтайский край, г. Алейск');
INSERT INTO Division(id_division, name_division) VALUES (5, '12312 Амурская обл., г. Белогорск, ул. Кирова, 21');
INSERT INTO Division(id_division, name_division) VALUES (6, '23523 Амурская обл. г. Белогорск, ул Базарная,2');
INSERT INTO Division(id_division, name_division) VALUES (7, '65454 Респ. Бурятия, г.Кяхта');
INSERT INTO Division(id_division, name_division) VALUES (8, '23528 г.Владимир, Б. Московская ул., 104');
INSERT INTO Division(id_division, name_division) VALUES (9, '73468 г.Волгоград, ул.Качинцев,д.108а');
INSERT INTO Division(id_division, name_division) VALUES (10, '24328 Респ.Дагестан, г.Буйнакск, ул.Али Клыча,д.4');


INSERT INTO MillitaryData(millitary_id, action, ranks, mil_division, Date_From, Date_To) VALUES (1, 1, 1, 2, '01.07.2011', '01.07.2012');
INSERT INTO MillitaryData(millitary_id, action, ranks, mil_division, Date_From, Date_To) VALUES (2, 1, 1, 5, '01.06.2010', '01.06.2011');
INSERT INTO MillitaryData(millitary_id, action, ranks, mil_division, Date_From, Date_To) VALUES (3, 1, 1, 6, '01.05.2014', '01.05.2015');
INSERT INTO MillitaryData(millitary_id, action, ranks, mil_division, Date_From, Date_To) VALUES (4, 1, 1, 7, '01.06.2014', '01.06.2015');
INSERT INTO MillitaryData(millitary_id, action, ranks, mil_division, Date_From, Date_To) VALUES (5, 1, 1, 8, '01.04.2010', '01.04.2011');
INSERT INTO MillitaryData(millitary_id, action, ranks, mil_division, Date_From, Date_To) VALUES (6, 1, 1, 2, '01.09.2009', '01.09.2010');
INSERT INTO MillitaryData(millitary_id, action, ranks, mil_division, Date_From, Date_To) VALUES (7, 1, 1, 1, '01.03.2009', '01.03.2010');

INSERT INTO Prizyvnik(pr_id,  PrivateData_id, MillitaryData_id, Status_id, father_id, mother_id) VALUES (1, 21, 1, 1, 1, 2);
INSERT INTO Prizyvnik(pr_id,  PrivateData_id, MillitaryData_id, Status_id, father_id, mother_id) VALUES (2, 22, 2, 2, 3, 4);
INSERT INTO Prizyvnik(pr_id,  PrivateData_id, MillitaryData_id, Status_id, father_id, mother_id) VALUES (3, 23, 3, 3, 5, 6);
INSERT INTO Prizyvnik(pr_id,  PrivateData_id, MillitaryData_id, Status_id, father_id, mother_id) VALUES (4, 24, 4, 4, 7, 8);
INSERT INTO Prizyvnik(pr_id,  PrivateData_id, MillitaryData_id, Status_id, father_id, mother_id) VALUES (5, 25, 5, 5, 9, 10);
INSERT INTO Prizyvnik(pr_id,  PrivateData_id, MillitaryData_id, Status_id, father_id, mother_id) VALUES (6, 26, 6, 6, 11, 12);
INSERT INTO Prizyvnik(pr_id,  PrivateData_id, MillitaryData_id, Status_id, father_id, mother_id) VALUES (7, 27, 7, 7, 13, 14);


INSERT INTO StoryPrizyvnik(id_strory, pr_id, reason, DateFrom, DateTo) VALUES (1, 1, 'Школа', '15.03.2007', '07.06.2011');
INSERT INTO StoryPrizyvnik(id_strory, pr_id, reason, DateFrom, DateTo) VALUES (2, 2, 'Школа', '15.03.2006', '28.05.2010');
INSERT INTO StoryPrizyvnik(id_strory, pr_id, reason, DateFrom, DateTo) VALUES (3, 3, 'Школа', '14.03.2009', '28.05.2013');
INSERT INTO StoryPrizyvnik(id_strory, pr_id, reason, DateFrom, DateTo) VALUES (4, 3, 'По болезни', '28.05.2013', '28.04.2014');
INSERT INTO StoryPrizyvnik(id_strory, pr_id, reason, DateFrom, DateTo) VALUES (5, 4, 'Школа', '01.09.2013', '01.09.2016');
INSERT INTO StoryPrizyvnik(id_strory, pr_id, reason, DateFrom, DateTo) VALUES (6, 5, 'Школа', '01.09.2013', '01.09.2015');
INSERT INTO StoryPrizyvnik(id_strory, pr_id, reason, DateFrom, DateTo) VALUES (7, 6, 'Школа', '01.09.2013', '01.09.2017');
INSERT INTO StoryPrizyvnik(id_strory, pr_id, reason, DateFrom, DateTo) VALUES (8, 7, 'Школа', '15.03.2008', '27.05.2012');
INSERT INTO StoryPrizyvnik(id_strory, pr_id, reason, DateFrom, DateTo) VALUES (9, 7, 'По болезни', '27.05.2012', '27.05.2014');


commit;