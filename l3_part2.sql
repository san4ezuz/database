CREATE TABLE PostDoctor(PostD_id INT PRIMARY KEY, PostDoc VARCHAR(32) NOT NULL);
COMMIT;
CREATE TABLE Groupp(group_id INT PRIMARY KEY, NameGroup VARCHAR(2) NOT NULL);
COMMIT;
CREATE TABLE ListDoctor(ListDoc_id INT PRIMARY KEY, FullName VARCHAR(64) NOT NULL);
COMMIT;
CREATE TABLE Doctor(doc_id INT PRIMARY KEY, NameDoc_id INT REFERENCES ListDoctor(ListDoc_id), PostDoc_id INT REFERENCES PostDoctor(PostD_id), note VARCHAR(100) NOT NULL);
COMMIT;
CREATE TABLE MedicalData(md_id INT PRIMARY KEY,pr_id INT REFERENCES Prizyvnik(pr_id), ther_id INT REFERENCES Doctor(doc_id), ent_id INT REFERENCES Doctor(doc_id), surg_id INT REFERENCES Doctor(doc_id), ocul_id INT REFERENCES Doctor(doc_id), derm_id INT REFERENCES Doctor(doc_id), neur_id INT REFERENCES Doctor(doc_id), psych_id INT REFERENCES Doctor(doc_id), glav_id INT REFERENCES Doctor(doc_id), group_id INT REFERENCES Groupp(group_id));
COMMIT;



INSERT INTO PostDoctor(PostD_id, PostDoc) VALUES (1, 'Terapevt');
INSERT INTO PostDoctor(PostD_id, PostDoc) VALUES (2, 'Lor');
INSERT INTO PostDoctor(PostD_id, PostDoc) VALUES (3, 'Xirurg');
INSERT INTO PostDoctor(PostD_id, PostDoc) VALUES (4, 'Okulist');
INSERT INTO PostDoctor(PostD_id, PostDoc) VALUES (5, 'Dermatolog');
INSERT INTO PostDoctor(PostD_id, PostDoc) VALUES (6, 'Nevrolog');
INSERT INTO PostDoctor(PostD_id, PostDoc) VALUES (7, 'Psixoterapevt');
INSERT INTO PostDoctor(PostD_id, PostDoc) VALUES (8, 'Glavnyi vrach');

INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (1,'Вяткин Игорь Владимирович');
INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (2,'Жмуркин Михаил Петрович');
INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (3,'Веселов Александр Кириллович');
INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (4,'Игораев Никита Владимирович');
INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (5,'Лубсанов Баир Александрович');
INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (6,'Кравченко Андрей Георгиевич');
INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (7,'Жуков Александр Степанович');
INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (8,'Николаев Игорь Николаевич');
INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (9,'Иванов Иван Иванович');
INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (10,'Петров Петр Петрович');
INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (11,'Бессонова Наталья Николаевна');
INSERT INTO ListDoctor(ListDoc_id, FullName) VALUES (12,'Маришко Людмила Петровна');


INSERT INTO Groupp(group_id, NameGroup) VALUES (1, 'A1');
INSERT INTO Groupp(group_id, NameGroup) VALUES (2, 'A2');
INSERT INTO Groupp(group_id, NameGroup) VALUES (3, 'B1');
INSERT INTO Groupp(group_id, NameGroup) VALUES (4, 'B2');
INSERT INTO Groupp(group_id, NameGroup) VALUES (5, 'B3');
INSERT INTO Groupp(group_id, NameGroup) VALUES (6, 'B4');
INSERT INTO Groupp(group_id, NameGroup) VALUES (7, 'V');
INSERT INTO Groupp(group_id, NameGroup) VALUES (8, 'G');
INSERT INTO Groupp(group_id, NameGroup) VALUES (9, 'D');

INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (1, 1, 1, 'Жалоб нет');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (2, 2, 2, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (3, 3, 3, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (4, 4, 4, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (5, 5, 5, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (6, 6, 6, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (7, 7, 7, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (8, 8, 8, 'Годен, А1');

INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (9, 1, 1, 'Жалоб нет');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (10, 2, 2, 'Плохой слух');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (11, 3, 3, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (12, 4, 4, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (13, 5, 5, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (14, 6, 6, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (15, 7, 7, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (16, 8, 8, 'Годен, Б1');

INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (17, 1, 1, 'Жалоб нет');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (18, 11, 2, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (19, 3, 3, 'Искривление позвоночника');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (20, 4, 4, 'Оба глаза -1');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (21, 5, 5, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (22, 6, 6, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (23, 7, 7, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (24, 8, 8, 'Годен, Б2');

INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (25, 1, 1, 'Жалоб нет');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (26, 2, 2, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (27, 3, 3, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (28, 4, 4, 'оба глаза -1');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (29, 5, 5, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (30, 6, 6, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (31, 7, 7, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (32, 8, 8, 'Годен, А2');

INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (33, 1, 1, 'Жалуется на бессоницу');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (34, 2, 2, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (35, 3, 3, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (36, 4, 4, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (37, 5, 5, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (38, 6, 6, 'Невроз правого глаза');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (39, 7, 7, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (40, 8, 8, 'Годен, Б3');

INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (41, 1, 1, 'Жалоб нет');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (42, 2, 2, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (43, 3, 3, 'Хромает на левую ногу');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (44, 4, 4, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (45, 5, 5, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (46, 6, 6, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (47, 7, 7, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (48, 8, 8, 'Годен, Б4');

INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (49, 1, 1, 'Жалоб нет');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (50, 2, 2, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (51, 3, 3, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (52, 4, 4, 'Правый глаз -3');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (53, 5, 5, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (54, 6, 6, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (55, 7, 7, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (56, 8, 8, 'Годен, Б1');

INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (57, 1, 1, 'Жалоб нет');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (58, 2, 2, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (59, 3, 3, 'Левая нога короче правой на 7 см');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (60, 4, 4, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (61, 5, 5, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (62, 6, 6, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (63, 7, 7, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (64, 12, 8, 'Годен, Б2');

INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (65, 1, 1, 'Жалоб нет');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (66, 2, 2, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (67, 3, 3, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (68, 4, 4, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (69, 5, 5, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (70, 6, 6, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (71, 7, 7, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (72, 8, 8, 'Годен, А1');

INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (73, 1, 1, 'Жалоб нет');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (74, 2, 2, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (75, 3, 3, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (76, 4, 4, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (77, 5, 5, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (78, 6, 6, 'Здоров');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (79, 7, 7, 'Боиться громких звуков');
INSERT INTO Doctor(doc_id, NameDoc_id, PostDoc_id, note) VALUES (80, 12, 8, 'Годен, А2');

INSERT INTO MedicalData(md_id, pr_id, ther_id, ent_id, surg_id, ocul_id, derm_id, neur_id, psych_id, glav_id, group_id) VALUES (1, 1, 1, 2, 3, 4, 5, 6, 7, 8, 1);
INSERT INTO MedicalData(md_id, pr_id, ther_id, ent_id, surg_id, ocul_id, derm_id, neur_id, psych_id, glav_id, group_id) VALUES (2, 2, 9, 10, 11, 12, 13, 14, 15, 16, 3);
INSERT INTO MedicalData(md_id, pr_id, ther_id, ent_id, surg_id, ocul_id, derm_id, neur_id, psych_id, glav_id, group_id) VALUES (3, 3, 17, 18, 19, 20, 21, 22, 23, 24, 4);
INSERT INTO MedicalData(md_id, pr_id, ther_id, ent_id, surg_id, ocul_id, derm_id, neur_id, psych_id, glav_id, group_id) VALUES (4, 4, 25, 26, 27, 28, 29, 30, 31, 32, 2);
INSERT INTO MedicalData(md_id, pr_id, ther_id, ent_id, surg_id, ocul_id, derm_id, neur_id, psych_id, glav_id, group_id) VALUES (5, 5, 33, 34, 35, 36, 37, 38, 39, 40, 5);
INSERT INTO MedicalData(md_id, pr_id, ther_id, ent_id, surg_id, ocul_id, derm_id, neur_id, psych_id, glav_id, group_id) VALUES (6, 6, 41, 42, 43, 44, 45, 46, 47, 48, 6);
INSERT INTO MedicalData(md_id, pr_id, ther_id, ent_id, surg_id, ocul_id, derm_id, neur_id, psych_id, glav_id, group_id) VALUES (7, 7, 49, 50, 51, 52, 53, 54, 55, 56, 3);
