--------------------------------------------------------
--  File created - Sunday-March-18-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ADMIN
--------------------------------------------------------

  CREATE TABLE "HR"."ADMIN" 
   (	"USERNAME" VARCHAR2(20 BYTE), 
	"PASSWORD" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ATTENDENCE
--------------------------------------------------------

  CREATE TABLE "HR"."ATTENDENCE" 
   (	"ATTENDENCEID" NUMBER(*,0), 
	"RFIDNUMBER" NUMBER(*,0), 
	"CHECKIN" TIMESTAMP (6), 
	"CHECKOUT" TIMESTAMP (6), 
	"FLAG" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DEPARTMENT
--------------------------------------------------------

  CREATE TABLE "HR"."DEPARTMENT" 
   (	"DEPTID" NUMBER(*,0), 
	"DEPTNAME" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table EMPLOYEES
--------------------------------------------------------

  CREATE TABLE "HR"."EMPLOYEES" 
   (	"EMPLOYEEID" NUMBER(*,0), 
	"FIRSTNAME" VARCHAR2(25 BYTE), 
	"LASTNAME" VARCHAR2(20 BYTE), 
	"GENDER" VARCHAR2(10 BYTE), 
	"PHONENUMBER" NUMBER(*,0), 
	"EMAIL" VARCHAR2(30 BYTE), 
	"ADDRESS" VARCHAR2(100 BYTE), 
	"PASSWORD" VARCHAR2(20 BYTE), 
	"DOB" DATE, 
	"FLAG" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
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
   (	"EMAIL" VARCHAR2(20 BYTE), 
	"PASSWORD" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
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
--  DDL for Table RFID
--------------------------------------------------------

  CREATE TABLE "HR"."RFID" 
   (	"RFIDNUMBER" NUMBER(*,0), 
	"EMPLOYEEID" NUMBER(*,0), 
	"IMAGE" BLOB, 
	"FLAG" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("IMAGE") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
--------------------------------------------------------
--  DDL for Table SALARY
--------------------------------------------------------

  CREATE TABLE "HR"."SALARY" 
   (	"EMPLOYEEID" NUMBER(*,0), 
	"AMOUNT" FLOAT(126), 
	"DEPTID" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
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
REM INSERTING into HR.ADMIN
SET DEFINE OFF;
REM INSERTING into HR.ATTENDENCE
SET DEFINE OFF;
REM INSERTING into HR.DEPARTMENT
SET DEFINE OFF;
REM INSERTING into HR.EMPLOYEES
SET DEFINE OFF;
REM INSERTING into HR.HOLIDAY
SET DEFINE OFF;
REM INSERTING into HR.HR
SET DEFINE OFF;
REM INSERTING into HR.MAILSERVICE
SET DEFINE OFF;
REM INSERTING into HR.MESSAGES
SET DEFINE OFF;
REM INSERTING into HR.RFID
SET DEFINE OFF;
REM INSERTING into HR.SALARY
SET DEFINE OFF;
REM INSERTING into HR.TRIGGR
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index ATTENDENCE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."ATTENDENCE_PK" ON "HR"."ATTENDENCE" ("ATTENDENCEID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DEPARTMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."DEPARTMENT_PK" ON "HR"."DEPARTMENT" ("DEPTID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMPLOYEES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."EMPLOYEES_PK" ON "HR"."EMPLOYEES" ("EMPLOYEEID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index HOLIDAY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."HOLIDAY_PK" ON "HR"."HOLIDAY" ("HOLIDAYID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MESSAGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MESSAGES_PK" ON "HR"."MESSAGES" ("MESSSAGEID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index RFIDPK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."RFIDPK" ON "HR"."RFID" ("RFIDNUMBER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
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
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."ATTENDENCE" MODIFY ("ATTENDENCEID" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."ATTENDENCE" MODIFY ("RFIDNUMBER" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."ATTENDENCE" MODIFY ("CHECKIN" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."ATTENDENCE" MODIFY ("CHECKOUT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEPARTMENT
--------------------------------------------------------

  ALTER TABLE "HR"."DEPARTMENT" ADD CONSTRAINT "DEPARTMENT_PK" PRIMARY KEY ("DEPTID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."DEPARTMENT" MODIFY ("DEPTID" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."DEPARTMENT" MODIFY ("DEPTNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMPLOYEES_PK" PRIMARY KEY ("EMPLOYEEID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
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
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
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
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."MESSAGES" MODIFY ("MESSSAGEID" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."MESSAGES" MODIFY ("CONTEXT" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."MESSAGES" MODIFY ("TYPE" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."MESSAGES" MODIFY ("TIME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RFID
--------------------------------------------------------

  ALTER TABLE "HR"."RFID" ADD CONSTRAINT "RFIDPK" PRIMARY KEY ("RFIDNUMBER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."RFID" MODIFY ("RFIDNUMBER" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."RFID" MODIFY ("IMAGE" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."RFID" MODIFY ("FLAG" NOT NULL ENABLE);
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
--  Ref Constraints for Table HOLIDAY
--------------------------------------------------------

  ALTER TABLE "HR"."HOLIDAY" ADD CONSTRAINT "HOLIDAY_FK1" FOREIGN KEY ("EMPLOYEEID")
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
