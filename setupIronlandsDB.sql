set global time_zone = '+00:00';
create database ironlands;
use ironlands;

drop table farmjob;
drop table marketlisting;
drop table consumable;
drop table traveljob;
drop table farm;
drop table playercharacter;
drop table user;

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
    nourishment smallint,
	intelligence SMALLINT,
    charisma SMALLINT,
    strength SMALLINT,
    agility SMALLINT,
    copper INTEGER,
    xcoordinate smallint,
    ycoordinate smallint,
    primary key (username),
    constraint fk_username foreign key (username) references user(username)
);
insert into playercharacter (username, charactername, stomachState, nourishment, intelligence, charisma, strength, agility, copper, xcoordinate, ycoordinate) 
values ('harald', 'Supa Boy', 0, 0, 10, 10, 10, 10, 100, 1, 2);
insert into playercharacter (username, charactername, stomachState, nourishment, intelligence, charisma, strength, agility, copper, xcoordinate, ycoordinate) 
values ('test', 'Testman', 1, 0, 8, 8, 8, 8, 10, 0, 0);
create table traveljob (
	username VARCHAR(50),
    xcoordinate smallint,
    ycoordinate smallint,
    primary key (username),
    constraint one_to_one_jobs foreign key (username) references playercharacter(username)
);
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
    owner varchar(50),
    primary key (id),
    constraint fk_marketlisting foreign key (owner) references playercharacter(username)
);
insert into marketlisting (price, itemname, owner) values (3, 'potato', 'test');
insert into marketlisting (price, itemname, owner) values (5, 'carrot', 'test');
insert into marketlisting (price, itemname, owner) values (5, 'beer', 'test');
create table farm (
	id int auto_increment,
    xcoordinate smallint,
    ycoordinate smallint,
    owner varchar(50),
    state smallint,
    progression smallint,
    primary key (id),
    name varchar(50),
    constraint fk_potatofield foreign key (owner) references playercharacter(username)
);
insert into farm (xcoordinate, ycoordinate, owner, state, progression, name) values (1, 2, 'harald', 1, 0, 'Testfarm 1');
create table farmjob (
	worker varchar(50),
    farm int,
    primary key (worker),
    constraint fk_farmjob_work foreign key (worker) references playercharacter(username),
    constraint fk_farmjob_farm foreign key (farm) references farm(id)
);

select * from user;
select * from playercharacter;
select * from consumable;
select * from traveljob;
select * from farmjob;
select * from marketlisting;
select * from farm;
