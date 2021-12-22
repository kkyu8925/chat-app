# ChatPRJ
- Redis를 활용한 채팅 애플리케이션
- 학교 팀 프로젝트로 진행
- 개발 인원 총 5명(웹 개발 5명), 웹 개발 담당

### 진행 기간 : 2020-10-08 ~ 2020-11-23    

## 사용 기술
  - Spring 4.3.7 - 웹 프레임워크
  - Java 8 - 개발 언어
  - HTML/CSS/JS - 프론트 개발
  - Maven - 의존성 관리 프로그램
  - Tomcat - 웹 애플리케이션 서버
  - MariaDB, Redis - 데이터베이스
  - AWS EC2, RDS, Route53, Docker - 서버 인프라
  
## 설명  
- 데이터톡은 다른 사람들과 실시간으로 단체 채팅을 할 수 있는 웹 애플리케이션입니다. 
- OAuth 2.0 기반으로 구글이 제공하는 API에 접근하여 로그인 기능을 구현했습니다.
- 채팅방, 채팅 데이터는 In-Memory 데이터베이스인 Redis를 활용했습니다. 
- AWS EC2의 linux2 기반의 Docker 환경에서 실행하며 AWS RDS의 MariaDB를 사용했습니다. 
- AWS Route 53을 통해 도메인 주소를 라우팅했습니다. 

## 담당한 기능
- HTML, CSS, JavaScript를 사용해 Frontend 개발
- MariaDB, Redis, Docker 프로젝트 환경 구성
- WebSocket을 활용해 채팅 기능 구현
- 회원가입, 로그인 기능 구현
- OAuth 2.0 기반 구글 로그인 구현
- AWS EC2 + RDS + Route53 인프라 구성, 배포, 운영

### 시연영상 URL
> https://youtu.be/32nwd7ggvUk


