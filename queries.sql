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