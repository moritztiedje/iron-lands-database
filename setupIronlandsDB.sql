set global time_zone = '+00:00';
create database ironlands;
use ironlands;
create table user (
	username VARCHAR(50),
    password VARCHAR(50),
    constraint username primary key (username)
);
insert into user (username, password) values ('harald', 'password');
insert into user (username, password) values ('test', 'test');
create table playercharacter (
	username VARCHAR(50),
	charactername VARCHAR(50),
    stomachState smallint,
	intelligence SMALLINT,
    charisma SMALLINT,
    strength SMALLINT,
    agility SMALLINT,
    copper SMALLINT,
    silver SMALLINT,
    gold SMALLINT,
    primary key (username),
    constraint fk_username foreign key (username) references user(username)
);
insert into playercharacter (username, charactername, stomachState, intelligence, charisma, strength, agility, copper, silver, gold) values ('harald', 'Supa Boy', 0, 10, 10, 10, 10, 5, 5, 5);
insert into playercharacter (username, charactername, stomachState, intelligence, charisma, strength, agility, copper, silver, gold) values ('test', 'Testman', 1, 8, 8, 8, 8, 0, 0, 1);
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
insert into consumable (username, itemname, amount) values ('test', 'potato', 1);
create table marketlisting (
	id int auto_increment,
    price int,
    itemname VARCHAR(50),
    primary key (id)
);
insert into marketlisting (price, itemname) values (10, 'potato');

select * from user;
select * from playercharacter;
select * from consumable;
drop table marketlisting;
drop table consumable;
drop table playercharacter;
drop table user;

