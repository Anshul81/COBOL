//MYJOB    JOB (ACCOUNT),'MY JOB',CLASS=A,MSGCLASS=A,NOTIFY=&SYSUID
//********************************************************************
//* STEP1: RUN THE IEBGENER PROGRAM
//********************************************************************
//STEP1    EXEC PGM=IEBGENER
//INCLUDE  MEMBER=COMMONDDS
//SYSIN    DD DUMMY
//SYSOUT   DD SYSOUT=*
//
