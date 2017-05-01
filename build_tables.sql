/*
Users Table
*/
CREATE TABLE users OF USER_TYPE (
  CONSTRAINT user_userID_pk PRIMARY KEY (userID)
);

/*
locations table
*/
CREATE TABLE locations OF LOCATION_TYPE (
  CONSTRAINT loc_locID_pk PRIMARY KEY (locID)
);


/*
Departments table
*/
CREATE TABLE departments OF DEPARTMENT_TYPE (
  CONSTRAINT dep_deptID_pk PRIMARY KEY (deptID)
);


/*
Devices Table (holds different device types
*/
CREATE TABLE devices OF DEVICE_TYPE (
  CONSTRAINT dev_serialNum_pk PRIMARY KEY (serialNum)
);


CREATE TABLE assigned_dev_loc (
  location  REF LOCATION_TYPE,
  device    REF DEVICE_TYPE
);

CREATE TABLE assigned_dev_usr (
  assnd_usr      REF USER_TYPE,
  device    REF DEVICE_TYPE
);


/*
PO system table
-- dark magic nested table stuff
*/
CREATE TABLE purchases OF PURCHASE_ORDER_TYPE (
  CONSTRAINT Pur_poNum_pk PRIMARY KEY (poNum)
)
/* Notice that this creates a nested table with the DeviceListType */
OBJECT IDENTIFIER IS PRIMARY KEY
  NESTED TABLE devices_bought
  STORE AS deviceListStorageTable((PRIMARY KEY (nested_table_id, serialNum))
  ORGANIZATION INDEX COMPRESS
  )
  RETURN AS LOCATOR;