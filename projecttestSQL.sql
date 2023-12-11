
insert into Member (first_name,last_name,email,phone,join_date)
values
('Bart','Simpson','bart@example.com','613-123-3214','2023-01-21'),
('John','Smith','Michael123@example.com','123-231-0102','2023-07-23'),
('Jack','Black','blackjack@example.com','124-223-0342','2023-07-23'),
('Bugs','Bunny','carrots@example.com','986-552-0392','2023-07-23');


--select all members

select * from Member;


-- update member email
update Member
set email='newemail@gmail.com'
where member_id= 1;



-- insert trainers
insert into Trainer (first_name,last_name,email,phone,certification)
values
('Grant','Daniel','gDaniel@example.com','333-444-5555','NASM'),
('Miles','Morales','spiderman@example.com','987-654-3211','CPR'),
('Max','Moran','maximus@example.com','225-625-9756','Gold');

--select trainers
select * from Trainer;


-- set up training session between member and trainer 
insert into Schedule(member_id,trainer_id,schedule_time,notes)
values
(1,1,'5:30','run 5km'),
(2,1,'8:30','do yoga'),
(3,2,'10:45','make sure to stretch'),
(4,3,'11:00','be careful of leg injury');

select * from Schedule;

--show all trainers and their members
Select *
from Trainer
join Schedule on Trainer.trainer_id = Schedule.trainer_id
join Member on Schedule.member_id = Member.member_id;


-- select a member
SELECT *  
from Member
WHERE member_id > 1;

--delete a member
DELETE FROM Schedule WHERE member_id = 1;

Select * from Schedule;

--drop a table
DROP TABLE Health_statistics;


--update schedule
update Schedule
set schedule_status='Cancelled'
where member_id= 2;

Select * from Schedule;


--create an event
insert into Event(event_type, event_time,capacity)
values
('Meet and Greet', '2:30',50),
('Marathon','12:00',1000);

select * from event;


--sign up member for event
insert into Register(event_id,member_id)
values
(1,1),
(2,3);

select * from Register;
