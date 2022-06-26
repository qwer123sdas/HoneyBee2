SELECT r.meeting_reply_id ,
	   r.meeting_id ,
	   r.member_id ,
	   r.content,
       r.refNum,
       r.step,
       r.refOrder
	  -- , r.*
 FROM MeetingReply r JOIN Member m ON r.member_id = m.member_id
WHERE (r.meeting_reply_id = 79 or r.refNum = '79' or  r.refNum = '80') ;

COMMIT;

UPDATE MeetingReply 
   SET refOrder = 6
WHERE meeting_id = 13
   AND meeting_reply_id = 54;
   
-- 본글에 대한 자식 여부 쿼리
SELECT count(*) as cnt
  FROM MeetingReply
WHERE refNum = meeting_reply_id ;

/*UPDATE MeetingReply 
   SET content = #{content}
 WHERE meeting_id = #{meeting_id}
   AND meeting_reply_id = #{meeting_reply_id};
   
	DELETE FROM MeetingReply;
	WHERE meeting_id = #{meeting_id}
	   AND meeting_reply_id = #{meeting_reply_id};*/
   
SELECT 
  CASE WHEN (SELECT MAX_STEP
			   FROM (SELECT NVL(MAX(refOrder)+1, 1) AS MAX_STEP
					   FROM MeetingReply 
					  WHERE meeting_id = 13
						AND refNum = 77
					  GROUP BY refNum
					) TEMP
			) IS NULL THEN 11
       ELSE (SELECT MAX_STEP
			   FROM (SELECT NVL(MAX(refOrder)+1, 1) AS MAX_STEP
					   FROM MeetingReply 
					  WHERE meeting_id = 13
						AND refNum = 77
					  GROUP BY refNum
					) TEMP
			  )
  END 	AS AAAA		
  , r.*
FROM MeetingReply r
WHERE (r.meeting_reply_id = 77 or r.refNum = 77) ;
    
 SELECT MAX(refOrder)+1 AS MAX_STEP
   FROM MeetingReply 
  WHERE meeting_id = 13
	AND refNum = 71
  -- GROUP BY refNum
    ;
    
 SELECT MAX_STEP
   FROM (SELECT NVL(MAX(refOrder)+1, 1) AS MAX_STEP
		   FROM MeetingReply 
		  WHERE meeting_id = 13
			AND refNum = 55
		  GROUP BY refNum
		) TEMP;
		
      
  select case when count(*) >0 then 'Y`'
              else 'N'
	     end yn
    from MeetingGuest
    where member_id = 'a'
        

      
      SELECT  'admin' as member_id
            , 38        as meeting_id               
            , '본 자식3'  as    content            
            , 38      as  refNum 
            , ( SELECT MAX_STEP                
                  FROM (                        
                        SELECT MAX(STEP)+1 AS MAX_STEP                          
                          FROM MeetingReply             
						  WHERE meeting_reply_id = 38            
						) AA          
			   )     as step      
			 , CASE WHEN 0 = 0 THEN 1                 
                    ELSE (SELECT MAX_STEP                         
				            FROM ( SELECT MAX(refOrder)+1 as MAX_STEP                              
                                     FROM MeetingReply                                 
									WHERE meeting_reply_id = 38                              
								  ) TEMP                       
						  )             
				END   as refOrder         
		FROM DUAL;
        
        rollback;