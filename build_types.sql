--
-- SIMPLE BASE TYPES
-- these are just the small building blocks of other things
--
-- phone number type
CREATE OR REPLACE TYPE PHONE_NUM_TYPE AS OBJECT (
  areaCode CHAR(3),
  teleNum  CHAR(7)
);
-- Address Type
CREATE OR REPLACE TYPE ADDRESS_TYPE AS OBJECT (
  street VARCHAR2(50),
  city   VARCHAR2(15),
  state  CHAR(2),
  zip    VARCHAR2(10)
);




-- PRIMARY Types
--
--
-- USER type
CREATE OR REPLACE TYPE USER_TYPE AS OBJECT (
  userID     NUMBER(5),
  firstName  VARCHAR2(15),
  lastName   VARCHAR2(20),
  email      VARCHAR2(30),
  phone      PHONE_NUM_TYPE,
  address    ADDRESS_TYPE,
  start_date DATE
)
INSTANTIABLE
FINAL;
--
--


--
-- Location Type
CREATE OR REPLACE TYPE LOCATION_TYPE AS OBJECT (
  locID   CHAR(3),
  room    VARCHAR2(20),
  address ADDRESS_TYPE
)
INSTANTIABLE
FINAL;


--
--
-- DEPARTMENT type
CREATE OR REPLACE TYPE DEPARTMENT_TYPE AS OBJECT (
  deptID   VARCHAR2(15),
  deptName VARCHAR2(35),
  phone    PHONE_NUM_TYPE
)
INSTANTIABLE
FINAL;
--
--


--
-- DEVICES
--
--
-- Plain device type
CREATE OR REPLACE TYPE DEVICE_TYPE AS OBJECT (
  serialNum VARCHAR2(25),
  brand     VARCHAR2(30),
  mfct_date DATE
)
INSTANTIABLE
NOT FINAL; /* Not final so that others can inherit */


/* NOT USABLE -- IGNORE */
-- CREATE TYPE BODY DEVICE_TYPE AS
--   STATIC FUNCTION new_device(dev DEVICE_TYPE, tab_name VARCHAR2, schm_name VARCHAR2)
--     RETURN REF DEVICE_TYPE
--   IS
--     sqlstmt VARCHAR2(100);
--     BEGIN
--       sqlstmt := 'INSERT INTO ' || schm_name || '.' || tab_name || ' VALUES (DEVICE_TYPE(:1))';
--       EXECUTE IMMEDIATE sqlstmt USING dev;
--       SELECT REF(x) d
--       FROM tab_name x
--       WHERE x.serialNum = dev.serialNum;
--       RETURN d;
--     END;


--
-- TABLETS AND PHONES
CREATE OR REPLACE TYPE TABLET_TYPE UNDER DEVICE_TYPE (
  carrier VARCHAR2(20),
  mac_add VARCHAR2(12)
)
INSTANTIABLE
FINAL;
--
-- PRINTERS
CREATE OR REPLACE TYPE PRINTER_TYPE UNDER DEVICE_TYPE (
  mac_add VARCHAR2(12)
)
INSTANTIABLE
FINAL;
--
-- COMPUTERS
CREATE OR REPLACE TYPE COMPUTER_TYPE UNDER DEVICE_TYPE (
  mac_add   VARCHAR2(12),
  cpu_count NUMBER(2)
)
INSTANTIABLE
NOT FINAL;
--
-- COMPUTERS:  LAPTOPS
CREATE OR REPLACE TYPE LAPTOP_TYPE UNDER COMPUTER_TYPE (
  screen_size NUMBER(2)
)
INSTANTIABLE
NOT FINAL;


-- ----------------------------------------------------------
-- CREATING PO structure
--
-- First create a DeviceListType (table of devices)
CREATE OR REPLACE TYPE DEVICE_LIST_TYPE AS TABLE OF DEVICE_TYPE;


-- THEN create the purchaseOrder Type
CREATE OR REPLACE TYPE PURCHASE_ORDER_TYPE AS OBJECT (
  poNum          VARCHAR2(10),
  boughtBy       REF DEPARTMENT_TYPE,
  devices_bought DEVICE_LIST_TYPE
)
INSTANTIABLE
NOT FINAL;

