
/*You have to create project for fashion brands. One person can endorse more than one brands you have to create 3 tables one for brand, 
2nd for celebrity and 3rd for brand endorsement. You have to fill atleast 10 records in each table and
you have to find output brands not endorced by celebrity, common brands endorced by celebrity, brands not endorced by celebrity
with stored procedures
--brand, celebrity, endorsement
--endoresement :- brand id, celebrity id */

create database fashiohDesign
use fashiohDesign
create table celebrities(cid int primary key identity, cfname nvarchar(20), clname nvarchar(20), czip int, cphone numeric(10,0))

create table brands(bid int primary key identity,  cid int not null, CONSTRAINT fk_brand_celebid 
FOREIGN KEY (cid)  
REFERENCES celebrities (cid), bname nvarchar(20))

create table endorsement (cid int, bid int, CONSTRAINT fk_endorsement_cid 
FOREIGN KEY (cid)  
REFERENCES celebrities (cid), CONSTRAINT fk_endorsement_bid 
FOREIGN KEY (bid)  
REFERENCES brands (bid))


create procedure sp_CelebritiesList
as
begin
select cid, cfname, clname, czip, cphone from celebrities
end

exec sp_CelebritiesList

create procedure sp_insertCelebrities(@cfname nvarchar(20), @clname nvarchar(20), @czip int, @cphone numeric(10,0))
as
begin
insert into celebrities(cfname, clname, czip, cphone) values (@cfname, @clname, @czip, @cphone)
end


exec sp_insertCelebrities
@cfname='Shahrukh', 
@clname='Khan', 
@czip=248003, 
@cphone='9170248923'

exec sp_insertCelebrities
@cfname='Ranveer', 
@clname='Singh', 
@czip=248001, 
@cphone='9120548923'

exec sp_insertCelebrities
@cfname='Ranbeer', 
@clname='Kapoor', 
@czip=248008, 
@cphone='7084673454'

exec sp_insertCelebrities
@cfname='Priyanka', 
@clname='Chopra', 
@czip=248004, 
@cphone='6735454923'

exec sp_insertCelebrities
@cfname='Anushka', 
@clname='Sharma', 
@czip=248005, 
@cphone='7054275464'

exec sp_insertCelebrities
@cfname='Katrina', 
@clname='Kaif', 
@czip=248006, 
@cphone='6734567823'

exec sp_insertCelebrities
@cfname='Ayushman', 
@clname='Khurana', 
@czip=248007, 
@cphone='9834123454'

exec sp_insertCelebrities
@cfname='Akshay', 
@clname='Kumar', 
@czip=248014, 
@cphone='7345826173'

exec sp_insertCelebrities
@cfname='Alia', 
@clname='Bhatt', 
@czip=248009, 
@cphone='6378547823'

exec sp_insertCelebrities
@cfname='Deepika', 
@clname='Padukone', 
@czip=248010, 
@cphone='9170248923'

-- End of input for 1st table using stored procedure (SP)
-- Input for second table using SP:-


create procedure sp_BrandsList
as
begin
select bid, cid, bname from brands
end

exec sp_BrandsList

create procedure sp_insertBrands(@cid int, @bname nvarchar(20))
as
begin
insert into brands(cid, bname) values (@cid, @bname)
end


exec sp_insertBrands
@cid=1,
@bname='Adidas'

exec sp_insertBrands
@cid=2,
@bname='Jockey'

exec sp_insertBrands
@cid=1,
@bname='Nike'

exec sp_insertBrands
@cid=3,
@bname='Kappa'

exec sp_insertBrands
@cid=4,
@bname='Asics'

exec sp_insertBrands
@cid=6,
@bname='Garnier'

exec sp_insertBrands
@cid=4,
@bname='Dove'

exec sp_insertBrands
@cid=9,
@bname='Prada'

exec sp_insertBrands
@cid=9,
@bname='Armani'

exec sp_insertBrands
@cid=7,
@bname='Gucci'

--End of Input for 2nd table using SP
-- Third table using SP

create procedure sp_EndorsementList
as
begin
select cid, bid from endorsement
end

exec sp_EndorsementList

create procedure sp_insertEndorsement(@cid int, @bid int)
as
begin
insert into endorsement(cid, bid) values (@cid, @bid)
end


exec sp_insertEndorsement
@cid=1,
@bid=2

exec sp_insertEndorsement
@cid=1,
@bid=1

exec sp_insertEndorsement
@cid=1,
@bid=3

exec sp_insertEndorsement
@cid=2,
@bid=2

exec sp_insertEndorsement
@cid=4,
@bid=8

exec sp_insertEndorsement
@cid=6,
@bid=4

exec sp_insertEndorsement
@cid=4,
@bid=9

exec sp_insertEndorsement
@cid=7,
@bid=9

exec sp_insertEndorsement
@cid=6,
@bid=7

exec sp_insertEndorsement
@cid=7,
@bid=10

exec sp_insertEndorsement
@cid=9,
@bid=9

exec sp_insertEndorsement
@cid=10,
@bid=7


create procedure sp_not_endorsed_brands
as
begin
select * from brands as b
left join endorsement as e
on b.bid=e.bid
where e.bid is null
end

exec sp_not_endorsed_brands

create procedure sp_commonBrands
as
begin
select b.bname as 'brands' from brands as b 
inner join endorsement as e 
on b.bid = e.bid 
group by(bname) 
having count(bname) > 1
end


exec sp_commonBrands

exec sp_EndorsementList

exec sp_CelebritiesList

exec sp_BrandsList

exec sp_not_endorsed_brands


