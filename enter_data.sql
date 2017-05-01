INSERT INTO USERS VALUES (1004, 'Dallin', 'Coolbanks', 'neato@g-unit.com', PHONE_NUM_TYPE('801', '223342'),
                          ADDRESS_TYPE('1234 Neat St', 'Alpine', 'UT', '84004'), TO_DATE('1999-10-10', 'YYYY-MM-DD'));
INSERT INTO USERS VALUES (1006, 'Geraldine', 'Fastcars', 'jackson4@tbone.com', PHONE_NUM_TYPE('801', '229987'),
                          ADDRESS_TYPE('45 West Ave.', 'Provo', 'UT', '84604'), TO_DATE('1966-01-22', 'YYYY-MM-DD'));
INSERT INTO USERS VALUES (1008, 'Pendalton', 'Gatsby', 'asciiNow@duude.com', PHONE_NUM_TYPE('801', '112334'),
                          ADDRESS_TYPE('666 Devils Rd.', 'SLC', 'UT', '84002'), TO_DATE('1981-05-10', 'YYYY-MM-DD'));


INSERT INTO departments VALUES (DEPARTMENT_TYPE('HR', 'Human Resources', PHONE_NUM_TYPE('801', '8883322')));
INSERT INTO departments VALUES (DEPARTMENT_TYPE('PR', 'Public Relations', PHONE_NUM_TYPE('801', '8883133')));
INSERT INTO departments VALUES (DEPARTMENT_TYPE('EMP', 'Employee Resources', PHONE_NUM_TYPE('801', '8883342')));
INSERT INTO departments VALUES (DEPARTMENT_TYPE('STU', 'Student Resources', PHONE_NUM_TYPE('801', '8883567')));


INSERT INTO LOCATIONS VALUES ('100', 'D105', ADDRESS_TYPE('554 East St.', 'Provo', 'UT', '84604'));
INSERT INTO LOCATIONS VALUES ('200', 'A303', ADDRESS_TYPE('22 Juniper Ln.', 'Provo', 'UT', '84604'));
INSERT INTO LOCATIONS VALUES ('400', 'Library', ADDRESS_TYPE('68 Cranston Ave', 'Provo', 'UT', '84604'));
INSERT INTO LOCATIONS VALUES ('700', '10', ADDRESS_TYPE('45 Denver Ave', 'Provo', 'UT', '84604'));


INSERT INTO DEVICES
VALUES (TABLET_TYPE('DDD233DWW001', 'Samsung', TO_DATE('2010-10-10', 'YYYY-MM-DD'), 'Verizon', 'EE3345D3F0S2'));
INSERT INTO DEVICES
VALUES (TABLET_TYPE('DDD23SSSE203', 'Samsung', TO_DATE('2016-04-01', 'YYYY-MM-DD'), 'Sprint', 'EE3345D3D3L0'));
INSERT INTO DEVICES
VALUES (LAPTOP_TYPE('EQ000333XW', 'HP', TO_DATE('1999-04-05', 'YYYY-MM-DD'), 'XXP345D3F0Q2', 3, 13));
INSERT INTO DEVICES
VALUES (LAPTOP_TYPE('EQ000355CQ', 'HP', TO_DATE('2013-01-01', 'YYYY-MM-DD'), 'XXP343DBV0DW', 3, 15));
INSERT INTO DEVICES VALUES (COMPUTER_TYPE('WN000DEG3', 'Acer', TO_DATE('2007-01-01', 'YYYY-MM-DD'), 'DGGGCC6666DD', 3));
INSERT INTO DEVICES VALUES (COMPUTER_TYPE('WN000DEE1', 'Acer', TO_DATE('2009-01-01', 'YYYY-MM-DD'), 'PJH665544DDS', 1));
INSERT INTO DEVICES VALUES (PRINTER_TYPE('EFF1234', 'Canon', TO_DATE('1989-10-01', 'YYYY-MM-DD'), 'EE3489FE1P9H'));


/*
INSERTION TO PO: PO23456
*/

DELETE from PURCHASES WHERE PONUM='PO23456';

INSERT INTO purchases VALUES ('PO23456', (SELECT REF(d)
                                          FROM departments d
                                          WHERE deptID = 'HR'), DEVICE_LIST_TYPE());
/* This is sort of cheating. I COULD NOT get the reference to the other object working right so I just
hard coded the values from one of the existing devices in */
INSERT INTO TABLE (SELECT p.devices_bought
                   FROM purchases p
                   WHERE poNum = 'PO23456')
VALUES ('DDD233DWW001', 'Samsung', TO_DATE('2010-10-10', 'YYYY-MM-DD'));

INSERT INTO TABLE (SELECT p.devices_bought
                   FROM purchases p
                   WHERE poNum = 'PO23456')
VALUES ('WN000DEG3', 'Acer', TO_DATE('2007-01-01', 'YYYY-MM-DD'));


/*
INSERTION TO PO: PO23442
*/
INSERT INTO purchases VALUES ('PO23442', (SELECT REF(d)
                                          FROM departments d
                                          WHERE deptID = 'EMP'), DEVICE_LIST_TYPE());
INSERT INTO TABLE (SELECT p.devices_bought
                   FROM purchases p
                   WHERE poNum = 'PO23442')
VALUES ('WN000DEE1', 'Acer', TO_DATE('2009-01-01', 'YYYY-MM-DD'));
INSERT INTO TABLE (SELECT p.devices_bought
                   FROM purchases p
                   WHERE poNum = 'PO23442')
VALUES ('EFF1234', 'Canon', TO_DATE('1989-10-01', 'YYYY-MM-DD'));



