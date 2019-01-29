create database ShareSpace;

create user 'team'@'%' identified by '1111';

grant all privileges on ShareSpace.* to team@'%' identified by '1111';
grant all privileges on ShareSpace.* to team@'localhost' identified by '1111';

flush privileges;


use ShareSpace;
show tables;


CREATE TABLE `hosting` (
  `host_id` varchar(20) DEFAULT NULL COMMENT '호스트ID',
  `room_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '룸자동생성번호',
  `subject` varchar(45) NOT NULL COMMENT '제목',
  `room` varchar(10) NOT NULL COMMENT '공간타입',
  `people` varchar(10) NOT NULL COMMENT '수용인원수',
  `drink` int(1) NOT NULL COMMENT '기본음료제공',
  `elevator` int(1) NOT NULL COMMENT '엘리베이터',
  `toilet` int(1) NOT NULL COMMENT '화장실',
  `airconditioner` int(1) NOT NULL COMMENT '에어컨',
  `heating` int(1) NOT NULL COMMENT '난방',
  `socket` int(1) NOT NULL COMMENT '콘센트',
  
  `content` varchar(100) DEFAULT NULL,
  `fromdate` varchar(45) NOT NULL,
  `todate` varchar(45) NOT NULL,
  `time` varchar(100) NOT NULL,
  `etc` varchar(100) DEFAULT NULL,
  
  PRIMARY KEY (`room_no`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


drop table hosting;
insert into hosting values('hello', 0, 'subject1', '카페', 1, 1, 1, 1, 1, 1, 1);
insert into hosting values('hello', 0, 'subject1', '2인룸', 1, 1, 1, 1, 1, 1, 1);
select * from hosting;
 
CREATE TABLE `hosting_address` (
  `room_no` int(11) NOT NULL COMMENT '룸자동생성번호',
  `a_wdo` varchar(45) DEFAULT NULL COMMENT '위도',
  `a_kdo` varchar(45) DEFAULT NULL COMMENT '경도',
  `a_woo` varchar(45) DEFAULT NULL COMMENT '우편번호',
  `a_address` varchar(45) DEFAULT NULL COMMENT '주소',
  `a_D_address` varchar(45) DEFAULT NULL COMMENT '상세주소',
  `a_etc_address` varchar(45) DEFAULT NULL COMMENT '참고항목'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table hosting_address;
insert into hosting_address values(1,'33.450669085761284', '126.5719305094318', '690-140', '제주특별자치도 제주시 첨단로 242', '', '');
update hosting_address set a_wdo='33.450669085761284', a_kdo='126.5719305094318' where room_no=1;
commit;

CREATE TABLE `hosting_bill` (
  `room_no` int(11) NOT NULL COMMENT '룸자동생성번호',
  
  `weekday` int(11) NOT NULL COMMENT '평일요금',
  `holiday` int(11) NOT NULL COMMENT '주말요금',
  
  PRIMARY KEY (`room_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into hosting_bill values(1, 5000, 6000);

drop table hosting_bill;


CREATE TABLE `hosting_option` (
  `room_no` int(11) NOT NULL COMMENT '룸자동생성번호',
  `parking` int(1) NOT NULL COMMENT '주차',
  `wifi` int(1) NOT NULL COMMENT '무선인터넷',
  `projector` int(1) NOT NULL COMMENT '빔 프로젝트',
  `laptop` int(1) NOT NULL COMMENT '노트북 대여',
  `cabinet` int(1) not null COMMENT '사물함 대여',
  PRIMARY KEY (`room_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table hosting_option;

insert into hosting_option values(1, 1, 1, 1, 1, 1);


CREATE TABLE `hosting_pic` (
  `room_no` int(11) NOT NULL COMMENT '룸자동생성번호',
  `pic1` varchar(45) NOT NULL,
  `pic2` varchar(45) NOT NULL,
  `pic3` varchar(45) NOT NULL,
  `pic4` varchar(45) NOT NULL,
  
  `pic5` varchar(45) DEFAULT NULL,
  
  PRIMARY KEY (`room_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into hosting_pic values(1, '', '', '', '', '');
drop table hosting_pic;
use jspbeginner;
show tables;



CREATE TABLE `host` (
  `host_id` varchar(45) COMMENT '호스트아이디',
  `email` varchar(45) NOT NULL COMMENT '호스트이메일',
  `host_pass` varchar(45) NOT NULL COMMENT '호스트비밀번호',
  `host_nic` varchar(20) COMMENT '호스트닉네임',
  `host_phone` varchar(15) COMMENT '호스트폰',
  `host_level` int(1) COMMENT '호스트레벨',
  PRIMARY KEY (`host_id`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into host values('hello', 'slfie@gmail.com', '1111', 'hong', '010-3244-2422', '1');
drop table host;

CREATE TABLE `user` (
`email` varchar(45) NOT NULL COMMENT '유저이메일',
`name` varchar(20) NOT NULL COMMENT '유저이름',
`pass` varchar(20) COMMENT '비밀번호',
`host_check` int(1) NOT NULL COMMENT '호스트여부',
`point` int NOT NULL COMMENT '통합포인트',
 primary key(`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table user;
insert into user values('slfie@gmail.com', 'hoho', '1', 1, 10000);
insert into user values('ddd@gmail.com', 'hoyo', '1', 0, 10000);
select * from user;


CREATE TABLE `booking` (
`book_no` int NOT NULL AUTO_INCREMENT COMMENT '예약번호',
`email` varchar(45) NOT NULL COMMENT 'email',
`book_phone` varchar(15) NOT NULL COMMENT '예약전화번호',
`book_date` date NOT NULL COMMENT '체크인날짜',
`book_time` int NOT NULL COMMENT '체크인시간',
`book_hour` int NOT NULL COMMENT '이용시간',
`total_price` int NOT NULL COMMENT '총금액',
`room_no` int NOT NULL COMMENT '룸번호',
`book_check` int default 0 COMMENT'예약취소유무' check('book_check' in(0,1)),
 primary key(`book_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





drop table booking;
insert into booking values(0, 'ddd@gmail.com', '010-2232-2323', '2019-01-29', 10, 2, 6000, 1, 0);
insert into booking values(0, 'ddd@gmail.com', '010-2232-2323', '2019-01-25', 10, 2, 6000, 1, 0);
insert into booking values(0, 'ddd@gmail.com', '010-2232-2323', '2019-01-25', 10, 2, 6000, 1, 0);
insert into booking values(0, 'ddd@gmail.com', '010-2232-2323', '2019-01-26', 10, 2, 6000, 2, 0);
insert into booking values(0, 'ddd@gmail.com', '010-2232-2323', '2019-01-27', 10, 2, 6000, 1, 0);
update booking set book_date='2019-01-23' where book_no=2;
update booking set book_date='2019-01-24' where book_no=3;

update booking set room_no=1 where book_no=6;

delete from booking;
select * from booking;

create table booking_time
(
   book_no int primary key,
   book_date date NOT NULL,
    t10 int default 0 check('t10' in(0, 1)),
    t11 int default 0 check('t11' in(0, 1)),
    t12 int default 0 check('t12' in(0, 1)),
    t13 int default 0 check('t13' in(0, 1)),
    t14 int default 0 check('t14' in(0, 1)),
    t15 int default 0 check('t15' in(0, 1)),
    t16 int default 0 check('t16' in(0, 1)),
    t17 int default 0 check('t17' in(0, 1)),
    t18 int default 0 check('t18' in(0, 1)),
    t19 int default 0 check('t19' in(0, 1)),
    t20 int default 0 check('t20' in(0, 1)),
    t21 int default 0 check('t21' in(0, 1)),
    foreign key ( book_no ) references booking ( book_no ) on delete cascade

)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into booking_time values(1, '2019-01-29', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into booking_time values(2, '2019-01-25', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1);
insert into booking_time values(3, '2019-01-25', 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0);
insert into booking_time values(4, '2019-01-26', 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0);
insert into booking_time values(5, '2019-01-27', 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1);

update booking_time set book_date='2019-01-23' where book_no=2;
update booking_time set book_date='2019-01-24' where book_no=3;

delete from booking_time where book_no=2;
drop table booking_time;
select * from booking_time;


CREATE TABLE comment (
comment_no int NOT NULL AUTO_INCREMENT COMMENT 'comment번호',
room_no int NOT NULL COMMENT '룸번호',
email varchar(45) NOT NULL COMMENT 'email',
com_content varchar(15) NOT NULL COMMENT 'comment내용',
com_date datetime NOT NULL COMMENT 'comment날짜',
primary key(comment_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table comment;
insert into comment values(0, 1, 'ddd@gmail.com', 'hihi', now());

select * from comment;


CREATE TABLE review (
review_no int NOT NULL AUTO_INCREMENT COMMENT 'review번호',
room_no int NOT NULL COMMENT '룸번호',
email varchar(45) NOT NULL COMMENT 'email',
re_date datetime NOT NULL COMMENT 'review날짜',
re_point int NOT NULL COMMENT '별점',
re_content varchar(45) NOT NULL COMMENT 'review내용',
primary key(review_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




select c.comment_no, c.room_no, u.email, u.name, c.com_content, c.com_date
from comment c
join user u
on u.email = c.email
where room_no=1
order by com_date desc limit 0, 10;


select *
from comment
where room_no=1
order by com_date desc;


select bt.t11 from 
   (select * from booking where book_date='2019-01-25' and room_no=1) b 
    join booking_time bt
on b.book_no = bt.book_no
where bt.t11 =1;


select b.book_date
from (select * from booking where book_check=0) b
join booking_time bt
on b.book_no = bt.book_no and
b.book_date = bt.book_date
where room_no=1 and bt.t10 in(1) and bt.t11 in(1) and bt.t12 in(1) and bt.t13 in(1) and bt.t14 in(1) and bt.t15 in(1) and bt.t16 in(1)
	  and bt.t17 in(1) and bt.t18 in(1) and bt.t19 in(1) and bt.t20 in(1) and bt.t21 in(1);
      
      

select sum(bt.t10), sum(bt.t11), sum(bt.t12), sum(bt.t13),sum(bt.t14),sum(bt.t15), sum(bt.t16),
	   sum(bt.t17), sum(bt.t18), sum(bt.t19), sum(bt.t20), sum(bt.t21)
from (select * from booking where book_check=0 and book_date='2019-01-25' and room_no=1) b 
join booking_time bt
on b.book_no = bt.book_no
and b.book_date = bt.book_date;




select sum(t10), sum(t11), sum(t12), sum(t13),sum(t14),sum(t15), sum(t16), 
sum(t17), sum(t18), sum(t19), sum(t20), sum(t21) 
from booking b join booking_time t
on b.book_no = t.book_no
where b.book_check = 0
and b.book_date = '2019-01-25'
and b.room_no = 1
group by b.room_no;

select *
from booking b join booking_time t
on b.book_no = t.book_no
where b.book_check = 0
and b.book_date = '2019-01-25'
and b.room_no = 1
;
