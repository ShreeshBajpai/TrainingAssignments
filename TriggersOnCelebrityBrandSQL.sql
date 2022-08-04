
--log table for celebrities

create table celebrities_log(Celeb_LogId int identity(100,1), c_id int, operation nvarchar(30), updateDate datetime)
select * from celebrities_log
 
 --triggers for celebrities table

create trigger CelebrityInsertTrigger
on celebrities 
for insert 
as 
insert into celebrities_log(c_id, operation, updateDate)
select cid, 'Data Inserted', GETDATE() from inserted

create table celebrities(cid int primary key identity, cfname nvarchar(20), clname nvarchar(20), czip int, cphone numeric(10,0))
insert into celebrities values('Jubin', 'Nautiyal', 248001, '7054783415')


create trigger CelebrityUpdateTrigger
on celebrities 
after update
as 
insert into celebrities_log(c_id, operation, updateDate)
select cid, 'Data Updated', GETDATE() from deleted

update celebrities set clname='Bisht' where cid=11
select * from celebrities


create trigger CelebrityDeleteTrigger
on celebrities 
after delete
as 
insert into celebrities_log(c_id, operation, updateDate)
select cid, 'Data Deleted', GETDATE() from deleted

/*
create trigger CelebrityDeleteTrigger
on celebrities 
instead of delete
as 
insert into celebrities_log(c_id, operation, updateDate)
select cid, 'Data Deleted', GETDATE() from deleted

for not deleting the record before the administrator's permission is given
*/

delete from celebrities where cid=11
select * from celebrities



--log table for brands

create table brands_log(Brand_LogId int identity(200,1), b_id int, operation nvarchar(30), updateDate datetime)
select * from brands_log


 --triggers for Brands table

 create trigger BrandInsertTrigger
on brands 
for insert 
as 
insert into brands_log(b_id, operation, updateDate)
select bid, 'Data Inserted', GETDATE() from inserted

insert into brands values(10, 'HRX')
select * from brands_log



create trigger BrandUpdateTrigger
on brands 
after update
as 
insert into brands_log(b_id, operation, updateDate)
select bid, 'Data Updated', GETDATE() from deleted

update celebrities set bname='JBL' where bid=9
select * from brands


create trigger BrandsDeleteTrigger
on brands 
after delete
as 
insert into brands_log(b_id, operation, updateDate)
select bid, 'Data Deleted', GETDATE() from deleted

delete from brands where bid=9


-- Log table for endorsement

create table endorsement_log(E_LogId int identity(300,1), e_id int, operation nvarchar(30), updateDate datetime)
select * from endorsement_log

 --triggers for Endorsement table

 create trigger EndorsementInsertTrigger
on endorsement 
for insert 
as 
insert into endorsement_log(e_id, operation, updateDate)
select cid, 'Data Inserted', GETDATE() from inserted

insert into endorsement values(9,5)
select * from endorsement_log



create trigger EndorsementUpdateTrigger
on endorsement 
after update
as 
insert into endorsement_log(e_id, operation, updateDate)
select cid, 'Data Updated', GETDATE() from deleted

update endorsement set bid=10 where cid=9
select * from endorsement


create trigger EndorsementDeleteTrigger
on endorsement 
after delete
as 
insert into endorsement_log(e_id, operation, updateDate)
select cid, 'Data Deleted', GETDATE() from deleted

delete from endorsement where bid=3