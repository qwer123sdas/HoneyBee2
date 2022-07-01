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
ALTER TABLE MeetingReply
MODIFY COLUMN refNum INT(255) NOT NULL DEFAULT '0';
SELECT * FROM MeetingReply;
DESC MeetingReply;
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
ADD COLUMN refNum INT(255) DEFAULT 0;

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
ADD COLUMN guest VARCHAR(20) DEFAULT 'N';
SELECT * FROM MeetingGuest;
ALTER TABLE MeetingGuest
MODIFY COLUMN inserted DATE DEFAULT (current_date);

ALTER TABLE Meeting
MODIFY COLUMN content TEXT;

DESC MeetingGuest;
DESC BoardImage;
DESC Meeting;
SELECT * FROM MeetingGuest;
SELECT * FROM MeetingReply;
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
        
SELECT * FROM MeetingGuest;

SELECT COUNT(member_id) cntNum
		FROM MeetingGuest
		WHERE meeting_id = '12';

SELECT * FROM MeetingReply;
DESC MeetingReply;
ALTER TABLE MeetingReply DROP deep;
ALTER TABLE MeetingReply DROP 
parentNum

;
ALTER TABLE MeetingReply
ADD COLUMN step INT(255) DEFAULT 0;

		DELETE FROM MeetingReply
		 WHERE meeting_id = 13
		   AND meeting_reply_id = 120;

ALTER TABLE MeetingReply
MODIFY COLUMN refNum INT(255) NULL DEFAULT NULL;

		INSERT INTO MeetingReply (  member_id
							      , meeting_id
							      , content

							      , step
							      , refOrder
				 			      )
		        VALUES ( 
		                  'admin'
		                , 13
		                , '부모3'
	
					    , 0
					    , 0
		               );
WITH RECURSIVE t3 ( meeting_reply_id, member_id, content, step, refNum, refOrder) AS
(
	SELECT t1.meeting_reply_id, t1.member_id, t1.content, t1.step, t1.refNum, t1.refOrder
    FROM MeetingReply t1
    WHERE t1.refNum is null
    
    UNION ALL
    
    SELECT t2.meeting_reply_id, t2.member_id, t2.content, t2.step, t2.refNum, t2.refOrder
    FROM MeetingReply t2
    INNER JOIN t3 ON t2.refNum = meeting_reply_id
)

SELECT * FROM t3
ORDER BY t3. meeting_reply_id, t3.refOrder;

SELECT * FROM MeetingReply ORDER BY refNum, refOrder
;

WITH RECURSIVE CTE AS ( -- CTE 가상테이블
	SELECT 1 AS h  -- 1 초기값 h 컬럼
    UNION ALL -- 모든 컬럼값이 같은 결과 중복제거 x
    SELECT h + 1 FROM CTE WHERE h < 5 -- 조건
)
SELECT * FROM CTE;


SELECT * FROM MeetingReply  ;

SELECT r.meeting_reply_id meetingReplyId,
			   r.meeting_id meetingId,
			   r.member_id memberId,
			   r.content,
			   r.inserted,
			   r.step,
			   m.nickname
		FROM MeetingReply r LEFT JOIN Member m ON r.member_id = m.member_id
		WHERE r.meeting_id = 13
		AND r.step = 0 -- 최상위 부모
	 ORDER BY meetingReplyId DESC;
     
ALTER TABLE MeetingReply
MODIFY COLUMN delete_info varchar(10) DEFAULT 'N';
SELECT * FROM MeetingReply;
DESC Meeting;
DESC MeetingGuest;
ALTER TABLE MeetingReply
MODIFY COLUMN delete_info varchar(10) DEFAULT 'N';

SELECT COUNT(member_id) cntNum
		FROM MeetingGuest
		WHERE meeting_id = 13;

UPDATE MeetingReply 
		   SET delete_info = 'y'
		 WHERE meeting_reply_id = 173;
         
         INSERT INTO MeetingReply (  member_id
							      , meeting_id
							      , content
							      , step
							      , refOrder
							      , delete_info
				 			      )
		        VALUES ( 
		                  'admin'
		                , '13'
		                , '손수 넣어준 부모 댓글'
					    , 0
					    , 0
					    , 'n'
		               );
                       
INSERT INTO MeetingReply (  member_id 
							      , meeting_id 
							      , content 
							      , refNum 
							      , step   -- 들여쓰기 -->
							      , refOrder -- 그룹내에서의 순서-->
							      , delete_info -- 삭제 유무 설정 -->
				 			      )
		        SELECT 
		                  'admin'
		                , '13'		 
		                , '손수 넣어준 부모의 자식 댓글'
		                , '174'
					    , ( SELECT MAX_STEP
					          FROM ( 
					                 SELECT NVL(MAX(step), 0)+1 AS MAX_STEP 
					                   FROM MeetingReply 
									  WHERE meeting_reply_id = 174
								   ) AA
						   ) 
						, IFNULL( (SELECT MAX_STEP
						             FROM (SELECT NVL(MAX(refOrder)+1, 1) AS MAX_STEP
						                     FROM MeetingReply 
						                    WHERE meeting_id = '13'
						                      AND refNum = '174'
						                    GROUP BY refNum
						                   ) TEMP
						           ), 1)
						, 'n'					                 
		         FROM DUAL;
                 
SELECT r.meeting_reply_id meetingReplyId,
			   r.meeting_id meetingId,
			   r.member_id memberId,
			   r.content,
			   r.inserted,
			   r.delete_info deleteInfo,
			   m.nickname
		FROM MeetingReply r JOIN Member m ON r.member_id = m.member_id
		WHERE r.meeting_id = 13;
        
ALTER TABLE MeetingReply DROP meeting_reply_parent;
ALTER TABLE Meeting DROP longitude;
;
ALTER TABLE MeetingReply DROP meeting_reply_gnum;

ALTER TABLE MeetingGuest DROP guest;
UPDATE MeetingReply 
		   SET delete_info = 'N'
		 WHERE meeting_reply_id = '187';
         
SELECT * FROM Meeting;
DESC MeetingGuest;
DESC MeetingComment;
DESC Meeting;
SELECT * FROM BoardImage;


		SELECT mt.meeting_id meetingId,
				mt.member_id memberId,
				mt.title,
				mt.content,
				mt.postcode,
				mt.address,
				mt.detailAddress,
				mt.inserted,
				mt.start_date startDate,
				mt.end_date endDate,
				mt.tag,
				m.nickname,
				bi.main_image_name MPhoto,
				bi.image_folder_id folderName,
				t.hash_tag hashTag,
				g.member_id guest
		FROM Meeting mt LEFT JOIN Member m ON mt.member_id = m.member_id
						LEFT JOIN BoardImage bi ON mt.meeting_id = bi.meeting_id
						LEFT JOIN Tag t ON mt.meeting_id = t.meeting_id
						LEFT JOIN MeetingGuest g ON t.meeting_id = g.meeting_id
		WHERE mt.meeting_id = 20 AND bi.main_image_name IS NOT NULL;