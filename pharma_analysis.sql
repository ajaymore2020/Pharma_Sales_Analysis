create database pharma;
use pharma;
select * from pharmadata;
-- KPI

-- 1)Gross sale
select sum(sales) from pharmadata;

-- 2)Total Quantity
select sum(Quantity) from pharmadata;

-- 3)Total Customer
select count(distinct(CustomerName))from pharmadata;

-- 4)Total Product
select count(distinct(ProductName))from pharmadata;

-- Dashboard

-- 1)top 3 product get most sale
select ProductName , Sales
from pharmadata
order by Sales desc
limit 3;

-- 2)top 3 product get less sale
select  ProductName , Sales 
from pharmadata
order by Sales
limit 3 ;

-- 3)Which Sales Team Sold most Quantity
select SalesTeam , Quantity 
from pharmadata
order by Quantity desc
Limit 1;

-- 4)changing table name 
ALTER TABLE pharmadata
RENAME COLUMN `Sub-channel` TO Subchannel;

-- 5)Quantity Sold By Sub-Channel
select Subchannel , sum(Quantity) 
from pharmadata
group by Subchannel;

-- 6)sold Quantity by Manager performance
create View Manager as
select Manager , sum(Quantity)as Quantity
from pharmadata
group by Manager; 
select * from Manager;

select Manager , Quantity,
case Manager
when Quantity <10000 then "Best Performance"
when Quantity >10000 then "AVG Performance"
end performance
from Manager;

-- 7)Channel BY Customers
select Channel , count(distinct(CustomerName))as Customer
 from pharmadata
 group by Channel;
 
 -- 8)Top 5 Golden Customer
 select CustomerName ,sum(Sales) as Sales 
 from pharmadata 
 group by CustomerName 
 order by Sales desc
 limit 5;
 
-- 9)Find the highest revenue-generating distributor 
Select Distributor , sum(Sales) as Sales
from pharmadata 
group by Distributor
order by Sales desc;

