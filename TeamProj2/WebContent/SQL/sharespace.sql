-- hosting Table Create SQL
CREATE TABLE hosting
(
    `room_no`         int             NOT NULL    AUTO_INCREMENT COMMENT '룸자동생성번호', 
    `host_id`         VARCHAR(45)     NULL        			 	COMMENT '호스트ID', 
    `subject`         VARCHAR(45)     NOT NULL    				COMMENT '제목', 
    `room_type`       VARCHAR(45)     NOT NULL    				COMMENT '공간타입', 
    `people`          VARCHAR(45)     NOT NULL    				COMMENT '수용인원수', 
    `drink`           int             NOT NULL    				COMMENT '기본음료제공', 
    `elevator`        int             NOT NULL    				COMMENT '엘리베이터', 
    `toilet`          int             NOT NULL    				COMMENT '화장실', 
    `airconditioner`  int             NOT NULL    				COMMENT '에어컨', 
    `heating`         int             NOT NULL    				COMMENT '난방', 
    `socket`          int             NOT NULL    				COMMENT '콘센트', 
    `content`         VARCHAR(100)    NULL        			 	COMMENT '공간내용', 
    `fromdate`        VARCHAR(45)     NOT NULL, 
    `todate`          VARCHAR(45)     NOT NULL, 
    `time`            VARCHAR(45)     NOT NULL, 
    `etc`             VARCHAR(100)    NULL, 
    PRIMARY KEY (room_no)
);

-- host Table Create SQL
CREATE TABLE host
(
	`host_id`     VARCHAR(45)    NOT NULL    COMMENT '호스트아이디', 
    `email`       VARCHAR(45)    NOT NULL    COMMENT '호스트이메일', 
    `host_pass`   VARCHAR(45)    NOT NULL    COMMENT '호스트비밀번호', 
    `host_nic`    VARCHAR(45)    NOT NULL    COMMENT '호스트닉네임', 
    `host_phone`  VARCHAR(45)    NOT NULL    COMMENT '호스트폰', 
    `host_level`  int            NOT NULL    COMMENT '호스트레벨', 
    PRIMARY KEY (host_id, email)
);

-- user Table Create SQL
CREATE TABLE user
(
    `email`       VARCHAR(45)    NOT NULL    			COMMENT '유저이메일', 
    `name`        VARCHAR(45)    NOT NULL    			COMMENT '유저이름', 
    `pass`        VARCHAR(45)    NULL        			COMMENT '비밀번호', 
    `host_check`  int            NOT NULL    DEFAULT 0 	COMMENT '호스트여부', 
    `point`       int            NOT NULL    DEFAULT 0 	COMMENT '통합포인트', 
    PRIMARY KEY (email)
);


-- booking Table Create SQL
CREATE TABLE booking
(
    `book_no`         int            NOT NULL    AUTO_INCREMENT COMMENT '예약번호', 
    `room_no`         int            NOT NULL    				COMMENT '룸번호', 
    `email`           VARCHAR(45)    NOT NULL    				COMMENT 'email', 
    `book_phone`      VARCHAR(45)    NOT NULL    				COMMENT '예약전화번호', 
    `book_date`       date           NOT NULL    				COMMENT '체크인날짜', 
    `book_time`       int            NOT NULL   				COMMENT '체크인시간', 
    `book_hour`       int            NOT NULL    				COMMENT '이용시간', 
    `book_parking`    int            NOT NULL    				COMMENT '예약주차', 
    `book_wifi`       int            NOT NULL    DEFAULT 0 		COMMENT '예약무선인터넷', 
    `book_projector`  int            NOT NULL    DEFAULT 0 		COMMENT '예약프로젝터', 
    `book_laptop`     int            NOT NULL    DEFAULT 0 		COMMENT '예약노트북대여', 
    `book_cabinet`    int            NOT NULL    DEFAULT 0 		COMMENT '예약사물함', 
    `total_price`     int            NOT NULL    				COMMENT '총금액', 
    `book_check`      int            NOT NULL    DEFAULT 0 		COMMENT '예약유무', 
    PRIMARY KEY (book_no)
);


-- hosting_address Table Create SQL
CREATE TABLE hosting_address
(
    `room_no`        int            NOT NULL    COMMENT '룸자동생성번호', 
    `a_wdo`          VARCHAR(45)    NOT NULL    COMMENT '위도', 
    `a_kdo`          VARCHAR(45)    NOT NULL    COMMENT '경도', 
    `a_woo`          VARCHAR(45)    NOT NULL    COMMENT '우편번호', 
    `a_address`      VARCHAR(45)    NOT NULL    COMMENT '주소', 
    `a_D_address`    VARCHAR(45)    NULL        COMMENT '상세주소', 
    `a_etc_address`  VARCHAR(45)    NULL        COMMENT '참고항목',
    PRIMARY KEY (room_no)
);

-- hosting_bill Table Create SQL
CREATE TABLE hosting_bill
(
    `room_no`  int    NOT NULL    COMMENT '룸자동생성번호', 
    `weekday`  int    NOT NULL    COMMENT '평일요금', 
    `holiday`  int    NOT NULL    COMMENT '주말요금', 
    PRIMARY KEY (room_no)
);

-- hosting_option Table Create SQL
CREATE TABLE hosting_option
(
    `room_no`    int    NOT NULL    		  COMMENT '룸자동생성번호', 
    `parking`    int    NOT NULL    DEFAULT 0 COMMENT '주차', 
    `wifi`       int    NOT NULL    DEFAULT 0 COMMENT '무선인터넷', 
    `projector`  int    NOT NULL    DEFAULT 0 COMMENT '빔 프로젝트', 
    `laptop`     int    NOT NULL    DEFAULT 0 COMMENT '노트북 대여', 
    `cabinet`    int    NOT NULL    DEFAULT 0 COMMENT '사물함 대여', 
    PRIMARY KEY (room_no)
);

-- hosting_pic Table Create SQL
CREATE TABLE hosting_pic
(
    `room_no`  int            NOT NULL    COMMENT '룸자동생성번호', 
    `pic1`     VARCHAR(45)    NOT NULL    COMMENT '공간사진1', 
    `pic2`     VARCHAR(45)    NOT NULL    COMMENT '공간사진2', 
    `pic3`     VARCHAR(45)    NOT NULL    COMMENT '공간사진3', 
    `pic4`     VARCHAR(45)    NOT NULL    COMMENT '공간사진4', 
    `pic5`     VARCHAR(45)    NULL        COMMENT '공간사진5', 
    PRIMARY KEY (room_no)
);

-- booking_time Table Create SQL
CREATE TABLE booking_time
(
    `book_no`    int     NOT NULL    			COMMENT '예약번호', 
    `book_date`  date    NOT NULL    			COMMENT '예약날짜', 
    `t10`        int     NOT NULL    DEFAULT 0 	COMMENT '10시', 
    `t11`        int     NOT NULL    DEFAULT 0 	COMMENT '11시', 
    `t12`        int     NOT NULL    DEFAULT 0 	COMMENT '12시', 
    `t13`        int     NOT NULL    DEFAULT 0 	COMMENT '13시', 
    `t14`        int     NOT NULL    DEFAULT 0 	COMMENT '14시', 
    `t15`        int     NOT NULL    DEFAULT 0 	COMMENT '15시', 
    `t16`        int     NOT NULL    DEFAULT 0 	COMMENT '16시', 
    `t17`        int     NOT NULL    DEFAULT 0 	COMMENT '17시', 
    `t18`        int     NOT NULL    DEFAULT 0 	COMMENT '18시', 
    `t19`        int     NOT NULL    DEFAULT 0 	COMMENT '19시', 
    `t20`        int     NOT NULL    DEFAULT 0 	COMMENT '20시', 
    `t21`        int     NOT NULL    DEFAULT 0 	COMMENT '21시'
);

-- comment Table Create SQL
CREATE TABLE comment
(
    `comment_no`   int            NOT NULL    AUTO_INCREMENT COMMENT 'comment번호', 
    `room_no`      int            NOT NULL    				 COMMENT '룸번호', 
    `email`        VARCHAR(45)    NOT NULL    				 COMMENT 'email', 
    `com_content`  VARCHAR(45)    NOT NULL    				 COMMENT 'comment내용', 
    `com_date`     datetime       NOT NULL    				 COMMENT 'comment날짜', 
    PRIMARY KEY (comment_no)
);

-- review Table Create SQL
CREATE TABLE review
(
    `review_no`   int            NOT NULL    AUTO_INCREMENT COMMENT 'review번호', 
    `room_no`     int            NOT NULL    				COMMENT '룸번호', 
    `email`       VARCHAR(45)    NOT NULL    				COMMENT 'email', 
    `re_date`     datetime       NOT NULL    				COMMENT 'review날짜', 
    `re_point`    int            NOT NULL    				COMMENT '별점', 
    `re_content`  VARCHAR(45)    NOT NULL    				COMMENT 'review내용', 
    PRIMARY KEY (review_no)
);