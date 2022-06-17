SELECT * FROM MeetingFile;
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
		WHERE r.meeting_id = '18'
		  AND r.meeting_reply_id = r.meeting_reply_parent
		ORDER BY meeting_reply_id;
  

  