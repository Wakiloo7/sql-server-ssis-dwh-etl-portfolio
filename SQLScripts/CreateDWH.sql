USE [book_sales]
GO

/*
===================
DWH for graviety bookstore DB 
===================
= Wakil Ahmad
*/



/*
===================
***** Object:  Table [dbo].[address]    
===================
*/

CREATE TABLE [dbo].[address]
(
	[address_sk] int IDENTITY(1,1) NOT NULL,
	[address_bk] int NOT NULL,
	[street_no] [nvarchar](10) NULL,
	[street_name] [nvarchar](200) NULL,
	[city] nvarchar (100) NULL,
	[country_bk] int NOT NULL,
	[countryname] nvarchar(200) NULL,
	[status_bk] int NOT NULL,
	[status] varchar(30) NULL,


			-- Constraints ==> Primary Keys
	CONSTRAINT pk_address PRIMARY KEY ([address_sk]) 
)

GO

/*
===================
****** Object:  Table [dbo].[customer] 
===================
*/

CREATE TABLE [dbo].[customer]
(
	[customerid_sk] int IDENTITY(1,1) NOT NULL,
	[customerid_bk] int NOT NULL,
	[fname] nvarchar(100) NULL,
	[lname] nvarchar(100) NULL,
	[email] nvarchar(200) NULL,
	[start_date] datetime NULL,
	[end_date] datetime NULL,
	[iscurrent] bit NULL,

			-- Constraints ==> Primary Keys
	CONSTRAINT pk_customer PRIMARY KEY ([customerid_sk]) 
)

GO


/*
===================
****** Object:  Table [dbo].[address_customer_bridge]
===================
*/

CREATE TABLE [dbo].[address_customer_bridge]
(
	[customerid_fk] int NOT NULL,
	[addressid_fk] int NOT NULL,


		    -- Constraints ==> Foreign Keys
	CONSTRAINT [fk_address_customer_bridge_address] FOREIGN KEY([addressid_fk])
	    REFERENCES [dbo].[address] ([address_sk]),
	CONSTRAINT [fk_address_customer_bridge_customer] FOREIGN KEY([customerid_fk])
	    REFERENCES [dbo].[customer] ([customerid_sk]),
			-- Constraints ==> Primary Keys
	CONSTRAINT [pk_address_customer_bridge_customer] PRIMARY KEY  ([customerid_fk] , [addressid_fk])
)

GO

/*
===================
****** Object:  Table [dbo].[author]
===================
*/

CREATE TABLE [dbo].[author]
(
	[author_sk] int IDENTITY(1,1) NOT NULL,
	[author_bk] int NOT NULL,
	[author_name] nvarchar(1000) NULL,

			-- Constraints ==> Primary Keys
    CONSTRAINT [pk_author] PRIMARY KEY  ([author_sk])
) 

GO

/*
===================
****** Object:  Table [dbo].[book]
===================
*/

CREATE TABLE [dbo].[book]
(
	[bookid_sk] [int] IDENTITY(1,1) NOT NULL,
	[bookid_bk] [int] NOT NULL,
	[title] [nvarchar](400) NOT NULL,
	[isbn] [varchar](13) NULL,
	[languageid_bk] [int] NULL,
	[languagename] [nvarchar](50) NULL,
	[languagecode] [varchar](8) NULL,
	[publicationdate] [date] NULL,
	[nopages] [int] NULL,
	[publisherid_bk] [int] NULL,
	[publisher_name] [nvarchar](200) NULL,

			-- Constraints ==> Primary Keys
    CONSTRAINT [pk_book] PRIMARY KEY  ([bookid_sk])
)

GO

/*
===================
****** Object:  Table [dbo].[author_book]
===================
*/

CREATE TABLE [dbo].[author_book]

(
	[bookid_fk] [int] NOT NULL,
	[authorid_fk] [int] NOT NULL,

		    -- Constraints ==> Foreign Keys
	CONSTRAINT [fk_author_book_book] FOREIGN KEY([bookid_fk]) REFERENCES [dbo].[book] ([bookid_sk]),
	CONSTRAINT [fk_author_book_author] FOREIGN KEY([authorid_fk]) REFERENCES [dbo].[author] ([author_sk]),
			-- Constraints ==> Primary Keys
    CONSTRAINT [pk_author_book] PRIMARY KEY  ([bookid_fk] , [authorid_fk])
)

GO

/*
===================
****** Object:  Table [dbo].[order_history_status]
===================
*/

CREATE TABLE [dbo].[order_history_status]
(
	[history_sk] [int] IDENTITY(1,1) NOT NULL,
	[history_bk] [int] NOT NULL,
	[status_bk] [int] NOT NULL,
	[status_value] [nvarchar](50) NULL,
	[status_date] [date] NULL,
	[status_time] [time](7) NULL,

			-- Constraints ==> Primary Keys
    CONSTRAINT [pk_order_history_status] PRIMARY KEY  ([history_sk])
)

GO
insert into Dim_order_history(history_id_bk, status_id_bk,status_value, status_date, status_time)
values(99999,99999,'Order Deprecated','2000-01-01','07:28:00.0000000')

/*
===================
****** Object:  Table [dbo].[shipping_method]
===================
*/

CREATE TABLE [dbo].[shipping_method]
(
	[method_sk] [int] IDENTITY(1,1) NOT NULL,
	[methodid_bk] [int] NOT NULL,
	[method_name] [nvarchar](100) NULL,
	[cost] [float] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[iscurrent] [bit] NULL,

			-- Constraints ==> Primary Keys
    CONSTRAINT [pk_shipping_method] PRIMARY KEY  ([method_sk])
)

GO

/*
===================
****** Object:  Table [dbo].[salesfact]
===================
*/
CREATE TABLE [dbo].[salesfact]
(
	[salesfact_sk] [int] IDENTITY(1,1) NOT NULL,
	[orderid_pk_dd] [int] NOT NULL,
	[customer_fk] [int] NOT NULL,
	[shipping_method_fk] [int] NOT NULL,
	[book_id_fk] [int] NOT NULL,
	[history_fk] [int] NOT NULL,
	[timeid_fk] [int] NOT NULL,
	[dateid_fk] [int] NOT NULL,
	[dest_address_fk] [int] NULL,
            -- Measures
	[price] [decimal](5, 2) NULL,

		    -- Constraints ==> Foreign Keys
	CONSTRAINT [fk_fact_customer] FOREIGN KEY([customer_fk]) REFERENCES [dbo].[customer] ([customerid_sk]),
    CONSTRAINT [fk_fact_shipping_method] FOREIGN KEY([shipping_method_fk]) REFERENCES [dbo].[shipping_method] ([method_sk]),
    CONSTRAINT [fk_fact_book] FOREIGN KEY([book_id_fk]) REFERENCES [dbo].[book] ([bookid_sk]),
    CONSTRAINT [fk_fact_address] FOREIGN KEY([dest_address_fk]) REFERENCES [dbo].[address] ([address_sk]),
	CONSTRAINT [fk_fact_order_history_status] FOREIGN KEY([history_fk]) REFERENCES [dbo].[order_history_status] ([history_sk]),
    CONSTRAINT [FK_salesfact_Dim_Time] FOREIGN KEY([timeid_fk]) REFERENCES [dbo].[Dim_Time] ([Time_SK]),
    CONSTRAINT [FK_salesfact_Dim_Date] FOREIGN KEY([dateid_fk]) REFERENCES [dbo].[Dim_Date] ([Date_SK]),
			-- Constraints ==> Primary Keys
	CONSTRAINT [pk_salesfact] PRIMARY KEY  ([salesfact_sk])
)

GO

