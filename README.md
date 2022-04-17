Create table Genre(
	Genre_ID char(6),
	Name varchar(10)
	);

Create table Customers(
	Customer_ID char(6) PRIMARY KEY,
	Name varchar(20),
	Mail varchar(25),
	Tel int
);
CREATE TABLE Production (
    Prod_ID char(6) not null,
    Name varchar(25),
    Link varchar(100),
    primary key (Prod_ID)
);
Create table Price (
	Hall_Type char(6),
	Cost int,
	Seat_Type char(6)
);
CREATE TABLE Movies(
	Movie_ID char(6) PRIMARY KEY, 
	Name varchar(25),
	PG int,
	Description varchar(8000), 
	Start_Date date, 
	End_Date date,
	Status int,
	Poster varchar(100),
	Trailer varchar(100),
	Duration int,
	CONSTRAINT ck_Movies_ischk Check(Status IN(1,0))
);
CREATE TABLE Participated (
    Role varchar(10),
    Prod_ID char(6),
    Movie_ID char(6),
    foreign key (Prod_ID) references Production(Prod_ID),
    foreign key (Movie_ID) references Movies(Movie_ID)
);
Create table Hall(
	Hall_ID char(6) PRIMARY KEY,
	Hall_Type varchar(10),
	Seat_Count int
	);
Create table Timetable(
	Show_ID char(6) PRIMARY KEY,
	Hall_ID char(6),
	Movie_ID char(6),
	Start_Time time,
	End_Time time,
	Day varchar(9)
	);
Create table Orders(
	Order_ID char(6) PRIMARY KEY,
	Show_ID char(6),
	Adult_Num int,
	Child_Num int,
	Customer_ID char(6),
	foreign key (Show_ID) references Timetable(Show_ID),
	Foreign key (Customer_ID) references Customers(Customer_ID)
);
create table Seat (
    Seat_ID char(6) primary key,
    Seat_Type Varchar(3),
    Hall_ID char(6),
    foreign key (Hall_ID) references Hall(Hall_ID)
);
create table OrderSeats (
	Order_ID char(6),
	FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
	Seat_ID char(6),
	FOREIGN KEY (Seat_ID) REFERENCES Seat(Seat_ID)
);
create table Payment (
	Order_ID char(6),
	Bank varchar(10),
	Dans int,
	foreign key (Order_ID) references Orders(Order_ID)
);


insert into Genre(Genre_ID, Name)
Values 
('G00001', 'Action'),
('G00002', 'Cartoon'),
('G00003', 'Fantasy'),
('G00004', 'Sci-Fi'),
('G00005', 'Comedy'),
('G00006', 'Romantic'),
('G00007', 'Drama'),
('G00008', 'Historic'),
('G00009', 'Crime'),
('G00010', 'Horror'),
('G00011', 'Adventure'),
('G00012', 'Thriller'),
('G00013', 'War'),
('G00014', 'Satire');


insert into Price(Hall_Type, Seat_Type, Cost)
values('Normal', 'Stn', 10000),
('3D', 'Stn', 15000),
('IMAX', 'Stn', 20000),
('Normal', 'VIP', 20000),
('3D', 'VIP', 30000),
('IMAX', 'VIP', 40000);

insert into Movies(Movie_ID, Name, PG, Description, Start_Date, End_Date, Status, Poster, Trailer, Duration)
values
	('M00001', 'Turning Red', 0, 'A 13-year-old girl named Mei Lee turns into a giant red panda whenever she gets too excited.', '2022.03.11', '2022-04-01', 1, 
	'https://tengis.mn/media/tengisnew/content/2022/thumb/turning-red-bosoo.jpg', 'https://www.youtube.com/watch?v=XdKzUbAiswE', 80),

	('M00002', 'Улаанцэцэг', 14, 'Монгол улсын төр нийгмийн гарамгай зүтгэлтэн, төрийн соёрхолт зохиолч Сономын Удвалын бодит амьдралаас сэдэвлэн түүний нийгэм улс төрд оруулсан их хувь нэмэр',
	'2022.03.08', '2022-04-01', 1, 'https://tengis.mn/media/tengisnew/content/2022/thumb/ulaan-tsetseg_-_Copy.jpg', 'https://www.youtube.com/watch?v=EWh5U8Rz3qs', 125),

	('M00003', 'Мардай', 13,'ЗХУ-ын мэдэлд байх Эрдэс хотын Мардайн уурхайд Монгол улсын ялын дээд хэмжээ авсан хоригдлуудыг зөөвөрлөх үед санаандгүй нэг хоригдол амь насаа алдсанаар заавал бүрэн гүйцэт хүлээлгэж өгөхгүй бол 2 улсын хоорондын асуудал болж хувирах болов.',
	'2022.03.04', '2022-04-01', 1, 'https://tengis.mn/media/tengisnew/content/2022/thumb/mardai-bosoo.jpg', 'https://www.youtube.com/watch?v=SVl1-aURD3A', 115),
	
	('M00004', 'Batman', 0, 'When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the citys hidden corruption and question his familys involvement.', 
	'2022-03-04', '2022-04-01', 1, 'https://cdn.mos.cms.futurecdn.net/p7LYq5FN4SAHk7sYp6zZog.jpg', 'https://www.youtube.com/watch?v=mqqft2x_Aa4', 175),

	('M00005', 'Uncharted', 6, 'Street-smart Nathan Drake, is recruited by seasoned treasure hunter, Victor "Sully" Sullivan, to recover a fortune amassed by Ferdinand Magellan, and lost 500 years ago by the House of Moncada.', 
	'2022-02-18', '2022-04-01', 1, 'https://scale.coolshop-cdn.com/product-media.coolshop-cdn.com', 'https://www.youtube.com/watch?v=eHp3MbsCbMg', 120),

	('M00006', 'For You', 0, 'Улс орон даяар 3-н хоног амрахаар болно. Санамсаргүй байдлаар дүргүй залуутайгаа хамт түгжигдсэн маркетингийн менежер бүсгүй гарах арга хайх боловч ээлж солигдтол өөр арга байхгүй гэдгийг хамгаалагч Маргад ойлгуулна. Их дэлгүүрт түгжигдсэн залуус эхэндээ зөрчилдөх ба яваандаа цагийг хөгжилтэй өнгөрөөх гэж Их дэлгүүрээр хэсэж энэ хугацаандаа бие биедээ дасаж дурлана. ',
	'2022-02-09', '2022-01-07', 1, 'https://kinosan.mn/uploads/cache/6/d/8a8e172930ced9c823ca274c9c6527972fb5d535_900x0.jpg', 'https://www.youtube.com/watch?v=HMAWnsNVsFs', 85),

	('M00007', 'Encanto', 0, 'A young Colombian girl has to face the frustration of being the only member of her family without magical powers.', 
	'2022-02-18', '2022-04-01', 1, 'https://i.scdn.co/image/ab67616d0000b273121c88edcc3a5b74972a3fe9', 'https://www.youtube.com/watch?v=CaimKeDcudo', 100),

	('M00008', 'Ambulance', 13, 'Two robbers steal an ambulance after their heist goes awry.', 
	'2022.03.18', '2022-04-01', 0, 'https://tengis.mn/ambulance/', 'https://www.youtube.com/watch?v=7NU-STboFeI', 135),

	('M00009', 'Хурд', 16, 'Амиа егүүтгэх үзэгдэл Монгол улсад жилээс жилд ихэссээр байгаа нь ямар учир шалтгаантай вэ?', 
	'2022.03.18', '2022-04-01', 0, 'https://tengis.mn/%D1%85%D2%AF%D1%80%D0%B4/', 'https://www.youtube.com/', 60);

insert into Hall(Hall_ID, Hall_Type, Seat_Count)
values('H00001', 'Normal', 40),
('H00002', 'Normal', 40),
('H00003', '3D', 30),
('H00004', '3D', 30),
('H00005', 'IMAX', 30),
('H00006', 'IMAX', 30);

insert into Customers(Customer_ID, Name, Mail, Tel)
values ('C00001', 'Bat', 'bat@gmail.com', 99999999),
('C00002', 'Bataa', 'bataa@gmail.com', 99999998),
('C00003', 'John', 'john@gmail.com', 99999997)

insert into Orders(Order_ID, Show_ID, Adult_Num, Child_Num, Customer_ID)
values ('O00001', 'S00001', 3, 2, 'C00001'),
('O00002', 'S00001', 1, 2, 'C00002'),
('O00003', 'S00001', 2, 2, 'C00003'),
('O00004', 'S00001', 3, 2, 'C00001'),
('O00005', 'S00001', 4, 2, 'C00002'),
('O00006', 'S00002', 5, 2, 'C00003'),
('O00007', 'S00002', 1, 2, 'C00001'),
('O00008', 'S00003', 3, 2, 'C00002'),
('O00009', 'S00003', 2, 2, 'C00003'),
('O00010', 'S00003', 3, 2, 'C00001');

insert into Timetable(Show_ID, Hall_ID, Movie_ID, Start_Time, End_Time, Day)
values
('S00001', 'H00001', 'M00001', '12:00:00', '13:30:00', 'Monday'),
('S00002', 'H00002', 'M00002', '14:00:00', '15:30:00', 'Wednesday'),
('S00003', 'H00003', 'M00003', '18:00:00', '20:00:00', 'Friday');

INSERT INTO Production(Prod_ID, Name,Link)
Values  ('P00001', 'Will Wernick', 'https://www.imdb.com/name/nm1820881/'),
		('P00002', 'Alisa Allapach', 'https://www.imdb.com/name/nm3444384/'),
		('P00003', 'Lia Bozonelis', 'https://www.imdb.com/name/nm8454659/'),
		('P00004', 'Adwin Brown', 'https://www.imdb.com/name/nm4665483/'),	
		('P00005', 'Katie L. Hall', 'https://www.imdb.com/name/nm3302440/'),		
		('P00006', 'Jocelyn Hudon', 'https://www.imdb.com/name/nm6749397/'),	
		('P00007', 'Jake Gyllenhaal', 'https://www.imdb.com/name/nm0350453/'),	
		('P00008', 'Eiza González', 'https://www.imdb.com/name/nm2555462/'),
		('P00009', 'Devan Chandler Long', 'https://www.imdb.com/name/nm4231435/'),
		('P00010', 'Н.Сувд', 'https://www.urgoo.mn/movie/HO00001029/%D0%BD%D0%B0%D1%80%D0%BD%D1%8B-%D1%81%D0%B0%D0%B4%D0%B0%D0%BD'),
		('P00011', 'А.Дашпэлжээ', 'https://www.urgoo.mn/movie/HO00001029/%D0%BD%D0%B0%D1%80%D0%BD%D1%8B-%D1%81%D0%B0%D0%B4%D0%B0%D0%BD'),
		('P00012', 'Б.Замилан', 'https://www.urgoo.mn/movie/HO00001029/%D0%BD%D0%B0%D1%80%D0%BD%D1%8B-%D1%81%D0%B0%D0%B4%D0%B0%D0%BD'),
		('P00013', 'Г.Алтангэрэл', 'https://www.urgoo.mn/movie/HO00001029/%D0%BD%D0%B0%D1%80%D0%BD%D1%8B-%D1%81%D0%B0%D0%B4%D0%B0%D0%BD'),
		('P00014', 'Domee Shi', 'https://www.imdb.com/name/nm7626019/');



insert into Participated(Role, Prod_ID, Movie_ID)
values('Director', 'P00001', 'M00001'),
('Actress', 'P00002', 'M00002'),
('Actress', 'P00003', 'M00003'),
('Actor', 'P00004', 'M00004'),
('Producer', 'P00005', 'M00005'),
('Actor', 'P00006', 'M00006'),
('Director', 'P00007', 'M00007')

insert into Payment(Order_ID, Bank, Dans)
values('O00001', 'Khanbank', 51515250),
('O00002', 'Golomtbank', 11515250),
('O00003', 'Xacbank', 21515250),
('O00004', 'Khanbank', 41515250),
('O00005', 'Xacbank', 31515250),
('O00006', 'Golomtbank', 81515250),
('O00006', 'TDB', 87615250),
('O00007', 'TDB', 87615250),
('O00008', 'Khanbank', 52515250)

insert into Seat(Seat_ID, Seat_Type, Hall_ID)
values('S00001', 'Stn', 'H00001'),
('S00002', 'VIP', 'H00003'),
('S00003', 'Stn', 'H00001'),
('S00004', 'VIP', 'H00003'),
('S00005', 'VIP', 'H00006'),
('S00006', 'Stn', 'H00005'),
('S00007', 'VIP', 'H00006'),
('S00008', 'Stn', 'H00004'),
('S00009', 'VIP', 'H00001'),
('S00010', 'Stn', 'H00002'),
('S00011', 'Stn', 'H00002'),
('S00012', 'Stn', 'H00001')

insert into OrderSeats(Order_ID, Seat_ID)
values ('O00001', 'S00001'),
('O00001', 'S00002'),
('O00001', 'S00003'),
('O00001', 'S00004'),
('O00001', 'S00005'),
('O00002', 'S00006'),
('O00002', 'S00007'),
('O00002', 'S00008'),
('O00003', 'S00009'),
('O00003', 'S00010'),
('O00003', 'S00011'),
('O00003', 'S00012'),
('O00006', 'S00001'),
('O00006', 'S00002'),
('O00006', 'S00003'),
('O00006', 'S00004'),
('O00006', 'S00005'),
('O00006', 'S00006'),
('O00006', 'S00007'),
('O00007', 'S00008'),
('O00007', 'S00009'),
('O00007', 'S00010'),
('O00008', 'S00001'),
('O00008', 'S00002'),
('O00008', 'S00003'),
('O00008', 'S00004'),
('O00008', 'S00005')


go
/* View 1 */
CREATE VIEW ProductionTeams as
select p.Prod_ID, d.Role, p.Name, m.Name as MovieName from Production p, Movies m, Participated d
where p.Prod_ID = d.Prod_ID and m.Movie_ID = d.Movie_ID

select * from ProductionTeams


create view TakenSeats as
select m.Name as MovieName, t.Start_Time, os.Seat_ID from Movies m, Orders o, OrderSeats os, Timetable t
where t.Show_ID = o.Show_ID and o.Order_ID = os.Order_ID and m.Movie_ID = t.Movie_ID

select * from TakenSeats

/*View №3*/ 
create view Tsagiinhuvaari as
Select m.Name, t.Day, t.Start_Time, t.Hall_ID
from Movies m, Timetable t
where m.Movie_ID=t.Movie_ID 
select * from Tsagiinhuvaari

/* Group By 1*/
SELECT pr.Name, COUNT(p.Movie_ID) AS Involved_In FROM Participated p
INNER JOIN Movies m ON p.Movie_ID = m.Movie_ID
INNER JOIN Production pr ON pr.Prod_ID = p.Prod_ID
GROUP BY pr.Name

/* Group By 2 */
SELECT o.Customer_ID, COUNT(o.Order_ID) AS TotalWatched FROM Orders o
INNER JOIN Customers c ON c.Customer_ID = o.Customer_ID
GROUP BY o.Customer_ID

create proc sul_suudal as 
select count(Seat.Seat_ID) as Seats, Hall.Hall_ID from Seat, Hall
where Hall.Hall_ID = Seat.Hall_ID
group by Hall.Hall_ID

execute sul_suudal


SELECT pr.Name, p.Movie_ID, pr.Link from Participated p
INNER JOIN Production pr ON pr.Prod_ID = p.Prod_ID


SELECT o.Customer_ID, c.Name, c.Mail, o.Order_ID FROM Orders o
INNER JOIN Customers c ON c.Customer_ID = o.Customer_ID

SELECT o.Customer_ID, c.Name, c.Mail, o.Order_ID, t.Day FROM Orders o
INNER JOIN Customers c ON c.Customer_ID = o.Customer_ID
INNER JOIN Timetable t on t.Show_ID = o.Show_ID

SELECT pr.Name, p.Movie_ID, pr.Link, m.Name FROM Participated p
INNER JOIN Movies m ON p.Movie_ID = m.Movie_ID
INNER JOIN Production pr ON pr.Prod_ID = p.Prod_ID
