-- Include your INSERT SQL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the parent tables!

-- This is only an example of how you add INSERT statements to this file.
--   You may remove it.

INSERT INTO CATEGORY (cname, priority_number) VALUES
('Health Care Worker', 1), ('Elder', 1), ('Immunologically Compromised', 1), ('Teacher', 2), ('Children below 10', 2),
 ('Physical proximity priority1', 2), ('Essential Service Worker', 3), ('Physical proximity priority2', 3),
    ('Everybody else', 4);

INSERT INTO PERSON VALUES (100, 'PAM BEASLY', 'FEMALE', '1975-02-21', 'CALIFORNIA, CA', 123456789, '2021-02-21', 'RECEPTIONIST', 'NO',
                           'NO', 'Essential Service Worker ');
INSERT INTO PERSON VALUES (101, 'ANGELA MARTIN', 'FEMALE', '1974-03-11', 'NEWYORK, NY', 123456788, '2021-02-21', 'ACCOUNTANT', 'NO',
                               'NO', 'Essential Service Worker');
INSERT INTO PERSON VALUES (103, 'OSCAR MARTIN', 'MALE', '1969-12-02', 'TORONTO, ON', 123556789, '2021-02-20', 'POLITICIAN', 'NO',
                           'NO', 'Essential Service Worker');
INSERT INTO PERSON VALUES (109, 'MICHAEL SCOTT', 'MALE', '1966-03-20', 'QUEBEC, ML', 223456789, '2021-02-22', 'MANAGER', 'Physical proximity priority2',
                               'NO', 'Physical proximity priority2');
INSERT INTO PERSON VALUES (104, 'DWIGHT SCHRUTE', 'MALE', '1970-11-11', 'CALGARY, AB', 623456789, '2020-12-21', 'FARMER', 'Physical proximity priority1',
                           'Immunologically Compromised', 'Immunologically Compromised');
INSERT INTO PERSON VALUES (105, 'JIM HARPERT', 'MALE', '1970-02-21', 'CALGARY, AB', 923456789, '2021-02-21', 'SALES MAN', 'NO',
                           'NO', 'Essential Service Worker');
INSERT INTO PERSON VALUES (106, 'CREED X', 'MALE', '1955-01-21', 'ALASKA CITY, AL', 323456789, '2021-09-09', 'GUITARIST', 'Physical proximity priority2',
                           'NO', 'Elder');

INSERT INTO PERSON VALUES (210, 'Jane Doe', 'FEMALE', '1995-01-12', 'Montreal, QC', 514456789, '2021-01-01', 'Student', 'NO',
                           'NO', 'Everybody else');


INSERT INTO PERSON VALUES (310, 'Harry Styles', 'MALE', '1995-01-12', 'Montreal, QC', 514456781, '2020-12-01', 'Celebrity', 'NO',
                           'NO', 'Everybody else');
INSERT INTO PERSON VALUES (320, 'Justin Bieber', 'MALE', '1995-02-12', 'Montreal, QC', 514456782, '2020-11-01', 'Celebrity', 'NO',
                           'NO', 'Everybody else');
INSERT INTO PERSON VALUES (350, 'Bojack Horseman', 'MALE', '1995-03-12', 'Montreal, QC', 514456783, '2020-10-01', 'Celebrity', 'NO',
                           'NO', 'Everybody else');




INSERT INTO PERSON VALUES(1000, 'Miley Cyrus', 'FEMAILE', '1992-02-01', 'Montreal, QC', 514111111, '2020-05-01', 'NURSE', 'NO', 'NO','Health Care Worker');
INSERT INTO PERSON VALUES(1001, 'Miley Virus', 'FEMAILE', '1992-02-11', 'Montreal, QC', 514111112, '2020-05-01', 'TEACHER', 'NO', 'NO','Teacher');
INSERT INTO PERSON VALUES(1002, 'Miley Kikots', 'FEMAILE', '1942-02-01', 'Montreal, QC', 514111113, '2020-05-01', 'VET', 'NO', 'NO','Elder');



INSERT INTO LOCATION VALUES('SOMERSET PHARMACY', 'T2Y3A2', 'CALGARY', '42 SOMERSET STREET SW');
INSERT INTO LOCATION VALUES('SOMERSET HOSPITAL', 'T1Y3A2', 'CALGARY', '41 SOMERSET STREET SW');
INSERT INTO LOCATION VALUES('EVERGREEN PHARMACY', 'T2Y3H2', 'TORONTO', '50 EVERGREEN STREET NW');
INSERT INTO LOCATION VALUES('EVERGREEN HOSPITAL', 'T2Y3H3', 'TORONTO', '51 EVERGREEN STREET NW');
INSERT INTO LOCATION VALUES('DUNDER MIFFLIN VACCINE SHOTS LOCATION', 'H21321', 'COLORADO', '123 COLORADO STREET NE');
INSERT INTO LOCATION VALUES('DUNDER MIFFLIN  CORPORATE VACCINE SHOTS LOCATION', '1221321', 'NEWYORK', 'NEW YORK STREET NY');
INSERT INTO LOCATION VALUES('DUNDER MIFFLIN  BUFFALO HOSPITAL', '1221321', 'BUFFALO', 'BUFFALO BA SE');
INSERT INTO LOCATION VALUES('DUNDER MIFFLIN  SCRANTON HOSPITAL', '121121321', 'SCRANTON', 'SCRANTON STREET SE');
INSERT INTO LOCATION VALUES('DUNDER MIFFLIN  NASHUA HOSPITAL', '122111321', 'NASHUA', 'NASHUA STREET SE');

INSERT INTO LOCATION VALUES('Jewish General', 'H3T1E2', 'MONTREAL, QC', '3755 Chemin de la Côte-Sainte-Catherine');

INSERT INTO LOCATION VALUES('McGill Hospital', 'H4T1E2', 'MONTREAL, QC', '4000 Chemin de la Côte-Sainte-Catherine');
INSERT INTO LOCATION VALUES('Montreal Hospital', 'H5T1E2', 'MONTREAL, QC', '5000 Chemin de la Côte-Sainte-Catherine');
INSERT INTO LOCATION VALUES('French Hospital', 'H6T1E2', 'MONTREAL, QC', '6000 Chemin de la Côte-Sainte-Catherine');



INSERT INTO DAYS VALUES('2021-02-21', 50, 30, 20, 'DUNDER MIFFLIN VACCINE SHOTS LOCATION');
INSERT INTO DAYS VALUES('2021-02-21', 60, 40, 30, 'DUNDER MIFFLIN  CORPORATE VACCINE SHOTS LOCATION');
INSERT INTO DAYS VALUES('2021-02-21', 70, 50, 30, 'SOMERSET PHARMACY');
INSERT INTO DAYS VALUES('2021-02-21', 100, 30, 10, 'EVERGREEN PHARMACY');
INSERT INTO DAYS VALUES('2021-02-21', 20, 10, 5, 'SOMERSET HOSPITAL');
INSERT INTO DAYS VALUES('2021-02-21', 0, 0, 0, 'EVERGREEN HOSPITAL');

INSERT INTO DAYS VALUES('2021-03-20', 50, 40, 35, 'Jewish General');
INSERT INTO DAYS VALUES('2021-02-06', 50, 40, 35, 'Jewish General');

INSERT INTO DAYS VALUES('2021-01-01', 50, 40, 35, 'McGill Hospital');
INSERT INTO DAYS VALUES('2021-01-02', 50, 40, 35, 'Montreal Hospital');
INSERT INTO DAYS VALUES('2021-01-03', 50, 40, 35, 'French Hospital');

INSERT INTO DAYS VALUES('2021-01-01', 50, 40, 35, 'Jewish General');
INSERT INTO DAYS VALUES('2021-01-02', 50, 40, 35, 'Jewish General');
INSERT INTO DAYS VALUES('2021-01-03', 50, 40, 35, 'Jewish General');



INSERT INTO SLOT VALUES(1,'3:30PM', '2021-02-21','DUNDER MIFFLIN VACCINE SHOTS LOCATION' );
INSERT INTO SLOT VALUES(2,'3:35PM', '2021-02-21','DUNDER MIFFLIN VACCINE SHOTS LOCATION' );
INSERT INTO SLOT VALUES(4,'3:40PM', '2021-02-21','DUNDER MIFFLIN VACCINE SHOTS LOCATION' );
INSERT INTO SLOT VALUES(4,'3:45PM', '2021-02-21','DUNDER MIFFLIN VACCINE SHOTS LOCATION' );
INSERT INTO SLOT VALUES(6,'3:50PM', '2021-02-21','DUNDER MIFFLIN VACCINE SHOTS LOCATION' );
INSERT INTO SLOT VALUES(6,'3:55PM', '2021-02-21','DUNDER MIFFLIN VACCINE SHOTS LOCATION' );

INSERT INTO SLOT VALUES(1,'3:30PM', '2021-03-20','Jewish General');
INSERT INTO SLOT VALUES(2,'3:30PM', '2021-03-20','Jewish General');
INSERT INTO SLOT VALUES(3,'3:30PM', '2021-03-20','Jewish General');
INSERT INTO SLOT VALUES(4,'3:30PM', '2021-03-20','Jewish General');
INSERT INTO SLOT VALUES(5,'3:30PM', '2021-03-20','Jewish General');

INSERT INTO SLOT VALUES(6,'3:30PM', '2021-02-06','Jewish General');

INSERT INTO SLOT VALUES(1,'3:30PM', '2021-01-01','Jewish General');
INSERT INTO SLOT VALUES(2,'3:30PM', '2021-01-02','Jewish General');
INSERT INTO SLOT VALUES(3,'3:30PM', '2021-01-03','Jewish General');

INSERT INTO SLOT VALUES(1,'3:30PM', '2021-01-03','French Hospital');
INSERT INTO SLOT VALUES(2,'3:30PM', '2021-01-01','McGill Hospital');
INSERT INTO SLOT VALUES(3,'3:30PM', '2021-01-02','Montreal Hospital');



INSERT INTO PERSON_SLOT_ASSIGNMENT VALUES(
    100, '2021-02-18', 1, '3:30PM', '2021-02-21', 'DUNDER MIFFLIN VACCINE SHOTS LOCATION'
);
INSERT INTO PERSON_SLOT_ASSIGNMENT VALUES(
    101, '2021-02-18', 2, '3:35PM', '2021-02-21', 'DUNDER MIFFLIN VACCINE SHOTS LOCATION'
                                         );
INSERT INTO PERSON_SLOT_ASSIGNMENT VALUES(
    106, '2021-02-18', 4, '3:40PM', '2021-02-21', 'DUNDER MIFFLIN VACCINE SHOTS LOCATION'
                                         );
INSERT INTO PERSON_SLOT_ASSIGNMENT VALUES(
    103, '2021-02-18', 4, '3:45PM', '2021-02-21', 'DUNDER MIFFLIN VACCINE SHOTS LOCATION'
                                         );
INSERT INTO PERSON_SLOT_ASSIGNMENT VALUES(
    104, '2021-02-18', 6, '3:50PM', '2021-02-21', 'DUNDER MIFFLIN VACCINE SHOTS LOCATION'
                                         );
INSERT INTO PERSON_SLOT_ASSIGNMENT VALUES(
    105, '2021-02-18', 6, '3:55PM', '2021-02-21', 'DUNDER MIFFLIN VACCINE SHOTS LOCATION'
                                         );
INSERT INTO PERSON_SLOT_ASSIGNMENT VALUES(
    210, '2021-02-18', 6, '3:30PM', '2021-02-06','Jewish General'
                                         );




INSERT INTO PERSON_SLOT_ASSIGNMENT VALUES(
    310, '2020-02-18', 1,'3:30PM', '2021-01-01','Jewish General'
                                         );
INSERT INTO PERSON_SLOT_ASSIGNMENT VALUES(
    320, '2020-02-18',2,'3:30PM', '2021-01-02','Jewish General'
                                         );
INSERT INTO PERSON_SLOT_ASSIGNMENT VALUES(
     350, '2020-02-18', 3,'3:30PM', '2021-01-03','Jewish General'
                                         );


INSERT INTO PERSON_SLOT_ASSIGNMENT VALUES(
         1000, '2020-02-18', 1,'3:30PM', '2021-01-03','French Hospital'
                                         );
INSERT INTO PERSON_SLOT_ASSIGNMENT VALUES(
        1001, '2020-02-18',2,'3:30PM', '2021-01-01','McGill Hospital'
                                         );
INSERT INTO PERSON_SLOT_ASSIGNMENT VALUES(
        1002, '2020-02-18', 3,'3:30PM', '2021-01-02','Montreal Hospital'
                                         );




INSERT INTO HOSPITAL VALUES('EVERGREEN HOSPITAL');
INSERT INTO HOSPITAL VALUES('SOMERSET HOSPITAL');
INSERT INTO HOSPITAL VALUES('DUNDER MIFFLIN  BUFFALO HOSPITAL');
INSERT INTO HOSPITAL VALUES('DUNDER MIFFLIN  SCRANTON HOSPITAL');
INSERT INTO HOSPITAL VALUES('DUNDER MIFFLIN  NASHUA HOSPITAL');
INSERT INTO HOSPITAL VALUES('Jewish General');

INSERT INTO HOSPITAL VALUES('French Hospital');
INSERT INTO HOSPITAL VALUES('McGill Hospital');
INSERT INTO HOSPITAL VALUES('Montreal Hospital');


INSERT INTO NURSE VALUES(1021, 'Carly Stewart','DUNDER MIFFLIN  BUFFALO HOSPITAL');
INSERT INTO NURSE VALUES(1055, 'Sam Kranski','DUNDER MIFFLIN  BUFFALO HOSPITAL');
INSERT INTO NURSE VALUES(1045, 'Freddie Smith','DUNDER MIFFLIN  BUFFALO HOSPITAL');
INSERT INTO NURSE VALUES(1015, 'Josh Mount','SOMERSET HOSPITAL');
INSERT INTO NURSE VALUES(1014, 'Drake Mount','SOMERSET HOSPITAL');

INSERT INTO NURSE VALUES(1012, 'Kate Kurt','Jewish General');
INSERT INTO NURSE VALUES(1043, 'Demi Lovato','Jewish General');
INSERT INTO NURSE VALUES(1064, 'Semi Loverto','Jewish General');
INSERT INTO NURSE VALUES(1075, 'Chemi Lolango','Jewish General');


INSERT INTO NURSE VALUES(7890, 'Hardwell Drock','McGill Hospital');
INSERT INTO NURSE VALUES(7891, 'Lost Frequency','French Hospital');
INSERT INTO NURSE VALUES(8799, 'Martin Gary','Montreal Hospital');





INSERT INTO ASSIGN_NURSE_DATE VALUES(1021,'2021-02-21','DUNDER MIFFLIN VACCINE SHOTS LOCATION');
INSERT INTO ASSIGN_NURSE_DATE VALUES(1055,'2021-02-21','DUNDER MIFFLIN VACCINE SHOTS LOCATION');
INSERT INTO ASSIGN_NURSE_DATE VALUES(1045,'2021-02-21','DUNDER MIFFLIN VACCINE SHOTS LOCATION');
INSERT INTO ASSIGN_NURSE_DATE VALUES(1015,'2021-02-21','DUNDER MIFFLIN VACCINE SHOTS LOCATION');
INSERT INTO ASSIGN_NURSE_DATE VALUES(1014,'2021-02-21','DUNDER MIFFLIN VACCINE SHOTS LOCATION');

INSERT INTO ASSIGN_NURSE_DATE VALUES(1012,'2021-01-01','Jewish General');
INSERT INTO ASSIGN_NURSE_DATE VALUES(1043,'2021-01-01','Jewish General');
INSERT INTO ASSIGN_NURSE_DATE VALUES(1064,'2021-01-01','Jewish General');
INSERT INTO ASSIGN_NURSE_DATE VALUES(1075,'2021-01-01','Jewish General');
INSERT INTO ASSIGN_NURSE_DATE VALUES(7890,'2021-01-01','McGill Hospital');

INSERT INTO ASSIGN_NURSE_DATE VALUES(7891,'2021-01-03','French Hospital');
INSERT INTO ASSIGN_NURSE_DATE VALUES(8799,'2021-01-02','Montreal Hospital');



INSERT INTO SLOT_ADMINISTER_BY_NURSE VALUES(
            1,'3:30PM', '2021-02-21','DUNDER MIFFLIN VACCINE SHOTS LOCATION', 1021
                                           );
INSERT INTO SLOT_ADMINISTER_BY_NURSE VALUES(
            2,'3:35PM', '2021-02-21','DUNDER MIFFLIN VACCINE SHOTS LOCATION', 1055
                                          );
INSERT INTO SLOT_ADMINISTER_BY_NURSE VALUES(
            4,'3:40PM', '2021-02-21','DUNDER MIFFLIN VACCINE SHOTS LOCATION', 1045
                                          );
INSERT INTO SLOT_ADMINISTER_BY_NURSE VALUES(
            6,'3:50PM', '2021-02-21','DUNDER MIFFLIN VACCINE SHOTS LOCATION', 1015
                                          );
INSERT INTO SLOT_ADMINISTER_BY_NURSE VALUES(
            6,'3:55PM', '2021-02-21','DUNDER MIFFLIN VACCINE SHOTS LOCATION', 1015
                                          );

INSERT INTO SLOT_ADMINISTER_BY_NURSE VALUES(
            1,'3:30PM', '2021-03-20','Jewish General', 1012
                                           );
INSERT INTO SLOT_ADMINISTER_BY_NURSE VALUES(
        2,'3:30PM', '2021-03-20','Jewish General', 1043
                                           );
INSERT INTO SLOT_ADMINISTER_BY_NURSE VALUES(
            3,'3:30PM', '2021-03-20','Jewish General', 1064
                                           );
INSERT INTO SLOT_ADMINISTER_BY_NURSE VALUES(
         4,'3:30PM', '2021-03-20','Jewish General', 1075
                                           );
INSERT INTO SLOT_ADMINISTER_BY_NURSE VALUES(
     5,'3:30PM', '2021-03-20','Jewish General', 7891
                                           );

INSERT INTO SLOT_ADMINISTER_BY_NURSE VALUES(
                2,'3:30PM', '2021-01-01','McGill Hospital', 7890
                                           );
INSERT INTO SLOT_ADMINISTER_BY_NURSE VALUES(
            3,'3:30PM', '2021-01-02','Montreal Hospital', 8799
                                           );




INSERT INTO VACCINE VALUES(
            'Moderna', 1, 0);
INSERT INTO VACCINE VALUES(
            'Pfizer-BioNTec', 2, 30);
INSERT INTO VACCINE VALUES(
            'Oxford-AstraZenca', 1, 0);
INSERT INTO VACCINE VALUES(
            'EpiVacCorona', 1, 0);
INSERT INTO VACCINE VALUES(
                'BBV152', 1, 0);

INSERT INTO BATCH VALUES(
        10, '2020-12-31', '2022-12-31', 'SOMERSET PHARMACY', 'Moderna'
                        );
INSERT INTO BATCH VALUES(
        10, '2020-12-31', '2022-12-31', 'EVERGREEN PHARMACY', 'Pfizer-BioNTec'
                        );
INSERT INTO BATCH VALUES(
        10, '2020-12-31', '2022-12-31', 'SOMERSET PHARMACY', 'Oxford-AstraZenca'
                        );
INSERT INTO BATCH VALUES(
        10, '2020-12-31', '2022-12-31', 'SOMERSET PHARMACY', 'EpiVacCorona'
                        );
INSERT INTO BATCH VALUES(
     10, '2020-12-31', '2022-12-31', 'SOMERSET PHARMACY', 'BBV152'
                        );
INSERT INTO BATCH VALUES(
                            11, '2020-12-31', '2022-12-31', 'DUNDER MIFFLIN VACCINE SHOTS LOCATION', 'Moderna'
                        );
INSERT INTO BATCH VALUES(
                            12, '2020-12-31', '2022-12-31', 'DUNDER MIFFLIN VACCINE SHOTS LOCATION', 'Moderna'
                        );
INSERT INTO BATCH VALUES(
                            13, '2020-12-31', '2022-12-31', 'DUNDER MIFFLIN VACCINE SHOTS LOCATION', 'Moderna'
                        );
INSERT INTO BATCH VALUES(
                            14, '2020-12-31', '2022-12-31', 'DUNDER MIFFLIN VACCINE SHOTS LOCATION', 'Moderna'
                        );
INSERT INTO BATCH VALUES(
                            15, '2020-12-31', '2022-12-31', 'DUNDER MIFFLIN VACCINE SHOTS LOCATION', 'Moderna'
                        );
INSERT INTO BATCH VALUES(
                            16, '2020-12-31', '2022-12-31', 'Jewish General', 'Moderna'
                        );
INSERT INTO BATCH VALUES(
                            17, '2020-12-31', '2022-12-31', 'Jewish General', 'Moderna'
                        );

INSERT INTO BATCH VALUES(
                            100, '2020-12-31', '2022-12-31', 'Jewish General', 'Pfizer-BioNTec'
                        );
INSERT INTO BATCH VALUES(
                            101, '2020-12-31', '2022-12-31', 'Jewish General', 'Pfizer-BioNTec'
                        );
INSERT INTO BATCH VALUES(
                            102, '2020-12-31', '2022-12-31', 'Jewish General', 'Pfizer-BioNTec'
                        );


INSERT INTO BATCH VALUES(
                            1022, '2020-12-31', '2022-12-31', 'Montreal Hospital', 'Pfizer-BioNTec'
                        );
INSERT INTO BATCH VALUES(
                            10222, '2020-12-31', '2022-12-31', 'McGill Hospital', 'Pfizer-BioNTec'
                        );
INSERT INTO BATCH VALUES(
                            102222, '2020-12-31', '2022-12-31', 'Montreal Hospital', 'Pfizer-BioNTec'
                        );
INSERT INTO BATCH VALUES(
                            1022222, '2020-12-31', '2022-12-31', 'French Hospital', 'Pfizer-BioNTec'
                        );








INSERT INTO VIAL VALUES(
       10, 1,'3:30PM', '2021-02-21','DUNDER MIFFLIN VACCINE SHOTS LOCATION', 11, 'Moderna'
                       );
INSERT INTO VIAL VALUES(
        11, 2,'3:35PM', '2021-02-21','DUNDER MIFFLIN VACCINE SHOTS LOCATION', 12, 'Moderna'
                       );
INSERT INTO VIAL VALUES(
        12, 4,'3:40PM', '2021-02-21','DUNDER MIFFLIN VACCINE SHOTS LOCATION', 13, 'Moderna'
                       );
INSERT INTO VIAL VALUES(
        13, 6,'3:50PM', '2021-02-21','DUNDER MIFFLIN VACCINE SHOTS LOCATION', 14, 'Moderna'
                       );
INSERT INTO VIAL VALUES(
        14, 6,'3:55PM', '2021-02-21','DUNDER MIFFLIN VACCINE SHOTS LOCATION', 15, 'Moderna'
                       );


INSERT INTO VIAL VALUES(
        22, 5,'3:30PM', '2021-03-20','Jewish General', 16, 'Moderna'
                       );
INSERT INTO VIAL VALUES(
        33, 6,'3:30PM', '2021-02-06','Jewish General', 17, 'Moderna'
                       );

INSERT INTO VIAL VALUES(
        1, 1,'3:30PM', '2021-01-01','Jewish General', 100, 'Pfizer-BioNTec'
                       );
INSERT INTO VIAL VALUES(
        2, 2,'3:30PM', '2021-01-02','Jewish General', 101, 'Pfizer-BioNTec'
                       );
INSERT INTO VIAL VALUES(
         3, 3,'3:30PM', '2021-01-03','Jewish General', 102, 'Pfizer-BioNTec'
                       );

INSERT INTO VIAL VALUES(
                           1, 1,'3:30PM', '2021-01-03','French Hospital', 1022222, 'Pfizer-BioNTec'
                       );
INSERT INTO VIAL VALUES(
                           2, 2,'3:30PM', '2021-01-01','McGill Hospital', 10222, 'Pfizer-BioNTec'
                       );
INSERT INTO VIAL VALUES(
                           3, 3,'3:30PM', '2021-01-02','Montreal Hospital', 1022, 'Pfizer-BioNTec'
                       );

