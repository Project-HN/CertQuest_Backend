-- 테스트_데이터_삽입.sql

-- USERS 테이블 데이터
INSERT INTO USERS (email, name, nickname, password, signup_type) VALUES ('user1@example.com', '홍길동', '길동이', 'password123', 'email');
INSERT INTO USERS (email, name, nickname, password, signup_type) VALUES ('user2@example.com', '김철수', '철수킹', 'mypassword', 'kakao');
INSERT INTO USERS (email, name, nickname, password, signup_type) VALUES ('user3@example.com', '이영희', '영희님', 'securepass', 'google');
INSERT INTO USERS (email, name, nickname, password, signup_type) VALUES ('user4@example.com', '박보영', '보영쓰', 'testpass123', 'naver');

-- CERTIFICATES 테이블 데이터
INSERT INTO CERTIFICATES (name, description) VALUES ('정보처리기사', '정보시스템의 생명주기 전반에 걸친 프로젝트 업무를 수행하는 직무로서 계획수립, 분석, 설계, 구현, 시험, 운영, 유지보수 등의 업무를 수행할 수 있는 능력을 검증하는 시험입니다. 데이터 모델의 이해 및 분석, SQL 이해 및 활용 능력을 포함합니다.');
INSERT INTO CERTIFICATES (name, description) VALUES ('네트워크관리사 2급', '서버를 구축하고 보안 및 웹 서비스 등 네트워크 인프라를 효율적으로 구축, 관리할 수 있는 전문가 양성을 목표로 하는 자격증입니다.');

-- SUBJECTS 테이블 데이터 (CERTIFICATES의 cert_id를 참조)
-- 정보처리기사 (cert_id = 1) 과목
INSERT INTO SUBJECTS (cert_id, name) VALUES ((SELECT cert_id FROM CERTIFICATES WHERE name = '정보처리기사'), '소프트웨어 설계');
INSERT INTO SUBJECTS (cert_id, name) VALUES ((SELECT cert_id FROM CERTIFICATES WHERE name = '정보처리기사'), '소프트웨어 개발');
INSERT INTO SUBJECTS (cert_id, name) VALUES ((SELECT cert_id FROM CERTIFICATES WHERE name = '정보처리기사'), '데이터베이스 구축');
INSERT INTO SUBJECTS (cert_id, name) VALUES ((SELECT cert_id FROM CERTIFICATES WHERE name = '정보처리기사'), '프로그래밍 언어 활용');
INSERT INTO SUBJECTS (cert_id, name) VALUES ((SELECT cert_id FROM CERTIFICATES WHERE name = '정보처리기사'), '정보시스템 구축 관리');
-- 네트워크관리사 2급 (cert_id = 2) 과목
INSERT INTO SUBJECTS (cert_id, name) VALUES ((SELECT cert_id FROM CERTIFICATES WHERE name = '네트워크관리사 2급'), '네트워크 일반');
INSERT INTO SUBJECTS (cert_id, name) VALUES ((SELECT cert_id FROM CERTIFICATES WHERE name = '네트워크관리사 2급'), 'TCP/IP');
INSERT INTO SUBJECTS (cert_id, name) VALUES ((SELECT cert_id FROM CERTIFICATES WHERE name = '네트워크관리사 2급'), '네트워크 운영체제');


-- PROBLEMS 테이블 데이터 (SUBJECTS의 subject_id를 참조)
-- 데이터베이스 구축 과목 문제
INSERT INTO PROBLEMS (subject_id, year, round, question, option_1, option_2, option_3, option_4, option_5, answer, explanation)
VALUES ((SELECT subject_id FROM SUBJECTS WHERE name = '데이터베이스 구축' AND cert_id = (SELECT cert_id FROM CERTIFICATES WHERE name = '정보처리기사')), 2023, 1, '다음 중 데이터베이스 관리 시스템(DBMS)의 특징이 아닌 것은?', '데이터 중복 최소화', '데이터 무결성 유지', '데이터 독립성 보장', '데이터 보안 기능 미제공', '데이터 공유 기능 제공', 4, 'DBMS는 데이터 보안 기능을 제공합니다.');

INSERT INTO PROBLEMS (subject_id, year, round, question, option_1, option_2, option_3, option_4, option_5, answer, explanation)
VALUES ((SELECT subject_id FROM SUBJECTS WHERE name = '데이터베이스 구축' AND cert_id = (SELECT cert_id FROM CERTIFICATES WHERE name = '정보처리기사')), 2024, 2, '관계형 데이터베이스에서 튜플(Tuple)의 개수를 의미하는 용어는?', '차수(Degree)', '카디널리티(Cardinality)', '도메인(Domain)', '속성(Attribute)', NULL, 2, '튜플의 개수는 카디널리티(Cardinality)라고 합니다.');

-- 소프트웨어 설계 과목 문제
INSERT INTO PROBLEMS (subject_id, year, round, question, option_1, option_2, option_3, option_4, option_5, answer, explanation)
VALUES ((SELECT subject_id FROM SUBJECTS WHERE name = '소프트웨어 설계' AND cert_id = (SELECT cert_id FROM CERTIFICATES WHERE name = '정보처리기사')), 2023, 1, '객체지향 설계 원칙 중 SOLID의 S에 해당하는 것은?', 'Single Responsibility Principle', 'Open/Closed Principle', 'Liskov Substitution Principle', 'Interface Segregation Principle', 'Dependency Inversion Principle', 1, 'SOLID의 S는 단일 책임 원칙(Single Responsibility Principle)을 의미합니다.');


-- USER_PROBLEM_STATUS 테이블 데이터
INSERT INTO USER_PROBLEM_STATUS (user_id, problem_id, solved, bookmarked, wrong)
VALUES ((SELECT user_id FROM USERS WHERE email = 'user1@example.com'), (SELECT problem_id FROM PROBLEMS WHERE question LIKE '다음 중 데이터베이스 관리 시스템%' AND ROWNUM = 1), 1, 0, 0);

INSERT INTO USER_PROBLEM_STATUS (user_id, problem_id, solved, bookmarked, wrong)
VALUES ((SELECT user_id FROM USERS WHERE email = 'user1@example.com'), (SELECT problem_id FROM PROBLEMS WHERE question LIKE '관계형 데이터베이스에서 튜플%' AND ROWNUM = 1), 1, 1, 1);

INSERT INTO USER_PROBLEM_STATUS (user_id, problem_id, solved, bookmarked, wrong)
VALUES ((SELECT user_id FROM USERS WHERE email = 'user1@example.com'), (SELECT problem_id FROM PROBLEMS WHERE question LIKE '객체지향 설계 원칙 중 SOLID%' AND ROWNUM = 1), 0, 1, 0);

INSERT INTO USER_PROBLEM_STATUS (user_id, problem_id, solved, bookmarked, wrong)
VALUES ((SELECT user_id FROM USERS WHERE email = 'user2@example.com'), (SELECT problem_id FROM PROBLEMS WHERE question LIKE '다음 중 데이터베이스 관리 시스템%' AND ROWNUM = 1), 1, 0, 1);


-- USER_CERT_PROGRESS 테이블 데이터
INSERT INTO USER_CERT_PROGRESS (user_id, cert_id, solved_count, wrong_count)
VALUES ((SELECT user_id FROM USERS WHERE email = 'user1@example.com'), (SELECT cert_id FROM CERTIFICATES WHERE name = '정보처리기사'), 2, 1);

INSERT INTO USER_CERT_PROGRESS (user_id, cert_id, solved_count, wrong_count)
VALUES ((SELECT user_id FROM USERS WHERE email = 'user2@example.com'), (SELECT cert_id FROM CERTIFICATES WHERE name = '정보처리기사'), 1, 1);


-- EXAM_LOGS 테이블 데이터
INSERT INTO EXAM_LOGS (user_id, cert_id, "mode", problem_ids, started_at, ended_at)
VALUES (
    (SELECT user_id FROM USERS WHERE email = 'user1@example.com'),
    (SELECT cert_id FROM CERTIFICATES WHERE name = '정보처리기사'),
    '기출',
    '[' || (SELECT problem_id FROM PROBLEMS WHERE question LIKE '다음 중 데이터베이스 관리 시스템%' AND ROWNUM = 1) || ', ' || (SELECT problem_id FROM PROBLEMS WHERE question LIKE '관계형 데이터베이스에서 튜플%' AND ROWNUM = 1) || ']',
    SYSTIMESTAMP - INTERVAL '30' MINUTE,
    SYSTIMESTAMP
);

INSERT INTO EXAM_LOGS (user_id, cert_id, "mode", problem_ids, started_at, ended_at)
VALUES (
    (SELECT user_id FROM USERS WHERE email = 'user2@example.com'),
    (SELECT cert_id FROM CERTIFICATES WHERE name = '정보처리기사'),
    '전체',
    '[' || (SELECT problem_id FROM PROBLEMS WHERE question LIKE '다음 중 데이터베이스 관리 시스템%' AND ROWNUM = 1) || ', ' || (SELECT problem_id FROM PROBLEMS WHERE question LIKE '관계형 데이터베이스에서 튜플%' AND ROWNUM = 1) || ', ' || (SELECT problem_id FROM PROBLEMS WHERE question LIKE '객체지향 설계 원칙 중 SOLID%' AND ROWNUM = 1) || ']',
    SYSTIMESTAMP - INTERVAL '1' HOUR,
    SYSTIMESTAMP - INTERVAL '40' MINUTE
);


-- POSTS 테이블 데이터
INSERT INTO POSTS (user_id, title, content, category)
VALUES ((SELECT user_id FROM USERS WHERE email = 'user1@example.com'), '정보처리기사 스터디 모집합니다!', '온라인으로 매주 2회 진행할 정보처리기사 스터디원 구합니다. 의욕 있으신 분 환영해요!', '공부모임');

INSERT INTO POSTS (user_id, title, content, category)
VALUES ((SELECT user_id FROM USERS WHERE email = 'user2@example.com'), '오늘 시험 너무 어려웠네요...', '다들 정보처리기사 2회차 보셨나요? 전 너무 어려웠어요 ㅠㅠ', '자유');


-- COMMENTS 테이블 데이터
INSERT INTO COMMENTS (post_id, user_id, content)
VALUES ((SELECT post_id FROM POSTS WHERE title = '정보처리기사 스터디 모집합니다!'), (SELECT user_id FROM USERS WHERE email = 'user3@example.com'), '저 참여하고 싶어요! 어떤 방식으로 진행되나요?');

INSERT INTO COMMENTS (post_id, user_id, content)
VALUES ((SELECT post_id FROM POSTS WHERE title = '오늘 시험 너무 어려웠네요...'), (SELECT user_id FROM USERS WHERE email = 'user1@example.com'), '저도요 ㅠㅠ 특히 데이터베이스가 헷갈렸어요.');