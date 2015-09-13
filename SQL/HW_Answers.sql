
/* 
Question 1
Create the DB 
*/
CREATE DATABASE Walkton14
ON 
PRIMARY ( NAME=Walkton14_data, 
  FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL\Data\Walkton14.mdf', 
  SIZE=1MB,  
  FILEGROWTH=512KB) 
LOG ON ( NAME=Walkton14_log, 
  FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL\Data\Walkton14.ldf', 
  SIZE=512KB,  
  FILEGROWTH=10%)

/* 
Question 2
Run the Walkton_Data.sql (see file of same name) 
*/



/* 
Question 3
Retrieve all data from billings table where route range J200 - J300
*/
Select * FROM BILLINGS
Where RouteID BETWEEN 'J200' AND 'J300'

/* 
Question 4
Show CarrierId and Balance if the TotalBalance is over 400
*/
Select CarrierID, Sum(BalanceAmount) as TotalBalance FROM BILLINGS
Group by CarrierID
Having  Sum(BalanceAmount) > 400


/* 
Question 5
Display last name, first name, and balance for each carrier, sort on last and first names
*/
Select 
	CARRIERS.LastName,
	CARRIERS.FirstName,
	Sum(BILLINGS.BalanceAmount) as TotalBalance
FROM 
	billings 
	right OUTER JOIN    
	CARRIERS 
ON 
	BILLINGS.CarrierID = CARRIERS.CarrierID
group by CARRIERS.LastName,CARRIERS.FirstName
ORDER By CARRIERS.LastName, CARRIERS.FirstName



/* 
Question 6
Display last name, first name, and phone number for all carriers with 
a phone number starting with 538
*/
Select LastName,FirstName,CarrierPhone FROM CARRIERS
Where CarrierPhone Like '538%'

/* 
Question 7
Show b-day, phone, last and first names, and balance for carrier born 
before 1980, with id less than 5 or greater than 10
*/
SELECT  
	CARRIERS.Birthdate, 
	CARRIERS.CarrierPhone, 
	CARRIERS.LastName, 
	CARRIERS.FirstName, 
	Sum(BILLINGS.BalanceAmount) as BalanceTotal
FROM 
	billings 
	right OUTER JOIN    
	CARRIERS 
ON 
	BILLINGS.CarrierID = CARRIERS.CarrierID
WHERE     (CARRIERS.Birthdate < '1/1/1980') AND ((CARRIERS.CarrierID < 5) OR
                     (CARRIERS.CarrierID > 10))

group by CARRIERS.Birthdate,CARRIERS.CarrierPhone,CARRIERS.LastName, 
	CARRIERS.FirstName




/*
Question 8
Displays the total, ave, min, and max balance amount for all carrier
*/
Select 
	sum(BalanceAmount) as Total, 
	AVG(BalanceAmount)as Average,
	MIN(BalanceAmount)as Lowest,
	Max(BalanceAmount)as Highest
from BILLINGS

/*
Question 9
Display the total, ave, min, and max balance amount grouped by
last name and first name and ordered on last name and first name
*/
Select 	
	sum(BILLINGS.BalanceAmount) as Total, 
	AVG(BILLINGS.BalanceAmount)as Average,
	MIN(BILLINGS.BalanceAmount)as Lowest,
	Max(BILLINGS.BalanceAmount)as Highest
FROM  
  CARRIERS 
	LEFT OUTER JOIN
  BILLINGS 
	ON BILLINGS.CarrierID = CARRIERS.CarrierID
group by CARRIERS.LastName, CARRIERS.FirstName
ORDER By CARRIERS.LastName, CARRIERS.FirstName

/*
Question 10
Number of rows in Cartesian product of carrier and billings
*/

Select Count(billings.Carrierid) from billings, carriers


