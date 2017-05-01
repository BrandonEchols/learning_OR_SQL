/* Users example */
SELECT
  u.FIRSTNAME AS "First Name",
  u.LASTNAME  AS "Last Name",
  u.EMAIL as "Email",
  CONCAT(u.PHONE.areaCode, u.PHONE.teleNum) as "Phone",
  u.ADDRESS.street as "Street",
  u.ADDRESS.city as "City",
  u.ADDRESS.state as "State",
  u.ADDRESS.zip as "Zip"
FROM USERS u;



SELECT
  p.PONUM,
  TREAT(deref(p.BOUGHTBY) AS DEPARTMENT_TYPE).deptID AS department,
  d.*
FROM purchases p, TABLE (p.DEVICES_BOUGHT) d;

--Look up a user based on the card that they scanned in which gives the userId
SELECT * FROM USERS WHERE USERID = 1006;

--Update the address for a location in the system
UPDATE LOCATIONS SET ADDRESS = ADDRESS_TYPE('1234 Paradise Way', 'Orem', 'UT', '84604') WHERE LOCID = '400';

--Find out if the device sitting in front of you is already in the system
SELECT * FROM DEVICES WHERE SERIALNUM = 'DDD23SSSE203';

--Get a list of all Laptops in the system
SELECT * FROM DEVICES WHERE type
