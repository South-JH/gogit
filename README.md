<img src="https://capsule-render.vercel.app/api?type=waving&&color=0:EEFF00,100:a82da8&height=200&section=header&text=Welcome%20to%20GoGit🫶&fontSize=40&fontAlign=75" />
<br/>

# 📌프로젝트 소개 

요즘 개발자들 사이에서 깃허브는 형상 관리를 위한 필수 도구이지만, 신입 개발자들이 사용하기에는 어려운 부분이 있고 개발 가이드도 명확하지 않은 경우가 많습니다. <br/>
유명한 협업 도구일지라도 사용 과정에서 아쉬운 점이 있을 수 있습니다. <br/>
이에 따라, 저희는 이러한 단점을 보완하고 Git을 보다 간편하게, 초보자도 쉽게 다룰 수 있는 플랫폼을 제작하려고 합니다. <br/>
<br/><br/> 

# ⌚ 개발기간

◽ 2024.03.25 ~ 2024.03.26 주제, 프로젝트명 선정 <br/>
◽ 2024.03.27 ~ 2024.03.27 기획의도, 유사사이트 분석, 클라이언트 요구사항분석 <br/>
◽ 2024.03.28 ~ 2024.04.02  메인페이지 회의, UseCase Diagram 작성, 사이트맵작성 <br/>
◽ 2024.04.02 ~ 2024.04.04 DB 테이블 설계, 샘플데이터, ERD 작성 <br/>
◽ 2024.04.05 ~ 2024.04.10 화면 JSP 생성, 기능구현, JDBC 오라클연동 후 CRUD 최소 1개 <br/>
◽ 2024.04.11 ~ 2024.04.26 프로젝트 구현 및 디버깅 <br/>
◽ 2024.04.29 ~ 2024.05.01 베타 테스트, 최종 발표자료 준비 <br/>
<br/><br/> <br/>

# 🌱 구성원 및 역할

💗 조장 : 김초롱
   - Repository 관리
   - issue 관리
   - Commit List
   - Branch
<br/>

💛 조원 : 박지민
   - 프로젝트 
   - 커밋캘린더
   - 깃허브 전체검색
<br/>

💙 **조원 : 남지혜** <br/>
   - **GitHub 로그인** <br/>
   - **Pull Request 관리** <br/>
   - **GitHub 사용자 Follow/Unfollow** <br/>
<br/>

💜 조원 : 신동재
   - 친구등록 및 삭제
<br/>

🤎 조원 : 양동건
   - 프로젝트 캘린더
   - 마이 PR
   - 줌 회의
   - 알람
<br/><br/>

# ⚙ 개발환경
- OS : Windows10
- Developer Tools : Eclipse / VS Code / SqlDeveloper
- Server : Apach Tomcat 9.0
- DBMS : Oracle
- Management : Git, GitHub
- Front-end : HTML5 / CSS3 / JavaScript / jQuery / AJAX / JSON 
- BackEnd : Java 11, JSP & Servlet 

<br/>

# 💡 사용한 REST API
- 깃허브 API
- 줌 API
- gitignore.io API

<br/>

# ✔ 설계
ERD Cloud : 
![ERD Cloud](https://file.notion.so/f/f/87d71406-9469-4a04-834b-dc12ba2349e9/3793a43d-0a0b-4b21-9170-c5cbf9f5cd39/%EB%A7%9B%EC%A7%91%EC%9D%98_%EB%AF%BC%EC%A1%B1_ERD.png?id=90bb3dc5-b9c1-4504-8d54-471e55606221&table=block&spaceId=87d71406-9469-4a04-834b-dc12ba2349e9&expirationTimestamp=1711756800000&signature=cMKH8_wlhnK02YkQHbmfzuk56gu7TxTfTJHXVmYZ5hk)

<br/><br/>

# 📽 프로젝트 구현

### 💙 조원 : 남지혜

#### 로그인 <br/>
- GitHub 계정으로 로그인하는 기능 <br/>
![로그인](https://github.com/user-attachments/assets/f895c790-5f74-4a4b-b54e-01324e544646) <br/>

#### Pull Request <br/>
- Pull Request 목록 조회 <br/>
![PullRequest목록조회](https://github.com/user-attachments/assets/879848e1-abba-4e09-ad73-29fdd5a0d0eb) <br/>

- Pull Request Title, Comment 수정 <br/>
![PullRequest수정](https://github.com/user-attachments/assets/e897ba8e-eec3-4d38-9441-c196159fd041) <br/>

- Reviewer, Assignees 추가 및 삭제 <br/>
![Reviewer,Assignees추가및삭제](https://github.com/user-attachments/assets/68422e83-dcb0-4311-a3c1-02e3243e2f31) <br/>

- Review 등록 <br/>
![Review등록](https://github.com/user-attachments/assets/171266d3-2815-4218-82af-25a4fab1c0c2) <br/>

- Pull Request 상태 수정 (Open/Close) <br/>
![PullRequest상태변경](https://github.com/user-attachments/assets/d57159d5-66ce-411e-abdb-8150793a92af) <br/>

- Pull Request 생성 <br/>
![PullRequest생성](https://github.com/user-attachments/assets/7cf49aa0-1ebd-4397-b933-2a3cb74faaea) <br/>

- Pull Request Merge <br/>
![Merge](https://github.com/user-attachments/assets/a6b53c9f-f40d-4b52-a7a8-0b337b582d86) <br/>

#### 팔로우 <br/>
- GitHub 사용자의 계정을 Follow/Unfollow 하는 기능 (GitHub API를 사용하여 GitHub에 연동되는 Follow 기능) <br/>
![Follow](https://github.com/user-attachments/assets/79f9a054-f9af-46ff-b479-821a6d515988) <br/>

<br/><br/>

### 💛 조원 : 박지민

- 프로젝트(모집자) <br/>
   ◽ 프로젝트 모집글 작성 <br />
   ◽ 프로젝트 모집글 수정 <br />
   ◽ 프로젝트 모집글 삭제 <br />
   ◽ 프로젝트 모집마감 <br />

- 프로젝트(신청자) <br/>
   ◽ 프로젝트 신청 <br />
   ◽ 프로젝트 신청해제 <br />
   ◽ 프로젝트 거절 당했을 시 <br />
   ◽ 프로젝트 모집자가 수락 했을 시 <br />
     
- 프로젝트 댓글 <br/>
- 프로젝트 모집중 & 모집완료 조회 <br/>
<br />

- 프로젝트 키워드 검색 <br/>
<br />

- 커밋 내역 조회 캘린더 <br/>
<br />

- 깃허브 전체 USER 검색 <br/>
<br />

- 깃허브 전체 REPOSITORY 검색 <br/>

<br /><br />
### 🤎 조원 : 양동건

- 캘린더 <br/>
- 캘린더 일정 등록
<br/><br/>

- 캘린더 일정 수정
<br/><br/>

- 캘린더 일정 삭제
<br/><br/>

- 메인화면 PR TOP 5
<br/><br/>

- PR 검색
<br/><br/>

- PR 댓글
<br/><br/>

- PR 등록
<br/><br/>

- PR 수정
<br/><br/>

- PR 삭제
<br/><br/>

- 줌 회의 생성
<br /><br />
### 💗 조장 : 김초롱

- 레파지토리 관리 <br/>

   ◽ 레파지토리 리스트 조회 <br />
   ◽ 레파지토리 생성 <br />
   ◽ 레파지토리 사용자 초대 <br />
   ◽ 레파지토리 수정 <br />
   ◽ 레파지토리 삭제 <br />
   ◽ 레파지토리 컨텐츠 조회 <br />
   ◽ 브랜치별 커밋 리스트 조회 <br />

- 이슈 관리 <br/>

   ◽ 이슈 리스트 조회 <br />
   ◽ 이슈 생성 <br />

<br/><br/>

# 📚 최종보고서

최종보고서 링크

     
