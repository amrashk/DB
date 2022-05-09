create table MyBulk1(txt NVARCHAR(MAX))
BULK INSERT MyBulk1 FROM N'D:\uruunii-medeelel.json' WITH(ROWTERMINATOR =' |\n', CODEPAGE = '65001'  );

 

create table MyBulk2(txt NVARCHAR(MAX))
BULK INSERT MyBulk2 FROM N'D:\bagsh-ajilchdiin-ners.json' WITH(ROWTERMINATOR =' |\n', CODEPAGE = '65001'  ); 

 

create table MyBulk3(txt NVARCHAR(MAX))
BULK INSERT MyBulk3 FROM N'D:\hicheeliin-huvaari.json' WITH(ROWTERMINATOR =' |\n', CODEPAGE = '65001'  ); 

 

create table MyBulk4(txt NVARCHAR(MAX))
BULK INSERT MyBulk4 FROM N'D:\baiguullagiin-butets.json' WITH(ROWTERMINATOR =' |\n', CODEPAGE = '65001'  ); 

 

create table MyBulk5(txt NVARCHAR(MAX))
BULK INSERT MyBulk5 FROM N'D:\hicheel.json' WITH(ROWTERMINATOR =' |\n', CODEPAGE = '65001'  ); 

 

select txt from MyBulk1

 


create table room(
room_id nvarchar(32), 
building nvarchar(100),
room_number nvarchar(100),
school nvarchar(100),
school_name nvarchar(100),
zoriulalt nvarchar(100),
talbain_hemjee float,
huvaari_tavih_school nvarchar(100),
seat_number integer,
projector nvarchar(100)
)

 

create table worker(
negjiin_dugaar nvarchar(32),
negjiin_ner nvarchar(100),
huviin_dugaar nvarchar(100),
ovog nvarchar(100),
ner nvarchar(100),
alban_tushaal nvarchar(100),
tuluv nvarchar(100),
bolovsrol nvarchar(100),
email nvarchar(100),
room_number nvarchar(100),
room_address nvarchar(100)
)

 

create table huvaari(
huvaari_id nvarchar(32),
zaasan_hicheeliin_dugaar nvarchar(100),
hicheeliin_jil nvarchar(100),
uliral nvarchar(100),
zaasan_bagsh nvarchar(100),
bagsh_id nvarchar(100),
hicheeliin_ner nvarchar(100),
bagts_tsag float,
hicheeliin_helber nvarchar(100),
garag nvarchar(100),
ehleh_tsag nvarchar(100),
duusah_tsag nvarchar(100),
oroltiin_too integer,
davtamj nvarchar(100),
ehleh_ognoo nvarchar(100),
batalgaajuulsan_suraltsagchiin_too integer,
room_id nvarchar(100),
hicheeliin_bair nvarchar(100),
room_number nvarchar(100),
room_name nvarchar(100),
bolomjit_seat nvarchar(100),
tanhim_id nvarchar(100),
surguuli_id nvarchar(100),
)

 


create table butets(
buttsiin_id nvarchar(32),
hariyaalagdah_negjiin_id nvarchar(32),
butets_name nvarchar(100),
butets_tovchlol nvarchar(100),
hariyaalagdah_negjiin_ner nvarchar(100),
)

 

create table hicheel (
hicheel_id nvarchar(32),
hicheel_index nvarchar(100),
mon_name nvarchar(100),
eng_name nvarchar(100),
hariyaalagdah_butets nvarchar(100),
hariyaalagdah_tanhim nvarchar(100),
surgaltiin_tuvshin nvarchar(100),
bagts_tsag float,
uliral nvarchar(100),
zorilgo nvarchar(100),
aguulga nvarchar(100),
ognoo integer,
lect_tsag nvarchar(100),
sem_tsag nvarchar(100),
lab_tsag nvarchar(100),
biy_daalt_tsag nvarchar(100),
dadlaga_tsag nvarchar(100),
)

 


declare @var nvarchar(max)
set @var  = (select txt from MyBulk1)
insert into room
select * from openjson(@var)
with (
room_id nvarchar(32) '$."uruunii_khuviin_dugaar"', 
building nvarchar(100) '$."khicheeliin_bair"',
room_number nvarchar(100) '$."uruunii_dugaar"',
school nvarchar(100) '$."khariyaalakh_surguuliin_dugaar"',
school_name nvarchar(100) '$."khariyaalakh_surguuliin_ner"',
zoriulalt nvarchar(100) '$."uruunii_zoriulalt"',
talbain_hemjee float '$."talbain_khemjee"',
huvaari_tavih_school nvarchar(100) '$."khicheeliin_khuvaari_tavikh_bolomj"',
seat_number integer '$."suudlyn_too"',
projector nvarchar(100) '$."proyektortoi_esekh"'
);

 


declare @var nvarchar(max)
set @var  = (select txt from MyBulk2)
insert into worker
select * from openjson(@var)
with (
negjiin_dugaar nvarchar(32) '$."khariyaalakh_buttsiin_negjiin_dugaar"', 
negjiin_ner nvarchar(100) '$."khariyaalakh_buttsiin_negjiin_ner"',
huviin_dugaar nvarchar(100) '$."bagsh_ajiltny_khuviin_dugaar"',
ovog nvarchar(100) '$."bagsh_ajiltny_ovog"',
ner nvarchar(100) '$."bagsh_ajiltny_ner"',
alban_tushaal nvarchar(100) '$."alban_tushaal"',
tuluv nvarchar(100) '$."tuluv"',
bolovsrol nvarchar(100) '$."ezemshsen_bolovsrol"',
email nvarchar(100) '$."imeil_khayag"',
room_number nvarchar(100) '$."alban_uruunii_dugaar"',
room_address nvarchar(100) '$."alban_uruunii_khayag"'
);

 


declare @var nvarchar(max)
set @var  = (select txt from MyBulk3)
insert into huvaari
select * from openjson(@var)
with (
huvaari_id nvarchar(32) '$."khuvaariin_dugaar"',
zaasan_hicheeliin_dugaar nvarchar(100) '$."zaasan_khicheeliin_dugaar"',
hicheeliin_jil nvarchar(100) '$."khicheeliin_jil"',
uliral nvarchar(100) '$."uliral"',
zaasan_bagsh nvarchar(100) '$."zaasan_bagshiin_ner"',
bagsh_id nvarchar(100) '$."bagshiin_khuviin_dugaar"',
hicheeliin_ner nvarchar(100) '$."khicheeliin_ner"',
bagts_tsag float '$."bagts_tsag"',
hicheeliin_helber nvarchar(100) '$."khicheeliin_khelber"',
garag nvarchar(100) '$."garag"',
ehleh_tsag nvarchar(100) '$."ekhlekh_tsag"',
duusah_tsag nvarchar(100) '$."duusakh_tsag"',
oroltiin_too integer '$."oroltyn_too"',
davtamj nvarchar(100) '$."davtamj"',
ehleh_ognoo nvarchar(100) '$."ekhlekh_ognoo"',
batalgaajuulsan_suraltsagchiin_too integer '$."batalgaajuulsan_suraltsagchiin_too"',
room_id nvarchar(100) '$."uruunii_khuviin_dugaar"',
hicheeliin_bair nvarchar(100) '$."khicheellekh_bair"',
room_number nvarchar(100) '$."uruunii_dugaar"',
room_name nvarchar(100) '$."uruunii_ner"',
bolomjit_seat nvarchar(100) '$."bolomjit_suudal"',
tanhim_id nvarchar(100) '$."khicheeliin_tenkhimiin_dugaar"',
surguuli_id nvarchar(100) '$."khicheeliin_surguuliin_dugaar"'
);

declare @var nvarchar(max)
set @var  = (select txt from MyBulk4)
insert into butets
select * from openjson(@var)
with (
buttsiin_id nvarchar(32) '$."buttsiin_negjiin_dugaar"',
hariyaalagdah_negjiin_id nvarchar(32) '$."buttsiin_khariyaalagdakh_negjiin_dugaar"',
butets_name nvarchar(100) '$."buttsiin_negjiin_ner"',
butets_tovchlol nvarchar(100) '$."buttsiin_negjiin_tovchlol"',
hariyaalagdah_negjiin_ner nvarchar(100) '$."buttsiin_khariyaalagdakh_negjiin_ner"'
);

declare @var nvarchar(max)
set @var  = (select txt from MyBulk5)
insert into hicheel
select * from openjson(@var)
with (
hicheel_id nvarchar(32) '$."khicheeliin_dugaar"',
hicheel_index nvarchar(100) '$."khicheeliin_indyeks"',
mon_name nvarchar(100) '$."mongol_ner"',
eng_name nvarchar(100) '$."angli_ner"',
hariyaalagdah_butets nvarchar(100) '$."khariyaalakh_butets"',
hariyaalagdah_tanhim nvarchar(100) '$."khariyaalakh_tenkhim"',
surgaltiin_tuvshin nvarchar(100) '$."surgaltyn_tuvshin"',
bagts_tsag float '$."bagts_tsag"',
uliral nvarchar(100) '$."orokh_uliral"',
zorilgo nvarchar(100) '$."zorilgo"',
aguulga nvarchar(100) '$."tovch_aguulga"',
ognoo integer '$."todorkhoilson_ognoo"',
lect_tsag nvarchar(100) '$."lyektsiin_bagts_tsag"',
sem_tsag nvarchar(100) '$."syeminaryn_bagts_tsag"',
lab_tsag nvarchar(100) '$."laboratoriin_bagts_tsag"',
biy_daalt_tsag nvarchar(100) '$."biye_daaltyn_bagts_tsag"',
dadlaga_tsag nvarchar(100) '$."dadlaga_sudalgaany_bagts_tsag"'
);

select * from worker

/*1*/
create view bagsh_ajilchidiin_too as
 select count(hariyaalagdah_negjiin_id) as staffs,hariyaalagdah_negjiin_ner from butets group by hariyaalagdah_negjiin_ner;
 
select * from bagsh_ajilchidiin_too
 
/*2*/

CREATE FUNCTION count_wh_stushal_snegj ( @negjiin_ner varchar(max), @tushaal varchar(max) )
RETURNS int 
BEGIN
declare @x int;
select @x = count(b.ner)  from worker b where b.negjiin_ner=@negjiin_ner and b.alban_tushaal=@tushaal;
return @x;
END; 
GO

/*3*/
CREATE PROCEDURE bagsh_infoss @bagsh_ner NVARCHAR(100) 
AS
 select * from worker where ner = @bagsh_ner
GO
 
exec bagsh_infoss @bagsh_ner = "Баатарбилэг"
 
/*4*/
CREATE PROCEDURE hicheel_abt @hich_index nvarchar(100)
as
 select * from hicheel where hicheel_index=@hich_index;
go
 
exec hicheel_abt @hich_index = "POLI418"
 
/*5*/
 
CREATE PROCEDURE dasgal5 @hich_bair nvarchar(100), @uruu nvarchar(100)
as
 if N'Хичээлийн танхим' = (select zoriulalt from room where building=@hich_bair and room_number = @uruu) begin
 select * from huvaari where hicheeliin_bair=@hich_bair and room_number=@uruu;
 end else
 if N'Багш нарын өрөө' =(select zoriulalt from room where building=@hich_bair and room_number = @uruu) begin
 select * from worker where room_address = concat( @hich_bair, '-', @uruu);
 end
go 
 
exec dasgal5 @hich_bair = N'Хичээлийн байр 4', @uruu = "213"
exec dasgal5 @hich_bair = N'Хичээлийн байр 3А', @uruu = "317"

/*6*/

declare @onoodor varchar(20);
declare @odor nvarchar(10);
set @onoodor=datepart(weekday, getdate());
set @odor=(case @onoodor when 2 then N'Даваа'
when 3 then N'Мягмар'
when 4 then N'Лхагва'
when 5 then N'Пүрэв'
when 6 then N'Баасан'
end);
declare @ygodoo varchar(10);
set @ygodoo=(select cast(datepart(HOUR, getdate()) as varchar) + ':' + cast(datepart(MINUTE, getdate()) as varchar));
select * from room
where room_id not in (select room_id from huvaari
where @ygodoo between ehleh_tsag and duusah_tsag
and garag=@odor)
 
 
/*7*/
 
create procedure projector (@a nvarchar(20), @suudal int)
as
begin
select * from room
where projector = @a and seat_number > @suudal
end

exec projector @a = N'Проекторгүй', @suudal = 50


/*8*/

create view tuhain_hicheel_zaaj_bui_bagsh as
select zaasan_bagsh,hicheeliin_ner from huvaari group by zaasan_bagsh,hicheeliin_ner ;

select * from tuhain_hicheel_zaaj_bui_bagsh


/*9*/
create procedure history @zaasan_bagsh nvarchar(100)
as
begin
select hicheeliin_ner, zaasan_bagsh, hicheeliin_jil, uliral, bagts_tsag, hicheeliin_helber
from huvaari
where zaasan_bagsh = @zaasan_bagsh
end

exec history @zaasan_bagsh = N'Б.Наранчимэг'
