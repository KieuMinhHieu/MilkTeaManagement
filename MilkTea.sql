USE [master]
GO
/****** Object:  Database [MilkTeaManagement]    Script Date: 7/7/2022 10:06:36 PM ******/
CREATE DATABASE [MilkTeaManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MilkTeaManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MilkTeaManagement.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MilkTeaManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MilkTeaManagement_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MilkTeaManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MilkTeaManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MilkTeaManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MilkTeaManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MilkTeaManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MilkTeaManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MilkTeaManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MilkTeaManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MilkTeaManagement] SET  MULTI_USER 
GO
ALTER DATABASE [MilkTeaManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MilkTeaManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MilkTeaManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MilkTeaManagement] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MilkTeaManagement]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 7/7/2022 10:06:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 7/7/2022 10:06:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[orderID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 7/7/2022 10:06:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [int] IDENTITY(0,1) NOT NULL,
	[userID] [int] NOT NULL,
	[date] [date] NOT NULL,
	[total] [decimal](18, 3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 7/7/2022 10:06:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [decimal](18, 3) NOT NULL,
	[quantity] [int] NOT NULL,
	[categoryID] [int] NOT NULL,
	[productIMG] [nvarchar](max) NOT NULL,
	[detail] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 7/7/2022 10:06:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [varchar](2) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 7/7/2022 10:06:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [int] IDENTITY(0,1) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[gender] [varchar](10) NULL,
	[email] [nvarchar](50) NULL,
	[birthday] [date] NULL,
	[address] [nvarchar](50) NULL,
	[password] [varchar](25) NULL,
	[roleID] [varchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (1, N'LATTE SERIES')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (2, N'SPECIAL MILK FOAM')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (3, N'MILK TEA')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (4, N'BREWED TEA SERIES')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (5, N'CREATIVE MIX')
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (42, 15, 63, 4)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (43, 14, 58, 1)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (44, 3, 61, 10)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (45, 4, 69, 1)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (46, 2, 53, 1)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (47, 4, 69, 3)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (48, 4, 69, 1)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (49, 3, 61, 1)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (50, 3, 61, 1)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (51, 13, 45, 2)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (52, 3, 61, 1)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (52, 16, 52, 1)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (53, 4, 69, 2)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (54, 4, 69, 1)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (55, 3, 61, 1)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (56, 15, 63, 1)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (57, 14, 58, 1)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (58, 2, 53, 1)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (59, 15, 63, 1)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (59, 16, 52, 1)
SET IDENTITY_INSERT [dbo].[tblOrders] ON 

INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (42, 6, CAST(N'2022-07-04' AS Date), CAST(252.000 AS Decimal(18, 3)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (43, 6, CAST(N'2022-07-04' AS Date), CAST(58.000 AS Decimal(18, 3)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (44, 6, CAST(N'2022-07-04' AS Date), CAST(610.000 AS Decimal(18, 3)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (45, 6, CAST(N'2022-07-04' AS Date), CAST(69.000 AS Decimal(18, 3)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (46, 6, CAST(N'2022-07-04' AS Date), CAST(53.000 AS Decimal(18, 3)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (47, 6, CAST(N'2022-07-04' AS Date), CAST(207.000 AS Decimal(18, 3)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (48, 6, CAST(N'2022-07-04' AS Date), CAST(69.000 AS Decimal(18, 3)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (49, 6, CAST(N'2022-07-04' AS Date), CAST(61.000 AS Decimal(18, 3)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (50, 6, CAST(N'2022-07-04' AS Date), CAST(61.000 AS Decimal(18, 3)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (51, 6, CAST(N'2022-07-04' AS Date), CAST(90.000 AS Decimal(18, 3)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (52, 6, CAST(N'2022-07-04' AS Date), CAST(113.000 AS Decimal(18, 3)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (53, 6, CAST(N'2022-07-05' AS Date), CAST(138.000 AS Decimal(18, 3)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (54, 6, CAST(N'2022-07-05' AS Date), CAST(69.000 AS Decimal(18, 3)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (55, 6, CAST(N'2022-07-05' AS Date), CAST(61.000 AS Decimal(18, 3)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (56, 10, CAST(N'2022-07-06' AS Date), CAST(63.000 AS Decimal(18, 3)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (57, 10, CAST(N'2022-07-06' AS Date), CAST(58.000 AS Decimal(18, 3)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (58, 6, CAST(N'2022-07-07' AS Date), CAST(53.000 AS Decimal(18, 3)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (59, 6, CAST(N'2022-07-07' AS Date), CAST(115.000 AS Decimal(18, 3)))
SET IDENTITY_INSERT [dbo].[tblOrders] OFF
SET IDENTITY_INSERT [dbo].[tblProducts] ON 

INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [detail]) VALUES (2, N'Toffee Black Tea Latte', CAST(53.000 AS Decimal(18, 3)), 47, 1, N'https://gongcha.com.vn/wp-content/uploads/2022/03/LATTE-TOFFEE-1.png', N'This is your item description. Add as many info for your buyers about this digital product.')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [detail]) VALUES (3, N'Creme Brulee Matcha', CAST(61.000 AS Decimal(18, 3)), 34, 1, N'https://gongcha.com.vn/wp-content/uploads/2022/01/matcha-creme-brulee.png', N'This is your item description. Add as many info for your buyers about this digital product.')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [detail]) VALUES (4, N'Creme Brulee Latte', CAST(69.000 AS Decimal(18, 3)), 30, 1, N'https://gongcha.com.vn/wp-content/uploads/2022/01/creme-brulee-late.png', N'This is your item description. Add as many info for your buyers about this digital product.')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [detail]) VALUES (5, N'Winter Melon Tea', CAST(51.000 AS Decimal(18, 3)), 45, 2, N'https://gongcha.com.vn/wp-content/uploads/2018/02/Tr%C3%A0-B%C3%AD-%C4%90ao-Milkfoam-2.png', N'This is your item description. Add as many info for your buyers about this digital product.')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [detail]) VALUES (6, N'Milk Foam Oolong Tea', CAST(69.000 AS Decimal(18, 3)), 88, 2, N'https://gongcha.com.vn/wp-content/uploads/2018/02/Tr%C3%A0-Oolong-Milkfoam-3.png', N'This is your item description. Add as many info for your buyers about this digital product.')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [detail]) VALUES (7, N'Milk Foam Green Tea', CAST(59.000 AS Decimal(18, 3)), 99, 2, N'https://gongcha.com.vn/wp-content/uploads/2018/02/Tra%CC%80-xanh-GC.png', N'This is your item description. Add as many info for your buyers about this digital product.')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [detail]) VALUES (8, N'Okinawa Milk Tea', CAST(57.000 AS Decimal(18, 3)), 96, 3, N'https://gongcha.com.vn/wp-content/uploads/2018/10/Hinh-Web-OKINAWA-TR%C3%80-S%E1%BB%AEA.png', N'This is your item description. Add as many info for your buyers about this digital product.')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [detail]) VALUES (9, N'Milk Tea with Pudding & Red Bean', CAST(69.000 AS Decimal(18, 3)), 100, 3, N'https://gongcha.com.vn/wp-content/uploads/2018/02/Tr%C3%A0-s%E1%BB%AFa-Pudding-%C4%91%E1%BA%ADu-%C4%91%E1%BB%8F-2.png', N'This is your item description. Add as many info for your buyers about this digital product.')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [detail]) VALUES (10, N'Matcha Milk Tea with Red Bean', CAST(57.000 AS Decimal(18, 3)), 100, 3, N'https://gongcha.com.vn/wp-content/uploads/2018/02/Tr%C3%A0-s%E1%BB%AFa-Matcha-%C4%91%E1%BA%ADu-%C4%91%E1%BB%8F-2.png', N'This is your item description. Add as many info for your buyers about this digital product.')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [detail]) VALUES (11, N'Black Tea', CAST(37.000 AS Decimal(18, 3)), 100, 4, N'https://gongcha.com.vn/wp-content/uploads/2018/02/Tr%C3%A0-%C4%90en-2.png', N'This is your item description. Add as many info for your buyers about this digital product.')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [detail]) VALUES (12, N'Alisan Tea', CAST(40.000 AS Decimal(18, 3)), 100, 4, N'https://gongcha.com.vn/wp-content/uploads/2018/02/Tr%C3%A0-Alisan-2.png', N'This is your item description. Add as many info for your buyers about this digital product.')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [detail]) VALUES (13, N'Green Tea', CAST(45.000 AS Decimal(18, 3)), 98, 4, N'https://gongcha.com.vn/wp-content/uploads/2018/02/Tr%C3%A0-Xanh-2.png', N'This is your item description. Add as many info for your buyers about this digital product.')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [detail]) VALUES (14, N'Strawberry Choco Smoothie', CAST(58.000 AS Decimal(18, 3)), 97, 5, N'https://gongcha.com.vn/wp-content/uploads/2022/02/Strawberry-Chocolate-Smoothie.png', N'This is your item description. Add as many info for your buyers about this digital product.')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [detail]) VALUES (15, N'Okinawa Milk Foam Smoothie', CAST(63.000 AS Decimal(18, 3)), 93, 5, N'https://gongcha.com.vn/wp-content/uploads/2019/11/Okinawa-Oreo-Cream-Milk-Tea.png', N'This is your item description. Add as many info for your buyers about this digital product.')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [detail]) VALUES (16, N'Toffee Oolong Smoothie', CAST(52.000 AS Decimal(18, 3)), 96, 5, N'https://gongcha.com.vn/wp-content/uploads/2022/03/DA-XAY-TOFFEE-1.png', N'This is your item description. Add as many info for your buyers about this digital product.')
SET IDENTITY_INSERT [dbo].[tblProducts] OFF
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'AD', N'ADMIN')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'US', N'USER')
SET IDENTITY_INSERT [dbo].[tblUsers] ON 

INSERT [dbo].[tblUsers] ([userID], [userName], [gender], [email], [birthday], [address], [password], [roleID]) VALUES (5, N'admin', N'male', N'', CAST(N'1900-01-01' AS Date), N'', N'1', N'AD')
INSERT [dbo].[tblUsers] ([userID], [userName], [gender], [email], [birthday], [address], [password], [roleID]) VALUES (6, N'user', N'female', N'xekolist1@gmail.com', CAST(N'2002-01-23' AS Date), N'', N'0', N'US')
INSERT [dbo].[tblUsers] ([userID], [userName], [gender], [email], [birthday], [address], [password], [roleID]) VALUES (7, N'RONALDO', N'male', N'', CAST(N'2022-07-07' AS Date), N'', N'0', N'US')
INSERT [dbo].[tblUsers] ([userID], [userName], [gender], [email], [birthday], [address], [password], [roleID]) VALUES (8, N'IU', N'male', N'', CAST(N'1900-01-01' AS Date), N'', N'0', N'US')
INSERT [dbo].[tblUsers] ([userID], [userName], [gender], [email], [birthday], [address], [password], [roleID]) VALUES (10, N'hieu kieu', N'male', N'minhhieutb321@gmail.com', CAST(N'1900-01-01' AS Date), N'', N'', N'US')
INSERT [dbo].[tblUsers] ([userID], [userName], [gender], [email], [birthday], [address], [password], [roleID]) VALUES (11, N'JISOO', N'female', NULL, NULL, NULL, N'0', N'US')
INSERT [dbo].[tblUsers] ([userID], [userName], [gender], [email], [birthday], [address], [password], [roleID]) VALUES (12, N'nan', N'male', N'xekolist1@gmail.com', CAST(N'1900-01-01' AS Date), N'', N'0', N'US')
INSERT [dbo].[tblUsers] ([userID], [userName], [gender], [email], [birthday], [address], [password], [roleID]) VALUES (14, N'xeko', N'male', N'abc123@gmail.com', NULL, NULL, N'0', N'US')
INSERT [dbo].[tblUsers] ([userID], [userName], [gender], [email], [birthday], [address], [password], [roleID]) VALUES (15, N'xeko2', N'male', N'abc213@gmail.com', CAST(N'1900-01-01' AS Date), N'', N'0', N'US')
INSERT [dbo].[tblUsers] ([userID], [userName], [gender], [email], [birthday], [address], [password], [roleID]) VALUES (16, N'Kieu Minh Hieu (K16 HCM)', N'', N'hieukmse161998@fpt.edu.vn', NULL, NULL, N'', N'US')
SET IDENTITY_INSERT [dbo].[tblUsers] OFF
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
USE [master]
GO
ALTER DATABASE [MilkTeaManagement] SET  READ_WRITE 
GO
