set global time_zone = '+00:00';
create database ironlands;
use ironlands;

drop table duepayment;
drop table farmjob;
drop table marketlisting;
drop table consumable;
drop table traveljob;
drop table farmjobpost;
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
insert into farm (xcoordinate, ycoordinate, owner, state, progression, name) values (1, 2, 'harald', 1, 0, 'Testfarm');
insert into farm (xcoordinate, ycoordinate, owner, state, progression, name) values (2, 2, 'harald', 1, 0, 'Far off x');
insert into farm (xcoordinate, ycoordinate, owner, state, progression, name) values (1, 3, 'harald', 1, 0, 'Far off y');
create table farmjob (
	worker varchar(50),
    farm int,
    locked boolean,
    primary key (worker),
    constraint fk_farmjob_work foreign key (worker) references playercharacter(username),
    constraint fk_farmjob_farm foreign key (farm) references farm(id)
);
create table farmjobpost (
	id int,
	salary int,
    farm int,
    poster varchar(50),
    primary key (id),
    constraint fk_farmjobpost_farm foreign key (farm) references farm(id),
    constraint fk_farmjobpost_poster foreign key (poster) references user(username)
);
insert into farmjobpost (id, salary, farm, poster) values (1, 10, 1, 'harald');
insert into farmjobpost (id, salary, farm, poster) values (2, 12, 2, 'harald');
insert into farmjobpost (id, salary, farm, poster) values (3, 10, 3, 'harald');
create table duepayment (
	id int,
    amount smallint,
    receiver varchar(50),
    primary key (id),
    constraint fk_duepayment_receiver foreign key (receiver) references playercharacter(username)
);
insert into duepayment (id, amount, receiver) values (1, 10, 'harald');
insert into duepayment (id, amount, receiver) values (2, -7, 'harald');

select * from user;
select * from playercharacter;
select * from consumable;
select * from traveljob;
select * from marketlisting;
select * from farm;
select * from farmjob;
select * from farmjobpost;
select * from duepayment;
