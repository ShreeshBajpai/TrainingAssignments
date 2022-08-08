/* Tour and Travels Database project
Indigo airlines want to create their own software so they need to work on database first. 
They want to manage employee database as well as ticket booking system, flight details means end to end solution from manpower 
source ticket booking customer details, flight assignment including all dependencies, keys
and normalize your table at least 2nd normal form.
Note:
Primary key and foreign key relationship
2nd normal form 
DRY rules 


Employee Database
Customer DB

Ticket Booking System
*/

create database ToursAndTravels
use ToursAndTravels

create table FlightDetails(FlightId int primary key, FlightName nvarchar(20), FlightDistance int, FlightRoute nvarchar(20))

create procedure sp_FlightList
as
begin
select FlightId, FlightName, FlightDistance, FlightRoute from FlightDetails
end

exec sp_FlightList


create procedure sp_insertFlightDetails(@FlightId int, @FlightName nvarchar(20), @FlightDistance int, @FlightRoute nvarchar(20))
as
begin
insert into FlightDetails(FlightId, FlightName, FlightDistance, FlightRoute) values (@FlightId, @FlightName, @FlightDistance, @FlightRoute)
end


exec sp_insertFlightDetails
@FlightId=101, 
@FlightName= 'MUM01', 
@FlightDistance= 365, 
@FlightRoute='DEL-MUM'

exec sp_insertFlightDetails
@FlightId=102, 
@FlightName= 'BLR02', 
@FlightDistance= 900, 
@FlightRoute='DEL-BLR'

exec sp_insertFlightDetails
@FlightId=103, 
@FlightName= 'DDN03', 
@FlightDistance= 250, 
@FlightRoute='DEL-DDN'

exec sp_insertFlightDetails
@FlightId=104, 
@FlightName= 'LKO04', 
@FlightDistance= 750, 
@FlightRoute='DEL-LKO'

exec sp_insertFlightDetails
@FlightId=105, 
@FlightName= 'CHD05', 
@FlightDistance= 200, 
@FlightRoute='DEL-CHD'

exec sp_insertFlightDetails
@FlightId=106, 
@FlightName= 'MYS06', 
@FlightDistance= 700, 
@FlightRoute='DEL-MYS'

exec sp_insertFlightDetails
@FlightId=107, 
@FlightName= 'GUW07', 
@FlightDistance= 1100, 
@FlightRoute='DEL-GUW'






create table Passengers(PassId int primary key, PassFlightId int CONSTRAINT fk_brand_celebid 
FOREIGN KEY (PassFlightId)  
REFERENCES FlightDetails (FlightId),
PassName nvarchar(20), PassAge int, PassPhone numeric(10,0))



create procedure sp_PassengerList
as
begin
select PassId, PassFlightId, PassName, PassAge, PassPhone from Passengers
end


create procedure sp_insertPassengerDetails(@PassId int, @PassFlightId int, @PassName nvarchar(20), @PassAge int, @PassPhone numeric(10,0))
as
begin
insert into Passengers(PassId, PassFlightId, PassName, PassAge, PassPhone) values (@PassId, @PassFlightId, @PassName, @PassAge, @PassPhone)
end

exec sp_PassengerList



exec sp_insertPassengerDetails
@PassId=1001, 
@PassFlightId= 101, 
@PassName= 'Shreesh', 
@PassAge=21,
@PassPhone=9170248923


exec sp_insertPassengerDetails
@PassId=1002, 
@PassFlightId= 102, 
@PassName= 'Sarthak', 
@PassAge=21,
@PassPhone=6576545783


exec sp_insertPassengerDetails
@PassId=1003, 
@PassFlightId= 103, 
@PassName= 'Shivesh', 
@PassAge=22,
@PassPhone=9810248953


exec sp_insertPassengerDetails
@PassId=1004, 
@PassFlightId= 104, 
@PassName= 'Sumit', 
@PassAge=26,
@PassPhone=7065564123


exec sp_insertPassengerDetails
@PassId=1005, 
@PassFlightId= 105, 
@PassName= 'Shreyash', 
@PassAge=31,
@PassPhone=6775245923


exec sp_insertPassengerDetails
@PassId=1006, 
@PassFlightId= 106, 
@PassName= 'Suresh', 
@PassAge=54,
@PassPhone=8714024893


exec sp_insertPassengerDetails
@PassId=1007, 
@PassFlightId= 107, 
@PassName= 'Abhishek', 
@PassAge=23,
@PassPhone=9548563413


exec sp_PassengerList



create table Booking(BookingId int primary key, BookingDate nvarchar(20), BookingSeatNo int, BookingFare int)


create procedure sp_BookingList
as
begin
select BookingId, BookingDate, BookingSeatNo, BookingFare from Booking
end

exec sp_BookingList


create procedure sp_insertBookingDetails(@BookingId int, @BookingDate nvarchar(20), @BookingSeatNo int, @BookingFare int)
as
begin
insert into Booking(BookingId, BookingDate, BookingSeatNo, BookingFare) values (@BookingId, @BookingDate, @BookingSeatNo, @BookingFare)
end


exec sp_insertBookingDetails
@BookingId=2001, 
@BookingDate='21/08/2022', 
@BookingSeatNo=21, 
@BookingFare=3000

exec sp_insertBookingDetails
@BookingId=2002, 
@BookingDate='29/09/2022', 
@BookingSeatNo=22, 
@BookingFare=5000

exec sp_insertBookingDetails
@BookingId=2003, 
@BookingDate='31/06/2022', 
@BookingSeatNo=23, 
@BookingFare=4000

exec sp_insertBookingDetails
@BookingId=2004, 
@BookingDate='11/03/2022', 
@BookingSeatNo=24, 
@BookingFare=3500

exec sp_insertBookingDetails
@BookingId=2005, 
@BookingDate='14/03/2022', 
@BookingSeatNo=25, 
@BookingFare=9000


exec sp_insertBookingDetails
@BookingId=2006, 
@BookingDate='08/08/2022', 
@BookingSeatNo=26, 
@BookingFare=5500

exec sp_insertBookingDetails
@BookingId=2007, 
@BookingDate='28/05/2022', 
@BookingSeatNo=27, 
@BookingFare=7500


exec sp_FlightList
exec sp_PassengerList
exec sp_BookingList


create procedure sp_Passenger_Details
as
begin
select * from FlightDetails as f
left join Passengers as p
on p.PassFlightId=f.FlightId
end

drop procedure sp_Passenger_Details

exec sp_Passenger_Details


create procedure sp_Passenger_Details2
as
begin
select * from FlightDetails as f
right join Passengers as p
on p.PassFlightId=f.FlightId
end


exec sp_Passenger_Details
