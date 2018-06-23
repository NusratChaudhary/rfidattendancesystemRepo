--------------------------------------------------------
--  File created - Sunday-June-24-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ADMIN
--------------------------------------------------------

  CREATE TABLE "HR"."ADMIN" 
   (	"USERNAME" VARCHAR2(20 BYTE), 
	"PASSWORD" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ATTENDENCE
--------------------------------------------------------

  CREATE TABLE "HR"."ATTENDENCE" 
   (	"ATTENDENCEID" NUMBER(*,0), 
	"RFIDNUMBER" NUMBER(*,0), 
	"CHECKIN" TIMESTAMP (6), 
	"CHECKOUT" TIMESTAMP (6), 
	"FLAG" VARCHAR2(100 BYTE), 
	"CREATIONDATE" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BROADCAST
--------------------------------------------------------

  CREATE TABLE "HR"."BROADCAST" 
   (	"ID" NUMBER, 
	"MESSAGE" VARCHAR2(1000 BYTE), 
	"BROADCASTTYPE" VARCHAR2(50 BYTE), 
	"FLAG" VARCHAR2(50 BYTE), 
	"DATETIME" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BROADCASTEMPLOYEEMAPPER
--------------------------------------------------------

  CREATE TABLE "HR"."BROADCASTEMPLOYEEMAPPER" 
   (	"ID" NUMBER, 
	"EMPLOYEEID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CUSTOMER
--------------------------------------------------------

  CREATE TABLE "HR"."CUSTOMER" 
   (	"NAME" VARCHAR2(20 BYTE), 
	"GENDER" VARCHAR2(20 BYTE), 
	"PHONENUMBER" NUMBER(20,0), 
	"EMAIL" VARCHAR2(20 BYTE), 
	"DOB" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DEPARTMENT
--------------------------------------------------------

  CREATE TABLE "HR"."DEPARTMENT" 
   (	"DEPTID" NUMBER(*,0), 
	"DEPTNAME" VARCHAR2(80 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table EMPLOYEES
--------------------------------------------------------

  CREATE TABLE "HR"."EMPLOYEES" 
   (	"EMPLOYEEID" NUMBER(*,0), 
	"FIRSTNAME" VARCHAR2(25 BYTE), 
	"LASTNAME" VARCHAR2(20 BYTE), 
	"GENDER" VARCHAR2(10 BYTE), 
	"PHONENUMBER" VARCHAR2(30 BYTE), 
	"EMAIL" VARCHAR2(30 BYTE), 
	"ADDRESS" VARCHAR2(100 BYTE), 
	"PASSWORD" VARCHAR2(20 BYTE), 
	"DOB" DATE, 
	"FLAG" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table HOLIDAY
--------------------------------------------------------

  CREATE TABLE "HR"."HOLIDAY" 
   (	"HOLIDAYID" NUMBER(*,0), 
	"EMPLOYEEID" NUMBER(*,0), 
	"REASON" VARCHAR2(500 BYTE), 
	"STARTDATE" DATE, 
	"ENDDATE" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table HR
--------------------------------------------------------

  CREATE TABLE "HR"."HR" 
   (	"EMAIL" VARCHAR2(50 BYTE), 
	"PASSWORD" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MAILSERVICE
--------------------------------------------------------

  CREATE TABLE "HR"."MAILSERVICE" 
   (	"RECIEVER" VARCHAR2(20 BYTE), 
	"SUBJECT" VARCHAR2(100 BYTE), 
	"CONTEXT" VARCHAR2(500 BYTE), 
	"TIME" TIMESTAMP (6)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MESSAGES
--------------------------------------------------------

  CREATE TABLE "HR"."MESSAGES" 
   (	"MESSSAGEID" NUMBER(*,0), 
	"CONTEXT" VARCHAR2(500 BYTE), 
	"TYPE" VARCHAR2(20 BYTE), 
	"TIME" TIMESTAMP (6)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REQUEST
--------------------------------------------------------

  CREATE TABLE "HR"."REQUEST" 
   (	"REQUESTID" NUMBER, 
	"REQUESTSUBJECT" VARCHAR2(300 BYTE), 
	"REQUESTBODY" VARCHAR2(2000 BYTE), 
	"REQUESTREPLY" VARCHAR2(2000 BYTE), 
	"EMPLOYEEID" NUMBER, 
	"ADMINSTATUS" NUMBER, 
	"DATETIME" TIMESTAMP (6), 
	"FLAG" VARCHAR2(50 BYTE), 
	"REPLYDATETIME" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table RFID
--------------------------------------------------------

  CREATE TABLE "HR"."RFID" 
   (	"RFIDNUMBER" NUMBER(*,0), 
	"EMPLOYEEID" NUMBER(*,0), 
	"IMAGE" BLOB, 
	"FLAG" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("IMAGE") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table RFIDCARDS
--------------------------------------------------------

  CREATE TABLE "HR"."RFIDCARDS" 
   (	"ID" NUMBER, 
	"FLAG" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SALARY
--------------------------------------------------------

  CREATE TABLE "HR"."SALARY" 
   (	"EMPLOYEEID" NUMBER(*,0), 
	"AMOUNT" FLOAT(126), 
	"DEPTID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TRIGGR
--------------------------------------------------------

  CREATE TABLE "HR"."TRIGGR" 
   (	"TIME" TIMESTAMP (6), 
	"TASK" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table VERIFICATION
--------------------------------------------------------

  CREATE TABLE "HR"."VERIFICATION" 
   (	"ID" NUMBER(*,0), 
	"CODE" VARCHAR2(300 BYTE), 
	"REFERENCEID" NUMBER, 
	"WORK" VARCHAR2(50 BYTE), 
	"FLAG" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into HR.ADMIN
SET DEFINE OFF;
Insert into HR.ADMIN (USERNAME,PASSWORD) values ('admin','admin');
REM INSERTING into HR.ATTENDENCE
SET DEFINE OFF;
Insert into HR.ATTENDENCE (ATTENDENCEID,RFIDNUMBER,CHECKIN,CHECKOUT,FLAG,CREATIONDATE) values (1956896220,9051449,to_timestamp('20-05-18 04:17:36.000000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),to_timestamp('20-05-18 04:18:22.000000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),'out',to_timestamp('20-05-18 04:18:10.000000000 AM','DD-MM-RR HH12:MI:SSXFF AM'));
REM INSERTING into HR.BROADCAST
SET DEFINE OFF;
Insert into HR.BROADCAST (ID,MESSAGE,BROADCASTTYPE,FLAG,DATETIME) values (1659710737,'ghjkljhgf','broadcast_mode','broadcast_active',to_timestamp('14-06-18 08:03:08.017000000 PM','DD-MM-RR HH12:MI:SSXFF AM'));
Insert into HR.BROADCAST (ID,MESSAGE,BROADCASTTYPE,FLAG,DATETIME) values (110609273,'dfghj','broadcast_mode','broadcast_active',to_timestamp('14-06-18 08:05:44.656000000 PM','DD-MM-RR HH12:MI:SSXFF AM'));
Insert into HR.BROADCAST (ID,MESSAGE,BROADCASTTYPE,FLAG,DATETIME) values (1550031842,'dfghjhgbbh','broadcast_mode','broadcast_active',to_timestamp('14-06-18 08:05:52.822000000 PM','DD-MM-RR HH12:MI:SSXFF AM'));
Insert into HR.BROADCAST (ID,MESSAGE,BROADCASTTYPE,FLAG,DATETIME) values (1688167605,'sdfghjk,.','broadcast_mode','broadcast_active',to_timestamp('14-06-18 08:04:52.601000000 PM','DD-MM-RR HH12:MI:SSXFF AM'));
Insert into HR.BROADCAST (ID,MESSAGE,BROADCASTTYPE,FLAG,DATETIME) values (2099514417,'dfghjhgbbhytgh','broadcast_mode','broadcast_active',to_timestamp('14-06-18 08:05:58.390000000 PM','DD-MM-RR HH12:MI:SSXFF AM'));
Insert into HR.BROADCAST (ID,MESSAGE,BROADCASTTYPE,FLAG,DATETIME) values (1811270355,'sdf','broadcast_mode','broadcast_active',to_timestamp('14-06-18 08:04:37.448000000 PM','DD-MM-RR HH12:MI:SSXFF AM'));
Insert into HR.BROADCAST (ID,MESSAGE,BROADCASTTYPE,FLAG,DATETIME) values (1398659510,'test','broadcast_mode','broadcast_active',to_timestamp('14-06-18 08:02:41.773000000 PM','DD-MM-RR HH12:MI:SSXFF AM'));
Insert into HR.BROADCAST (ID,MESSAGE,BROADCASTTYPE,FLAG,DATETIME) values (936804634,'sdfg','broadcast_mode','broadcast_active',to_timestamp('14-06-18 08:04:14.585000000 PM','DD-MM-RR HH12:MI:SSXFF AM'));
Insert into HR.BROADCAST (ID,MESSAGE,BROADCASTTYPE,FLAG,DATETIME) values (674729376,'sdfghjk,.gv','broadcast_mode','broadcast_active',to_timestamp('14-06-18 08:05:18.498000000 PM','DD-MM-RR HH12:MI:SSXFF AM'));
Insert into HR.BROADCAST (ID,MESSAGE,BROADCASTTYPE,FLAG,DATETIME) values (2082815394,'sdfghjk,.gv','broadcast_mode','broadcast_active',to_timestamp('14-06-18 08:05:33.039000000 PM','DD-MM-RR HH12:MI:SSXFF AM'));
REM INSERTING into HR.BROADCASTEMPLOYEEMAPPER
SET DEFINE OFF;
REM INSERTING into HR.CUSTOMER
SET DEFINE OFF;
Insert into HR.CUSTOMER (NAME,GENDER,PHONENUMBER,EMAIL,DOB) values ('Mohnish Anjaria','Male',9969742702,'anjariamohnish','04/11/1996');
Insert into HR.CUSTOMER (NAME,GENDER,PHONENUMBER,EMAIL,DOB) values ('Bhaumik Shah','Male',9969742703,'shahbhaumik','02/10/1995');
Insert into HR.CUSTOMER (NAME,GENDER,PHONENUMBER,EMAIL,DOB) values ('Ajinkya Pawar','Male',9969742704,'pawarajinkya','24/11/1997');
REM INSERTING into HR.DEPARTMENT
SET DEFINE OFF;
Insert into HR.DEPARTMENT (DEPTID,DEPTNAME) values (1,'Production');
Insert into HR.DEPARTMENT (DEPTID,DEPTNAME) values (3,'Purchase');
Insert into HR.DEPARTMENT (DEPTID,DEPTNAME) values (4,'Marketing');
Insert into HR.DEPARTMENT (DEPTID,DEPTNAME) values (6,'IT');
Insert into HR.DEPARTMENT (DEPTID,DEPTNAME) values (2,'Research and Development');
Insert into HR.DEPARTMENT (DEPTID,DEPTNAME) values (5,'Accounting and Finance');
REM INSERTING into HR.EMPLOYEES
SET DEFINE OFF;
Insert into HR.EMPLOYEES (EMPLOYEEID,FIRSTNAME,LASTNAME,GENDER,PHONENUMBER,EMAIL,ADDRESS,PASSWORD,DOB,FLAG) values (1015584988,'Mohnish','Anjaria','male','9969742702','anjariamohnish@gmail.com','401/A,Neumec Heights ,Shraddhanand Road Vile Parle East','pass123',to_date('04-11-96','DD-MM-RR'),'user_active');
Insert into HR.EMPLOYEES (EMPLOYEEID,FIRSTNAME,LASTNAME,GENDER,PHONENUMBER,EMAIL,ADDRESS,PASSWORD,DOB,FLAG) values (444921366,'Priyanka','Varma','female','8655441903','mohnishanjaria@gmail.com','Royal Apts ,Hanuman Road,Vile Parle East Mumbai ','pass123',to_date('28-02-95','DD-MM-RR'),'user_active');
Insert into HR.EMPLOYEES (EMPLOYEEID,FIRSTNAME,LASTNAME,GENDER,PHONENUMBER,EMAIL,ADDRESS,PASSWORD,DOB,FLAG) values (959711844,'Prashant','Godavale','male','9172400740','mohnishbackup@gmail.com','Shastri Nagar Vile Parle West Mumbai','pass123',to_date('08-08-96','DD-MM-RR'),'user_active');
REM INSERTING into HR.HOLIDAY
SET DEFINE OFF;
REM INSERTING into HR.HR
SET DEFINE OFF;
Insert into HR.HR (EMAIL,PASSWORD) values ('anjariamohnish@gmail.com','pass123');
REM INSERTING into HR.MAILSERVICE
SET DEFINE OFF;
REM INSERTING into HR.MESSAGES
SET DEFINE OFF;
REM INSERTING into HR.REQUEST
SET DEFINE OFF;
Insert into HR.REQUEST (REQUESTID,REQUESTSUBJECT,REQUESTBODY,REQUESTREPLY,EMPLOYEEID,ADMINSTATUS,DATETIME,FLAG,REPLYDATETIME) values (1,'sub','body','testreply',1015584988,1,to_timestamp('02-06-18 12:25:51.199000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),'request_responded',to_timestamp('06-06-18 07:42:52.680000000 PM','DD-MM-RR HH12:MI:SSXFF AM'));
Insert into HR.REQUEST (REQUESTID,REQUESTSUBJECT,REQUESTBODY,REQUESTREPLY,EMPLOYEEID,ADMINSTATUS,DATETIME,FLAG,REPLYDATETIME) values (2,'sub2','body2','body2 reply',1015584988,0,to_timestamp('02-06-18 03:56:04.405000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),'request_responded',to_timestamp('07-06-18 07:34:27.157000000 PM','DD-MM-RR HH12:MI:SSXFF AM'));
Insert into HR.REQUEST (REQUESTID,REQUESTSUBJECT,REQUESTBODY,REQUESTREPLY,EMPLOYEEID,ADMINSTATUS,DATETIME,FLAG,REPLYDATETIME) values (3,'sub3','body3','body 3 reply',1015584988,0,to_timestamp('02-06-18 03:59:02.573000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),'request_responded',to_timestamp('07-06-18 07:36:14.205000000 PM','DD-MM-RR HH12:MI:SSXFF AM'));
Insert into HR.REQUEST (REQUESTID,REQUESTSUBJECT,REQUESTBODY,REQUESTREPLY,EMPLOYEEID,ADMINSTATUS,DATETIME,FLAG,REPLYDATETIME) values (4,'sub4','body4','body4',1015584988,0,to_timestamp('02-06-18 04:00:22.227000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),'request_responded',to_timestamp('07-06-18 07:37:46.198000000 PM','DD-MM-RR HH12:MI:SSXFF AM'));
Insert into HR.REQUEST (REQUESTID,REQUESTSUBJECT,REQUESTBODY,REQUESTREPLY,EMPLOYEEID,ADMINSTATUS,DATETIME,FLAG,REPLYDATETIME) values (5,'sub5','body5','body5 reply',1015584988,0,to_timestamp('02-06-18 04:43:28.228000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),'request_responded',to_timestamp('07-06-18 07:37:16.776000000 PM','DD-MM-RR HH12:MI:SSXFF AM'));
Insert into HR.REQUEST (REQUESTID,REQUESTSUBJECT,REQUESTBODY,REQUESTREPLY,EMPLOYEEID,ADMINSTATUS,DATETIME,FLAG,REPLYDATETIME) values (6,'sub6','body6','body 6 reply',1015584988,0,to_timestamp('02-06-18 04:44:25.028000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),'request_responded',to_timestamp('07-06-18 07:32:25.103000000 PM','DD-MM-RR HH12:MI:SSXFF AM'));
REM INSERTING into HR.RFID
SET DEFINE OFF;
Insert into HR.RFID (RFIDNUMBER,EMPLOYEEID,FLAG) values (9051449,1015584988,'rfid_active');
Insert into HR.RFID (RFIDNUMBER,EMPLOYEEID,FLAG) values (8262116,444921366,'rfid_active');
Insert into HR.RFID (RFIDNUMBER,EMPLOYEEID,FLAG) values (8261925,959711844,'rfid_active');
REM INSERTING into HR.RFIDCARDS
SET DEFINE OFF;
Insert into HR.RFIDCARDS (ID,FLAG) values (8262116,'rfid_card_active');
Insert into HR.RFIDCARDS (ID,FLAG) values (9051449,'rfid_card_active');
Insert into HR.RFIDCARDS (ID,FLAG) values (8261925,'rfid_card_active');
Insert into HR.RFIDCARDS (ID,FLAG) values (262251874,'rfid_card_inactive');
REM INSERTING into HR.SALARY
SET DEFINE OFF;
Insert into HR.SALARY (EMPLOYEEID,AMOUNT,DEPTID) values (1015584988,10000,6);
REM INSERTING into HR.TRIGGR
SET DEFINE OFF;
REM INSERTING into HR.VERIFICATION
SET DEFINE OFF;
Insert into HR.VERIFICATION (ID,CODE,REFERENCEID,WORK,FLAG) values (25767832,'437a51d1f6510a4cdb580bd9b23c58b8',1015584988,'mode_verify_email','completed');
Insert into HR.VERIFICATION (ID,CODE,REFERENCEID,WORK,FLAG) values (987698201,'0b1e0e62901f2a6e2699429d1389b5b4',444921366,'mode_verify_email','completed');
Insert into HR.VERIFICATION (ID,CODE,REFERENCEID,WORK,FLAG) values (103753681,'468e6dc5d5bfe6fd0eaac949bf4a25ba',959711844,'mode_verify_email','completed');
--------------------------------------------------------
--  DDL for Index ATTENDENCE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."ATTENDENCE_PK" ON "HR"."ATTENDENCE" ("ATTENDENCEID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BROADCAST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."BROADCAST_PK" ON "HR"."BROADCAST" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DEPARTMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."DEPARTMENT_PK" ON "HR"."DEPARTMENT" ("DEPTID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMPLOYEES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."EMPLOYEES_PK" ON "HR"."EMPLOYEES" ("EMPLOYEEID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index HOLIDAY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."HOLIDAY_PK" ON "HR"."HOLIDAY" ("HOLIDAYID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MESSAGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MESSAGES_PK" ON "HR"."MESSAGES" ("MESSSAGEID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index REQUEST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."REQUEST_PK" ON "HR"."REQUEST" ("REQUESTID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index RFIDCARDS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."RFIDCARDS_PK" ON "HR"."RFIDCARDS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index RFIDPK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."RFIDPK" ON "HR"."RFID" ("RFIDNUMBER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table ADMIN
--------------------------------------------------------

  ALTER TABLE "HR"."ADMIN" MODIFY ("USERNAME" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."ADMIN" MODIFY ("PASSWORD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ATTENDENCE
--------------------------------------------------------

  ALTER TABLE "HR"."ATTENDENCE" ADD CONSTRAINT "ATTENDENCE_PK" PRIMARY KEY ("ATTENDENCEID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."ATTENDENCE" MODIFY ("ATTENDENCEID" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."ATTENDENCE" MODIFY ("RFIDNUMBER" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."ATTENDENCE" MODIFY ("CHECKIN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BROADCAST
--------------------------------------------------------

  ALTER TABLE "HR"."BROADCAST" ADD CONSTRAINT "BROADCAST_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."BROADCAST" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEPARTMENT
--------------------------------------------------------

  ALTER TABLE "HR"."DEPARTMENT" ADD CONSTRAINT "DEPARTMENT_PK" PRIMARY KEY ("DEPTID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."DEPARTMENT" MODIFY ("DEPTID" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."DEPARTMENT" MODIFY ("DEPTNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMPLOYEES_PK" PRIMARY KEY ("EMPLOYEEID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("EMPLOYEEID" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("FIRSTNAME" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("LASTNAME" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("GENDER" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("PHONENUMBER" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("EMAIL" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("ADDRESS" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("PASSWORD" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("DOB" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("FLAG" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HOLIDAY
--------------------------------------------------------

  ALTER TABLE "HR"."HOLIDAY" ADD CONSTRAINT "HOLIDAY_PK" PRIMARY KEY ("HOLIDAYID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."HOLIDAY" MODIFY ("HOLIDAYID" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."HOLIDAY" MODIFY ("STARTDATE" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."HOLIDAY" MODIFY ("ENDDATE" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."HOLIDAY" MODIFY ("REASON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HR
--------------------------------------------------------

  ALTER TABLE "HR"."HR" MODIFY ("EMAIL" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."HR" MODIFY ("PASSWORD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MAILSERVICE
--------------------------------------------------------

  ALTER TABLE "HR"."MAILSERVICE" MODIFY ("RECIEVER" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."MAILSERVICE" MODIFY ("SUBJECT" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."MAILSERVICE" MODIFY ("CONTEXT" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."MAILSERVICE" MODIFY ("TIME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MESSAGES
--------------------------------------------------------

  ALTER TABLE "HR"."MESSAGES" ADD CONSTRAINT "MESSAGES_PK" PRIMARY KEY ("MESSSAGEID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."MESSAGES" MODIFY ("MESSSAGEID" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."MESSAGES" MODIFY ("CONTEXT" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."MESSAGES" MODIFY ("TYPE" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."MESSAGES" MODIFY ("TIME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REQUEST
--------------------------------------------------------

  ALTER TABLE "HR"."REQUEST" ADD CONSTRAINT "REQUEST_PK" PRIMARY KEY ("REQUESTID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."REQUEST" MODIFY ("REQUESTID" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."REQUEST" MODIFY ("REQUESTSUBJECT" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."REQUEST" MODIFY ("REQUESTBODY" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."REQUEST" MODIFY ("EMPLOYEEID" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."REQUEST" MODIFY ("DATETIME" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."REQUEST" MODIFY ("FLAG" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RFID
--------------------------------------------------------

  ALTER TABLE "HR"."RFID" ADD CONSTRAINT "RFIDPK" PRIMARY KEY ("RFIDNUMBER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."RFID" MODIFY ("RFIDNUMBER" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."RFID" MODIFY ("FLAG" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RFIDCARDS
--------------------------------------------------------

  ALTER TABLE "HR"."RFIDCARDS" ADD CONSTRAINT "RFIDCARDS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SALARY
--------------------------------------------------------

  ALTER TABLE "HR"."SALARY" MODIFY ("AMOUNT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRIGGR
--------------------------------------------------------

  ALTER TABLE "HR"."TRIGGR" MODIFY ("TIME" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."TRIGGR" MODIFY ("TASK" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table ATTENDENCE
--------------------------------------------------------

  ALTER TABLE "HR"."ATTENDENCE" ADD CONSTRAINT "ATTENDENCE_FK1" FOREIGN KEY ("RFIDNUMBER")
	  REFERENCES "HR"."RFID" ("RFIDNUMBER") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BROADCASTEMPLOYEEMAPPER
--------------------------------------------------------

  ALTER TABLE "HR"."BROADCASTEMPLOYEEMAPPER" ADD CONSTRAINT "BROADCASTEMPLOYEEMAPPER_FK1" FOREIGN KEY ("ID")
	  REFERENCES "HR"."BROADCAST" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "HR"."BROADCASTEMPLOYEEMAPPER" ADD CONSTRAINT "BROADCASTEMPLOYEEMAPPER_FK2" FOREIGN KEY ("EMPLOYEEID")
	  REFERENCES "HR"."EMPLOYEES" ("EMPLOYEEID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HOLIDAY
--------------------------------------------------------

  ALTER TABLE "HR"."HOLIDAY" ADD CONSTRAINT "HOLIDAY_FK1" FOREIGN KEY ("EMPLOYEEID")
	  REFERENCES "HR"."EMPLOYEES" ("EMPLOYEEID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REQUEST
--------------------------------------------------------

  ALTER TABLE "HR"."REQUEST" ADD CONSTRAINT "REQUEST_FK1" FOREIGN KEY ("EMPLOYEEID")
	  REFERENCES "HR"."EMPLOYEES" ("EMPLOYEEID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RFID
--------------------------------------------------------

  ALTER TABLE "HR"."RFID" ADD CONSTRAINT "RFID_FK1" FOREIGN KEY ("EMPLOYEEID")
	  REFERENCES "HR"."EMPLOYEES" ("EMPLOYEEID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALARY
--------------------------------------------------------

  ALTER TABLE "HR"."SALARY" ADD CONSTRAINT "SALARYFK1" FOREIGN KEY ("EMPLOYEEID")
	  REFERENCES "HR"."EMPLOYEES" ("EMPLOYEEID") ENABLE;
 
  ALTER TABLE "HR"."SALARY" ADD CONSTRAINT "SALARY_FK2" FOREIGN KEY ("DEPTID")
	  REFERENCES "HR"."DEPARTMENT" ("DEPTID") ENABLE;
