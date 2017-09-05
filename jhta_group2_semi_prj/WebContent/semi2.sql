
/* Drop Tables */

DROP TABLE PROGRESS CASCADE CONSTRAINTS;
DROP TABLE COURSE_VIDEO CASCADE CONSTRAINTS;
DROP TABLE ENROLMENT CASCADE CONSTRAINTS;
DROP TABLE POSTSCRIPTION CASCADE CONSTRAINTS;
DROP TABLE QNA CASCADE CONSTRAINTS;
DROP TABLE COURSE CASCADE CONSTRAINTS;
DROP TABLE DEPT CASCADE CONSTRAINTS;
DROP TABLE LECTURER CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE POINT CASCADE CONSTRAINTS;
DROP TABLE TECH CASCADE CONSTRAINTS;
DROP TABLE STUDENT CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE COURSE
(
	COURSE_NO number(6) NOT NULL,
	COURSE_NAME varchar2(100),
	COURSE_SUMMARY varchar2(500),
	COURSE_DETAIL varchar2(2000),
	COURSE_POINT number(3,0),
	LECTURER_NO number(3,0),
	DEPT_NO number(2,0),
	PRIMARY KEY (COURSE_NO)
);


CREATE TABLE COURSE_VIDEO
(
	COURSE_VIDEO_NO number(4,0) NOT NULL,
	COURSE_VIDEO_LINK varchar2(100) UNIQUE,
	COURSE_VIDEO_TITLE varchar2(100),
	COURSE_VIDEO_DESCRIPTION varchar2(500),
	COURSE_VIDEO_ATTACHED varchar2(500),
	COURSE_VIDEO_PERMIT char(1) DEFAULT 'N',
	COURSE_VIDEO_ORDER number(2,0),
	COURSE_NO number(6),
	PRIMARY KEY (COURSE_VIDEO_NO)
);


CREATE TABLE DEPT
(
	DEPT_NO number(2,0) NOT NULL,
	DEPT_NAME varchar2(0) UNIQUE,
	PRIMARY KEY (DEPT_NO)
);


CREATE TABLE ENROLMENT
(
	ENROLMENT_NO number(4,0) NOT NULL,
	ENROLMENT_START_DATE date DEFAULT SYSDATE,
	STUDENT_NO number(3),
	COURSE_NO number(6),
	PRIMARY KEY (ENROLMENT_NO)
);


CREATE TABLE LECTURER
(
	LECTURER_NO number(3,0) NOT NULL,
	LECTURER_NAME varchar2(100),
	LECTURER_EMAIL varchar2(256) UNIQUE,
	LECTURER_PWD char(64),
	LECTURER_PHONE varchar2(20),
	LECTURER_CAREER varchar2(200),
	LECTURER_PICTURE varchar2(500),
	LECTURER_PERMIT char(1) DEFAULT 'N',
	USER_TYPE char(1) DEFAULT 'T',
	PRIMARY KEY (LECTURER_NO)
);


CREATE TABLE NOTICE
(
	NOTICE_NO number(4,0) NOT NULL,
	NOTICE_TITLE varchar2(100),
	NOTICE_CONTENT varchar2(2000),
	NOTICE_REGDATE date DEFAULT SYSDATE,
	NOTICE_EXPIREDATE date,
	NOTICE_ACTIVE char(1) DEFAULT 'Y',
	PRIMARY KEY (NOTICE_NO)
);


CREATE TABLE POINT
(
	POINT_PAYMENT number(5,0),
	POINT_HISTORY varchar2(150),
	POINT_DATE date DEFAULT SYSDATE,
	STUDENT_NO number(3)
);


CREATE TABLE POSTSCRIPTION
(
	POSTSCRIPTION_NO number(4,0) NOT NULL,
	POSTSCRIPTION_TITLE varchar2(100),
	POSTSCRIPTION_CONTENT varchar2(2000),
	POSTSCRIPTION_REGDATE date,
	POSTSCRIPTION_GRADE number(1),
	POSTSCRIPTION_ACTIVE char(1) DEFAULT 'Y',
	STUDENT_NO number(3),
	COURSE_NO number(6),
	PRIMARY KEY (POSTSCRIPTION_NO)
);


CREATE TABLE PROGRESS
(
	PROGRESS_COMPLETE char(1) DEFAULT 'N',
	STUDENT_NO number(3),
	COURSE_VIDEO_NO number(4,0)
);


CREATE TABLE QNA
(
	QNA_NO number(4,0) NOT NULL,
	QNA_TITLE varchar2(100),
	QNA_QUES_CONTENT varchar2(2000),
	QNA_QUES_DATE date DEFAULT SYSDATE,
	QNA_ANS_CONTENT varchar2(500),
	QNA_ANS_REGDATE date DEFAULT SYSDATE,
	QNA_ACTIVE char(1) DEFAULT 'Y',
	COURSE_NO number(6),
	STUDENT_NO number(3),
	PRIMARY KEY (QNA_NO)
);


CREATE TABLE STUDENT
(
	STUDENT_NO number(3) NOT NULL,
	STUDENT_NAME varchar2(100),
	STUDENT_EMAIL varchar2(256) UNIQUE,
	STUDENT_PWD char(64),
	STUDENT_PHONE varchar2(20),
	STUDENT_POINT number(6),
	USER_TYPE char(1) DEFAULT 'S',
	PRIMARY KEY (STUDENT_NO)
);


CREATE TABLE TECH
(
	TECH_NO number(4,0) NOT NULL,
	TECH_TITLE varchar2(100),
	TECH_QUES_CONTENT varchar2(2000),
	TECH_QUES_REGDATE date DEFAULT SYSDATE,
	TECH_ANS_CONTENT varchar2(500),
	TECH_ANS_REGDATE date DEFAULT SYSDATE,
	TECH_ACTIVE char(1) DEFAULT 'Y',
	STUDENT_NO number(3),
	PRIMARY KEY (TECH_NO)
);



/* Create Foreign Keys */

ALTER TABLE COURSE_VIDEO
	ADD FOREIGN KEY (COURSE_NO)
	REFERENCES COURSE (COURSE_NO)
;


ALTER TABLE ENROLMENT
	ADD FOREIGN KEY (COURSE_NO)
	REFERENCES COURSE (COURSE_NO)
;


ALTER TABLE POSTSCRIPTION
	ADD FOREIGN KEY (COURSE_NO)
	REFERENCES COURSE (COURSE_NO)
;


ALTER TABLE QNA
	ADD FOREIGN KEY (COURSE_NO)
	REFERENCES COURSE (COURSE_NO)
;


ALTER TABLE PROGRESS
	ADD FOREIGN KEY (COURSE_VIDEO_NO)
	REFERENCES COURSE_VIDEO (COURSE_VIDEO_NO)
;


ALTER TABLE COURSE
	ADD FOREIGN KEY (DEPT_NO)
	REFERENCES DEPT (DEPT_NO)
;


ALTER TABLE COURSE
	ADD FOREIGN KEY (LECTURER_NO)
	REFERENCES LECTURER (LECTURER_NO)
;


ALTER TABLE ENROLMENT
	ADD FOREIGN KEY (STUDENT_NO)
	REFERENCES STUDENT (STUDENT_NO)
;


ALTER TABLE POINT
	ADD FOREIGN KEY (STUDENT_NO)
	REFERENCES STUDENT (STUDENT_NO)
;


ALTER TABLE POSTSCRIPTION
	ADD FOREIGN KEY (STUDENT_NO)
	REFERENCES STUDENT (STUDENT_NO)
;


ALTER TABLE PROGRESS
	ADD FOREIGN KEY (STUDENT_NO)
	REFERENCES STUDENT (STUDENT_NO)
;


ALTER TABLE QNA
	ADD FOREIGN KEY (STUDENT_NO)
	REFERENCES STUDENT (STUDENT_NO)
;


ALTER TABLE TECH
	ADD FOREIGN KEY (STUDENT_NO)
	REFERENCES STUDENT (STUDENT_NO)
;


