-----------------����------------------
--���������� ������̺� �� �������� ����
BEGIN
    FOR C IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE '||C.TABLE_NAME||' CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--���������� ��� ������ ����
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--���������� ��� �� ����
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
--���������� ��� Ʈ���� ����
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/

--------------------------------------------------
--------------     SEQUENCE ����	------------------	
--------------------------------------------------

-- ATTACHMENT SEQUENCE
CREATE SEQUENCE SEQ_ANO
NOCACHE;

-- FINPROJECT SEQUENCE
CREATE SEQUENCE SEQ_FPNO
NOCACHE;

-- PROJECT SEQUENCE
CREATE SEQUENCE SEQ_PNO
NOCACHE;

-- COMMIT SEQUENCE
CREATE SEQUENCE SEQ_CNO
NOCACHE;

-- MEETING SEQUENCE
CREATE SEQUENCE SEQ_MTNO
NOCACHE;

-- MY_PR SEQUENCE
CREATE SEQUENCE SEQ_MPNO
NOCACHE;

-- CALENDAR SEQUENCE
CREATE SEQUENCE SEQ_CDNO
NOCACHE;

-- CATEGORY SEQUENCE
CREATE SEQUENCE SEQ_CTNO
NOCACHE;

-- MILESTONE SEQUENCE
CREATE SEQUENCE SEQ_MSNO
NOCACHE;

-- ISSUE SEQUENCE
CREATE SEQUENCE SEQ_INO
NOCACHE;

-- LABELS SEQUENCE
CREATE SEQUENCE SEQ_LNO
NOCACHE;

-- REPOSITORY SEQUENCE
CREATE SEQUENCE SEQ_RNO
NOCACHE;

-- PULL_REQUEST SEQUENCE
CREATE SEQUENCE SEQ_PQNO
NOCACHE;

-- PULL_REVIEW SEQUENCE
CREATE SEQUENCE SEQ_PRNO
NOCACHE;

-- NOTICE SEQUENCE
CREATE SEQUENCE SEQ_NNO
NOCACHE;

-- STACK SEQUENCE
CREATE SEQUENCE SEQ_SNO
NOCACHE;

-- REPLY SEQUENCE
CREATE SEQUENCE SEQ_RENO
NOCACHE;

--------------------------------------------------
--------------     STACK	------------------	
--------------------------------------------------
CREATE TABLE STACK(
    STACK_NO NUMBER PRIMARY KEY,
    STACK_TYPE VARCHAR2(100),
    STACK_NAME VARCHAR2(100),
    STACK_IMG VARCHAR2(100)
);

-- ��� ���� �ڸ�Ʈ �ޱ� 
COMMENT ON COLUMN STACK.STACK_NO IS '������� ��ȣ';
COMMENT ON COLUMN STACK.STACK_NAME IS '������� �̸�';
COMMENT ON COLUMN STACK.STACK_TYPE IS '��� ���� �з�';
COMMENT ON COLUMN STACK.STACK_IMG IS '��� ���� �̹���';

-- ��� ���� ���� ������
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '����Ʈ����','javascript','https://holaworld.io/images/languages/javascript.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '����Ʈ����','typescript','https://holaworld.io/images/languages/typescript.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '����Ʈ����','react','https://holaworld.io/images/languages/react.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '����Ʈ����','vue','https://holaworld.io/images/languages/vue.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '����Ʈ����','svelte','https://holaworld.io/images/languages/svelte.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '����Ʈ����','nextjs','https://holaworld.io/images/languages/nextjs.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '�鿣��','java','https://holaworld.io/images/languages/java.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '�鿣��','spring','https://holaworld.io/images/languages/spring.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '�鿣��','nodejs','https://holaworld.io/images/languages/nodejs.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '�鿣��','nestjs','https://holaworld.io/images/languages/nestjs.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '�鿣��','go','https://holaworld.io/images/languages/go.svg');
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '�鿣��','kotlin','https://holaworld.io/images/languages/kotlin.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '�鿣��','express','https://holaworld.io/images/languages/express.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '�鿣��','mysql','https://holaworld.io/images/languages/mysql.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '�鿣��','mongodb','https://holaworld.io/images/languages/mongodb.svg');
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '�鿣��','python','https://holaworld.io/images/languages/python.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '�鿣��','django','https://holaworld.io/images/languages/django.svg');
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '�鿣��','php','https://holaworld.io/images/languages/php.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '�鿣��','graphql','https://holaworld.io/images/languages/graphql.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '�鿣��','firebase','https://holaworld.io/images/languages/firebase.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '�����','flutter','https://holaworld.io/images/languages/flutter.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '�����','swift','https://holaworld.io/images/languages/swift.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '�����','reactnative','https://holaworld.io/images/languages/reactnative.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '�����','unity','https://holaworld.io/images/languages/unity.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '��Ÿ','aws','https://holaworld.io/images/languages/aws.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '��Ÿ','kubernetes','https://holaworld.io/images/languages/kubernetes.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '��Ÿ','docker','https://holaworld.io/images/languages/docker.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '��Ÿ','git','https://holaworld.io/images/languages/git.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '��Ÿ','figma','https://holaworld.io/images/languages/figma.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '��Ÿ','zeplin','https://holaworld.io/images/languages/zeplin.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '��Ÿ','jest','https://holaworld.io/images/languages/jest.svg');

--------------------------------------------------
--------------     CATEGORY	------------------	
--------------------------------------------------
CREATE TABLE CATEGORY (
    CATE_NO NUMBER PRIMARY KEY,
    CATE_NAME VARCHAR2(400) NOT NULL
);

COMMENT ON COLUMN CATEGORY.CATE_NO IS 'ī�װ� ��ȣ';
COMMENT ON COLUMN CATEGORY.CATE_NAME IS 'ī�װ���';

--------------------------------------------------
--------------     LABELS	------------------	
--------------------------------------------------
CREATE TABLE LABELS (
   LAB_NO NUMBER PRIMARY KEY,
   LAB_NAME VARCHAR2(20)
);

-- �� ���̺� �ڸ�Ʈ
COMMENT ON COLUMN LABELS.LAB_NO IS '�󺧹�ȣ';
COMMENT ON COLUMN LABELS.LAB_NAME IS '���̸�';

-- �� INSERT��
INSERT 
  INTO LABELS
     (
       LAB_NO
     , LAB_NAME
     )
VALUES
     (
       SEQ_LNO.NEXTVAL
     , 'BUG'
     );
INSERT 
  INTO LABELS
     (
       LAB_NO
     , LAB_NAME
     )
VALUES
     (
       SEQ_LNO.NEXTVAL
     , 'DOCUMENTATION'
     );
INSERT 
  INTO LABELS
     (
       LAB_NO
     , LAB_NAME
     )
VALUES
     (
       SEQ_LNO.NEXTVAL
     , 'DUPLICATE'
     );

--------------------------------------------------
--------------     ATTACHMENT	------------------	
--------------------------------------------------
CREATE TABLE ATTACHMENT(
    FILE_NO NUMBER PRIMARY KEY,
    REF_BNO NUMBER NOT NULL,
    ORIGIN_NAME VARCHAR2(1000) NOT NULL,
    CHANGE_NAME VARCHAR2(1000) NOT NULL,
    FILE_PATH VARCHAR2(1000) NOT NULL,
    UPLOAD_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN ('Y','N')),
    CATEGORY VARCHAR2(1) CHECK(CATEGORY IN('C','M','P')) NOT NULL
 );
    
-- ���� ���̺� �ڸ�Ʈ    
COMMENT ON COLUMN ATTACHMENT.FILE_NO IS '���Ϲ�ȣ';   
COMMENT ON COLUMN ATTACHMENT.REF_BNO IS '�����Խ��� ��ȣ';
COMMENT ON COLUMN ATTACHMENT.ORIGIN_NAME IS '���Ͽ�����'; 
COMMENT ON COLUMN ATTACHMENT.CHANGE_NAME IS '���ϼ�����'; 
COMMENT ON COLUMN ATTACHMENT.FILE_PATH IS '������'; 
COMMENT ON COLUMN ATTACHMENT.UPLOAD_DATE IS '���ε���'; 
COMMENT ON COLUMN ATTACHMENT.STATUS IS '����'; 
COMMENT ON COLUMN ATTACHMENT.CATEGORY IS '�Խ��Ǳ���(C:ä��, P: �Ϸ�� ������Ʈ, M:ȸ�� )';

-- ���� ���̺� ���õ�����
INSERT INTO ATTACHMENT (FILE_NO, REF_BNO, ORIGIN_NAME, CHANGE_NAME, FILE_PATH, UPLOAD_DATE, STATUS, CATEGORY) VALUES (SEQ_ANO.NEXTVAL, 1, 'ȣ��.jpg', '2023101610204578.jpg', 'resources/upfiles/', DEFAULT, DEFAULT, 'M');

--------------------------------------------------
--------------     MEMBER   ------------------	
--------------------------------------------------
CREATE TABLE MEMBER(
    MEM_ID VARCHAR2(50) PRIMARY KEY,
    MEM_TOKEN VARCHAR2(100),
    MEM_INTRO VARCHAR2(4000),
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')),
    STACK_NAME VARCHAR2(4000),
    TEAM NUMBER DEFAULT 0,
    TEAM_STATUS VARCHAR2(1) DEFAULT 'N' CHECK(TEAM_STATUS IN ('Y', 'N')),
    GIT_NICK VARCHAR2(1000),
    PROFILE VARCHAR2(1000),
    FILE_NO NUMBER
);

-- ��� ���̺� �ڸ�Ʈ
COMMENT ON COLUMN MEMBER.MEM_ID IS 'ȸ�����̵�';
COMMENT ON COLUMN MEMBER.MEM_TOKEN IS 'ȸ����ū';
COMMENT ON COLUMN MEMBER.MEM_INTRO IS '�ڱ�Ұ�';
COMMENT ON COLUMN MEMBER.CREATE_DATE IS 'ȸ��������';
COMMENT ON COLUMN MEMBER.STATUS IS 'ȸ������(Y/N)';
COMMENT ON COLUMN MEMBER.STACK_NAME IS '�������';
COMMENT ON COLUMN MEMBER.TEAM IS '���� ������Ʈ ��';
COMMENT ON COLUMN MEMBER.TEAM_STATUS IS '��������(Y:Ȯ��, N:�ӽ�)';
COMMENT ON COLUMN MEMBER.GIT_NICK IS '�� �г���';
COMMENT ON COLUMN MEMBER.PROFILE IS '������';
COMMENT ON COLUMN MEMBER.FILE_NO IS '���Ϲ�ȣ';

-- ��� ���̺� ���õ����� 5��
INSERT INTO MEMBER (MEM_ID, MEM_TOKEN, MEM_INTRO, CREATE_DATE, STATUS, STACK_NAME, TEAM, TEAM_STATUS,GIT_NICK) VALUES ('0000', '00000', '�ڱ�Ұ�1', DEFAULT, DEFAULT, 'JAVA, AWS', 1, 'Y','ȣ��õ��ģ��');
INSERT INTO MEMBER (MEM_ID, MEM_TOKEN, MEM_INTRO, CREATE_DATE, STATUS, STACK_NAME, TEAM, TEAM_STATUS,GIT_NICK) VALUES ('11111', '21451', '�ڱ�Ұ�1', DEFAULT, DEFAULT, 'JAVA, AWS', 1, 'Y','ȣ��õ��');
INSERT INTO MEMBER (MEM_ID, MEM_TOKEN, MEM_INTRO, CREATE_DATE, STATUS, STACK_NAME, TEAM, TEAM_STATUS,GIT_NICK) VALUES ('22222', '46747', '�ڱ�Ұ�2', DEFAULT, DEFAULT, 'JAVA, AWS', 1, 'Y','��õ��');
INSERT INTO MEMBER (MEM_ID, MEM_TOKEN, MEM_INTRO, CREATE_DATE, STATUS, STACK_NAME, TEAM, TEAM_STATUS,GIT_NICK) VALUES ('33333', '21125', '�ڱ�Ұ�3', DEFAULT, DEFAULT, 'JAVA, AWS', 1, 'Y','���ڻ�õ��');
INSERT INTO MEMBER (MEM_ID, MEM_TOKEN, MEM_INTRO, CREATE_DATE, STATUS, STACK_NAME, TEAM, TEAM_STATUS,GIT_NICK) VALUES ('44444', '84849', '�ڱ�Ұ�4', DEFAULT, DEFAULT, 'JAVA, AWS', 1, 'Y','���û�õ��');
INSERT INTO MEMBER (MEM_ID, MEM_TOKEN, MEM_INTRO, CREATE_DATE, STATUS, STACK_NAME, TEAM, TEAM_STATUS,GIT_NICK) VALUES ('55555', '28922', '�ڱ�Ұ�5', DEFAULT, DEFAULT, 'JAVA, AWS', 1, 'Y','�ؾõ��');

--------------------------------------------------
--------------     FRIEND	------------------	
--------------------------------------------------
CREATE TABLE FRIEND(
    BF_GIVER VARCHAR2(50) REFERENCES MEMBER ON DELETE CASCADE NOT NULL,
    BF_TAKER VARCHAR2(50) REFERENCES MEMBER ON DELETE CASCADE NOT NULL,
    STATUS VARCHAR2(1) DEFAULT 'A' CHECK(STATUS IN('Y','A','B','D')) NOT NULL,
    REQUEST_DATE DATE DEFAULT SYSDATE NOT NULL,
    PRIMARY KEY(BF_GIVER,BF_TAKER)
);

-- ģ�� ���̺� �ڸ�Ʈ
COMMENT ON COLUMN FRIEND.BF_GIVER IS 'ģ�� ��û��';
COMMENT ON COLUMN FRIEND.BF_TAKER IS 'ģ�� ��û�޴���';
COMMENT ON COLUMN FRIEND.STATUS IS 'ģ������(Y:ģ��,A:ģ����û,B:ģ������,D:����)';
COMMENT ON COLUMN FRIEND.REQUEST_DATE IS 'ģ�� ��û��';

-- ģ�� ���̺� ���� ������
INSERT INTO 
            FRIEND
     VALUES      
     (
       '0000'
     , '11111'
     , DEFAULT
     , DEFAULT
     );


INSERT INTO 
            FRIEND
     VALUES      
     (
       '0000'
     , '22222'
     , DEFAULT
     , DEFAULT
     );


INSERT INTO 
            FRIEND
     VALUES      
     (
       '11111'
     , '22222'
     , DEFAULT
     , DEFAULT
     );

--------------------------------------------------
--------------     MEETING	------------------	
--------------------------------------------------
CREATE TABLE MEETING(
    MEETING_NO NUMBER PRIMARY KEY,
    MEETING_CREATER VARCHAR2(50) REFERENCES MEMBER ON DELETE CASCADE NOT NULL,
    MEETING_NM VARCHAR2(100) NOT NULL,
    MEETING_PW VARCHAR2(100)
);

COMMENT ON COLUMN MEETING.MEETING_NO IS 'ȸ�ǹ�ȣ';
COMMENT ON COLUMN MEETING.MEETING_CREATER IS 'ȸ�ǰ�����';
COMMENT ON COLUMN MEETING.MEETING_NM IS 'ȸ�Ǹ�';
COMMENT ON COLUMN MEETING.MEETING_PW IS 'ȸ�Ǻ�й�ȣ';

--------------------------------------------------
--------------     MEETING_MEMBER	------------------	
--------------------------------------------------
CREATE TABLE MEETING_MEMBER(
    MEETING_NO NUMBER REFERENCES MEETING ON DELETE CASCADE NOT NULL,
    MEM_ID VARCHAR2(50) REFERENCES MEMBER ON DELETE CASCADE NOT NULL
);

COMMENT ON COLUMN MEETING_MEMBER.MEETING_NO IS 'ȸ�ǹ�ȣ';
COMMENT ON COLUMN MEETING_MEMBER.MEM_ID IS 'ȸ�����̵�';

--------------------------------------------------
--------------     FOLLOW	------------------	
--------------------------------------------------
CREATE TABLE FOLLOW(
    FOLLOWING_MEM VARCHAR2(50) REFERENCES MEMBER ON DELETE CASCADE NOT NULL,
    FOLLOW_MEM VARCHAR2(50) REFERENCES MEMBER ON DELETE CASCADE NOT NULL,
    FOLLOW_DATE DATE DEFAULT SYSDATE NOT NULL,
    PRIMARY KEY(FOLLOWING_MEM,FOLLOW_MEM)
);

COMMENT ON COLUMN FOLLOW.FOLLOWING_MEM IS '�ȷο��� ȸ����ȣ';
COMMENT ON COLUMN FOLLOW.FOLLOW_MEM IS '�ȷο� ���� ȸ����ȣ';
COMMENT ON COLUMN FOLLOW.FOLLOW_DATE IS '�ȷο� ��¥';

--------------------------------------------------
--------------     PROJECT	------------------	
--------------------------------------------------
CREATE TABLE PROJECT(
    PRO_NO NUMBER PRIMARY KEY,
    PRO_WRITER VARCHAR2(50) REFERENCES MEMBER NOT NULL,
    PRO_STACK VARCHAR2(4000) NOT NULL,
    PRO_TITLE VARCHAR2(1000) NOT NULL,
    PRO_CONTENT VARCHAR2(4000) NOT NULL,  
    PRO_MEMBER NUMBER NOT NULL,
    PRO_PERIOD VARCHAR2(30) NOT NULL,
    PRO_DEADLINE DATE NOT NULL,
    PRO_START_DATE DATE NOT NULL,
    PRO_POSITION VARCHAR2(500) NOT NULL,
    PRO_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(PRO_STATUS IN('Y','N')),
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')),
    COUNT NUMBER DEFAULT 0,
    CREATE_DATE DATE DEFAULT SYSDATE
);

-- ������Ʈ ���� ���̺� �ڸ�Ʈ
COMMENT ON COLUMN PROJECT.PRO_NO IS '������Ʈ ������ȣ';
COMMENT ON COLUMN PROJECT.PRO_WRITER IS '������Ʈ �ۼ���';
COMMENT ON COLUMN PROJECT.PRO_STACK IS '������Ʈ ��� �������';
COMMENT ON COLUMN PROJECT.PRO_TITLE IS '������Ʈ ��������';
COMMENT ON COLUMN PROJECT.PRO_CONTENT IS '������Ʈ ��������';
COMMENT ON COLUMN PROJECT.PRO_MEMBER IS '������Ʈ �����ο�';
COMMENT ON COLUMN PROJECT.PRO_PERIOD IS '������Ʈ ����Ⱓ';
COMMENT ON COLUMN PROJECT.PRO_DEADLINE IS '������Ʈ ����������';
COMMENT ON COLUMN PROJECT.PRO_START_DATE IS '������Ʈ ���ۿ�����';
COMMENT ON COLUMN PROJECT.PRO_POSITION IS '������Ʈ ����������';
COMMENT ON COLUMN PROJECT.PRO_STATUS IS '������Ʈ ��������';
COMMENT ON COLUMN PROJECT.STATUS IS '������Ʈ �Խñ� ����';
COMMENT ON COLUMN PROJECT.COUNT IS '��ȸ��';
COMMENT ON COLUMN PROJECT.CREATE_DATE IS '������Ʈ ���� ������';


-- ������Ʈ ���� ���̺� ���õ�����
INSERT INTO
PROJECT
VALUES
(
SEQ_PNO.NEXTVAL
, '0000'
, 'java,javascript,mysql'
, '�鿣�� ������ ���մϴ�'
, '���� �鿣�� �� �Ѵ�? ��ʴϴ�'
, 1
, '3����'
, '2023-10-20'
, '2023-10-22'
, '�鿣��'
, 'Y'
, 'Y'
, DEFAULT
, DEFAULT
);


INSERT INTO
PROJECT
VALUES
(
SEQ_PNO.NEXTVAL
, '11111'
, 'java,javascript,spring'
, '��~ ȭ�� �� ����� ����Ʈ ������ ��� ������~?'
, 'ȭ���� ��򳪰� ���� �� �ִ� ����Ʈ ������ �� �ޱ��մϴ�!!!!!'
, 1
, '4����'
, '2023-10-28'
, '2023-10-30'
, '����Ʈ����'
, 'Y'
, 'Y'
, DEFAULT
, DEFAULT
);


INSERT INTO
PROJECT
VALUES
(
SEQ_PNO.NEXTVAL
, '22222'
, 'java,javascript,mysql,go,kotlin'

, '��! �� ����!!'
, '���� ������Ʈ ����?'
, 1
, '5����'
, '2023-10-18'
, '2023-10-20'
, '�鿣��'
, 'Y'
, 'Y'
, DEFAULT
, DEFAULT
);

--------------------------------------------------
--------------     FINPROJECT	------------------	
--------------------------------------------------
CREATE TABLE FINPROJECT(
    PRO_NO NUMBER PRIMARY KEY,
    REF_PNO NUMBER NOT NULL REFERENCES PROJECT,
    PRO_TITLE VARCHAR2(1000) NOT NULL,
    PRO_CONTENT VARCHAR2(4000) NOT NULL,
    PRO_README VARCHAR2(1000),
    CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN ('Y','N')) NOT NULL
);

-- �Ϸ�� ������Ʈ �ڸ�Ʈ
COMMENT ON COLUMN FINPROJECT.PRO_NO IS '�Ϸ�� ������Ʈ ��ȣ';
COMMENT ON COLUMN FINPROJECT.REF_PNO IS '���� ������Ʈ ��ȣ';  -- Ȥ�� ���� ���� �÷�
COMMENT ON COLUMN FINPROJECT.PRO_TITLE IS '�Ϸ�� ������Ʈ ����';
COMMENT ON COLUMN FINPROJECT.PRO_CONTENT IS '�Ϸ�� ������Ʈ ����';
COMMENT ON COLUMN FINPROJECT.PRO_README IS '���������';
COMMENT ON COLUMN FINPROJECT.CREATE_DATE IS '�ۼ���';
COMMENT ON COLUMN FINPROJECT.STATUS IS '����';

-- �Ϸ�� ������Ʈ ���� ������
INSERT INTO 
            FINPROJECT 
     VALUES     
     (
       SEQ_FPNO.NEXTVAL
     , 1
     , '�Ϸ�����1'
     , '�Ϸ� ����1'
     , '�����'
     , SYSDATE
     , 'Y'
     );


INSERT INTO 
            FINPROJECT 
     VALUES     
     (
       SEQ_FPNO.NEXTVAL
     , 2
     , '�Ϸ�����2'
     , '�Ϸ� ����2'
     , '�����'
     , SYSDATE
     , 'Y'
     );
     
     INSERT INTO 
            FINPROJECT 
     VALUES     
     (
       SEQ_FPNO.NEXTVAL
     , 2
     , '�Ϸ�����3'
     , '�Ϸ� ����3'
     , '�����'
     , SYSDATE
     , 'Y'
     );

INSERT INTO 
            FINPROJECT 
     VALUES     
     (
       SEQ_FPNO.NEXTVAL
     , 1
     , '�Ϸ�����4'
     , '�Ϸ� ����4'
     , '�����'
     , SYSDATE
     , 'Y'
     );

--------------------------------------------------
--------------     NOTICE	------------------	
--------------------------------------------------
CREATE TABLE NOTICE(
    NOTI_NO NUMBER PRIMARY KEY,
    CATEGORY_NAME VARCHAR2(50) NOT NULL,
    NOTI_CONTENT VARCHAR2(1000) NOT NULL,
    OCU_TIME DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')),
    MEM_ID VARCHAR2(50) REFERENCES MEMBER
);

-- �˸� ���̺� �ڸ�Ʈ
COMMENT ON COLUMN NOTICE.NOTI_NO IS '�˸���ȣ';
COMMENT ON COLUMN NOTICE.CATEGORY_NAME IS 'ī�װ���';
COMMENT ON COLUMN NOTICE.NOTI_CONTENT IS '�˸�����';
COMMENT ON COLUMN NOTICE.OCU_TIME IS '�˸��߻��ð�';
COMMENT ON COLUMN NOTICE.STATUS IS '�˸�����';
COMMENT ON COLUMN NOTICE.MEM_ID IS 'ȸ�����̵�';

-- �˸� ���̺� ���õ�����
INSERT INTO NOTICE (NOTI_NO, CATEGORY_NAME, NOTI_CONTENT, OCU_TIME, STATUS, MEM_ID) VALUES (SEQ_NNO.NEXTVAL, '�̽�', '00_java-workspace�� ���ο� �̽��� �߻��߽��ϴ�.', DEFAULT, DEFAULT, '11111');
INSERT INTO NOTICE (NOTI_NO, CATEGORY_NAME, NOTI_CONTENT, OCU_TIME, STATUS, MEM_ID) VALUES (SEQ_NNO.NEXTVAL, 'ģ��', 'USER03 ���� ģ����û�� �����ϼ̽��ϴ�.', DEFAULT, DEFAULT, '22222');
INSERT INTO NOTICE (NOTI_NO, CATEGORY_NAME, NOTI_CONTENT, OCU_TIME, STATUS, MEM_ID) VALUES (SEQ_NNO.NEXTVAL, '����ȫ��', 'USER02 ���� ������ �ڱ�PR�� ���ƿ並 �������ϴ�.', DEFAULT, DEFAULT, '0000');

--------------------------------------------------
--------------     REPLY	------------------	
--------------------------------------------------
CREATE TABLE REPLY(
    REPLY_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(50) REFERENCES MEMBER NOT NULL,
    REP_CONTENT VARCHAR2(4000) NOT NULL,
    REF_PRO NUMBER NOT NULL,
    REP_DATE DATE NOT NULL,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N'))
);

COMMENT ON COLUMN REPLY.REPLY_NO IS '��� ��ȣ';
COMMENT ON COLUMN REPLY.MEM_ID IS '��� �ۼ���';           
COMMENT ON COLUMN REPLY.REP_CONTENT IS '��� ����';
COMMENT ON COLUMN REPLY.REF_PRO IS '���� �Խù�';   
COMMENT ON COLUMN REPLY.REP_DATE IS '��� �ۼ���';     
COMMENT ON COLUMN REPLY.STATUS IS '��� ��������';     

INSERT INTO 
            REPLY
     VALUES
     (
       SEQ_RENO.NEXTVAL
     , '0000'
     , '���� �����ϰ� �;��'
     , 1
     , SYSDATE
     , DEFAULT
     );
    
    
INSERT INTO 
            REPLY
     VALUES
     (
       SEQ_RENO.NEXTVAL
     , '11111'
     , '������ �Ǿ�!! ������ ���� �ѹ� �����غ������ϴ�.'
     , 1
     , SYSDATE
     , DEFAULT
     );

--------------------------------------------------
--------------     MY_PR	------------------	
--------------------------------------------------
CREATE TABLE MY_PR(
    PR_NO NUMBER PRIMARY KEY,
    PR_TITLE VARCHAR2(1000) NOT NULL,
    PR_CONTENT VARCHAR2(4000) NOT NULL,
    CREATE_DATE DATE DEFAULT SYSDATE,
    PR_TIME DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN ('Y','N')) NOT NULL,
    STACK_NAME VARCHAR2(4000) NOT NULL,
    MEM_ID VARCHAR2(50) REFERENCES MEMBER,
    COUNT NUMBER DEFAULT 0
);

-- �ڱ�PR �ڸ�Ʈ
COMMENT ON COLUMN MY_PR.PR_NO IS 'PR ��ȣ';
COMMENT ON COLUMN MY_PR.PR_TITLE IS 'PR ����';
COMMENT ON COLUMN MY_PR.PR_CONTENT IS 'PR ����';
COMMENT ON COLUMN MY_PR.CREATE_DATE IS 'PR �ۼ���';
COMMENT ON COLUMN MY_PR.STATUS IS '����';
COMMENT ON COLUMN MY_PR.STACK_NAME IS '�������';
COMMENT ON COLUMN MY_PR.MEM_ID IS 'ȸ�����̵�';
COMMENT ON COLUMN MY_PR.COUNT IS '��ȸ��';
COMMENT ON COLUMN MY_PR.PR_TIME IS '������Ʈ ���ɽð�';


INSERT INTO MY_PR 
     VALUES
     (
       SEQ_MPNO.NEXTVAL
     , '������ �������Դϴ�'  
     , '���� ������ ���� ��ȸ���� �ʽ��ϴ�.'
     , '2023-09-25'
     , DEFAULT
     , 'Y'
     , 'java,spring,mysql,kotlin,vue'
     , '0000'
     , DEFAULT
     
     );
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_MPNO.NEXTVAL
     , '��... ������Ʈ �ϰ�ʹ�'  
     , '������Ʈ �ϰ� �;� ��ġ�����ϴ�. �������ֽʽÿ�'
     , '2023-09-28'
     , DEFAULT
     , 'Y'
     , 'java,spring,mysql,react'  
     , '11111'
     , DEFAULT
     );


INSERT INTO MY_PR 
     VALUES
     (
       SEQ_MPNO.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
     , '2023-09-25'
     , DEFAULT
     , 'Y'
     , 'typescript,javascript,spring,java'
     , '22222'
     , DEFAULT
     );



INSERT INTO MY_PR 
     VALUES
     (
       SEQ_MPNO.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
     , '2023-09-25'
     , DEFAULT
     , 'Y'
     , 'typescript,javascript,spring,java'
     , '22222'
     , DEFAULT
     );
     
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_MPNO.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
     , '2023-09-25'
     , DEFAULT
     , 'Y'
     , 'typescript,javascript,spring,java'
     , '22222'
     , DEFAULT
     );
     
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_MPNO.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
     , '2023-09-25'
     , DEFAULT
     , 'Y'
     , 'typescript,javascript,spring,java'
     , '22222'
     , DEFAULT
     );
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_MPNO.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
     , '2023-09-25'
     , DEFAULT
     , 'Y'
     , 'typescript,javascript,spring,java'
     , '22222'
     , DEFAULT
     );
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_MPNO.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
     , '2023-09-25'
     , DEFAULT
     , 'Y'
     , 'typescript,javascript,spring,java'
     , '22222'
     , DEFAULT
     );
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_MPNO.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
     , '2023-09-25'
     , DEFAULT
     , 'Y'
     , 'typescript,javascript,spring,java'
     , '22222'
     , DEFAULT
     );
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_MPNO.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
     , '2023-09-25'
     , DEFAULT
     , 'Y'
     , 'typescript,javascript,spring,java'
     , '22222'
     , DEFAULT
     );
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_MPNO.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
     , '2023-09-25'
     , DEFAULT
     , 'Y'
     , 'typescript,javascript,spring,java'
     , '22222'
     , DEFAULT
     );
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_MPNO.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
     , '2023-09-25'
     , DEFAULT
     , 'Y'
     , 'typescript,javascript,spring,java'
     , '22222'
     , DEFAULT
     );
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_MPNO.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
     , '2023-09-25'
     , DEFAULT
     , 'Y'
     , 'typescript,javascript,spring,java'
     , '22222'
     , DEFAULT
     );
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_MPNO.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
     , '2023-09-25'
     , DEFAULT
     , 'Y'
     , 'typescript,javascript,spring,java'
     , '22222'
     , DEFAULT
     );
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_MPNO.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
     , '2023-09-25'
     , DEFAULT
     , 'Y'
     , 'typescript,javascript,spring,java'
     , '22222'
     , DEFAULT
     )
;

--------------------------------------------------
--------------     CALENDAR	------------------	
--------------------------------------------------
CREATE TABLE CALENDAR(
    CAL_NO NUMBER CONSTRAINT CAL_PK PRIMARY KEY,
    CAL_TITLE VARCHAR2(100),
    CAL_CONTENT VARCHAR2(1000),
    START_DATE VARCHAR2(50),
    END_DATE VARCHAR2(50),
    CAL_CATEGORY VARCHAR2(50),
    CAL_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (CAL_STATUS IN ('Y', 'N')),
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N'))
);

-- Ķ���� �ڸ�Ʈ �ۼ�
COMMENT ON COLUMN CALENDAR.CAL_NO IS '���� ��ȣ';
COMMENT ON COLUMN CALENDAR.CAL_TITLE IS '���� ����';
COMMENT ON COLUMN CALENDAR.CAL_CONTENT IS '���� ����';
COMMENT ON COLUMN CALENDAR.START_DATE IS '���� ������';
COMMENT ON COLUMN CALENDAR.END_DATE IS '���� ������';
COMMENT ON COLUMN CALENDAR.CAL_CATEGORY IS '���� ī�װ�';
COMMENT ON COLUMN CALENDAR.CAL_STATUS IS '���� ���࿩��(�ʷϻ�, ȸ��)';
COMMENT ON COLUMN CALENDAR.STATUS IS '���� ��������';

-- Ķ���� ���� ������ 5��
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CDNO.NEXTVAL, '��������', '������Ʈ ���� ���� �� ���� �д�', '2023-10-16', '2023-10-16', '����', DEFAULT, DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CDNO.NEXTVAL, '�� ȸ��', '������ ���� ȸ��', '2023-10-21', '2023-10-21', '�Ҽ�', DEFAULT, DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CDNO.NEXTVAL, '�� ����', '�� ���� �� �λ�', '2023-10-4', '2023-10-4', '����', 'N', DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CDNO.NEXTVAL, '������ ����Ļ�', '������ ���õ������ ����Ļ�', '2023-10-17', '2023-10-17', '����', DEFAULT, DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CDNO.NEXTVAL, '������ ����', '������ ���� �� �ǵ��', '2023-10-17', '2023-10-30', '����', DEFAULT, DEFAULT);

--------------------------------------------------
--------------     REPOSITORY	------------------	
--------------------------------------------------
CREATE TABLE REPOSITORY(
    REPO_NO NUMBER CONSTRAINT REPO_PK PRIMARY KEY,
    REPO_TITLE VARCHAR2(100) NOT NULL,
    REPO_CONTENT VARCHAR2(1000),
    REPO_STATUS VARCHAR2(10) DEFAULT 'PUBLIC' CHECK (REPO_STATUS IN ('PUBLIC', 'PRIVATE')),
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
    REF_MID VARCHAR2(50) REFERENCES MEMBER,
    REF_PNO NUMBER REFERENCES PROJECT
);

-- �������丮 �ڸ�Ʈ �ۼ�
COMMENT ON COLUMN REPOSITORY.REPO_NO IS '�������丮 ��ȣ';
COMMENT ON COLUMN REPOSITORY.REPO_TITLE IS '�������丮 �̸�';
COMMENT ON COLUMN REPOSITORY.REPO_CONTENT IS '�������丮 ����';
COMMENT ON COLUMN REPOSITORY.REPO_STATUS IS '�������丮 ��������';
COMMENT ON COLUMN REPOSITORY.CREATE_DATE IS '�������丮 ������';
COMMENT ON COLUMN REPOSITORY.STATUS IS '�������丮 ��������';
COMMENT ON COLUMN REPOSITORY.REF_MID IS '���� ȸ�� ��ȣ';
COMMENT ON COLUMN REPOSITORY.REF_PNO IS '���� ������Ʈ ��ȣ';

-- �������丮 ���� ������ 5��
INSERT INTO REPOSITORY (REPO_NO, REPO_TITLE, REPO_CONTENT, REPO_STATUS, CREATE_DATE, STATUS, REF_MID, REF_PNO) VALUES (SEQ_RNO.NEXTVAL, 'FINAL_HTML', '������ �����ӵ�', DEFAULT, DEFAULT, DEFAULT, '0000', 1);
INSERT INTO REPOSITORY (REPO_NO, REPO_TITLE, REPO_CONTENT, REPO_STATUS, CREATE_DATE, STATUS, REF_MID, REF_PNO) VALUES (SEQ_RNO.NEXTVAL, 'FINAL_JSP', '������ �����ӵ�', DEFAULT, DEFAULT, DEFAULT, '0000', 2);
INSERT INTO REPOSITORY (REPO_NO, REPO_TITLE, REPO_CONTENT, REPO_STATUS, CREATE_DATE, STATUS, REF_MID, REF_PNO) VALUES (SEQ_RNO.NEXTVAL, 'FINAL_TEST', '������ �����ӵ�', DEFAULT, DEFAULT, DEFAULT, '0000', 3);
INSERT INTO REPOSITORY (REPO_NO, REPO_TITLE, REPO_CONTENT, REPO_STATUS, CREATE_DATE, STATUS, REF_MID, REF_PNO) VALUES (SEQ_RNO.NEXTVAL, 'FINAL_TEMPLATE', '������ �����ӵ�', DEFAULT, DEFAULT, DEFAULT, '0000', 2);
INSERT INTO REPOSITORY (REPO_NO, REPO_TITLE, REPO_CONTENT, REPO_STATUS, CREATE_DATE, STATUS, REF_MID, REF_PNO) VALUES (SEQ_RNO.NEXTVAL, 'FINAL_REAL', '������ �����ӵ�', DEFAULT, DEFAULT, DEFAULT, '0000', 1);

--------------------------------------------------
--------------     COMMIT	------------------	
--------------------------------------------------
CREATE TABLE PRO_COMMIT(
    COMMIT_NO NUMBER CONSTRAINT PRO_COMMIT_PK PRIMARY KEY,
    COMMIT_MEM VARCHAR2(50) CONSTRAINT COMMIT_MEM_FK REFERENCES MEMBER ON DELETE CASCADE,
    COMMIT_DATE DATE DEFAULT SYSDATE,
    COMM_HASH VARCHAR2(1000) NOT NULL,
    REPO_NO NUMBER CONSTRAINT REPO_NO_FK REFERENCES REPOSITORY ON DELETE CASCADE
);

-- Ŀ�� �ڸ�Ʈ �ۼ�
COMMENT ON COLUMN PRO_COMMIT.COMMIT_NO IS 'Ŀ�� ��ȣ';
COMMENT ON COLUMN PRO_COMMIT.COMMIT_MEM IS 'Ŀ�� �ۼ���';
COMMENT ON COLUMN PRO_COMMIT.COMMIT_DATE IS 'Ŀ�� ��¥';
COMMENT ON COLUMN PRO_COMMIT.COMM_HASH IS 'Ŀ�� �ؽ���';
COMMENT ON COLUMN PRO_COMMIT.REPO_NO IS '�������丮 ��ȣ';

-- Ŀ�� ���� ������ 5��
INSERT INTO PRO_COMMIT (COMMIT_NO, COMMIT_MEM, COMMIT_DATE, COMM_HASH, REPO_NO) VALUES (SEQ_CNO.NEXTVAL, '0000', DEFAULT, '�α��� ��� ����', 1);
INSERT INTO PRO_COMMIT (COMMIT_NO, COMMIT_MEM, COMMIT_DATE, COMM_HASH, REPO_NO) VALUES (SEQ_CNO.NEXTVAL, '0000', DEFAULT, '���ƿ� ��� ���� ����', 2);
INSERT INTO PRO_COMMIT (COMMIT_NO, COMMIT_MEM, COMMIT_DATE, COMM_HASH, REPO_NO) VALUES (SEQ_CNO.NEXTVAL, '0000', DEFAULT, '�������丮 ��� ��� �߰�', 3);
INSERT INTO PRO_COMMIT (COMMIT_NO, COMMIT_MEM, COMMIT_DATE, COMM_HASH, REPO_NO) VALUES (SEQ_CNO.NEXTVAL, '0000', DEFAULT, '�Ű� ��� ����', 4);
INSERT INTO PRO_COMMIT (COMMIT_NO, COMMIT_MEM, COMMIT_DATE, COMM_HASH, REPO_NO) VALUES (SEQ_CNO.NEXTVAL, '0000', DEFAULT, '���������� ��� �ڵ� ����', 5);

--------------------------------------------------
--------------     MILESTONE   ------------------	
--------------------------------------------------
CREATE TABLE MILESTONE (
   MIL_NO NUMBER PRIMARY KEY,
   MIL_TITLE VARCHAR2(100) NOT NULL,
   CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
   MODIFY_DATE DATE,
   END_DATE DATE,
   ISSUING VARCHAR2(1) DEFAULT 'Y' NOT NULL ,
   PROGRESS NUMBER DEFAULT 0 NOT NULL,
   STATUS VARCHAR2(1) DEFAULT 'Y',
   MEM_ID VARCHAR2(50) REFERENCES MEMBER,
   REPO_NO NUMBER REFERENCES REPOSITORY
);

-- ���Ͻ��� ���̺� �ڸ�Ʈ
COMMENT ON COLUMN MILESTONE.MIL_NO IS '���Ͻ��� ��ȣ';
COMMENT ON COLUMN MILESTONE.MIL_TITLE IS '���Ͻ��� ����';
COMMENT ON COLUMN MILESTONE.CREATE_DATE IS '���Ͻ��� ������';
COMMENT ON COLUMN MILESTONE.MODIFY_DATE IS '���Ͻ��� ������';
COMMENT ON COLUMN MILESTONE.END_DATE IS '�ֱ� ������';
COMMENT ON COLUMN MILESTONE.ISSUING IS '�������� �̽�';
COMMENT ON COLUMN MILESTONE.PROGRESS IS '��ô��';
COMMENT ON COLUMN MILESTONE.STATUS IS '���Ͻ��� ����';
COMMENT ON COLUMN MILESTONE.MEM_ID IS '���Ͻ��� �ۼ���';
COMMENT ON COLUMN MILESTONE.REPO_NO IS '�������丮 ��ȣ';

-- ���Ͻ��� INSERT��
INSERT
  INTO MILESTONE
     (
       MIL_NO
     , MIL_TITLE
     , CREATE_DATE
     , MODIFY_DATE
     , END_DATE
     , ISSUING
     , PROGRESS
     , STATUS
     , MEM_ID
     , REPO_NO
     )
VALUES
     (
       SEQ_MSNO.NEXTVAL
     , '����1'
     , DEFAULT
     , NULL
     , NULL
     , DEFAULT
     , DEFAULT
     , DEFAULT
     , '0000'
     , 1
     );
     
INSERT
  INTO MILESTONE
     (
       MIL_NO
     , MIL_TITLE
     , CREATE_DATE
     , MODIFY_DATE
     , END_DATE
     , ISSUING
     , PROGRESS
     , STATUS
     , MEM_ID
     , REPO_NO
     )
VALUES
     (
       SEQ_MSNO.NEXTVAL
     , '����2'
     , DEFAULT
     , NULL
     , NULL
     , DEFAULT
     , DEFAULT
     , DEFAULT
     , '0000'
     , 1
     );
     
INSERT
  INTO MILESTONE
     (
       MIL_NO
     , MIL_TITLE
     , CREATE_DATE
     , MODIFY_DATE
     , END_DATE
     , ISSUING
     , PROGRESS
     , STATUS
     , MEM_ID
     , REPO_NO
     )
VALUES
     (
       SEQ_MSNO.NEXTVAL
     , '����3'
     , DEFAULT
     , NULL
     , NULL
     , DEFAULT
     , DEFAULT
     , DEFAULT
     , '0000'
     , 1
     );

--------------------------------------------------
--------------     ISSUE    ------------------	
--------------------------------------------------
CREATE TABLE ISSUE (
   ISS_NO NUMBER PRIMARY KEY,
   ISS_TITLE VARCHAR2(100) NOT NULL,
   ISS_CONTENT VARCHAR2(4000) NOT NULL,
   CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
   MODIFY_DATE DATE,
   END_DATE DATE,
   ISS_ASSIGNEE VARCHAR2(100),
   ISS_STATUS VARCHAR2(1) DEFAULT 'Y',
   STATUS VARCHAR2(1) DEFAULT 'Y' NOT NULL,
   MEM_ID VARCHAR2(50) REFERENCES MEMBER,
   LAB_NAME VARCHAR2(300),
   MIL_NO NUMBER REFERENCES MILESTONE,
   REPO_NO NUMBER REFERENCES REPOSITORY
);

-- �̽� ���̺� �ڸ�Ʈ
COMMENT ON COLUMN ISSUE.ISS_NO IS '�̽���ȣ';
COMMENT ON COLUMN ISSUE.ISS_TITLE IS '�̽�����';
COMMENT ON COLUMN ISSUE.ISS_CONTENT IS '�̽�����';
COMMENT ON COLUMN ISSUE.CREATE_DATE IS '�̽� ������';
COMMENT ON COLUMN ISSUE.MODIFY_DATE IS '�̽� ������';
COMMENT ON COLUMN ISSUE.END_DATE IS '�̽� ������';
COMMENT ON COLUMN ISSUE.ISS_ASSIGNEE IS '�̽� �Ҵ���� ���';
COMMENT ON COLUMN ISSUE.ISS_STATUS IS '�̽� �������(Y/N)';
COMMENT ON COLUMN ISSUE.STATUS IS '�̽�����(Y/N)';
COMMENT ON COLUMN ISSUE.MEM_ID IS '�̽� �ۼ���';
COMMENT ON COLUMN ISSUE.LAB_NAME IS '�̽��� ���� ��(,�� ����)';
COMMENT ON COLUMN ISSUE.MIL_NO IS '�̽��� ���� ���Ͻ���';
COMMENT ON COLUMN ISSUE.REPO_NO IS '�̽��� ���� �������丮 ��ȣ';

-- �̽� INSERT��
INSERT
  INTO ISSUE
     (
       ISS_NO
     , ISS_TITLE
     , ISS_CONTENT
     , CREATE_DATE
     , MODIFY_DATE
     , END_DATE
     , ISS_ASSIGNEE
     , ISS_STATUS
     , STATUS
     , MEM_ID
     , LAB_NAME
     , MIL_NO
     , REPO_NO
     )
VALUES
     (
       SEQ_INO.NEXTVAL
     , '����1'
     , '����1'
     , DEFAULT
     , NULL
     , NULL
     , 'nangmangorani'
     , DEFAULT
     , DEFAULT
     , '0000'
     , 'bug,duplicate'
     , 1
     , 1
     );
     
INSERT
  INTO ISSUE
     (
       ISS_NO
     , ISS_TITLE
     , ISS_CONTENT
     , CREATE_DATE
     , MODIFY_DATE
     , END_DATE
     , ISS_ASSIGNEE
     , ISS_STATUS
     , STATUS
     , MEM_ID
     , LAB_NAME
     , MIL_NO
     , REPO_NO
     )
VALUES
     (
       SEQ_INO.NEXTVAL
     , '����2'
     , '����2'
     , DEFAULT
     , NULL
     , NULL
     , 'BBBBB'
     , DEFAULT
     , DEFAULT
     , '11111'
     , 'bug,duplicate'
     , 1
     , 1
     );
     
INSERT
  INTO ISSUE
     (
       ISS_NO
     , ISS_TITLE
     , ISS_CONTENT
     , CREATE_DATE
     , MODIFY_DATE
     , END_DATE
     , ISS_ASSIGNEE
     , ISS_STATUS
     , STATUS
     , MEM_ID
     , LAB_NAME
     , MIL_NO
     , REPO_NO
     )
VALUES
     (
       SEQ_INO.NEXTVAL
     , '����1'
     , '����1'
     , DEFAULT
     , NULL
     , NULL
     , 'nangmangorani'
     , DEFAULT
     , DEFAULT
     , '0000'
     , 'bug,duplicate,documentation'
     , 1
     , 1
     );

--------------------------------------------------
--------------     PULL_REQUEST   ------------------	
--------------------------------------------------
CREATE TABLE PULL_REQUEST(
    PULL_NO NUMBER PRIMARY KEY,
    PULL_TITLE VARCHAR2(1000) NOT NULL,
    PULL_CONTENT VARCHAR2(4000) NOT NULL,
    PULL_WRITER VARCHAR2(50) REFERENCES MEMBER NOT NULL,
    PULL_MANAGER VARCHAR2(1000) NOT NULL,
    REPO_NO NUMBER  REFERENCES REPOSITORY(REPO_NO) ON DELETE CASCADE NOT NULL,
    ISS_NO NUMBER REFERENCES ISSUE(ISS_NO) ON DELETE CASCADE NOT NULL,
    MIL_NO NUMBER REFERENCES MILESTONE(MIL_NO) ON DELETE CASCADE NOT NULL,
    STATUS VARCHAR2(1) DEFAULT 'M' CHECK(STATUS IN ('M','C','N')) NOT NULL,
    CREATE_DATE DATE  DEFAULT SYSDATE NOT NULL
);

-- Ǯ���� �ڸ�Ʈ
COMMENT ON COLUMN PULL_REQUEST.PULL_NO IS 'Ǯ���� ��ȣ';
COMMENT ON COLUMN PULL_REQUEST.PULL_TITLE IS 'Ǯ���� ����';
COMMENT ON COLUMN PULL_REQUEST.PULL_CONTENT IS 'Ǯ���� ����';
COMMENT ON COLUMN PULL_REQUEST.PULL_WRITER IS 'Ǯ���� �ۼ���';
COMMENT ON COLUMN PULL_REQUEST.PULL_MANAGER IS 'Ǯ���� �����';
COMMENT ON COLUMN PULL_REQUEST.REPO_NO IS '�������丮 ��ȣ';
COMMENT ON COLUMN PULL_REQUEST.ISS_NO IS '�̽� ��ȣ';
COMMENT ON COLUMN PULL_REQUEST.MIL_NO IS '���Ͻ��� ��ȣ';
COMMENT ON COLUMN PULL_REQUEST.STATUS IS '����(M:����,C:������,N:����)';
COMMENT ON COLUMN PULL_REQUEST.CREATE_DATE IS '�ۼ���';

-- Ǯ���� ���õ�����
INSERT INTO 
            PULL_REQUEST
     VALUES 
     (
       SEQ_PQNO.NEXTVAL
     , 'Ǯ�����޾ƶ�!'
     , 'Ǯ���� Ȯ���غ�����?'
     , '0000'
     , 'ȣ����,���ո�'
     , 1
     , 1
     , 1
     , DEFAULT
     , DEFAULT
     );

INSERT INTO 
            PULL_REQUEST
     VALUES 
     (
       SEQ_PQNO.NEXTVAL
     , 'Ǯ�����޾ƶ�1!'
     , 'Ǯ���� Ȯ���غ�����1?'
     , '11111'
     , 'ȣ����,���ո�'
     , 2
     , 2
     , 2
     , DEFAULT
     , DEFAULT
     );
     
INSERT INTO 
            PULL_REQUEST
     VALUES 
     (
       SEQ_PQNO.NEXTVAL
     , 'Ǯ�����޾ƶ�3!'
     , 'Ǯ���� Ȯ���غ�����3?'
     , '22222'
     , 'ȣ����,���ո�'
     , 2
     , 2
     , 2
     , DEFAULT
     , DEFAULT
     ); 
     
INSERT INTO 
            PULL_REQUEST
     VALUES 
     (
       SEQ_PQNO.NEXTVAL
     , 'Ǯ�����޾ƶ�4!'
     , 'Ǯ���� Ȯ���غ�����4?'
     , '11111'
     , 'ȣ����,���ո�'
     , 2
     , 2
     , 2
     , DEFAULT
     , DEFAULT
     );     
     
 INSERT INTO 
            PULL_REQUEST
     VALUES 
     (
       SEQ_PQNO.NEXTVAL
     , 'Ǯ�����޾ƶ�5!'
     , 'Ǯ���� Ȯ���غ�����5?'
     , '11111'
     , 'ȣ����,���ո�'
     , 2
     , 2
     , 2
     , DEFAULT
     , DEFAULT
     );

--------------------------------------------------
--------------     PULL_REVIEW	------------------	
--------------------------------------------------
CREATE TABLE PULL_REVIEW(
    REVIEW_NO NUMBER PRIMARY KEY,
    REF_PULL NUMBER REFERENCES PULL_REQUEST,
    MEM_ID VARCHAR2(50) REFERENCES MEMBER,
    REVIEW_CONTENT VARCHAR2(1000) NOT NULL,
    CREATE_DATE DATE DEFAULT SYSDATE
);

-- Ǯ������Ʈ ���� ���̺� �ڸ�Ʈ
COMMENT ON COLUMN PULL_REVIEW.REVIEW_NO IS 'Ǯ������Ʈ ���� ��ȣ';
COMMENT ON COLUMN PULL_REVIEW.REF_PULL IS '������ Ǯ������Ʈ ��ȣ';
COMMENT ON COLUMN PULL_REVIEW.MEM_ID IS '�ۼ��� ȸ�� ���̵�';
COMMENT ON COLUMN PULL_REVIEW.REVIEW_CONTENT IS '���� ����';
COMMENT ON COLUMN PULL_REVIEW.CREATE_DATE IS '�ۼ���';

-- Ǯ������Ʈ ���� ���̺� ���õ�����
INSERT INTO PULL_REVIEW (REVIEW_NO, REF_PULL, MEM_ID, REVIEW_CONTENT, CREATE_DATE) VALUES (SEQ_PRNO.NEXTVAL, 1, '0000', '�̻�', DEFAULT);
INSERT INTO PULL_REVIEW (REVIEW_NO, REF_PULL, MEM_ID, REVIEW_CONTENT, CREATE_DATE) VALUES (SEQ_PRNO.NEXTVAL, 2, '22222', '����', DEFAULT);
INSERT INTO PULL_REVIEW (REVIEW_NO, REF_PULL, MEM_ID, REVIEW_CONTENT, CREATE_DATE) VALUES (SEQ_PRNO.NEXTVAL, 3, '11111', 'ȫ�繫', DEFAULT);

COMMIT;