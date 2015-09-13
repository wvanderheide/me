--Create DB
/*
CREATE DATABASE Walkton14 ON ( 
	NAME = 'Walkton14_dat',
	FILENAME = 'e:\mssql7\data\walkton14.mdf',
	SIZE = 2,
	MAXSIZE = 5,
	FILEGROWTH = 5% )

LOG ON( 
	NAME = 'Walkton14_log',
	FILENAME ='e:\mssql7\data\walkton14.ldf',
	SIZE = 1,
	MAXSIZE = 5,
	FILEGROWTH = 5%)

--Get DB Info
sp_helpdb walkton14

*/

--Make Tables
use Walkton14

/****** Object:  Table [dbo].[BILLINGS]    Script Date: 3/19/00 3:28:45 PM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[BILLINGS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BILLINGS]
GO

/****** Object:  Table [dbo].[CARRIERS]    Script Date: 3/19/00 3:28:45 PM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CARRIERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CARRIERS]
GO

/****** Object:  Table [dbo].[BILLINGS]    Script Date: 3/19/00 3:28:58 PM ******/
CREATE TABLE [dbo].[BILLINGS] (
	[RouteID] [nvarchar] (4) NOT NULL ,
	[CarrierID] [smallint] NOT NULL ,
	[BalanceAmount] [money] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CARRIERS]    Script Date: 3/19/00 3:29:11 PM ******/
CREATE TABLE [dbo].[CARRIERS] (
	[CarrierID] [smallint] NOT NULL ,
	[LastName] [nvarchar] (15) NULL ,
	[FirstName] [nvarchar] (14) NULL ,
	[CarrierPhone] [nvarchar] (8) NULL ,
	[Birthdate] [smalldatetime] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[BILLINGS] WITH NOCHECK ADD 
	CONSTRAINT [PK_BILLINGS] PRIMARY KEY  NONCLUSTERED 
	(
		[RouteID]
	)  ON [PRIMARY] 
GO



--add billings data
insert into billings values('G191', 3, 541.75)
insert into billings values('G192', 4, 8.96)
insert into billings values('G836', 11, 281.00)
insert into billings values('G993', 7, -6.50)
insert into billings values('J111', 16, 396.75)
insert into billings values('J112', 16, 240.00)
insert into billings values('J113', 16, 0.00)
insert into billings values('J221', 19, 705.25)
insert into billings values('J222', 2, 57.00)
insert into billings values('J311', 1, 0.00)
insert into billings values('J314', 1, 0.00)
insert into billings values('K211', 13, 612.73)
insert into billings values('K221', 8, 411.75)
insert into billings values('K312', 8, 535.25)
insert into billings values('K884', 14, 463.50)
insert into billings values('K966', 9, 312.25)
insert into billings values('W412', 12, 0.00)
insert into billings values('W413', 6, -0.75)
GO

--add carriers data
insert into carriers values(1, 'Stevenson', 'Erika', '896-7456', '10/11/80')
insert into carriers values(2, 'Statura', 'Nick', '455-2003', '1/26/82')
insert into carriers values(3, 'Ketchum', 'Austin', '241-3596', '4/13/80')
insert into carriers values(4, 'Oleszkiewicz', 'Chris', '243-5104', '5/31/79')
insert into carriers values(5, 'Griffin', 'Matt', '538-7295', '2/6/81')
insert into carriers values(6, 'Wals', 'Aja', '458-0473', '12/26/78')
insert into carriers values(7, 'Juarez', 'Jesse', '361-2521', '3/29/78')
insert into carriers values(8, 'Singh', 'Amarjit', '459-3355', '6/3/80')
insert into carriers values(9, 'Zakem', 'Leah', '669-2316', '7/22/81')
insert into carriers values(10, 'Carrasco', 'Joe', '457-9433', '8/1/81')
insert into carriers values(11, 'Thompson', 'Danielle', '896-8358', '1/18/79')
insert into carriers values(12, 'Barendse', 'Terry', '940-1048', '4/13/81')
insert into carriers values(13, 'Tong', 'Carl', '455-8078', '10/10/79')
insert into carriers values(14, 'Shaub', 'Ashley', '949-4943', '8/20/80')
insert into carriers values(15, 'Pencola', 'Joel', '949-8871', '8/11/81')
insert into carriers values(16, 'De Young', 'Amanda', '878-3632', '6/12/80')
insert into carriers values(17, 'Slachter', 'Bradley', '530-8356', '3/4/79')
insert into carriers values(18, 'Postlewait', 'Miranda', '538-9864', '7/9/78')
insert into carriers values(19, 'Host', 'Alisha', '458-7377', '5/17/80')
GO

--View Data
Select * from Billings
Select * from carriers