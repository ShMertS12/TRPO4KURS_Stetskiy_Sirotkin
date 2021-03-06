USE [master]
GO
/****** Object:  Database [SAVSAA_Material_storage]    Script Date: 24.10.2021 17:55:50 ******/
CREATE DATABASE [SAVSAA_Material_storage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SAVSAA_Material_storage', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SAVSAA_Material_storage.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SAVSAA_Material_storage_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SAVSAA_Material_storage_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SAVSAA_Material_storage] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SAVSAA_Material_storage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SAVSAA_Material_storage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET ARITHABORT OFF 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET  MULTI_USER 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SAVSAA_Material_storage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SAVSAA_Material_storage] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [SAVSAA_Material_storage]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 24.10.2021 17:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Category_id] [int] IDENTITY(1,1) NOT NULL,
	[Category_name] [char](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 24.10.2021 17:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_FullName] [char](50) NOT NULL,
	[Order_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 24.10.2021 17:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_id] [int] NOT NULL,
	[Product_id] [int] NOT NULL,
	[Order_date] [date] NOT NULL,
	[Unitprice] [int] NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 24.10.2021 17:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Product_id] [int] IDENTITY(1,1) NOT NULL,
	[Product_name] [char](50) NOT NULL,
	[Category_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 24.10.2021 17:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nchar](20) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 24.10.2021 17:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shipment](
	[Shipment_id] [int] IDENTITY(1,1) NOT NULL,
	[Shipper_CompanyName] [char](50) NOT NULL,
	[Shipment_date] [date] NOT NULL,
	[Product_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Shipment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 24.10.2021 17:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shipper](
	[Shipper_id] [int] IDENTITY(1,1) NOT NULL,
	[Shipment_id] [int] NOT NULL,
	[Company_Name] [char](50) NOT NULL,
	[Phone] [char](11) NULL,
PRIMARY KEY CLUSTERED 
(
	[Shipper_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 24.10.2021 17:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Pictures] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Category_id], [Category_name]) VALUES (1, N'Wood                                              ')
INSERT [dbo].[Category] ([Category_id], [Category_name]) VALUES (2, N'Metal                                             ')
INSERT [dbo].[Category] ([Category_id], [Category_name]) VALUES (3, N'Plastic                                           ')
INSERT [dbo].[Category] ([Category_id], [Category_name]) VALUES (4, N'Food                                              ')
INSERT [dbo].[Category] ([Category_id], [Category_name]) VALUES (5, N'Cloth                                             ')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Customer_id], [Customer_FullName], [Order_id]) VALUES (1, N'Dmitryi Sokolov                                   ', 1)
INSERT [dbo].[Customer] ([Customer_id], [Customer_FullName], [Order_id]) VALUES (2, N'Dmitryi Brekotkin                                 ', 2)
INSERT [dbo].[Customer] ([Customer_id], [Customer_FullName], [Order_id]) VALUES (3, N'Vladislav Boreckiy                                ', 3)
INSERT [dbo].[Customer] ([Customer_id], [Customer_FullName], [Order_id]) VALUES (4, N'Vyacheslav Myasnikov                              ', 4)
INSERT [dbo].[Customer] ([Customer_id], [Customer_FullName], [Order_id]) VALUES (5, N'Andrew Rojkov                                     ', 5)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Order_id], [Customer_id], [Product_id], [Order_date], [Unitprice], [Quantity]) VALUES (1, 1, 1, CAST(0x02420B00 AS Date), 15000, 150)
INSERT [dbo].[Orders] ([Order_id], [Customer_id], [Product_id], [Order_date], [Unitprice], [Quantity]) VALUES (2, 2, 3, CAST(0xF7410B00 AS Date), 20000, 200)
INSERT [dbo].[Orders] ([Order_id], [Customer_id], [Product_id], [Order_date], [Unitprice], [Quantity]) VALUES (3, 3, 3, CAST(0x863F0B00 AS Date), 4000, 100)
INSERT [dbo].[Orders] ([Order_id], [Customer_id], [Product_id], [Order_date], [Unitprice], [Quantity]) VALUES (4, 4, 7, CAST(0x54410B00 AS Date), 2800, 50)
INSERT [dbo].[Orders] ([Order_id], [Customer_id], [Product_id], [Order_date], [Unitprice], [Quantity]) VALUES (5, 5, 2, CAST(0x07420B00 AS Date), 8000, 20)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Product_id], [Product_name], [Category_id]) VALUES (1, N'bred                                              ', 1)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Category_id]) VALUES (2, N'table                                             ', 1)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Category_id]) VALUES (3, N'barrel                                            ', 2)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Category_id]) VALUES (6, N'chips                                             ', 4)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Category_id]) VALUES (7, N'jeans                                             ', 5)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [Title]) VALUES (1, N'Administrator       ')
INSERT [dbo].[Role] ([ID], [Title]) VALUES (2, N'User                ')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Shipment] ON 

INSERT [dbo].[Shipment] ([Shipment_id], [Shipper_CompanyName], [Shipment_date], [Product_id]) VALUES (1, N'Ikea                                              ', CAST(0x2B420B00 AS Date), 1)
INSERT [dbo].[Shipment] ([Shipment_id], [Shipper_CompanyName], [Shipment_date], [Product_id]) VALUES (3, N'Diksi                                             ', CAST(0x05420B00 AS Date), 6)
INSERT [dbo].[Shipment] ([Shipment_id], [Shipper_CompanyName], [Shipment_date], [Product_id]) VALUES (4, N'H&M                                               ', CAST(0x7F410B00 AS Date), 7)
INSERT [dbo].[Shipment] ([Shipment_id], [Shipper_CompanyName], [Shipment_date], [Product_id]) VALUES (5, N'Dom Medeli                                        ', CAST(0x2B420B00 AS Date), 2)
INSERT [dbo].[Shipment] ([Shipment_id], [Shipper_CompanyName], [Shipment_date], [Product_id]) VALUES (6, N'AZS                                               ', CAST(0xB23F0B00 AS Date), 3)
SET IDENTITY_INSERT [dbo].[Shipment] OFF
SET IDENTITY_INSERT [dbo].[Shipper] ON 

INSERT [dbo].[Shipper] ([Shipper_id], [Shipment_id], [Company_Name], [Phone]) VALUES (1, 1, N'Ikea                                              ', N'89554331783')
INSERT [dbo].[Shipper] ([Shipper_id], [Shipment_id], [Company_Name], [Phone]) VALUES (3, 4, N'H&M                                               ', N'89344321773')
INSERT [dbo].[Shipper] ([Shipper_id], [Shipment_id], [Company_Name], [Phone]) VALUES (4, 3, N'Diksi                                             ', N'89754245786')
INSERT [dbo].[Shipper] ([Shipper_id], [Shipment_id], [Company_Name], [Phone]) VALUES (5, 5, N'Dom Medeli                                        ', N'88005553683')
INSERT [dbo].[Shipper] ([Shipper_id], [Shipment_id], [Company_Name], [Phone]) VALUES (6, 6, N'AZS                                               ', N'88554820583')
SET IDENTITY_INSERT [dbo].[Shipper] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [FIO], [Login], [Password], [RoleID], [Pictures]) VALUES (1, N'Дмитрий', N'Bakus', N'12345', 2, N'A0b279b0f9aa6fa25260374a3bcaa7d02ad8e749.jpg')
INSERT [dbo].[Users] ([ID], [FIO], [Login], [Password], [RoleID], [Pictures]) VALUES (2, N'Валерий', N'xXx_Killer_xXX', N'qwerty12345', 2, NULL)
INSERT [dbo].[Users] ([ID], [FIO], [Login], [Password], [RoleID], [Pictures]) VALUES (3, N'Administrator', N'Administrator', N'1', 1, NULL)
INSERT [dbo].[Users] ([ID], [FIO], [Login], [Password], [RoleID], [Pictures]) VALUES (10, N'Margret', N'Margaret', N'BruhCringe12', 2, NULL)
INSERT [dbo].[Users] ([ID], [FIO], [Login], [Password], [RoleID], [Pictures]) VALUES (12, N'fio', N'Login', N'pass12', 2, N'adoWGmrH5cM.jpg')
INSERT [dbo].[Users] ([ID], [FIO], [Login], [Password], [RoleID], [Pictures]) VALUES (13, N'azaz', N'NewLogin', N'somaly120402', 2, N'6_xhpYWKZGA.jpg')
INSERT [dbo].[Users] ([ID], [FIO], [Login], [Password], [RoleID], [Pictures]) VALUES (14, N'EnterFio', N'Enter', N'Enter12', 2, N'ct3nDgz2Bvw.jpg')
INSERT [dbo].[Users] ([ID], [FIO], [Login], [Password], [RoleID], [Pictures]) VALUES (15, N'testFIO', N'Test1', N'testpassword1', 2, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Users__5E55825BB948A11C]    Script Date: 24.10.2021 17:55:51 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Orders] FOREIGN KEY([Order_id])
REFERENCES [dbo].[Orders] ([Order_id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Product] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Product] ([Product_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([Category_id])
REFERENCES [dbo].[Category] ([Category_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Product] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Product] ([Product_id])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_Product]
GO
ALTER TABLE [dbo].[Shipper]  WITH CHECK ADD  CONSTRAINT [FK_Shipper_Shipment] FOREIGN KEY([Shipment_id])
REFERENCES [dbo].[Shipment] ([Shipment_id])
GO
ALTER TABLE [dbo].[Shipper] CHECK CONSTRAINT [FK_Shipper_Shipment]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
USE [master]
GO
ALTER DATABASE [SAVSAA_Material_storage] SET  READ_WRITE 
GO
