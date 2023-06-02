drop table member;
drop table forum;
drop table computer;
drop table accessory;

create table member (
	id varchar2(30),
	pass varchar2(30),
	name varchar2(30),
	isAdmin varchar2(2),
	primary key (id)
);

insert into member values ('admin1','112233','������1','O');
insert into member values ('nomal1','112233','�Ϲ�1','X');



create table forum(
	num int,
	title varchar2(300),
	id varchar2(30),
	body varchar2(3000),
	visit_count int,
	primary key (num)
);

insert into forum values (1,'����� ������ �Դϴ�.','admin1','��ȣ ������� �ʴ� ������ ���ͳ� ��ȭ�� �����ô�.',0);
insert into forum values (2,'�������� �Դϴ�.','admin1','�弳, ��ȣ���, ��ġ�� �߾��� �ﰡ ���ֽñ� �ٶ��ϴ�.',0);

create table computer(
	category varchar2(15),
	model varchar2(50),
	cpu varchar2(50),
	gpu varchar2(50),
	ram varchar2(15),
	hdd varchar2(15),
	image varchar2(100),
	price int,
	primary key (model)
);

insert into computer values('laptop','IdeaPad S145','i5-9400f','RTX-2060','16GB','1TB','laptop1.png',570000);
insert into computer values('laptop','MSI PS42-8RB-i7','i7-9700k','RTX-2080Ti','32GB','2TB','laptop2.png',970000);
insert into computer values('laptop','MSI GL63-8RE','i7-9700k','RTX-2060','16GB','1TB','laptop3.png',740000);
insert into computer values('desktop','GIGABYTE GH67-8UE','i7-9700k','RTX-2080Ti','16GB','2TB','desktop3.png',840000);

create table accessory(
	model varchar2(50),
	category varchar2(30),
	image varchar2(100),
	price int,
	primary key (model)
);

insert into accessory values('Logitech G301','mouse','mouse3.jpg',55000);
