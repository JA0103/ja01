create table product( code number(5), name VARCHAR2(100), price number(8), pictureurl VARCHAR(50), description varchar(1000), primary key(code) );

create SEQUENCE product_seq start with 1 INCREMENT by 1;

insert into product values(product_seq.nextval, '개념을 콕콕 잡아주는 데이터베이스', 27000, 'db.jpg', '데이터베이스에 관한 모든 것을 쉽고 재미있게 정리한 교재...'); 
insert into product values(product_seq.nextval, '웹표준을 위한 HTML5', 25000, 'html5.jpg', 'HTML5 가이드북. 홈페이지 제작을 위한 필수 선택 HTML 기본 문법...'); 
insert into product values(product_seq.nextval, 'Dynamic Programming book 시리즈-01 오라클 11g + PL/SQL', 25000, 'oracle.jpg','Dynamic 실무 코칭 프로그래밍 Book의 첫번째 책으로, 오라클 11g의 새로운 ...'); 
insert into product values(product_seq.nextval, 'Visual C++ MFC 윈도우 프로그래밍', 26000, 'mfc.jpg', 'Visual C++를 처음 시작하는 독자의 눈높이에 맞춘 Visual C++...'); 
insert into product values(product_seq.nextval, 'jQuery and jQuery Mobile : 이해하기 쉽게 풀어쓴', 25000, 'jquery.jpg', '소스 하나로 데스크탑과 모바일까지 HTML5와 함께 사용한다. 초보자들도 ...');

select * from product;
delete product where code = 11; 
commit;



----------------------------------------------------------
create table movie(
code number(4),
title VARCHAR2(50),
price number(10),
director VARCHAR2(20),
actor VARCHAR2(20),
poster VARCHAR2(100),
synopsis VARCHAR2(3000),
PRIMARY KEY(code)
);

desc movie;
create sequence movie_seq start with 1 INCREMENT by 1;


insert into movie values(movie_seq.nextval , '베를린',10000 , '류승완', '하정우', 'movie1.jpg', '거대한 국제적 음모가 숨겨진 운명의 도시 베를린');
insert into movie values(movie_seq.nextval , '박수건달',10000 , '조진규', '박신양,엄지원', 'movie2.jpg', '건달로 사느냐..');
insert into movie values(movie_seq.nextval , '레미제라블',10000 , '톰 후퍼', '휴 잭맨', 'movie3.jpg', '빵 한조각을 훔친...');
insert into movie values(movie_seq.nextval , '7번방의 선물',9000 , '이환경', '류승룡, 갈소원', 'movie4.jpg', '최악의 흉악범들이...');

select * from movie;

commit;

drop table movie;
drop SEQUENCE movie_seq;







