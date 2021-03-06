USE [master]
GO
/****** Object:  Database [SE130566_EstateProject]    Script Date: 1/5/2020 3:47:01 PM ******/
CREATE DATABASE [SE130566_EstateProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SE130566_EstateProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SE130566_EstateProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SE130566_EstateProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SE130566_EstateProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SE130566_EstateProject] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SE130566_EstateProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SE130566_EstateProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SE130566_EstateProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SE130566_EstateProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SE130566_EstateProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SE130566_EstateProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [SE130566_EstateProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SE130566_EstateProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SE130566_EstateProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SE130566_EstateProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SE130566_EstateProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SE130566_EstateProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SE130566_EstateProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SE130566_EstateProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SE130566_EstateProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SE130566_EstateProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SE130566_EstateProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SE130566_EstateProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SE130566_EstateProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SE130566_EstateProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SE130566_EstateProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SE130566_EstateProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SE130566_EstateProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SE130566_EstateProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SE130566_EstateProject] SET  MULTI_USER 
GO
ALTER DATABASE [SE130566_EstateProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SE130566_EstateProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SE130566_EstateProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SE130566_EstateProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SE130566_EstateProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SE130566_EstateProject] SET QUERY_STORE = OFF
GO
USE [SE130566_EstateProject]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 1/5/2020 3:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[UserID] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[IsActived] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/5/2020 3:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 1/5/2020 3:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[Total] [float] NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceDetails]    Script Date: 1/5/2020 3:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[InvoiceDate] [date] NOT NULL,
 CONSTRAINT [PK_InvoiceDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Owner]    Script Date: 1/5/2020 3:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owner](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Owner] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Property]    Script Date: 1/5/2020 3:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property](
	[PropertyID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[SalePrice] [float] NOT NULL,
	[Square] [float] NULL,
	[Interior] [bit] NOT NULL,
	[Description] [nvarchar](50) NULL,
	[NumberOfRoom] [int] NULL,
	[NumberOfToilet] [int] NULL,
	[Sold] [bit] NULL,
	[Images] [nvarchar](100) NULL,
	[CategoryID] [int] NOT NULL,
	[ProvinceID] [int] NOT NULL,
	[OwnerID] [int] NOT NULL,
 CONSTRAINT [PK_Property] PRIMARY KEY CLUSTERED 
(
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Province]    Script Date: 1/5/2020 3:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 1/5/2020 3:47:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([UserID], [Password], [RoleID], [UserName], [Gender], [IsActived]) VALUES (N'admin', N'1', 1, N'Adminstrator', N'Male', 0)
INSERT [dbo].[Account] ([UserID], [Password], [RoleID], [UserName], [Gender], [IsActived]) VALUES (N'admin1', N'a', 2, N'admin 1', N'Male', 1)
INSERT [dbo].[Account] ([UserID], [Password], [RoleID], [UserName], [Gender], [IsActived]) VALUES (N'hoa', N'1', 2, N'HoaDNT', N'Male', 1)
INSERT [dbo].[Account] ([UserID], [Password], [RoleID], [UserName], [Gender], [IsActived]) VALUES (N'phuc', N'1', 2, N'Phuc Gay', N'Male', 0)
INSERT [dbo].[Account] ([UserID], [Password], [RoleID], [UserName], [Gender], [IsActived]) VALUES (N'thang', N'1', 2, N'Thang Hoang', N'Male', 0)
INSERT [dbo].[Account] ([UserID], [Password], [RoleID], [UserName], [Gender], [IsActived]) VALUES (N'uyen', N'1', 2, N'Uyen', N'FeMale', 0)
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Type]) VALUES (1, N'Villa')
INSERT [dbo].[Category] ([ID], [Type]) VALUES (2, N'Apartments')
INSERT [dbo].[Category] ([ID], [Type]) VALUES (3, N'Condos')
INSERT [dbo].[Category] ([ID], [Type]) VALUES (4, N'Houses')
INSERT [dbo].[Category] ([ID], [Type]) VALUES (5, N'Townhouses')
INSERT [dbo].[Category] ([ID], [Type]) VALUES (6, N'Project lands')
INSERT [dbo].[Category] ([ID], [Type]) VALUES (7, N'Other types')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([ID], [Date], [UserID], [Total]) VALUES (3, CAST(N'2019-12-18' AS Date), N'thang', 1)
INSERT [dbo].[Invoice] ([ID], [Date], [UserID], [Total]) VALUES (4, CAST(N'2019-12-18' AS Date), N'thang', 1)
INSERT [dbo].[Invoice] ([ID], [Date], [UserID], [Total]) VALUES (5, CAST(N'2019-12-18' AS Date), N'thang', 1)
INSERT [dbo].[Invoice] ([ID], [Date], [UserID], [Total]) VALUES (6, CAST(N'2019-12-18' AS Date), N'thang', 2)
INSERT [dbo].[Invoice] ([ID], [Date], [UserID], [Total]) VALUES (7, CAST(N'2019-12-18' AS Date), N'thang', 1)
SET IDENTITY_INSERT [dbo].[Invoice] OFF
SET IDENTITY_INSERT [dbo].[InvoiceDetails] ON 

INSERT [dbo].[InvoiceDetails] ([ID], [PropertyID], [Price], [InvoiceID], [InvoiceDate]) VALUES (4, 7, 1, 3, CAST(N'2019-12-18' AS Date))
INSERT [dbo].[InvoiceDetails] ([ID], [PropertyID], [Price], [InvoiceID], [InvoiceDate]) VALUES (5, 4, 1, 3, CAST(N'2019-12-18' AS Date))
INSERT [dbo].[InvoiceDetails] ([ID], [PropertyID], [Price], [InvoiceID], [InvoiceDate]) VALUES (6, 6, 1, 3, CAST(N'2019-12-18' AS Date))
INSERT [dbo].[InvoiceDetails] ([ID], [PropertyID], [Price], [InvoiceID], [InvoiceDate]) VALUES (7, 16, 1, 6, CAST(N'2019-12-18' AS Date))
INSERT [dbo].[InvoiceDetails] ([ID], [PropertyID], [Price], [InvoiceID], [InvoiceDate]) VALUES (8, 5, 1, 6, CAST(N'2019-12-18' AS Date))
INSERT [dbo].[InvoiceDetails] ([ID], [PropertyID], [Price], [InvoiceID], [InvoiceDate]) VALUES (9, 18, 1, 3, CAST(N'2019-12-18' AS Date))
SET IDENTITY_INSERT [dbo].[InvoiceDetails] OFF
SET IDENTITY_INSERT [dbo].[Owner] ON 

INSERT [dbo].[Owner] ([ID], [Name], [Phone], [Email]) VALUES (1, N'Vingroup', N'0123456789', N'Vingroup@gmail.com')
INSERT [dbo].[Owner] ([ID], [Name], [Phone], [Email]) VALUES (2, N'Jamila Khang Dien', NULL, NULL)
INSERT [dbo].[Owner] ([ID], [Name], [Phone], [Email]) VALUES (3, N'Messi', NULL, NULL)
INSERT [dbo].[Owner] ([ID], [Name], [Phone], [Email]) VALUES (4, N'Condotel', NULL, NULL)
INSERT [dbo].[Owner] ([ID], [Name], [Phone], [Email]) VALUES (5, N'Ronaldo', NULL, NULL)
INSERT [dbo].[Owner] ([ID], [Name], [Phone], [Email]) VALUES (6, N'City Land', NULL, NULL)
INSERT [dbo].[Owner] ([ID], [Name], [Phone], [Email]) VALUES (7, N'Huynh Thanh Tien', NULL, NULL)
INSERT [dbo].[Owner] ([ID], [Name], [Phone], [Email]) VALUES (8, N'Nguyen Quang Hai', NULL, NULL)
INSERT [dbo].[Owner] ([ID], [Name], [Phone], [Email]) VALUES (9, N'Van Thanh Phuong Dat', NULL, NULL)
INSERT [dbo].[Owner] ([ID], [Name], [Phone], [Email]) VALUES (10, N'Bich Phuong', NULL, NULL)
INSERT [dbo].[Owner] ([ID], [Name], [Phone], [Email]) VALUES (11, N'Nguyen Anh Duc', NULL, NULL)
INSERT [dbo].[Owner] ([ID], [Name], [Phone], [Email]) VALUES (12, N'Cuong Dola', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Owner] OFF
SET IDENTITY_INSERT [dbo].[Property] ON 

INSERT [dbo].[Property] ([PropertyID], [Address], [SalePrice], [Square], [Interior], [Description], [NumberOfRoom], [NumberOfToilet], [Sold], [Images], [CategoryID], [ProvinceID], [OwnerID]) VALUES (1, N'KrongBuk', 1, 250, 0, N'', 3, 2, 1, N'img/five-minute-plank-workout.jpg', 1, 1, 1)
INSERT [dbo].[Property] ([PropertyID], [Address], [SalePrice], [Square], [Interior], [Description], [NumberOfRoom], [NumberOfToilet], [Sold], [Images], [CategoryID], [ProvinceID], [OwnerID]) VALUES (2, N'Long Xuyen', 1, 120, 1, N'New House', 3, 2, 1, N'img/palazzate.jpg', 1, 1, 1)
INSERT [dbo].[Property] ([PropertyID], [Address], [SalePrice], [Square], [Interior], [Description], [NumberOfRoom], [NumberOfToilet], [Sold], [Images], [CategoryID], [ProvinceID], [OwnerID]) VALUES (3, N'Son Tra', 1, 120, 1, N'New Villa', 3, 2, 1, N'img/middle-gap-hk.jpg', 1, 1, 1)
INSERT [dbo].[Property] ([PropertyID], [Address], [SalePrice], [Square], [Interior], [Description], [NumberOfRoom], [NumberOfToilet], [Sold], [Images], [CategoryID], [ProvinceID], [OwnerID]) VALUES (4, N'Ngu Hanh Son', 1, 120, 1, N'New House', 3, 2, 1, N'img/mesa-vista-.jpg', 4, 20, 1)
INSERT [dbo].[Property] ([PropertyID], [Address], [SalePrice], [Square], [Interior], [Description], [NumberOfRoom], [NumberOfToilet], [Sold], [Images], [CategoryID], [ProvinceID], [OwnerID]) VALUES (5, N'Quan 8', 1, 120, 1, N'New Apartment', 3, 2, 1, N'img/gemini-palm-beach.jpg', 1, 2, 1)
INSERT [dbo].[Property] ([PropertyID], [Address], [SalePrice], [Square], [Interior], [Description], [NumberOfRoom], [NumberOfToilet], [Sold], [Images], [CategoryID], [ProvinceID], [OwnerID]) VALUES (6, N'Hai Chau', 1, 300, 1, N'New Condos', 5, 3, 1, N'img/the-one-bel-air.jpg', 3, 1, 4)
INSERT [dbo].[Property] ([PropertyID], [Address], [SalePrice], [Square], [Interior], [Description], [NumberOfRoom], [NumberOfToilet], [Sold], [Images], [CategoryID], [ProvinceID], [OwnerID]) VALUES (7, N'Buon Ho', 1, 140, 1, N'New House', 4, 3, 1, N'img/owlwood.jpg', 4, 16, 1)
INSERT [dbo].[Property] ([PropertyID], [Address], [SalePrice], [Square], [Interior], [Description], [NumberOfRoom], [NumberOfToilet], [Sold], [Images], [CategoryID], [ProvinceID], [OwnerID]) VALUES (16, N'FPT University', 1, 250, 1, N'New House', 5, 3, 1, N'img/villa-cedres.jpg', 1, 1, 2)
INSERT [dbo].[Property] ([PropertyID], [Address], [SalePrice], [Square], [Interior], [Description], [NumberOfRoom], [NumberOfToilet], [Sold], [Images], [CategoryID], [ProvinceID], [OwnerID]) VALUES (18, N'Quan 9', 1, 200, 1, N'New House', 5, 3, 1, N'img/the-billionaire.jpg', 1, 58, 3)
INSERT [dbo].[Property] ([PropertyID], [Address], [SalePrice], [Square], [Interior], [Description], [NumberOfRoom], [NumberOfToilet], [Sold], [Images], [CategoryID], [ProvinceID], [OwnerID]) VALUES (19, N'Buon Ma Thuot', 1, 400, 1, N'New House', 5, 3, 0, N'img/90-jule-pond-.jpg', 1, 16, 5)
INSERT [dbo].[Property] ([PropertyID], [Address], [SalePrice], [Square], [Interior], [Description], [NumberOfRoom], [NumberOfToilet], [Sold], [Images], [CategoryID], [ProvinceID], [OwnerID]) VALUES (20, N'Hong Bang', 1, 350, 0, N'New House', 5, 3, 0, N'img/chartwell.jpg', 4, 27, 6)
INSERT [dbo].[Property] ([PropertyID], [Address], [SalePrice], [Square], [Interior], [Description], [NumberOfRoom], [NumberOfToilet], [Sold], [Images], [CategoryID], [ProvinceID], [OwnerID]) VALUES (21, N'Tran Hung Dao', 1, 450, 0, N'New Villa', 4, 2, 0, N'img/villa-firenze.jpg', 1, 33, 7)
INSERT [dbo].[Property] ([PropertyID], [Address], [SalePrice], [Square], [Interior], [Description], [NumberOfRoom], [NumberOfToilet], [Sold], [Images], [CategoryID], [ProvinceID], [OwnerID]) VALUES (22, N'Hoan Kiem', 1, 350, 0, N'New TownHouse', 4, 2, 0, N'img/villa-lechauguette-2.jpg', 5, 24, 8)
INSERT [dbo].[Property] ([PropertyID], [Address], [SalePrice], [Square], [Interior], [Description], [NumberOfRoom], [NumberOfToilet], [Sold], [Images], [CategoryID], [ProvinceID], [OwnerID]) VALUES (24, N'Trang Bang', 1, 350, 0, N'New Villa', 5, 2, 0, N'img/72508062.jpg', 1, 52, 9)
INSERT [dbo].[Property] ([PropertyID], [Address], [SalePrice], [Square], [Interior], [Description], [NumberOfRoom], [NumberOfToilet], [Sold], [Images], [CategoryID], [ProvinceID], [OwnerID]) VALUES (26, N'Loc Tho', 1, 350, 0, N'New House', 4, 2, 0, N'img/170-naamloos.jpg', 1, 31, 10)
INSERT [dbo].[Property] ([PropertyID], [Address], [SalePrice], [Square], [Interior], [Description], [NumberOfRoom], [NumberOfToilet], [Sold], [Images], [CategoryID], [ProvinceID], [OwnerID]) VALUES (27, N'Thu Dau Mot', 1, 350, 0, N'New TownHouse', 4, 3, 0, N'img/epic3-2.jpg', 5, 9, 11)
SET IDENTITY_INSERT [dbo].[Property] OFF
INSERT [dbo].[Province] ([ID], [Name]) VALUES (1, N'An Giang  ')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (2, N'Vung Tau')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (3, N'Bac Giang')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (4, N'Bac Kan')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (5, N'Bac Lieu')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (6, N'Bac Ninh')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (7, N'Ben Tre')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (8, N'Binh Dinh')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (9, N'Binh Duong')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (10, N'Binh Phuoc')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (11, N'Binh Thuan')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (12, N'Ca Mau')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (13, N'Can Tho')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (14, N'Cao Bang')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (15, N'Da Nang')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (16, N'Dak Lak')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (17, N'Dak Nong')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (18, N'Dien Bien')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (19, N'Dong Nai')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (20, N'Dong Thap')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (21, N'Gia Lai   ')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (22, N'Ha Giang')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (23, N'Ha Nam')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (24, N'Ha Noi')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (25, N'Ha Tinh')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (26, N'Hai Duong')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (27, N'Hai Phong')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (28, N'Hau Giang')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (29, N'Hoa Binh')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (30, N'Hung Yen')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (31, N'Khanh Hoa')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (32, N'Kien Giang')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (33, N'Kon Tum')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (34, N'Lai Chau')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (35, N'Lam Dong')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (36, N'Lang Son')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (37, N'Lao Cai')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (38, N'Long An   ')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (39, N'Nam Dinh')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (40, N'Nghe An')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (41, N'Ninh Binh')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (42, N'Ninh Thuan')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (43, N'Phu Tho')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (44, N'Phu Yen')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (45, N'Quang Binh')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (46, N'Quang Nam')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (47, N'Quang Ngai')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (48, N'Quang Ninh')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (49, N'Quang Tri')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (50, N'Soc Trang')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (51, N'Son La')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (52, N'Tay Ninh')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (53, N'Thai Binh')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (54, N'Thai Nguyen')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (55, N'Thanh Hoa')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (56, N'Thua Thien Hue')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (57, N'Tien Giang')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (58, N'TP HCM')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (59, N'Tra Vinh')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (60, N'Tuyen Quang')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (61, N'Vinh Long')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (62, N'Vinh Phuc')
INSERT [dbo].[Province] ([ID], [Name]) VALUES (63, N'Yen Bai')
INSERT [dbo].[Role] ([ID], [Description]) VALUES (1, N'AD')
INSERT [dbo].[Role] ([ID], [Description]) VALUES (2, N'Customer')
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Account] FOREIGN KEY([UserID])
REFERENCES [dbo].[Account] ([UserID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Account]
GO
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetails_Invoice] FOREIGN KEY([InvoiceID], [InvoiceDate])
REFERENCES [dbo].[Invoice] ([ID], [Date])
GO
ALTER TABLE [dbo].[InvoiceDetails] CHECK CONSTRAINT [FK_InvoiceDetails_Invoice]
GO
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetails_Property] FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Property] ([PropertyID])
GO
ALTER TABLE [dbo].[InvoiceDetails] CHECK CONSTRAINT [FK_InvoiceDetails_Property]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_Property_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_Property_Category]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_Property_Owner] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[Owner] ([ID])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_Property_Owner]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_Property_Province] FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ID])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_Property_Province]
GO
USE [master]
GO
ALTER DATABASE [SE130566_EstateProject] SET  READ_WRITE 
GO
