-- course_tbl 테이블
 
Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID                                        NOT NULL VARCHAR2(5)
 NAME                                               VARCHAR2(40)
 CREDIT                                             NUMBER(6)
 LECTURER                                           VARCHAR2(10)
 WEEK                                               NUMBER(2)
 START_HOUR                                         NUMBER(4)
 END_END                                            NUMBER(4)
 
 -- lecturer_tbl 테이블
 
  Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 IDX                                       NOT NULL NUMBER(6)
 NAME                                               VARCHAR2(10)
 MAJOR                                              VARCHAR2(30)
 FIELD                                              VARCHAR2(30)
 
 