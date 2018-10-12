/*programmed by Xionghui Huang*/

DROP DATABASE IF EXISTS scheduling;
CREATE DATABASE IF NOT EXISTS scheduling;
use scheduling;


DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Builing;
DROP TABLE IF EXISTS Room;
DROP TABLE IF EXISTS Meeting;
DROP TABLE IF EXISTS Person_Meeting;



create table Person(
person_id INT(10)auto_increment,
first_name varchar(20),
last_name varchar(20),
Primary Key(person_id)
);

insert into Person(first_Name, last_name) values ('Tom', 'Hanks');
insert into Person(first_Name, last_name) values ('Anne', 'Hathaway');
insert into Person(first_Name, last_name) values ('Tom', 'Cruise');
insert into Person(first_Name, last_name) values ('Meryl', 'Steep');
insert into Person(first_Name, last_name) values ('Chris', 'Pratt');
insert into Person(first_Name, last_name) values ('Halle', 'Berry');
insert into Person(first_Name, last_name) values ('Robert', 'De Niro');
insert into Person(first_Name, last_name) values ('Julia', 'Roberts');
insert into Person(first_Name, last_name) values ('Denzel', 'Washington');
insert into Person(first_Name, last_name) values ('Melissa', 'McCarthy');





create table Building(
building_id INT(10),
building_name varchar(30),
primary key (building_id) 
);

insert into Building(building_id,building_name) values (1,'Headquarters');
insert into Building(building_id,building_name) values (2,'Main Street Building');


create table Room(
room_id INT(10),
room_number INT(10),
building_id INT(10),
capacity INT(10),
primary key (room_id),
	foreign key (building_id)
		references Building (building_id)
);

insert into Room(room_id,room_number, building_id, capacity) values (1,100,1,5);
insert into Room(room_id,room_number, building_id, capacity) values (2,200,1,4);
insert into Room(room_id,room_number, building_id, capacity) values (3,300,1,10);
insert into Room(room_id,room_number, building_id, capacity) values (4,10,2,4);
insert into Room(room_id,room_number, building_id, capacity) values (5,20,2,4);


create table Meeting(
meeting_id INT(10),
room_id INT(10),
meeting_start datetime,
meeting_end datetime,
primary key(meeting_id),
	foreign key (room_id)
		references Room (room_id)
);

insert into Meeting(meeting_id,room_id, meeting_start, meeting_end) values (1,1, '2016-12-25 09:00:00', '2016-12-25 10:00:00');
insert into Meeting(meeting_id,room_id, meeting_start, meeting_end) values (2,1, '2016-12-25 10:00:00', '2016-12-25 12:00:00');
insert into Meeting(meeting_id,room_id, meeting_start, meeting_end) values (3,1, '2016-12-25 11:00:00', '2016-12-25 12:00:00');
insert into Meeting(meeting_id,room_id, meeting_start, meeting_end) values (4,2, '2016-12-25 09:00:00', '2016-12-25 10:00:00');
insert into Meeting(meeting_id,room_id, meeting_start, meeting_end) values (5,4, '2016-12-25 09:00:00', '2016-12-25 10:00:00');
insert into Meeting(meeting_id,room_id, meeting_start, meeting_end) values (6,5, '2016-12-25 14:00:00', '2016-12-25 16:00:00');


create table Person_Meeting(
person_id INT(10),
meeting_id INT(10),
primary key (person_id, meeting_id),
	foreign key (person_id) 
		references Person(person_id),
	foreign key (meeting_id)
		references Meeting (meeting_id)
);

insert into Person_Meeting values (1,1);
insert into Person_Meeting values (10,1);
insert into Person_Meeting values (1,2);
insert into Person_Meeting values (2,2);
insert into Person_Meeting values (3,2);
insert into Person_Meeting values (4,2);
insert into Person_Meeting values (5,2);
insert into Person_Meeting values (6,2);
insert into Person_Meeting values (7,2);
insert into Person_Meeting values (8,2);
insert into Person_Meeting values (9,3);
insert into Person_Meeting values (10,3);
insert into Person_Meeting values (1,4);
insert into Person_Meeting values (2,4);
insert into Person_Meeting values (8,5);
insert into Person_Meeting values (9,5);
insert into Person_Meeting values (1,6);
insert into Person_Meeting values (2,6);
insert into Person_Meeting values (3,6);


select * from Person;
select * from Building;
select * from Room;
select * from Meeting;
select * from Person_Meeting;


select person.first_name, person.last_name, room_number, building_name, meeting.meeting_start, meeting.meeting_end, Meeting.meeting_id
from Person, building, Room, Meeting, Person_Meeting
where Building.building_id = Room.building_id and Person_Meeting.meeting_id in (1,2,4,6) and Person_Meeting.person_id = 1 and Person_Meeting.Meeting_id = Meeting.meeting_id
and Room.room_id = Meeting.room_id and Person_Meeting.person_id = Person.person_id;

select person.first_name, person.last_name, room_number, building_name, meeting.meeting_start, meeting.meeting_end, Meeting.meeting_id
from Person, building, Room, Meeting, Person_Meeting
where Building.building_id = Room.building_id and Person_Meeting.meeting_id in (2) and Person_Meeting.Meeting_id = Meeting.meeting_id
and Room.room_id = Meeting.room_id and Person_Meeting.person_id = Person.person_id;


select person.first_name, person.last_name, room_number, building_name, meeting.meeting_start, meeting.meeting_end, Meeting.meeting_id
from Person, building, Room, Meeting, Person_Meeting
where Building.building_id = Room.building_id and Person_Meeting.Meeting_id = Meeting.meeting_id
and Room.room_id = Meeting.room_id and Person_Meeting.person_id = Person.person_id and Building.building_id = 2
;

select Meeting.meeting_start, Meeting.meeting_end, Meeting.meeting_id, count(Person_meeting.person_id)
from Meeting, Person_meeting
where Meeting.meeting_id = Person_meeting.meeting_id and Person_meeting.meeting_id in(1,2,3,4,5,6)
group by Meeting.meeting_id;

select first_name, last_name, Meeting.meeting_id, meeting_start, meeting_end
from Person inner join Meeting, Building, Person_Meeting, Room  
where Building.building_id = Room.building_id and Person_Meeting.Meeting_id = Meeting.meeting_id
and Room.room_id = Meeting.room_id and Person_Meeting.person_id = Person.person_id and Meeting.meeting_start < '2016-12-25 12:00:00';



