
drop schema if exists csd220_tennis_club;
create schema csd220_tennis_club character set utf8mb4;

use csd220_tennis_club;

drop table if exists recreational_member;
drop table if exists `match`;
drop table if exists coach_assignment;
drop table if exists competitive_member;
drop table if exists member;
drop table if exists division;

create table if not exists recreational_member (
    player_number int not null primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    sex char(1),
    year_joined year(4) not null,
    phone varchar(15) not null,
    email varchar(100)
);

create table if not exists division (
    division_code char(2) not null primary key,
    description varchar(100) not null
);

create table if not exists competitive_member (
    player_number int not null primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    sex char(1),
    year_joined year(4) not null,
    phone varchar(15) not null,
    email varchar(100),
    division_code char(2) not null,
    constraint fk_competitive_member_member foreign key (division_code) references division(division_code)
);                  

create table if not exists coach_assignment (
    coach_player_number int  not null,
    coachee_player_number int not null,
    constraint fk_coach_member foreign key (coach_player_number) references competitive_member(player_number),
    constraint fk_coachee_member foreign key (coachee_player_number) references competitive_member(player_number)
);

create table if not exists `match` ( 
    match_id int not null primary key auto_increment,
    `date` date not null,
    player1_number int,
    player2_number int,
    winner_player_number int,
    winner_sets_won tinyint,
    division_code char(2) not null,
    constraint fk_player1_member foreign key (player1_number) references competitive_member(player_number),
    constraint fk_player2_member foreign key (player2_number) references competitive_member(player_number),
    constraint fk_winner_member foreign key (winner_player_number) references competitive_member(player_number),
    constraint fk_match_division_code foreign key (division_code) references division(division_code)
);

        
insert into division (division_code, description) values
('PM', 'Professional Men'),
('PF', 'Professional Women'),
('SM', 'Senior Men'),
('SF', 'Senior Women'),
('AM', 'Amateur Men'),
('AF', 'Amateur Women'),
('YM', 'Youth Men'),
('YF', 'Youth Women')
;

insert into competitive_member values
(102, 'Sandy', 'Beach', 'F', '2014', '705-254-6060', 'sb@heehaw.ca', 'PF'),
(103, 'Sam', 'Mannella', 'M', '2013', '705-254-6161', 'sm@heehaw.ca', 'PM'),
(104, 'Douglas', 'Fir', 'M', '2014', '705-254-6262', 'df@heehaw.ca', 'SM'),
(105, 'Helen', 'Earth', 'F', '2014', '705-254-6363', 'hw@heehaw.ca', 'SF'),
(107, 'Betty', 'Misses', 'F', '2014', '705-254-6565', 'bm@heehaw.ca', 'AF'),
(108, 'Phil', 'Itin', 'M', '2014', '705-254-6666', 'pi@heehaw.ca', 'AM'),
(109, 'Frank', 'Furter', 'M', '2015', '705-254-6868', 'ff@heehaw.ca', 'PM'),
(110, 'Stan', 'D\'Overheer', 'M', '2017', '705-254-7777', 'sd@heehaw.ca', 'SM'),
(112, 'Ellie', 'Phant', 'F', '2016', '705-254-7373', 'ep@heehaw.ca', 'PF'),
(113, 'Patty', 'Cake', 'F', '2015', '705-254-8595', 'pc@heehaw.ca', 'SF'),
(114, 'Will', 'Itmatter', 'M', '2013', '705-254-8765', 'wi@heehaw.ca',  'AM'),
(115, 'Scott', 'Ish', 'M', '2015', '705-254-8222', 'st@heehaw.ca', 'PM'),
(116, 'Nick', 'Oftime', 'M', '2015', '705-254-7788', 'no@heehaw.ca', 'PM'),
(117, 'Vic', 'Tory', 'M', '2017', '705-254-7522', 'vt@heehaw.ca', 'PM'),
(118, 'Bonnie', 'Anclyde', 'F', '2016', '705-254-7399', 'ba@heehaw.ca', 'PF'),
(119, 'Brad', 'Enbutter', 'M', '2015', '705-254-8533', 'bn@heehaw.ca', 'SM'),
(120, 'Justin', 'Case', 'M', '2015',  '705-254-8711', 'jc@heehaw.ca', 'AM'),
(121, 'Pete', 'Moss', 'M', '2015', '705-254-8299', 'pm@heehaw.ca', 'PM'),
(125, 'Max', 'Imam', 'M', '2017', '705-254-1513', 'mi@heehaw.ca', 'YM'),
(126, 'Rob', 'Urrey', 'M', '2017', '705-254-8222', 'ru@heehaw.ca', 'YM'),
(127, 'Charlie', 'Horse', 'F', '2018', '705-254-2345', 'ch@heehaw.ca', 'YF'),
(128, 'Tally', 'Ho', 'F', '2018', '705-254-4532', 'th@heehaw.ca', 'YF')
;

insert into recreational_member values
(100, 'Dwayne', 'Pipe', 'M', '2014', '705-254-6334', 'dp@heehaw.ca'),
(101, 'Bob', 'Cat', 'M', '2017', '705-254-6464', 'bc@heehaw.ca'),
(106, 'Sunny', 'Days', 'F', '2013', '705-254-6767', 'sd@heehaw.ca'),
(111, 'Jim', 'Bag', 'M', '2015', '705-254-7575', 'jb@heehaw.ca'),
(122, 'Gerry', 'Mander', 'M', '2015', '705-254-2561', 'gm@heehaw.ca'),
(123, 'Joan', 'Zin', 'F', '2016', '705-254-2561', 'jz@heehaw.ca'),
(124, 'Anne', 'Onimus', 'F', '2016', '705-254-2211', 'ao@heehaw.ca')
;

insert into `match` 
    (`date`, player1_number, player2_number, winner_player_number, winner_sets_won, division_code)
values
('2019-02-02', 127, 128, 128, 3, 'YF'),
('2019-02-03', 125, 126, 125, 2, 'YM'),
('2019-02-02', 102, 112, 102, 2, 'PF'),
('2019-02-03', 103, 109, 109, 2, 'PM'),
('2019-02-03', 104, 110, 110, 3, 'SM'),
('2019-02-10', 105, 113, 105, 2, 'SF'),
('2019-03-01', 113, 105, 113, 3, 'SF'),
('2019-03-01', 120, 108, 120, 2, 'AM'),
('2019-03-07', 118, 112, 112, 3, 'PF'),
('2019-03-08', 119, 110, 110, 2, 'SM'),
('2019-03-08', 118, 102, 118, 2, 'PF'),
('2019-03-09', 113, 105, 105, 3, 'SF'),
#scheduled matches with no players assigned
('2019-03-15', null, null, null, null, 'PM'),
('2019-03-15', null, null, null, null, 'SF'),
('2019-03-16', null, null, null, null, 'PF'),   
('2019-03-16', null, null, null, null, 'SF'),
('2019-03-16', null, null, null, null, 'AF'),   
('2019-03-16', null, null, null, null, 'YF'),
('2019-03-17', null, null, null, null, 'YF'),
('2019-03-17', null, null, null, null, 'YM'),
('2019-03-17', null, null, null, null, 'AF'),
('2019-03-17', null, null, null, null, 'AM'),
('2019-03-17', null, null, null, null, 'PF'),
('2019-03-17', null, null, null, null, 'PM'),
('2019-03-17', null, null, null, null, 'SF'),
('2019-03-17', null, null, null, null, 'SM')
;

insert into coach_assignment (coach_player_number, coachee_player_number) values
(102,107),
(102,105),
(103,104),
(109,104),
(112,113),
(115,119),
(121,119)
;

             