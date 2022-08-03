--In the day 2 assignment will give mathematical calculation on existing data, grouping the record, sorting the records, 
--creation of customize reports of E-commerce orders

create database ecommerce2
use ecommerce2

create table customer (cid int primary key, cname nvarchar(30), cphone numeric(10,0), caddress nvarchar(20), zipcode int)
insert into customer values (1,'Abhishek', 9170246734, 'Dehradun', 248001)
insert into customer values (2,'Abhilasha', 7064564525, 'Mussoorie', 248003)
insert into customer values (3,'Abhimanyu', 7156377346, 'Dehradun', 248143)
insert into customer values (4,'Shashank', 7854257854, 'Champawat', 248001)
insert into customer values (5,'Shashwat', 6356183656, 'Rishikesh', 248003)
insert into customer values (6,'Sajal', 9836453613, 'Rishikesh', 248001)
insert into customer values (7,'Sejal', 9966378654, 'Dehradu', 248001)
insert into customer values (8,'Shivangi', 9342567369, 'Chopta', 248003)
insert into customer values (9,'Anu', 9673862409, 'Champawat', 248143)
insert into customer values (10,'Vaishnavi', 7056379641, 'Chopta', 248001)
select * from customer


create table products (pid int primary key, cid int not null, pname nvarchar(30), pprice int, CONSTRAINT fk_inv_product_id 
FOREIGN KEY (cid)  
REFERENCES customer (cid))

insert into products values (101, 1, 'Shoe', 2000)
insert into products values (102, 1, 'Bag', 2500)
insert into products values (103, 2, 'Tie', 600)
insert into products values (104, 3, 'Shirt', 3200)
insert into products values (105, 4, 'Pant', 4000)
insert into products values (106, 5, 'Coat', 10000)
insert into products values (107, 6, 'Sleepers', 1600)
insert into products values (108, 7, 'Bottle', 1200)
insert into products values (109, 8, 'Speaker', 3200)
insert into products values (110, 9, 'Earphones', 4000)

select * from products

create table orders (oid int primary key, pid int not null, oaddress nvarchar(30), oprice int, CONSTRAINT fk_ord_pid 
FOREIGN KEY (pid)  
REFERENCES products (pid))

insert into orders values (201, 101, 'Dehradun', 22000)
insert into orders values (202, 102, 'Dehradun', 11000)
insert into orders values (203, 104, 'Mussoorie', 9000)
insert into orders values (204, 106, 'Rishikesh', 11000)
insert into orders values (205, 107, 'Champawat', 12000)
insert into orders values (206, 101, 'Rishikesh', 32000)
insert into orders values (207, 105, 'Chopta', 8800)
insert into orders values (208, 103, 'Champawat', 9400)
insert into orders values (209, 106, 'Chopta', 22000)
insert into orders values (210, 104, 'Rishikesh', 32000)

select * from orders

SELECT DISTINCT oprice 
FROM orders
WHERE oprice > 11000;  

SELECT caddress, COUNT(*) AS "Number of customers"  
FROM customer 
GROUP BY caddress; 

SELECT pname, MAX(pprice) AS "Highest Price"  
FROM products  
GROUP BY pname;    

SELECT pid, oaddress
FROM orders  
WHERE oprice>11000  
ORDER BY oprice; 

SELECT pid, oaddress
FROM orders  
WHERE oprice between 11000 and 25000 
ORDER BY oprice; 

SELECT pid, oaddress  
FROM orders 
WHERE oaddress != 'Rishikesh'
ORDER BY oprice;   

SELECT SUM(pprice) AS "Total price"  
FROM products  
GROUP BY pprice
HAVING pprice>1000


SELECT TOP(3) * FROM employee_info;

SELECT oaddress, COUNT(*) AS "Total_Orders"   
FROM orders
GROUP BY oaddress
ORDER BY oaddress;