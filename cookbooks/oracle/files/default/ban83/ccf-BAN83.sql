STARTUP NOMOUNT
CREATE CONTROLFILE SET DATABASE "BAN83" RESETLOGS  NOARCHIVELOG
    MAXLOGFILES 16
    MAXLOGMEMBERS 3
    MAXDATAFILES 100
    MAXINSTANCES 8
    MAXLOGHISTORY 292
LOGFILE
  GROUP 1 '/u02/oradata/BAN83/REDO01.LOG'  SIZE 6M,
  GROUP 2 '/u02/oradata/BAN83/REDO02.LOG'  SIZE 6M,
  GROUP 3 '/u02/oradata/BAN83/REDO03.LOG'  SIZE 6M
-- STANDBY LOGFILE
DATAFILE
  '/u02/oradata/BAN83/SYSTEM01.DBF',
  '/u02/oradata/BAN83/SYSTEM02.DBF',
  '/u02/oradata/BAN83/SYSTEM03.DBF',
  '/u02/oradata/BAN83/SYSTEM04.DBF',
  '/u02/oradata/BAN83/SYSTEM05.DBF',
  '/u02/oradata/BAN83/SYSTEM06.DBF',
  '/u02/oradata/BAN83/SYSAUX01.DBF',
  '/u02/oradata/BAN83/UNDOTBS01.DBF',
  '/u02/oradata/BAN83/BANAQ.DBF',
  '/u02/oradata/BAN83/BANIAM.DBF',
  '/u02/oradata/BAN83/BANLOB.DBF',
  '/u02/oradata/BAN83/DEVL01.DBF',
  '/u02/oradata/BAN83/DEVL02.DBF',
  '/u02/oradata/BAN83/DEVL03.DBF',
  '/u02/oradata/BAN83/DEVL04.DBF',
  '/u02/oradata/BAN83/DEVL05.DBF',
  '/u02/oradata/BAN83/DEVL06.DBF',
  '/u02/oradata/BAN83/DRSYS.DBF',
  '/u02/oradata/BAN83/INDX.DBF',
  '/u02/oradata/BAN83/OTG.DBF',
  '/u02/oradata/BAN83/SSOMGR.DBF',
  '/u02/oradata/BAN83/TOOLS.DBF',
  '/u02/oradata/BAN83/USERS01.DBF',
  '/u02/oradata/BAN83/XDB.DBF'
CHARACTER SET AL32UTF8
;
-- Commands to re-create incarnation table
-- Below log names MUST be changed to existing filenames on
-- disk. Any one log file from each branch can be used to
-- re-create incarnation records.
-- ALTER DATABASE REGISTER LOGFILE '/u02/app/oracle/product/11.1/dbs/arch1_1_777135541.dbf';
-- ALTER DATABASE REGISTER LOGFILE '/u02/app/oracle/product/11.1/dbs/arch1_1_777396336.dbf';
-- Recovery is required if any of the datafiles are restored backups,
-- or if the last shutdown was not normal or immediate.
-- Database can now be opened normally.
ALTER DATABASE OPEN RESETLOGS;
-- Commands to add tempfiles to temporary tablespaces.
-- Online tempfiles have complete space information.
-- Other tempfiles may require adjustment.
ALTER TABLESPACE TEMP ADD TEMPFILE '/u02/oradata/BAN83/TEMP01.DBF'
     SIZE 20971520  REUSE AUTOEXTEND ON NEXT 655360  MAXSIZE 32767M;
