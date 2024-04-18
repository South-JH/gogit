-----------------삭제------------------
--접속유저의 모든테이블 및 제약조건 삭제
BEGIN
    FOR C IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE '||C.TABLE_NAME||' CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--접속유저의 모든 시퀀스 삭제
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--접속유저의 모든 뷰 삭제
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
--접속유저의 모든 트리거 삭제
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/

--------------------------------------------------
--------------     SEQUENCE 생성	------------------	
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

-- 기술 스택 코멘트 달기 
COMMENT ON COLUMN STACK.STACK_NO IS '기술스택 번호';
COMMENT ON COLUMN STACK.STACK_NAME IS '기술스택 이름';
COMMENT ON COLUMN STACK.STACK_TYPE IS '기술 스택 분류';
COMMENT ON COLUMN STACK.STACK_IMG IS '기술 스택 이미지';

-- 기술 스택 샘플 데이터
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '프론트엔드','javascript','https://holaworld.io/images/languages/javascript.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '프론트엔드','typescript','https://holaworld.io/images/languages/typescript.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '프론트엔드','react','https://holaworld.io/images/languages/react.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '프론트엔드','vue','https://holaworld.io/images/languages/vue.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '프론트엔드','svelte','https://holaworld.io/images/languages/svelte.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '프론트엔드','nextjs','https://holaworld.io/images/languages/nextjs.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '백엔드','java','https://holaworld.io/images/languages/java.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '백엔드','spring','https://holaworld.io/images/languages/spring.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '백엔드','nodejs','https://holaworld.io/images/languages/nodejs.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '백엔드','nestjs','https://holaworld.io/images/languages/nestjs.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '백엔드','go','https://holaworld.io/images/languages/go.svg');
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '백엔드','kotlin','https://holaworld.io/images/languages/kotlin.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '백엔드','express','https://holaworld.io/images/languages/express.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '백엔드','mysql','https://holaworld.io/images/languages/mysql.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '백엔드','mongodb','https://holaworld.io/images/languages/mongodb.svg');
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '백엔드','python','https://holaworld.io/images/languages/python.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '백엔드','django','https://holaworld.io/images/languages/django.svg');
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '백엔드','php','https://holaworld.io/images/languages/php.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '백엔드','graphql','https://holaworld.io/images/languages/graphql.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '백엔드','firebase','https://holaworld.io/images/languages/firebase.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '모바일','flutter','https://holaworld.io/images/languages/flutter.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '모바일','swift','https://holaworld.io/images/languages/swift.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '모바일','reactnative','https://holaworld.io/images/languages/reactnative.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '모바일','unity','https://holaworld.io/images/languages/unity.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '기타','aws','https://holaworld.io/images/languages/aws.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '기타','kubernetes','https://holaworld.io/images/languages/kubernetes.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '기타','docker','https://holaworld.io/images/languages/docker.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '기타','git','https://holaworld.io/images/languages/git.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '기타','figma','https://holaworld.io/images/languages/figma.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '기타','zeplin','https://holaworld.io/images/languages/zeplin.svg'); 
INSERT INTO STACK VALUES (SEQ_SNO.NEXTVAL, '기타','jest','https://holaworld.io/images/languages/jest.svg');

--------------------------------------------------
--------------     CATEGORY	------------------	
--------------------------------------------------
CREATE TABLE CATEGORY (
    CATE_NO NUMBER PRIMARY KEY,
    CATE_NAME VARCHAR2(400) NOT NULL
);

COMMENT ON COLUMN CATEGORY.CATE_NO IS '카테고리 번호';
COMMENT ON COLUMN CATEGORY.CATE_NAME IS '카테고리명';

--------------------------------------------------
--------------     LABELS	------------------	
--------------------------------------------------
CREATE TABLE LABELS (
   LAB_NO NUMBER PRIMARY KEY,
   LAB_NAME VARCHAR2(20)
);

-- 라벨 테이블 코멘트
COMMENT ON COLUMN LABELS.LAB_NO IS '라벨번호';
COMMENT ON COLUMN LABELS.LAB_NAME IS '라벨이름';

-- 라벨 INSERT문
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
    
-- 사진 테이블 코멘트    
COMMENT ON COLUMN ATTACHMENT.FILE_NO IS '파일번호';   
COMMENT ON COLUMN ATTACHMENT.REF_BNO IS '참조게시판 번호';
COMMENT ON COLUMN ATTACHMENT.ORIGIN_NAME IS '파일원본명'; 
COMMENT ON COLUMN ATTACHMENT.CHANGE_NAME IS '파일수정명'; 
COMMENT ON COLUMN ATTACHMENT.FILE_PATH IS '저장경로'; 
COMMENT ON COLUMN ATTACHMENT.UPLOAD_DATE IS '업로드일'; 
COMMENT ON COLUMN ATTACHMENT.STATUS IS '상태'; 
COMMENT ON COLUMN ATTACHMENT.CATEGORY IS '게시판구분(C:채팅, P: 완료된 프로젝트, M:회원 )';

-- 사진 테이블 샘플데이터
INSERT INTO ATTACHMENT (FILE_NO, REF_BNO, ORIGIN_NAME, CHANGE_NAME, FILE_PATH, UPLOAD_DATE, STATUS, CATEGORY) VALUES (SEQ_ANO.NEXTVAL, 1, '호빵.jpg', '2023101610204578.jpg', 'resources/upfiles/', DEFAULT, DEFAULT, 'M');

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
    TEAM_STATUS VARCHAR2(1) DEFAULT 'N' CHECK(TEAM_STATUS IN ('Y', 'N', 'S')),
    GIT_NICK VARCHAR2(1000),
    PROFILE VARCHAR2(1000),
    FILE_NO NUMBER
);

-- 멤버 테이블 코멘트
COMMENT ON COLUMN MEMBER.MEM_ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.MEM_TOKEN IS '회원토큰';
COMMENT ON COLUMN MEMBER.MEM_INTRO IS '자기소개';
COMMENT ON COLUMN MEMBER.CREATE_DATE IS '회원가입일';
COMMENT ON COLUMN MEMBER.STATUS IS '회원상태(Y/N)';
COMMENT ON COLUMN MEMBER.STACK_NAME IS '기술스택';
COMMENT ON COLUMN MEMBER.TEAM IS '참여 프로젝트 팀';
COMMENT ON COLUMN MEMBER.TEAM_STATUS IS '참여상태(Y:확정, N:임시)';
COMMENT ON COLUMN MEMBER.GIT_NICK IS '깃 닉네임';
COMMENT ON COLUMN MEMBER.PROFILE IS '프로필';
COMMENT ON COLUMN MEMBER.FILE_NO IS '파일번호';

-- 멤버 테이블 샘플데이터 5개
INSERT INTO MEMBER (MEM_ID, MEM_TOKEN, MEM_INTRO, CREATE_DATE, STATUS, STACK_NAME, TEAM, TEAM_STATUS,GIT_NICK) VALUES ('0000', '00000', '자기소개1', DEFAULT, DEFAULT, 'JAVA, AWS', 1, 'Y','호빵천사친구');
INSERT INTO MEMBER (MEM_ID, MEM_TOKEN, MEM_INTRO, CREATE_DATE, STATUS, STACK_NAME, TEAM, TEAM_STATUS,GIT_NICK) VALUES ('11111', '21451', '자기소개1', DEFAULT, DEFAULT, 'JAVA, AWS', 1, 'Y','호빵천사');
INSERT INTO MEMBER (MEM_ID, MEM_TOKEN, MEM_INTRO, CREATE_DATE, STATUS, STACK_NAME, TEAM, TEAM_STATUS,GIT_NICK) VALUES ('22222', '46747', '자기소개2', DEFAULT, DEFAULT, 'JAVA, AWS', 1, 'Y','찐빵천사');
INSERT INTO MEMBER (MEM_ID, MEM_TOKEN, MEM_INTRO, CREATE_DATE, STATUS, STACK_NAME, TEAM, TEAM_STATUS,GIT_NICK) VALUES ('33333', '21125', '자기소개3', DEFAULT, DEFAULT, 'JAVA, AWS', 1, 'Y','피자빵천사');
INSERT INTO MEMBER (MEM_ID, MEM_TOKEN, MEM_INTRO, CREATE_DATE, STATUS, STACK_NAME, TEAM, TEAM_STATUS,GIT_NICK) VALUES ('44444', '84849', '자기소개4', DEFAULT, DEFAULT, 'JAVA, AWS', 1, 'Y','마늘빵천사');
INSERT INTO MEMBER (MEM_ID, MEM_TOKEN, MEM_INTRO, CREATE_DATE, STATUS, STACK_NAME, TEAM, TEAM_STATUS,GIT_NICK) VALUES ('55555', '28922', '자기소개5', DEFAULT, DEFAULT, 'JAVA, AWS', 1, 'Y','붕어빵천사');

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

-- 친구 테이블 코멘트
COMMENT ON COLUMN FRIEND.BF_GIVER IS '친구 요청자';
COMMENT ON COLUMN FRIEND.BF_TAKER IS '친구 요청받는자';
COMMENT ON COLUMN FRIEND.STATUS IS '친구상태(Y:친구,A:친구요청,B:친구거절,D:차단)';
COMMENT ON COLUMN FRIEND.REQUEST_DATE IS '친구 요청일';

-- 친구 테이블 샘플 데이터
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

COMMENT ON COLUMN MEETING.MEETING_NO IS '회의번호';
COMMENT ON COLUMN MEETING.MEETING_CREATER IS '회의개최자';
COMMENT ON COLUMN MEETING.MEETING_NM IS '회의명';
COMMENT ON COLUMN MEETING.MEETING_PW IS '회의비밀번호';

--------------------------------------------------
--------------     MEETING_MEMBER	------------------	
--------------------------------------------------
CREATE TABLE MEETING_MEMBER(
    MEETING_NO NUMBER REFERENCES MEETING ON DELETE CASCADE NOT NULL,
    MEM_ID VARCHAR2(50) REFERENCES MEMBER ON DELETE CASCADE NOT NULL
);

COMMENT ON COLUMN MEETING_MEMBER.MEETING_NO IS '회의번호';
COMMENT ON COLUMN MEETING_MEMBER.MEM_ID IS '회원아이디';

--------------------------------------------------
--------------     FOLLOW	------------------	
--------------------------------------------------
CREATE TABLE FOLLOW(
    FOLLOWING_MEM VARCHAR2(50) REFERENCES MEMBER ON DELETE CASCADE NOT NULL,
    FOLLOW_MEM VARCHAR2(50) REFERENCES MEMBER ON DELETE CASCADE NOT NULL,
    FOLLOW_DATE DATE DEFAULT SYSDATE NOT NULL,
    PRIMARY KEY(FOLLOWING_MEM,FOLLOW_MEM)
);

COMMENT ON COLUMN FOLLOW.FOLLOWING_MEM IS '팔로우한 회원번호';
COMMENT ON COLUMN FOLLOW.FOLLOW_MEM IS '팔로우 받은 회원번호';
COMMENT ON COLUMN FOLLOW.FOLLOW_DATE IS '팔로우 날짜';

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

-- 프로젝트 모집 테이블 코멘트
COMMENT ON COLUMN PROJECT.PRO_NO IS '프로젝트 모집번호';
COMMENT ON COLUMN PROJECT.PRO_WRITER IS '프로젝트 작성자';
COMMENT ON COLUMN PROJECT.PRO_STACK IS '프로젝트 사용 기술스택';
COMMENT ON COLUMN PROJECT.PRO_TITLE IS '프로젝트 모집제목';
COMMENT ON COLUMN PROJECT.PRO_CONTENT IS '프로젝트 모집내용';
COMMENT ON COLUMN PROJECT.PRO_MEMBER IS '프로젝트 모집인원';
COMMENT ON COLUMN PROJECT.PRO_PERIOD IS '프로젝트 진행기간';
COMMENT ON COLUMN PROJECT.PRO_DEADLINE IS '프로젝트 모집마감일';
COMMENT ON COLUMN PROJECT.PRO_START_DATE IS '프로젝트 시작예정일';
COMMENT ON COLUMN PROJECT.PRO_POSITION IS '프로젝트 모집포지션';
COMMENT ON COLUMN PROJECT.PRO_STATUS IS '프로젝트 모집상태';
COMMENT ON COLUMN PROJECT.STATUS IS '프로젝트 게시글 상태';
COMMENT ON COLUMN PROJECT.COUNT IS '조회수';
COMMENT ON COLUMN PROJECT.CREATE_DATE IS '프로젝트 모집 생성일';


-- 프로젝트 모집 테이블 샘플데이터
INSERT INTO
PROJECT
VALUES
(
SEQ_PNO.NEXTVAL
, '0000'
, 'java,javascript,mysql'
, '백엔드 개발자 구합니다'
, '내가 백엔드 좀 한다? 모십니다'
, 1
, '3개월'
, '2023-10-20'
, '2023-10-22'
, '백엔드'
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
, '아~ 화면 잘 만드는 프론트 개발자 어디 없을까~?'
, '화면을 기깔나게 만들 수 있는 프론트 개발자 분 급구합니다!!!!!'
, 1
, '4개월'
, '2023-10-28'
, '2023-10-30'
, '프론트엔드'
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

, '야! 너 들어와!!'
, '같이 프로젝트 하자?'
, 1
, '5개월'
, '2023-10-18'
, '2023-10-20'
, '백엔드'
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

-- 완료된 프로젝트 코멘트
COMMENT ON COLUMN FINPROJECT.PRO_NO IS '완료된 프로젝트 번호';
COMMENT ON COLUMN FINPROJECT.REF_PNO IS '참조 프로젝트 번호';  -- 혹시 몰라 만든 컬럼
COMMENT ON COLUMN FINPROJECT.PRO_TITLE IS '완료된 프로젝트 제목';
COMMENT ON COLUMN FINPROJECT.PRO_CONTENT IS '완료된 프로젝트 내용';
COMMENT ON COLUMN FINPROJECT.PRO_README IS '리드미파일';
COMMENT ON COLUMN FINPROJECT.CREATE_DATE IS '작성일';
COMMENT ON COLUMN FINPROJECT.STATUS IS '상태';

-- 완료된 프로젝트 샘플 데이터
INSERT INTO 
            FINPROJECT 
     VALUES     
     (
       SEQ_FPNO.NEXTVAL
     , 1
     , '완료제목1'
     , '완료 내용1'
     , '리드미'
     , SYSDATE
     , 'Y'
     );


INSERT INTO 
            FINPROJECT 
     VALUES     
     (
       SEQ_FPNO.NEXTVAL
     , 2
     , '완료제목2'
     , '완료 내용2'
     , '리드미'
     , SYSDATE
     , 'Y'
     );
     
     INSERT INTO 
            FINPROJECT 
     VALUES     
     (
       SEQ_FPNO.NEXTVAL
     , 2
     , '완료제목3'
     , '완료 내용3'
     , '리드미'
     , SYSDATE
     , 'Y'
     );

INSERT INTO 
            FINPROJECT 
     VALUES     
     (
       SEQ_FPNO.NEXTVAL
     , 1
     , '완료제목4'
     , '완료 내용4'
     , '리드미'
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

-- 알림 테이블 코멘트
COMMENT ON COLUMN NOTICE.NOTI_NO IS '알림번호';
COMMENT ON COLUMN NOTICE.CATEGORY_NAME IS '카테고리명';
COMMENT ON COLUMN NOTICE.NOTI_CONTENT IS '알림내용';
COMMENT ON COLUMN NOTICE.OCU_TIME IS '알림발생시간';
COMMENT ON COLUMN NOTICE.STATUS IS '알림상태';
COMMENT ON COLUMN NOTICE.MEM_ID IS '회원아이디';

-- 알림 테이블 샘플데이터
INSERT INTO NOTICE (NOTI_NO, CATEGORY_NAME, NOTI_CONTENT, OCU_TIME, STATUS, MEM_ID) VALUES (SEQ_NNO.NEXTVAL, '이슈', '00_java-workspace에 새로운 이슈가 발생했습니다.', DEFAULT, DEFAULT, '11111');
INSERT INTO NOTICE (NOTI_NO, CATEGORY_NAME, NOTI_CONTENT, OCU_TIME, STATUS, MEM_ID) VALUES (SEQ_NNO.NEXTVAL, '친구', 'USER03 님이 친구요청을 수락하셨습니다.', DEFAULT, DEFAULT, '22222');
INSERT INTO NOTICE (NOTI_NO, CATEGORY_NAME, NOTI_CONTENT, OCU_TIME, STATUS, MEM_ID) VALUES (SEQ_NNO.NEXTVAL, '개인홍보', 'USER02 님이 고객님의 자기PR에 좋아요를 눌렀습니다.', DEFAULT, DEFAULT, '0000');

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

COMMENT ON COLUMN REPLY.REPLY_NO IS '댓글 번호';
COMMENT ON COLUMN REPLY.MEM_ID IS '댓글 작성자';           
COMMENT ON COLUMN REPLY.REP_CONTENT IS '댓글 내용';
COMMENT ON COLUMN REPLY.REF_PRO IS '참조 게시물';   
COMMENT ON COLUMN REPLY.REP_DATE IS '댓글 작성일';     
COMMENT ON COLUMN REPLY.STATUS IS '댓글 삭제여부';     

INSERT INTO 
            REPLY
     VALUES
     (
       SEQ_RENO.NEXTVAL
     , '0000'
     , '저도 참여하고 싶어요'
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
     , '대한의 건아!! 성실한 제가 한번 참여해보겠읍니다.'
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

-- 자기PR 코멘트
COMMENT ON COLUMN MY_PR.PR_NO IS 'PR 번호';
COMMENT ON COLUMN MY_PR.PR_TITLE IS 'PR 제목';
COMMENT ON COLUMN MY_PR.PR_CONTENT IS 'PR 내용';
COMMENT ON COLUMN MY_PR.CREATE_DATE IS 'PR 작성일';
COMMENT ON COLUMN MY_PR.STATUS IS '상태';
COMMENT ON COLUMN MY_PR.STACK_NAME IS '기술스택';
COMMENT ON COLUMN MY_PR.MEM_ID IS '회원아이디';
COMMENT ON COLUMN MY_PR.COUNT IS '조회수';
COMMENT ON COLUMN MY_PR.PR_TIME IS '프로젝트 가능시간';


INSERT INTO MY_PR 
     VALUES
     (
       SEQ_MPNO.NEXTVAL
     , '성실한 개발자입니다'  
     , '저를 뽑으면 절대 후회하지 않습니다.'
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
     , '아... 프로젝트 하고싶다'  
     , '프로젝트 하고 싶어 미치겠읍니다. 데려가주십시오'
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
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
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
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
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
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
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
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
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
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
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
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
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
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
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
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
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
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
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
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
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
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
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
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
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
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
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

-- 캘린더 코멘트 작성
COMMENT ON COLUMN CALENDAR.CAL_NO IS '일정 번호';
COMMENT ON COLUMN CALENDAR.CAL_TITLE IS '일정 제목';
COMMENT ON COLUMN CALENDAR.CAL_CONTENT IS '일정 내용';
COMMENT ON COLUMN CALENDAR.START_DATE IS '일정 시작일';
COMMENT ON COLUMN CALENDAR.END_DATE IS '일정 종료일';
COMMENT ON COLUMN CALENDAR.CAL_CATEGORY IS '일정 카테고리';
COMMENT ON COLUMN CALENDAR.CAL_STATUS IS '일정 진행여부(초록색, 회색)';
COMMENT ON COLUMN CALENDAR.STATUS IS '일정 삭제여부';

-- 캘린더 샘플 데이터 5개
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CDNO.NEXTVAL, '주제선정', '프로젝트 주제 선정 및 역할 분담', '2023-10-16', '2023-10-16', '업무', DEFAULT, DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CDNO.NEXTVAL, '팀 회식', '단합을 위한 회식', '2023-10-21', '2023-10-21', '소셜', DEFAULT, DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CDNO.NEXTVAL, '팀 선정', '팀 선정 및 인사', '2023-10-4', '2023-10-4', '업무', 'N', DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CDNO.NEXTVAL, '가족과 저녁식사', '가족과 김밥천국에서 저녁식사', '2023-10-17', '2023-10-17', '개인', DEFAULT, DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CDNO.NEXTVAL, '페이지 제작', '페이지 제작 및 피드백', '2023-10-17', '2023-10-30', '업무', DEFAULT, DEFAULT);

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

-- 레파지토리 코멘트 작성
COMMENT ON COLUMN REPOSITORY.REPO_NO IS '레파지토리 번호';
COMMENT ON COLUMN REPOSITORY.REPO_TITLE IS '레파지토리 이름';
COMMENT ON COLUMN REPOSITORY.REPO_CONTENT IS '레파지토리 내용';
COMMENT ON COLUMN REPOSITORY.REPO_STATUS IS '레파지토리 공개여부';
COMMENT ON COLUMN REPOSITORY.CREATE_DATE IS '레파지토리 생성일';
COMMENT ON COLUMN REPOSITORY.STATUS IS '레파지토리 삭제여부';
COMMENT ON COLUMN REPOSITORY.REF_MID IS '참조 회원 번호';
COMMENT ON COLUMN REPOSITORY.REF_PNO IS '참조 프로젝트 번호';

-- 레파지토리 샘플 데이터 5개
INSERT INTO REPOSITORY (REPO_NO, REPO_TITLE, REPO_CONTENT, REPO_STATUS, CREATE_DATE, STATUS, REF_MID, REF_PNO) VALUES (SEQ_RNO.NEXTVAL, 'FINAL_HTML', '레파지 내용임돠', DEFAULT, DEFAULT, DEFAULT, '0000', 1);
INSERT INTO REPOSITORY (REPO_NO, REPO_TITLE, REPO_CONTENT, REPO_STATUS, CREATE_DATE, STATUS, REF_MID, REF_PNO) VALUES (SEQ_RNO.NEXTVAL, 'FINAL_JSP', '레파지 내용임돠', DEFAULT, DEFAULT, DEFAULT, '0000', 2);
INSERT INTO REPOSITORY (REPO_NO, REPO_TITLE, REPO_CONTENT, REPO_STATUS, CREATE_DATE, STATUS, REF_MID, REF_PNO) VALUES (SEQ_RNO.NEXTVAL, 'FINAL_TEST', '레파지 내용임돠', DEFAULT, DEFAULT, DEFAULT, '0000', 3);
INSERT INTO REPOSITORY (REPO_NO, REPO_TITLE, REPO_CONTENT, REPO_STATUS, CREATE_DATE, STATUS, REF_MID, REF_PNO) VALUES (SEQ_RNO.NEXTVAL, 'FINAL_TEMPLATE', '레파지 내용임돠', DEFAULT, DEFAULT, DEFAULT, '0000', 2);
INSERT INTO REPOSITORY (REPO_NO, REPO_TITLE, REPO_CONTENT, REPO_STATUS, CREATE_DATE, STATUS, REF_MID, REF_PNO) VALUES (SEQ_RNO.NEXTVAL, 'FINAL_REAL', '레파지 내용임돠', DEFAULT, DEFAULT, DEFAULT, '0000', 1);

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

-- 커밋 코멘트 작성
COMMENT ON COLUMN PRO_COMMIT.COMMIT_NO IS '커밋 번호';
COMMENT ON COLUMN PRO_COMMIT.COMMIT_MEM IS '커밋 작성자';
COMMENT ON COLUMN PRO_COMMIT.COMMIT_DATE IS '커밋 날짜';
COMMENT ON COLUMN PRO_COMMIT.COMM_HASH IS '커밋 해쉬값';
COMMENT ON COLUMN PRO_COMMIT.REPO_NO IS '레파지토리 번호';

-- 커밋 샘플 데이터 5개
INSERT INTO PRO_COMMIT (COMMIT_NO, COMMIT_MEM, COMMIT_DATE, COMM_HASH, REPO_NO) VALUES (SEQ_CNO.NEXTVAL, '0000', DEFAULT, '로그인 기능 수정', 1);
INSERT INTO PRO_COMMIT (COMMIT_NO, COMMIT_MEM, COMMIT_DATE, COMM_HASH, REPO_NO) VALUES (SEQ_CNO.NEXTVAL, '0000', DEFAULT, '좋아요 기능 버그 수정', 2);
INSERT INTO PRO_COMMIT (COMMIT_NO, COMMIT_MEM, COMMIT_DATE, COMM_HASH, REPO_NO) VALUES (SEQ_CNO.NEXTVAL, '0000', DEFAULT, '레파지토리 등록 기능 추가', 3);
INSERT INTO PRO_COMMIT (COMMIT_NO, COMMIT_MEM, COMMIT_DATE, COMM_HASH, REPO_NO) VALUES (SEQ_CNO.NEXTVAL, '0000', DEFAULT, '신고 기능 삭제', 4);
INSERT INTO PRO_COMMIT (COMMIT_NO, COMMIT_MEM, COMMIT_DATE, COMM_HASH, REPO_NO) VALUES (SEQ_CNO.NEXTVAL, '0000', DEFAULT, '마이페이지 기능 코드 수정', 5);

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

-- 마일스톤 테이블 코멘트
COMMENT ON COLUMN MILESTONE.MIL_NO IS '마일스톤 번호';
COMMENT ON COLUMN MILESTONE.MIL_TITLE IS '마일스톤 제목';
COMMENT ON COLUMN MILESTONE.CREATE_DATE IS '마일스톤 생성일';
COMMENT ON COLUMN MILESTONE.MODIFY_DATE IS '마일스톤 종료일';
COMMENT ON COLUMN MILESTONE.END_DATE IS '최근 수정일';
COMMENT ON COLUMN MILESTONE.ISSUING IS '진행중인 이슈';
COMMENT ON COLUMN MILESTONE.PROGRESS IS '진척도';
COMMENT ON COLUMN MILESTONE.STATUS IS '마일스톤 상태';
COMMENT ON COLUMN MILESTONE.MEM_ID IS '마일스톤 작성자';
COMMENT ON COLUMN MILESTONE.REPO_NO IS '레퍼지토리 번호';

-- 마일스톤 INSERT문
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
     , '마일1'
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
     , '마일2'
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
     , '마일3'
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

-- 이슈 테이블 코멘트
COMMENT ON COLUMN ISSUE.ISS_NO IS '이슈번호';
COMMENT ON COLUMN ISSUE.ISS_TITLE IS '이슈제목';
COMMENT ON COLUMN ISSUE.ISS_CONTENT IS '이슈내용';
COMMENT ON COLUMN ISSUE.CREATE_DATE IS '이슈 생성일';
COMMENT ON COLUMN ISSUE.MODIFY_DATE IS '이슈 수정일';
COMMENT ON COLUMN ISSUE.END_DATE IS '이슈 종료일';
COMMENT ON COLUMN ISSUE.ISS_ASSIGNEE IS '이슈 할당받은 사람';
COMMENT ON COLUMN ISSUE.ISS_STATUS IS '이슈 진행상태(Y/N)';
COMMENT ON COLUMN ISSUE.STATUS IS '이슈상태(Y/N)';
COMMENT ON COLUMN ISSUE.MEM_ID IS '이슈 작성자';
COMMENT ON COLUMN ISSUE.LAB_NAME IS '이슈가 속한 라벨(,로 구분)';
COMMENT ON COLUMN ISSUE.MIL_NO IS '이슈가 속한 마일스톤';
COMMENT ON COLUMN ISSUE.REPO_NO IS '이슈가 속한 레퍼지토리 번호';

-- 이슈 INSERT문
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
     , '제목1'
     , '내용1'
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
     , '제목2'
     , '내용2'
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
     , '제목1'
     , '내용1'
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

-- 풀리퀘 코멘트
COMMENT ON COLUMN PULL_REQUEST.PULL_NO IS '풀리퀘 번호';
COMMENT ON COLUMN PULL_REQUEST.PULL_TITLE IS '풀리퀘 제목';
COMMENT ON COLUMN PULL_REQUEST.PULL_CONTENT IS '풀리퀘 내용';
COMMENT ON COLUMN PULL_REQUEST.PULL_WRITER IS '풀리퀘 작성자';
COMMENT ON COLUMN PULL_REQUEST.PULL_MANAGER IS '풀리퀘 담당자';
COMMENT ON COLUMN PULL_REQUEST.REPO_NO IS '레파지토리 번호';
COMMENT ON COLUMN PULL_REQUEST.ISS_NO IS '이슈 번호';
COMMENT ON COLUMN PULL_REQUEST.MIL_NO IS '마일스톤 번호';
COMMENT ON COLUMN PULL_REQUEST.STATUS IS '상태(M:머지,C:진행중,N:거절)';
COMMENT ON COLUMN PULL_REQUEST.CREATE_DATE IS '작성일';

-- 풀리퀘 샘플데이터
INSERT INTO 
            PULL_REQUEST
     VALUES 
     (
       SEQ_PQNO.NEXTVAL
     , '풀리퀘받아랏!'
     , '풀리퀘 확인해보시지?'
     , '0000'
     , '호빵맨,세균맨'
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
     , '풀리퀘받아랏1!'
     , '풀리퀘 확인해보시지1?'
     , '11111'
     , '호빵맨,세균맨'
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
     , '풀리퀘받아랏3!'
     , '풀리퀘 확인해보시지3?'
     , '22222'
     , '호빵맨,세균맨'
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
     , '풀리퀘받아랏4!'
     , '풀리퀘 확인해보시지4?'
     , '11111'
     , '호빵맨,세균맨'
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
     , '풀리퀘받아랏5!'
     , '풀리퀘 확인해보시지5?'
     , '11111'
     , '호빵맨,세균맨'
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

-- 풀리퀘스트 리뷰 테이블 코멘트
COMMENT ON COLUMN PULL_REVIEW.REVIEW_NO IS '풀리퀘스트 리뷰 번호';
COMMENT ON COLUMN PULL_REVIEW.REF_PULL IS '참조할 풀리퀘스트 번호';
COMMENT ON COLUMN PULL_REVIEW.MEM_ID IS '작성한 회원 아이디';
COMMENT ON COLUMN PULL_REVIEW.REVIEW_CONTENT IS '리뷰 내용';
COMMENT ON COLUMN PULL_REVIEW.CREATE_DATE IS '작성일';

-- 풀리퀘스트 리뷰 테이블 샘플데이터
INSERT INTO PULL_REVIEW (REVIEW_NO, REF_PULL, MEM_ID, REVIEW_CONTENT, CREATE_DATE) VALUES (SEQ_PRNO.NEXTVAL, 1, '0000', '이상무', DEFAULT);
INSERT INTO PULL_REVIEW (REVIEW_NO, REF_PULL, MEM_ID, REVIEW_CONTENT, CREATE_DATE) VALUES (SEQ_PRNO.NEXTVAL, 2, '22222', '유상무', DEFAULT);
INSERT INTO PULL_REVIEW (REVIEW_NO, REF_PULL, MEM_ID, REVIEW_CONTENT, CREATE_DATE) VALUES (SEQ_PRNO.NEXTVAL, 3, '11111', '홍당무', DEFAULT);

COMMIT;
