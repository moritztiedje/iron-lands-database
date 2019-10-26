create database ironlands;
use ironlands;
create table user (
	username VARCHAR(50),
    password VARCHAR(50),
    constraint username primary key (username)
);
insert into user (username, password) values ('harald', 'password');
create table playercharacter (
	username VARCHAR(50),
	charactername VARCHAR(50),
	intelligence SMALLINT,
    charisma SMALLINT,
    strength SMALLINT,
    agility SMALLINT,
    primary key (username),
    constraint fk_username foreign key (username) references user(username)
);
insert into playercharacter (username, charactername, intelligence, charisma, strength, agility) values ('harald', 'Supa Boy', 10, 10, 10, 10);
create table consumable (
	id int auto_increment,
	username VARCHAR(50),
	itemname VARCHAR(50),
    amount int,
    primary key (id),
    constraint fk_playercharacter foreign key (username) references playercharacter(username)
);
insert into consumable (username, itemname, amount) values ('harald', 'bread', 2);
insert into consumable (username, itemname, amount) values ('harald', 'potato', 3);

select * from user;
select * from playercharacter;
select * from consumable;
drop table playercharacter;
drop table user;
drop table consumable;

