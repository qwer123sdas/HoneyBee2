SELECT * FROM MeetingFile;
SELECT * FROM Meeting;
DESC Meeting;
DESC MeetingReply;
SELECT * FROM Member;
DESC Member;
DESC Donation;
SELECT * FROM Donation;
SELECT * FROM MeetingReply;
DESC Member;
SELECT * FROM MeetingFile;
SELECT * FROM Member;
DESC Tag;
SELECT * FROM Tag;

-- 대댓글용 컬럼 추가 
-- 부모번호 추가
ALTER TABLE MeetingReply
ADD meeting_reply_parent INT(255) NOT NULL;

-- 부모댓글 참조갯수 깊이(기본값 0으로 시작함)
ALTER TABLE MeetingReply
ADD deep INT(255) NOT NULL DEFAULT '0';

-- 그룹번호(해당 대댓글 숫자 파악에 사용)
ALTER TABLE MeetingReply
ADD meeting_reply_gnum INT(255) NOT NULL DEFAULT '0';

SELECT * FROM MeetingReply;

-- 제약조건 확인
SELECT * FROM information_schema.table_constraints
WHERE table_name='MeetingReply';

-- 해당 컬럼 제약 조건 드랍
ALTER TABLE MeetingReply DROP constraint MeetingReply_ibfk_1;

-- 해당 컬럼 드랍
ALTER TABLE MeetingReply DROP COLUMN meeting_comment_id;

-- 컬럼->제약조건 추가
ALTER TABLE MeetingReply 
ADD meeting_id INT(255) NOT NULL AFTER member_id;
ALTER TABLE MeetingReply 
ADD FOREIGN KEY (meeting_id) REFERENCES Meeting(meeting_id);

-- meeting_reply_parent not null 지우고 기본값 0으로
ALTER TABLE MeetingReply
MODIFY COLUMN meeting_reply_parent INT(255) DEFAULT 0;

-- topic 컬럼 추가
ALTER TABLE Meeting
ADD topic INT(1) NOT NULL;

SELECT * FROM MeetingReply ;

set sql_safe_udpates=0;

-- 원댓글
SELECT * FROM MeetingReply 
WHERE meeting_reply_id = meeting_reply_parent;

-- 자식댓글 (또는 손자 댓글)
SELECT * FROM MeetingReply 
WHERE meeting_reply_id != meeting_reply_parent
  AND meeting_reply_parent = 18; -- 부모댓글번호


INSERT INTO MeetingReply (member_id, meeting_id, content, meeting_reply_parent)
VALUES ('admin', 5, '손자댓글이다#2', 20);

SELECT r.meeting_reply_id meetingReplyId,
			   r.meeting_id meetingId,
			   r.member_id memberId,
			   r.content,
			   r.inserted,
			   m.nickname
		FROM MeetingReply r JOIN Member m ON r.member_id = m.member_id
		WHERE r.meeting_reply_id = r.meeting_reply_parent
		  AND r.meeting_id = '8'
		ORDER BY meeting_reply_id;
        
select *
  from MeetingReply a
     , Member b
where a.member_id = b.member_id;


select max(meeting_reply_id) -- 33
  from MeetingReply;


-- 모임날짜 추가
ALTER TABLE Meeting
ADD COLUMN meeting_date DATE NOT NULL AFTER inserted;

DESC MeetingFile;
-- 6/20 컬럼 
DESC MeetingReply;

-- 삭제요망
ALTER TABLE MeetingReply
add COLUMN ref BIGINT(255) DEFAULT 0;


ALTER TABLE MeetingReply
MODIFY COLUMN refNum INT(255) DEFAULT 0;
DESC BoardImage;
DESC MeetingReply;

commit;

ALTER TABLE MeetingReply
ADD COLUMN step BIGINT(255) DEFAULT 0;

ALTER TABLE MeetingReply
ADD COLUMN refOrder BIGINT(255) DEFAULT 0;

ALTER TABLE MeetingReply
ADD COLUMN answerNum BIGINT(255) DEFAULT 0;

ALTER TABLE MeetingReply
ADD COLUMN parentNum BIGINT(255) DEFAULT 0;


ALTER TABLE BoardImage
ADD COLUMN meeting_id INT(255) AFTER donation_id;

ALTER TABLE BoardImage
ADD FOREIGN KEY (meeting_id) REFERENCES Meeting(meeting_id);

DESC BoardImage;

ALTER TABLE BoardImage
ADD COLUMN main_image_name INT(255) NOT NULL;

-- 테이블 전체 데이터 삭제 시 순서
-- 1. 세이프 모드 해제
SET SQL_SAFE_UPDATES = 0;

-- 2. 해당 데이터 삭제
DELETE FROM MeetingReply;

-- 3. 세이프 모드 설정
SET SQL_SAFE_UPDATES = 1;
------------------------------------

-- meetingGuest 테이블 생성
CREATE TABLE MeetingGuest (
	guest_id INT(255) PRIMARY KEY AUTO_INCREMENT,
    inserted DATE NOT NULL,
    member_id VARCHAR(20),
    meeting_id INT(255),
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (meeting_id) REFERENCES Meeting(meeting_id)
);
ALTER TABLE MeetingGuest
ADD COLUMN guest VARCHAR(20) NOT NULL;

ALTER TABLE MeetingGuest
MODIFY COLUMN inserted DATE DEFAULT (current_date);

DESC MeetingGuest;
DESC BoardImage;
DESC Meeting;
SELECT * FROM MeetingGuest;
SELECT * FROM Meeting;
SELECT * FROM Tag;
ALTER TABLE MeetingGuest
DROP COLUMN guest;

SELECT * FROM MeetingGuest;

SELECT IFNULL(COUNT(member_id), 4) cntNum
		FROM MeetingGuest
		WHERE meeting_id = 1;
        
        
        SELECT NVL(COUNT(member_id), 4) cntNum
		FROM MeetingGuest
		WHERE meeting_id = #{meetingId};
        ;
        
        SELECT COUNT(member_id) cntNum
		FROM MeetingGuest
		WHERE meeting_id = 1;
        
