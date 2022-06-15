create table product( code number(5), name VARCHAR2(100), price number(8), pictureurl VARCHAR(50), description varchar(1000), primary key(code) );

create SEQUENCE product_seq start with 1 INCREMENT by 1;

insert into product values(product_seq.nextval, '������ ���� ����ִ� �����ͺ��̽�', 27000, 'db.jpg', '�����ͺ��̽��� ���� ��� ���� ���� ����ְ� ������ ����...'); 
insert into product values(product_seq.nextval, '��ǥ���� ���� HTML5', 25000, 'html5.jpg', 'HTML5 ���̵��. Ȩ������ ������ ���� �ʼ� ���� HTML �⺻ ����...'); 
insert into product values(product_seq.nextval, 'Dynamic Programming book �ø���-01 ����Ŭ 11g + PL/SQL', 25000, 'oracle.jpg','Dynamic �ǹ� ��Ī ���α׷��� Book�� ù��° å����, ����Ŭ 11g�� ���ο� ...'); 
insert into product values(product_seq.nextval, 'Visual C++ MFC ������ ���α׷���', 26000, 'mfc.jpg', 'Visual C++�� ó�� �����ϴ� ������ �����̿� ���� Visual C++...'); 
insert into product values(product_seq.nextval, 'jQuery and jQuery Mobile : �����ϱ� ���� Ǯ�', 25000, 'jquery.jpg', '�ҽ� �ϳ��� ����ũž�� ����ϱ��� HTML5�� �Բ� ����Ѵ�. �ʺ��ڵ鵵 ...');

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


insert into movie values(movie_seq.nextval , '������',10000 , '���¿�', '������', 'movie1.jpg', '�Ŵ��� ������ ���� ������ ����� ���� ������');
insert into movie values(movie_seq.nextval , '�ڼ��Ǵ�',10000 , '������', '�ڽž�,������', 'movie2.jpg', '�Ǵ޷� �����..');
insert into movie values(movie_seq.nextval , '���������',10000 , '�� ����', '�� ���', 'movie3.jpg', '�� �������� ��ģ...');
insert into movie values(movie_seq.nextval , '7������ ����',9000 , '��ȯ��', '���·�, ���ҿ�', 'movie4.jpg', '�־��� ��ǹ�����...');

select * from movie;

commit;

drop table movie;
drop SEQUENCE movie_seq;







