CREATE DATABASE honeybee;

USE honeybee;

CREATE TABLE Member (
	member_id VARCHAR(20) PRIMARY KEY,
    pw VARCHAR(100) NOT NULL,
    name VARCHAR(10) NOT NULL,
    email VARCHAR(30) NOT NULL,
    create_date DATE NOT NULL,
    modify_date DATE,
    enable INT(2) NOT NULL,
    nickname VARCHAR(10) NOT NULL,
    profile VARCHAR(100),
    postcode VARCHAR(10) NOT NULL,
    address VARCHAR(100) NOT NULL,
    detail VARCHAR(100) NOT NULL COMMENT '상세주소',
    birth DATE NOT NULL,
    gender INT(2),
    phone VARCHAR(20) NOT NULL,
    rate VARCHAR(20) COMMENT '등급'
);

ALTER TABLE Member
MODIFY COLUMN enable INT(2) DEFAULT 1 NOT NULL;

CREATE TABLE Auth (
	member_id VARCHAR(20) NOT NULL,
    role VARCHAR(10) NOT NULL,
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

CREATE TABLE DonationPay (
	donation_pay_id VARCHAR(20) PRIMARY KEY,
    member_id VARCHAR(20) NOT NULL,
    amount INT(255) COMMENT '금액',
    pay_date DATE COMMENT '입금날짜',
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

CREATE TABLE DonationTag (
	donation_tag_id INT PRIMARY KEY AUTO_INCREMENT,
    donation_tag_name VARCHAR(10) NOT NULL
);

CREATE TABLE Donation (
	donation_id INT(255) PRIMARY KEY AUTO_INCREMENT,
    member_id VARCHAR(20) NOT NULL,
    donation_tag_id INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    content VARCHAR(255) NOT NULL,
    inserted DATE NOT NULL,
    favorite INT(255) NOT NULL COMMENT '좋아요',
    goal INT(255) NOT NULL,
    expired DATE NOT NULL COMMENT '마감날짜',
    current_amount INT(255) NOT NULL COMMENT '기부총액',
    code CHAR(1) DEFAULT 'D' NOT NULL,
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (donation_tag_id) REFERENCES DonationTag(donation_tag_id)
);

CREATE TABLE DonationFile (
	donation_file_id INT(255) PRIMARY KEY AUTO_INCREMENT,
    donation_id INT(255) NOT NULL,
    file VARCHAR(255),
    FOREIGN KEY (donation_id) REFERENCES Donation(donation_id)
);

CREATE TABLE DonationReply (
	reply_id INT(255) PRIMARY KEY AUTO_INCREMENT,
    donation_id INT(255) NOT NULL,
    member_id VARCHAR(20) NOT NULL,
    content VARCHAR(255) NOT NULL,
    inserted DATE NOT NULL,
    FOREIGN KEY (donation_id) REFERENCES Donation(donation_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

CREATE TABLE Meeting (
	meeting_id INT(255) PRIMARY KEY AUTO_INCREMENT,
    member_id VARCHAR(20) NOT NULL,
    title VARCHAR(50) NOT NULL,
    content VARCHAR(255) NOT NULL,
    inserted DATE NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    guest VARCHAR(20),
    address VARCHAR(200),
    code CHAR(1) DEFAULT 'M' NOT NULL,
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

CREATE TABLE MeetingFile (
	meeting_file_id INT(255) PRIMARY KEY AUTO_INCREMENT,
    meeting_id INT(255) NOT NULL,
    file VARCHAR(255) NOT NULL,
    FOREIGN KEY (meeting_id) REFERENCES Meeting(meeting_id)
);

CREATE TABLE MeetingComment (
	meeting_comment_id INT(255) PRIMARY KEY AUTO_INCREMENT,
    member_id VARCHAR(20) NOT NULL,
    meeting_id INT(255) NOT NULL,
    content VARCHAR(255) NOT NULL,
    inserted DATE NOT NULL,
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (meeting_id) REFERENCES Meeting(meeting_id)
);

CREATE TABLE MeetingReply (
	meeting_reply_id INT(255) PRIMARY KEY AUTO_INCREMENT,
    meeting_comment_id INT(255) NOT NULL,
    member_id VARCHAR(20) NOT NULL,
    content VARCHAR(255) NOT NULL,
    inserted DATE NOT NULL,
    FOREIGN KEY (meeting_comment_id) REFERENCES MeetingComment(meeting_comment_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

CREATE TABLE TalentTag (
	talent_tag_id INT PRIMARY KEY AUTO_INCREMENT,
    talent_tag_name VARCHAR(20) NOT NULL
);

CREATE TABLE Talent (
	talent_id INT(255) PRIMARY KEY AUTO_INCREMENT,
    member_id VARCHAR(20) NOT NULL,
    talent_tag_id INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    content VARCHAR(255) NOT NULL,
    price VARCHAR(255) NOT NULL COMMENT '금액',
    inserted DATE NOT NULL,
    expired DATE NOT NULL COMMENT '종료일',
    code CHAR(1) DEFAULT 'T',
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (talent_tag_id) REFERENCES TalentTag(talent_tag_id)
);

CREATE TABLE TalentFile (
	talent_file_id INT(255) PRIMARY KEY AUTO_INCREMENT,
    talent_id INT(255) NOT NULL,
    file VARCHAR(255),
    FOREIGN KEY (talent_id) REFERENCES Talent(talent_id)
);

CREATE TABLE TalentReview (
	review_id INT PRIMARY KEY AUTO_INCREMENT,
    talent_id INT(255) NOT NULL,
    member_id VARCHAR(20) NOT NULL,
    content VARCHAR(255) NOT NULL,
    inserted DATE NOT NULL,
    grade INT(1) NOT NULL COMMENT '평점',
    FOREIGN KEY (talent_id) REFERENCES Talent(talent_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

CREATE TABLE Market (
	market_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id VARCHAR(20) NOT NULL,
    title VARCHAR(50) NOT NULL,
    content VARCHAR(255) NOT NULL,
    inserted DATE NOT NULL,
    price INT(255) NOT NULL COMMENT '판매금액',
    product_name VARCHAR(255) NOT NULL,
    total INT(255) NOT NULL,
    enable INT(2) NOT NULL COMMENT '판매종료여부',
    code CHAR(1) DEFAULT 'K' NOT NULL,
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

CREATE TABLE MarketFile (
	market_file_id INT PRIMARY KEY AUTO_INCREMENT,
    market_id INT NOT NULL,
    file VARCHAR(255) NOT NULL,
    FOREIGN KEY (market_id) REFERENCES Market(market_id)
);

CREATE TABLE OrderPay (
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    market_id INT NOT NULL,
    member_id VARCHAR(20) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    request VARCHAR(50) NOT NULL,
    FOREIGN KEY (market_id) REFERENCES Market(market_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

CREATE TABLE Faq (
	question_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id VARCHAR(20) NOT NULL,
    title VARCHAR(50) NOT NULL,
    content VARCHAR(255) NOT NULL,
    inserted DATE NOT NULL,
    email VARCHAR(50) NOT NULL,
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

CREATE TABLE FaqFile (
	question_id INT NOT NULL,
    file VARCHAR(255),
    FOREIGN KEY (question_id) REFERENCES Faq(question_id)
);