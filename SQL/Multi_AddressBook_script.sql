USE [master]
GO
/****** Object:  Database [Multi_AddressBook]    Script Date: 20-03-2023 03:37:45 PM ******/
CREATE DATABASE [Multi_AddressBook]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Multi_AddressBook', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Multi_AddressBook.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Multi_AddressBook_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Multi_AddressBook_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Multi_AddressBook] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Multi_AddressBook].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Multi_AddressBook] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Multi_AddressBook] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Multi_AddressBook] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Multi_AddressBook] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Multi_AddressBook] SET ARITHABORT OFF 
GO
ALTER DATABASE [Multi_AddressBook] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Multi_AddressBook] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Multi_AddressBook] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Multi_AddressBook] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Multi_AddressBook] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Multi_AddressBook] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Multi_AddressBook] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Multi_AddressBook] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Multi_AddressBook] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Multi_AddressBook] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Multi_AddressBook] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Multi_AddressBook] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Multi_AddressBook] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Multi_AddressBook] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Multi_AddressBook] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Multi_AddressBook] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Multi_AddressBook] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Multi_AddressBook] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Multi_AddressBook] SET  MULTI_USER 
GO
ALTER DATABASE [Multi_AddressBook] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Multi_AddressBook] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Multi_AddressBook] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Multi_AddressBook] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Multi_AddressBook] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Multi_AddressBook] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Multi_AddressBook] SET QUERY_STORE = OFF
GO
USE [Multi_AddressBook]
GO
/****** Object:  Table [dbo].[ContactCategory]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactCategory](
	[ContactCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ContactCategoryName] [nvarchar](20) NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ContactCategory] PRIMARY KEY CLUSTERED 
(
	[ContactCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOC_City]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOC_City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[CityName] [nvarchar](50) NOT NULL,
	[CityCode] [nvarchar](10) NULL,
	[StateID] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_LOC_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOC_Country]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOC_Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[CountryName] [nvarchar](50) NOT NULL,
	[CountryCode] [nvarchar](5) NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_LOC_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOC_State]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOC_State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[StateName] [nvarchar](50) NOT NULL,
	[StateCode] [nvarchar](10) NULL,
	[CountryID] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_LOC_State] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MAS_Contact]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAS_Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ContactName] [nvarchar](50) NOT NULL,
	[ContactCategoryID] [int] NOT NULL,
	[ContactAddress] [nvarchar](500) NOT NULL,
	[CountryID] [int] NOT NULL,
	[StateID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[ContactPincode] [int] NOT NULL,
	[ContactMobile] [nvarchar](15) NOT NULL,
	[ContactEmail] [nvarchar](50) NOT NULL,
	[ContactDOB] [nvarchar](20) NOT NULL,
	[ContactLinkedIN] [nvarchar](100) NULL,
	[ContactGender] [nvarchar](10) NOT NULL,
	[ContactTypeOfProfession] [nvarchar](50) NULL,
	[ContactCompanyName] [nvarchar](50) NULL,
	[ContactDesignation] [nvarchar](50) NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
	[PhotoPath] [nvarchar](500) NULL,
 CONSTRAINT [PK_MAS_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](8) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ContactCategory] ON 

INSERT [dbo].[ContactCategory] ([ContactCategoryID], [UserID], [ContactCategoryName], [CreationDate], [ModificationDate]) VALUES (1, 1, N'Family', CAST(N'2023-02-12T13:22:52.303' AS DateTime), CAST(N'2023-02-12T13:22:52.303' AS DateTime))
INSERT [dbo].[ContactCategory] ([ContactCategoryID], [UserID], [ContactCategoryName], [CreationDate], [ModificationDate]) VALUES (2, 1, N'Friend', CAST(N'2023-02-12T13:22:52.303' AS DateTime), CAST(N'2023-02-12T13:22:52.303' AS DateTime))
INSERT [dbo].[ContactCategory] ([ContactCategoryID], [UserID], [ContactCategoryName], [CreationDate], [ModificationDate]) VALUES (3, 1, N'College', CAST(N'2023-02-12T13:22:52.303' AS DateTime), CAST(N'2023-02-12T13:22:52.303' AS DateTime))
INSERT [dbo].[ContactCategory] ([ContactCategoryID], [UserID], [ContactCategoryName], [CreationDate], [ModificationDate]) VALUES (4, 1, N'Colleague', CAST(N'2023-02-12T13:22:52.303' AS DateTime), CAST(N'2023-03-20T15:35:49.867' AS DateTime))
INSERT [dbo].[ContactCategory] ([ContactCategoryID], [UserID], [ContactCategoryName], [CreationDate], [ModificationDate]) VALUES (5, 1, N'SchoolFriends', CAST(N'2023-02-12T13:22:52.303' AS DateTime), CAST(N'2023-02-12T13:22:52.303' AS DateTime))
SET IDENTITY_INSERT [dbo].[ContactCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[LOC_City] ON 

INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (1, 1, N'Alipur', N'101', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-03-20T10:08:37.900' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (2, 1, N'Andaman Island', N'102', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (3, 1, N'Anderson Island', N'103', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (4, 1, N'Arainj-Laka-Punga', N'104', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (5, 1, N'Austinabad', N'105', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (6, 1, N'Bamboo Flat', N'106', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (7, 1, N'Barren Island', N'107', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (8, 1, N'Beadonabad', N'108', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (9, 1, N'Betapur', N'109', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (10, 1, N'Bindraban', N'110', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (11, 1, N'Bonington', N'111', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (12, 1, N'Brookesabad', N'112', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (13, 1, N'Cadell Point', N'113', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (14, 1, N'Calicut', N'114', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (15, 1, N'Chetamale', N'115', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (16, 1, N'Cinque Islands', N'116', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (17, 1, N'Defence Island', N'117', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (18, 1, N'Digilpur', N'118', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (19, 1, N'Dolyganj', N'119', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (20, 1, N'Flat Island', N'120', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (21, 1, N'Geinyale', N'121', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (22, 1, N'Great Coco Island', N'122', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (23, 1, N'Haddo', N'123', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (24, 1, N'Havelock Island', N'124', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (25, 1, N'Henry Lawrence Island', N'125', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (26, 1, N'Herbertabad', N'126', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (27, 1, N'Hobdaypur', N'127', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (28, 1, N'Ilichar', N'128', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (29, 1, N'Ingoie', N'128', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (30, 1, N'Inteview Island', N'130', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (31, 1, N'Jangli Ghat', N'131', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (32, 1, N'Jhon Lawrence Island', N'132', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (33, 1, N'Karen', N'133', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (34, 1, N'Kartara', N'134', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (35, 1, N'KYD Islannd', N'135', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (36, 1, N'Landfall Island', N'136', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (37, 1, N'Little Andmand', N'137', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (38, 1, N'Little Coco Island', N'138', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (39, 1, N'Long Island', N'138', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (40, 1, N'Maimyo', N'140', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (41, 1, N'Malappuram', N'141', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (42, 1, N'Manglutan', N'142', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (43, 1, N'Manpur', N'143', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (44, 1, N'Mitha Khari', N'144', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (45, 1, N'Neill Island', N'145', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (46, 1, N'Nicobar Island', N'146', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (47, 1, N'North Brother Island', N'147', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (48, 1, N'North Passage Island', N'148', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (49, 1, N'North Sentinel Island', N'149', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (50, 1, N'Nothen Reef Island', N'150', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (51, 1, N'Outram Island', N'151', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (52, 1, N'Pahlagaon', N'152', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (53, 1, N'Palalankwe', N'153', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (54, 1, N'Passage Island', N'154', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (55, 1, N'Phaiapong', N'155', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (56, 1, N'Phoenix Island', N'156', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (57, 1, N'Port Blair', N'157', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (58, 1, N'Preparis Island', N'158', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (59, 1, N'Protheroepur', N'159', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (60, 1, N'Rangachang', N'160', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (61, 1, N'Rongat', N'161', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (62, 1, N'Rutland Island', N'162', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (63, 1, N'Sabari', N'163', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (64, 1, N'Saddle Peak', N'164', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (65, 1, N'Shadipur', N'165', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (66, 1, N'Smith Island', N'166', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (67, 1, N'Sound Island', N'167', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (68, 1, N'South Sentinel Island', N'168', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (69, 1, N'Spike Island', N'169', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (70, 1, N'Tarmugli Island', N'170', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (71, 1, N'Taylerabad', N'171', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (72, 1, N'Titaije', N'172', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (73, 1, N'Toibalawe', N'173', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (74, 1, N'Tusonabad', N'174', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (75, 1, N'West Island', N'175', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (76, 1, N'Wimberleyganj', N'176', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (77, 1, N'Yadita', N'177', 1, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (78, 1, N'Adilabad', N'201', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (79, 1, N'Anantapur', N'201', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (80, 1, N'Chittoor', N'203', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (81, 1, N'Cuddapah', N'204', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (82, 1, N'East Godavari', N'205', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (83, 1, N'Guntur', N'206', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (84, 1, N'Hyderabad', N'207', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (85, 1, N'Karimnagar', N'208', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (86, 1, N'Khammam', N'209', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (87, 1, N'Krishna', N'210', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (88, 1, N'Kurnool', N'211', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (89, 1, N'Mahabubnagar', N'212', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (90, 1, N'Medak', N'213', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (91, 1, N'Nalgonda', N'214', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (92, 1, N'Nellore', N'215', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (93, 1, N'Nizamabad', N'216', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (94, 1, N'Prakasam', N'217', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (95, 1, N'Rangareddy', N'218', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (96, 1, N'Srikakulam', N'219', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (97, 1, N'Visakhapatnam', N'220', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (98, 1, N'Vizianagaram', N'221', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (99, 1, N'Warangal', N'222', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
GO
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (100, 1, N'West Godavari', N'223', 2, 99, CAST(N'2023-02-11T23:32:10.170' AS DateTime), CAST(N'2023-02-11T23:32:10.170' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (101, 1, N'Anjaw', N'301', 3, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (102, 1, N'Changlang', N'302', 3, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (103, 1, N'Dibang Valley', N'303', 3, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (104, 1, N'East Kameng', N'304', 3, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (105, 1, N'East Siang', N'305', 3, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (106, 1, N'Itanagar', N'306', 3, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (107, 1, N'Kurung Kumey', N'307', 3, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (108, 1, N'Lohit', N'308', 3, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (109, 1, N'Lower Dibang Valley', N'309', 3, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (110, 1, N'Lower Subansiri', N'310', 3, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (111, 1, N'Papum Pare', N'311', 3, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (112, 1, N'Tawang', N'312', 3, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (113, 1, N'Tirap', N'313', 3, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (114, 1, N'Upper Siang', N'314', 3, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (115, 1, N'Upper Subansiri', N'315', 3, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (116, 1, N'West Kameng', N'316', 3, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (117, 1, N'West Siang', N'317', 3, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (118, 1, N'Barpeta', N'401', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (119, 1, N'Bongaigaon', N'402', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (120, 1, N'Cachar', N'403', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (121, 1, N'Darrang', N'404', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (122, 1, N'Dhemaji', N'405', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (123, 1, N'Dhubri', N'406', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (124, 1, N'Dibrugarh', N'407', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (125, 1, N'Goalpara', N'408', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (126, 1, N'Golaghat', N'409', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (127, 1, N'Guwahati', N'410', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (128, 1, N'Hailakandi', N'411', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (129, 1, N'Jorhat', N'412', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (130, 1, N'Kamrup', N'413', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (131, 1, N'Karbi Anglong', N'414', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (132, 1, N'Karimganj', N'415', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (133, 1, N'Kokrajhar', N'416', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (134, 1, N'Lakhimpur', N'417', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (135, 1, N'Marigaon', N'418', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (136, 1, N'Nagaon', N'419', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (137, 1, N'Nalbari', N'420', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (138, 1, N'North Cachar Hills', N'421', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (139, 1, N'Silchar', N'422', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (140, 1, N'Sivasagar', N'423', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (141, 1, N'Sonitpur', N'424', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (142, 1, N'Tinsukia', N'425', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (143, 1, N'Udalguri', N'426', 4, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (144, 1, N'Araria', N'501', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (145, 1, N'Aurangabad', N'502', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (146, 1, N'Banka', N'503', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (147, 1, N'Begusarai', N'504', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (148, 1, N'Bhagalpur', N'505', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (149, 1, N'Bhojpur', N'506', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (150, 1, N'Buxar', N'507', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (151, 1, N'Darbhanga', N'508', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (152, 1, N'East Champaran', N'509', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (153, 1, N'Gaya', N'510', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (154, 1, N'Gopalganj', N'511', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (155, 1, N'Jamshedpur', N'512', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (156, 1, N'Jamui', N'513', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (157, 1, N'Jehanabad', N'514', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (158, 1, N'Kaimur (Bhabua)', N'515', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (159, 1, N'Katihar', N'516', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (160, 1, N'Khagaria', N'517', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (161, 1, N'Kishanganj', N'518', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (162, 1, N'Lakhisarai', N'519', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (163, 1, N'Madhepura', N'520', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (164, 1, N'Madhubani', N'521', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (165, 1, N'Munger', N'522', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (166, 1, N'Muzaffarpur', N'523', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (167, 1, N'Nalanda', N'524', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (168, 1, N'Nawada', N'525', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (169, 1, N'Patna', N'526', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (170, 1, N'Purnia', N'527', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (171, 1, N'Rohtas', N'528', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (172, 1, N'Saharsa', N'529', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (173, 1, N'Samastipur', N'530', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (174, 1, N'Saran', N'531', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (175, 1, N'Sheikhpura', N'532', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (176, 1, N'Sheohar', N'533', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (177, 1, N'Sitamarhi', N'534', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (178, 1, N'Siwan', N'535', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (179, 1, N'Supaul', N'536', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (180, 1, N'Vaishali', N'537', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (181, 1, N'West Champaran', N'538', 5, 99, CAST(N'2023-02-11T23:32:10.173' AS DateTime), CAST(N'2023-02-11T23:32:10.173' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (182, 1, N'Bastar', N'601', 6, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (183, 1, N'Bhilai', N'602', 6, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (184, 1, N'Bijapur', N'603', 6, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (185, 1, N'Bilaspur', N'604', 6, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (186, 1, N'Dhamtari', N'605', 6, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (187, 1, N'Durg', N'606', 6, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (188, 1, N'Janjgir-Champa', N'607', 6, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (189, 1, N'Jashpur', N'608', 6, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (190, 1, N'Kabirdham-Kawardha', N'609', 6, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (191, 1, N'Korba', N'610', 6, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (192, 1, N'Korea', N'611', 6, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (193, 1, N'Mahasamund', N'612', 6, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (194, 1, N'Narayanpur', N'613', 6, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (195, 1, N'Norh Bastar-Kanker', N'614', 6, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (196, 1, N'Raigarh', N'615', 6, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (197, 1, N'Raipur', N'616', 6, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (198, 1, N'Rajnandgaon', N'617', 6, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (199, 1, N'South Bastar-Dantewada', N'618', 6, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
GO
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (200, 1, N'Surguja', N'619', 6, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (201, 1, N'Chandigarh', N'701', 7, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (202, 1, N'Mani Marja', N'702', 7, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (203, 1, N'Amal', N'801', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (204, 1, N'Amli', N'802', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (205, 1, N'Bedpa', N'803', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (206, 1, N'Chikhli', N'804', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (207, 1, N'Dadra & Nagar Haveli', N'805', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (208, 1, N'Dahikhed', N'806', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (209, 1, N'Dolara', N'807', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (210, 1, N'Galonda', N'808', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (211, 1, N'Kanadi', N'809', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (212, 1, N'Karchond', N'810', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (213, 1, N'Khadoli', N'811', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (214, 1, N'Kharadpada', N'812', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (215, 1, N'Kherabari', N'813', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (216, 1, N'Kherdi', N'814', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (217, 1, N'Kothar', N'815', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (218, 1, N'Luari', N'816', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (219, 1, N'Mashat', N'817', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (220, 1, N'Rakholi', N'818', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (221, 1, N'Rudana', N'819', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (222, 1, N'Saili', N'820', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (223, 1, N'Sili', N'821', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (224, 1, N'Silvassa', N'822', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (225, 1, N'Sindavni', N'823', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (226, 1, N'Udva', N'824', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (227, 1, N'Umbarkoi', N'825', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (228, 1, N'Vansda', N'826', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (229, 1, N'Vasona', N'827', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (230, 1, N'Velugam', N'828', 8, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (231, 1, N'Brancavare', N'901', 9, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (232, 1, N'Dagasi', N'902', 9, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (233, 1, N'Daman', N'903', 9, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (234, 1, N'Diu', N'904', 9, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (235, 1, N'Magarvara', N'905', 9, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (236, 1, N'Nagwa', N'906', 9, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (237, 1, N'Pariali', N'907', 9, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (238, 1, N'Passo Covo', N'908', 9, 99, CAST(N'2023-02-11T23:32:10.177' AS DateTime), CAST(N'2023-02-11T23:32:10.177' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (239, 1, N'Central Delhi', N'1001', 10, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (240, 1, N'East Delhi', N'1002', 10, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (241, 1, N'New Delhi', N'1003', 10, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (242, 1, N'North Delhi', N'1004', 10, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (243, 1, N'North East Delhi', N'1005', 10, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (244, 1, N'North West Delhi', N'1006', 10, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (245, 1, N'Old Delhi', N'1007', 10, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (246, 1, N'South Delhi', N'1008', 10, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (247, 1, N'South West Delhi', N'1009', 10, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (248, 1, N'West Delhi', N'1010', 10, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (249, 1, N'Canacona', N'1101', 11, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (250, 1, N'Candolim', N'1102', 11, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (251, 1, N'Chinchinim', N'1103', 11, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (252, 1, N'Cortalim', N'1104', 11, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (253, 1, N'Goa', N'1105', 11, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (254, 1, N'Jua', N'1106', 11, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (255, 1, N'Madgaon', N'1107', 11, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (256, 1, N'Mahem', N'1108', 11, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (257, 1, N'Mapuca', N'1109', 11, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (258, 1, N'Marmagao', N'1110', 11, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (259, 1, N'Panji', N'1111', 11, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (260, 1, N'Ponda', N'1112', 11, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (261, 1, N'Sanvordem', N'1113', 11, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (262, 1, N'Terekhol', N'1114', 11, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (263, 1, N'Ahmedabad', N'1201', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (264, 1, N'Amreli', N'1202', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (265, 1, N'Anand', N'1203', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (266, 1, N'Banaskantha', N'1204', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (267, 1, N'Baroda', N'1205', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (268, 1, N'Bharuch', N'1206', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (269, 1, N'Bhavnagar', N'1207', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (270, 1, N'Dahod', N'1208', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (271, 1, N'Dang', N'1209', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (272, 1, N'Dwarka', N'1210', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (273, 1, N'Gandhinagar', N'1211', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (274, 1, N'Jamnagar', N'1212', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (275, 1, N'Junagadh', N'1213', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (276, 1, N'Kheda', N'1214', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (277, 1, N'Kutch', N'1215', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (278, 1, N'Mehsana', N'1216', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (279, 1, N'Nadiad', N'1217', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (280, 1, N'Narmada', N'1218', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (281, 1, N'Navsari', N'1219', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (282, 1, N'Panchmahals', N'1220', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (283, 1, N'Patan', N'1221', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (284, 1, N'Porbandar', N'1222', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (285, 1, N'Rajkot', N'1223', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (286, 1, N'Sabarkantha', N'1224', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (287, 1, N'Surat', N'1225', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (288, 1, N'Surendranagar', N'1226', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (289, 1, N'Vadodara', N'1227', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (290, 1, N'Valsad', N'1228', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (291, 1, N'Vapi', N'1229', 12, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (292, 1, N'Ambala', N'1301', 13, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (293, 1, N'Bhiwani', N'1302', 13, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (294, 1, N'Faridabad', N'1303', 13, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (295, 1, N'Fatehabad', N'1304', 13, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (296, 1, N'Gurgaon', N'1305', 13, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (297, 1, N'Hisar', N'1306', 13, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (298, 1, N'Jhajjar', N'1307', 13, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (299, 1, N'Jind', N'1308', 13, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
GO
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (300, 1, N'Kaithal', N'1309', 13, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (301, 1, N'Karnal', N'1310', 13, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (302, 1, N'Kurukshetra', N'1311', 13, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (303, 1, N'Mahendragarh', N'1312', 13, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (304, 1, N'Mewat', N'1313', 13, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (305, 1, N'Panchkula', N'1314', 13, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (306, 1, N'Panipat', N'1315', 13, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (307, 1, N'Rewari', N'1316', 13, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (308, 1, N'Rohtak', N'1317', 13, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (309, 1, N'Sirsa', N'1318', 13, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (310, 1, N'Sonipat', N'1319', 13, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (311, 1, N'Yamunanagar', N'1320', 13, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (312, 1, N'Bilaspur', N'1401', 14, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (313, 1, N'Chamba', N'1402', 14, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (314, 1, N'Dalhousie', N'1403', 14, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (315, 1, N'Hamirpur', N'1404', 14, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (316, 1, N'Kangra', N'1405', 14, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (317, 1, N'Kinnaur', N'1406', 14, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (318, 1, N'Kullu', N'1407', 14, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (319, 1, N'Lahaul & Spiti', N'1408', 14, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (320, 1, N'Mandi', N'1409', 14, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (321, 1, N'Shimla', N'1410', 14, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (322, 1, N'Sirmaur', N'1411', 14, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (323, 1, N'Solan', N'1412', 14, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (324, 1, N'Una', N'1413', 14, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (325, 1, N'Anantnag', N'1501', 15, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (326, 1, N'Baramulla', N'1502', 15, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (327, 1, N'Budgam', N'1503', 15, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (328, 1, N'Doda', N'1504', 15, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (329, 1, N'Jammu', N'1505', 15, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (330, 1, N'Kargil', N'1506', 15, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (331, 1, N'Kathua', N'1507', 15, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (332, 1, N'Kupwara', N'1508', 15, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (333, 1, N'Leh', N'1509', 15, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (334, 1, N'Poonch', N'1510', 15, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (335, 1, N'Pulwama', N'1511', 15, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (336, 1, N'Rajauri', N'1512', 15, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (337, 1, N'Srinagar', N'1513', 15, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (338, 1, N'Udhampur', N'1514', 15, 99, CAST(N'2023-02-11T23:32:10.180' AS DateTime), CAST(N'2023-02-11T23:32:10.180' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (339, 1, N'Bokaro', N'1601', 16, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (340, 1, N'Chatra', N'1602', 16, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (341, 1, N'Deoghar', N'1603', 16, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (342, 1, N'Dhanbad', N'1604', 16, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (343, 1, N'Dumka', N'1605', 16, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (344, 1, N'East Singhbhum', N'1606', 16, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (345, 1, N'Garhwa', N'1607', 16, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (346, 1, N'Giridih', N'1608', 16, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (347, 1, N'Godda', N'1609', 16, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (348, 1, N'Gumla', N'1610', 16, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (349, 1, N'Hazaribag', N'1611', 16, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (350, 1, N'Jamtara', N'1612', 16, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (351, 1, N'Koderma', N'1613', 16, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (352, 1, N'Latehar', N'1614', 16, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (353, 1, N'Lohardaga', N'1615', 16, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (354, 1, N'Pakur', N'1616', 16, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (355, 1, N'Palamu', N'1617', 16, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (356, 1, N'Ranchi', N'1618', 16, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (357, 1, N'Sahibganj', N'1619', 16, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (358, 1, N'Seraikela', N'1620', 16, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (359, 1, N'Simdega', N'1621', 16, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (360, 1, N'West Singhbhum', N'1622', 16, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (361, 1, N'Bagalkot', N'1701', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (362, 1, N'Bangalore', N'1702', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (363, 1, N'Bangalore Rural', N'1703', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (364, 1, N'Belgaum', N'1704', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (365, 1, N'Bellary', N'1705', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (366, 1, N'Bhatkal', N'1706', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (367, 1, N'Bidar', N'1707', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (368, 1, N'Bijapur', N'1708', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (369, 1, N'Chamrajnagar', N'1709', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (370, 1, N'Chickmagalur', N'1710', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (371, 1, N'Chikballapur', N'1711', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (372, 1, N'Chitradurga', N'1712', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (373, 1, N'Dakshina Kannada', N'1713', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (374, 1, N'Davanagere', N'1714', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (375, 1, N'Dharwad', N'1715', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (376, 1, N'Gadag', N'1716', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (377, 1, N'Gulbarga', N'1717', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (378, 1, N'Hampi', N'1718', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (379, 1, N'Hassan', N'1719', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (380, 1, N'Haveri', N'1720', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (381, 1, N'Hospet', N'1721', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (382, 1, N'Karwar', N'1722', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (383, 1, N'Kodagu', N'1723', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (384, 1, N'Kolar', N'1724', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (385, 1, N'Koppal', N'1725', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (386, 1, N'Madikeri', N'1726', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (387, 1, N'Mandya', N'1727', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (388, 1, N'Mangalore', N'1728', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (389, 1, N'Manipal', N'1729', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (390, 1, N'Mysore', N'1730', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (391, 1, N'Raichur', N'1731', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (392, 1, N'Shimoga', N'1732', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (393, 1, N'Sirsi', N'1733', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (394, 1, N'Sringeri', N'1734', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (395, 1, N'Srirangapatna', N'1735', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (396, 1, N'Tumkur', N'1736', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (397, 1, N'Udupi', N'1737', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (398, 1, N'Uttara Kannada', N'1738', 17, 99, CAST(N'2023-02-11T23:32:10.183' AS DateTime), CAST(N'2023-02-11T23:32:10.183' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (399, 1, N'Alappuzha', N'1801', 18, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
GO
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (400, 1, N'Alleppey', N'1802', 18, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (401, 1, N'Alwaye', N'1803', 18, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (402, 1, N'Ernakulam', N'1804', 18, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (403, 1, N'Idukki', N'1805', 18, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (404, 1, N'Kannur', N'1806', 18, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (405, 1, N'Kasargod', N'1807', 18, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (406, 1, N'Kochi', N'1808', 18, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (407, 1, N'Kollam', N'1809', 18, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (408, 1, N'Kottayam', N'1810', 18, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (409, 1, N'Kovalam', N'1811', 18, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (410, 1, N'Kozhikode', N'1812', 18, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (411, 1, N'Malappuram', N'1813', 18, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (412, 1, N'Palakkad', N'1814', 18, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (413, 1, N'Pathanamthitta', N'1815', 18, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (414, 1, N'Perumbavoor', N'1816', 18, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (415, 1, N'Thiruvananthapuram', N'1817', 18, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (416, 1, N'Thrissur', N'1818', 18, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (417, 1, N'Trichur', N'1819', 18, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (418, 1, N'Trivandrum', N'1820', 18, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (419, 1, N'Wayanad', N'1821', 18, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (420, 1, N'Agatti Island', N'1901', 19, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (421, 1, N'Bingaram Island', N'1902', 19, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (422, 1, N'Bitra Island', N'1903', 19, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (423, 1, N'Chetlat Island', N'1904', 19, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (424, 1, N'Kadmat Island', N'1905', 19, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (425, 1, N'Kalpeni Island', N'1906', 19, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (426, 1, N'Kavaratti Island', N'1907', 19, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (427, 1, N'Kiltan Island', N'1908', 19, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (428, 1, N'Lakshadweep Sea', N'1909', 19, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (429, 1, N'Minicoy Island', N'1910', 19, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (430, 1, N'North Island', N'1911', 19, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (431, 1, N'South Island', N'1912', 19, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (432, 1, N'Anuppur', N'2001', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (433, 1, N'Ashoknagar', N'2002', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (434, 1, N'Balaghat', N'2003', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (435, 1, N'Barwani', N'2004', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (436, 1, N'Betul', N'2005', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (437, 1, N'Bhind', N'2006', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (438, 1, N'Bhopal', N'2007', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (439, 1, N'Burhanpur', N'2008', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (440, 1, N'Chhatarpur', N'2009', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (441, 1, N'Chhindwara', N'2010', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (442, 1, N'Damoh', N'2011', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (443, 1, N'Datia', N'2012', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (444, 1, N'Dewas', N'2013', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (445, 1, N'Dhar', N'2014', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (446, 1, N'Dindori', N'2015', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (447, 1, N'Guna', N'2016', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (448, 1, N'Gwalior', N'2017', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (449, 1, N'Harda', N'2018', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (450, 1, N'Hoshangabad', N'2019', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (451, 1, N'Indore', N'2020', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (452, 1, N'Jabalpur', N'2021', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (453, 1, N'Jagdalpur', N'2022', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (454, 1, N'Jhabua', N'2023', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (455, 1, N'Katni', N'2024', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (456, 1, N'Khandwa', N'2025', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (457, 1, N'Khargone', N'2026', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (458, 1, N'Mandla', N'2027', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (459, 1, N'Mandsaur', N'2028', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (460, 1, N'Morena', N'2029', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (461, 1, N'Narsinghpur', N'2030', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (462, 1, N'Neemuch', N'2031', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (463, 1, N'Panna', N'2032', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (464, 1, N'Raisen', N'2033', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (465, 1, N'Rajgarh', N'2034', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (466, 1, N'Ratlam', N'2035', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (467, 1, N'Rewa', N'2036', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (468, 1, N'Sagar', N'2037', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (469, 1, N'Satna', N'2038', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (470, 1, N'Sehore', N'2039', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (471, 1, N'Seoni', N'2040', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (472, 1, N'Shahdol', N'2041', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (473, 1, N'Shajapur', N'2042', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (474, 1, N'Sheopur', N'2043', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (475, 1, N'Shivpuri', N'2044', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (476, 1, N'Sidhi', N'2045', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (477, 1, N'Tikamgarh', N'2046', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (478, 1, N'Ujjain', N'2047', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (479, 1, N'Umaria', N'2048', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (480, 1, N'Vidisha', N'2049', 20, 99, CAST(N'2023-02-11T23:32:10.187' AS DateTime), CAST(N'2023-02-11T23:32:10.187' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (481, 1, N'Ahmednagar', N'2101', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (482, 1, N'Akola', N'2102', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (483, 1, N'Amravati', N'2103', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (484, 1, N'Aurangabad', N'2104', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (485, 1, N'Beed', N'2105', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (486, 1, N'Bhandara', N'2106', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (487, 1, N'Buldhana', N'2107', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (488, 1, N'Chandrapur', N'2108', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (489, 1, N'Dhule', N'2109', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (490, 1, N'Gadchiroli', N'2110', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (491, 1, N'Gondia', N'2111', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (492, 1, N'Hingoli', N'2112', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (493, 1, N'Jalgaon', N'2113', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (494, 1, N'Jalna', N'2114', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (495, 1, N'Kolhapur', N'2115', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (496, 1, N'Latur', N'2116', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (497, 1, N'Mahabaleshwar', N'2117', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (498, 1, N'Mumbai', N'2118', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (499, 1, N'Mumbai City', N'2119', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
GO
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (500, 1, N'Mumbai Suburban', N'2120', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (501, 1, N'Nagpur', N'2121', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (502, 1, N'Nanded', N'2122', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (503, 1, N'Nandurbar', N'2123', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (504, 1, N'Nashik', N'2124', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (505, 1, N'Osmanabad', N'2125', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (506, 1, N'Parbhani', N'2126', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (507, 1, N'Pune', N'2127', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (508, 1, N'Raigad', N'2128', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (509, 1, N'Ratnagiri', N'2129', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (510, 1, N'Sangli', N'2130', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (511, 1, N'Satara', N'2131', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (512, 1, N'Sholapur', N'2132', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (513, 1, N'Sindhudurg', N'2133', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (514, 1, N'Thane', N'2134', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (515, 1, N'Wardha', N'2135', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (516, 1, N'Washim', N'2136', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (517, 1, N'Yavatmal', N'2137', 21, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (518, 1, N'Bishnupur', N'2201', 22, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (519, 1, N'Chandel', N'2202', 22, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (520, 1, N'Churachandpur', N'2203', 22, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (521, 1, N'Imphal East', N'2204', 22, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (522, 1, N'Imphal West', N'2205', 22, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (523, 1, N'Senapati', N'2206', 22, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (524, 1, N'Tamenglong', N'2207', 22, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (525, 1, N'Thoubal', N'2208', 22, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (526, 1, N'Ukhrul', N'2209', 22, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (527, 1, N'East Garo Hills', N'2301', 23, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (528, 1, N'East Khasi Hills', N'2302', 23, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (529, 1, N'Jaintia Hills', N'2303', 23, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (530, 1, N'Ri Bhoi', N'2304', 23, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (531, 1, N'Shillong', N'2305', 23, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (532, 1, N'South Garo Hills', N'2306', 23, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (533, 1, N'West Garo Hills', N'2307', 23, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (534, 1, N'West Khasi Hills', N'2308', 23, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (535, 1, N'Aizawl', N'2401', 24, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (536, 1, N'Champhai', N'2402', 24, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (537, 1, N'Kolasib', N'2403', 24, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (538, 1, N'Lawngtlai', N'2404', 24, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (539, 1, N'Lunglei', N'2405', 24, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (540, 1, N'Mamit', N'2406', 24, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (541, 1, N'Saiha', N'2407', 24, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (542, 1, N'Serchhip', N'2408', 24, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (543, 1, N'Dimapur', N'2501', 25, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (544, 1, N'Kohima', N'2502', 25, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (545, 1, N'Mokokchung', N'2503', 25, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (546, 1, N'Mon', N'2504', 25, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (547, 1, N'Phek', N'2505', 25, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (548, 1, N'Tuensang', N'2506', 25, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (549, 1, N'Wokha', N'2507', 25, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (550, 1, N'Zunheboto', N'2508', 25, 99, CAST(N'2023-02-11T23:32:10.190' AS DateTime), CAST(N'2023-02-11T23:32:10.190' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (551, 1, N'Angul', N'2601', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (552, 1, N'Balangir', N'2602', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (553, 1, N'Balasore', N'2603', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (554, 1, N'Baleswar', N'2604', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (555, 1, N'Bargarh', N'2605', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (556, 1, N'Berhampur', N'2606', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (557, 1, N'Bhadrak', N'2607', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (558, 1, N'Bhubaneswar', N'2608', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (559, 1, N'Boudh', N'2609', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (560, 1, N'Cuttack', N'2610', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (561, 1, N'Deogarh', N'2611', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (562, 1, N'Dhenkanal', N'2612', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (563, 1, N'Gajapati', N'2613', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (564, 1, N'Ganjam', N'2614', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (565, 1, N'Jagatsinghapur', N'2615', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (566, 1, N'Jajpur', N'2616', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (567, 1, N'Jharsuguda', N'2617', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (568, 1, N'Kalahandi', N'2618', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (569, 1, N'Kandhamal', N'2619', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (570, 1, N'Kendrapara', N'2620', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (571, 1, N'Kendujhar', N'2621', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (572, 1, N'Khordha', N'2622', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (573, 1, N'Koraput', N'2623', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (574, 1, N'Malkangiri', N'2624', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (575, 1, N'Mayurbhanj', N'2625', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (576, 1, N'Nabarangapur', N'2626', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (577, 1, N'Nayagarh', N'2627', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (578, 1, N'Nuapada', N'2628', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (579, 1, N'Puri', N'2629', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (580, 1, N'Rayagada', N'2630', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (581, 1, N'Rourkela', N'2631', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (582, 1, N'Sambalpur', N'2632', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (583, 1, N'Subarnapur', N'2633', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (584, 1, N'Sundergarh', N'2634', 26, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (585, 1, N'Bahur', N'2701', 27, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (586, 1, N'Karaikal', N'2701', 27, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (587, 1, N'Mahe', N'2701', 27, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (588, 1, N'Pondicherry', N'2701', 27, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (589, 1, N'Purnankuppam', N'2701', 27, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (590, 1, N'Valudavur', N'2701', 27, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (591, 1, N'Villianur', N'2701', 27, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (592, 1, N'Yanam', N'2701', 27, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (593, 1, N'Amritsar', N'2801', 28, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (594, 1, N'Barnala', N'2801', 28, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (595, 1, N'Bathinda', N'2801', 28, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (596, 1, N'Faridkot', N'2801', 28, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (597, 1, N'Fatehgarh Sahib', N'2801', 28, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (598, 1, N'Ferozepur', N'2801', 28, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (599, 1, N'Gurdaspur', N'2801', 28, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
GO
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (600, 1, N'Hoshiarpur', N'2801', 28, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (601, 1, N'Jalandhar', N'2801', 28, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (602, 1, N'Kapurthala', N'2801', 28, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (603, 1, N'Ludhiana', N'2801', 28, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (604, 1, N'Mansa', N'2801', 28, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (605, 1, N'Moga', N'2801', 28, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (606, 1, N'Muktsar', N'2801', 28, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (607, 1, N'Nawanshahr', N'2801', 28, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (608, 1, N'Pathankot', N'2801', 28, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (609, 1, N'Patiala', N'2801', 28, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (610, 1, N'Rupnagar', N'2801', 28, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (611, 1, N'Sangrur', N'2801', 28, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (612, 1, N'SAS Nagar', N'2801', 28, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (613, 1, N'Tarn Taran', N'2801', 28, 99, CAST(N'2023-02-11T23:32:10.193' AS DateTime), CAST(N'2023-02-11T23:32:10.193' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (614, 1, N'Ajmer', N'2901', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (615, 1, N'Alwar', N'2902', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (616, 1, N'Banswara', N'2903', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (617, 1, N'Baran', N'2904', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (618, 1, N'Barmer', N'2905', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (619, 1, N'Bharatpur', N'2906', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (620, 1, N'Bhilwara', N'2907', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (621, 1, N'Bikaner', N'2908', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (622, 1, N'Bundi', N'2909', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (623, 1, N'Chittorgarh', N'2910', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (624, 1, N'Churu', N'2911', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (625, 1, N'Dausa', N'2912', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (626, 1, N'Dholpur', N'2913', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (627, 1, N'Dungarpur', N'2914', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (628, 1, N'Hanumangarh', N'2915', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (629, 1, N'Jaipur', N'2916', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (630, 1, N'Jaisalmer', N'2917', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (631, 1, N'Jalore', N'2918', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (632, 1, N'Jhalawar', N'2919', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (633, 1, N'Jhunjhunu', N'2920', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (634, 1, N'Jodhpur', N'2921', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (635, 1, N'Karauli', N'2922', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (636, 1, N'Kota', N'2923', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (637, 1, N'Nagaur', N'2924', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (638, 1, N'Pali', N'2925', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (639, 1, N'Pilani', N'2926', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (640, 1, N'Rajsamand', N'2927', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (641, 1, N'Sawai Madhopur', N'2928', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (642, 1, N'Sikar', N'2929', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (643, 1, N'Sirohi', N'2930', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (644, 1, N'Sri Ganganagar', N'2931', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (645, 1, N'Tonk', N'2932', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (646, 1, N'Udaipur', N'2933', 29, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (647, 1, N'Barmiak', N'3001', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (648, 1, N'Be', N'3002', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (649, 1, N'Bhurtuk', N'3003', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (650, 1, N'Chhubakha', N'3004', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (651, 1, N'Chidam', N'3005', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (652, 1, N'Chubha', N'3006', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (653, 1, N'Chumikteng', N'3007', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (654, 1, N'Dentam', N'3008', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (655, 1, N'Dikchu', N'3009', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (656, 1, N'Dzongri', N'3010', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (657, 1, N'Gangtok', N'3011', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (658, 1, N'Gauzing', N'3012', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (659, 1, N'Gyalshing', N'3013', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (660, 1, N'Hema', N'3014', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (661, 1, N'Kerung', N'3015', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (662, 1, N'Lachen', N'3016', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (663, 1, N'Lachung', N'3017', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (664, 1, N'Lema', N'3018', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (665, 1, N'Lingtam', N'3019', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (666, 1, N'Lungthu', N'3020', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (667, 1, N'Mangan', N'3021', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (668, 1, N'Namchi', N'3022', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (669, 1, N'Namthang', N'3023', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (670, 1, N'Nanga', N'3024', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (671, 1, N'Nantang', N'3025', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (672, 1, N'Naya Bazar', N'3026', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (673, 1, N'Padamachen', N'3027', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (674, 1, N'Pakhyong', N'3028', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (675, 1, N'Pemayangtse', N'3029', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (676, 1, N'Phensang', N'3030', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (677, 1, N'Rangli', N'3031', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (678, 1, N'Rinchingpong', N'3032', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (679, 1, N'Sakyong', N'3033', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (680, 1, N'Samdong', N'3034', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (681, 1, N'Singtam', N'3035', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (682, 1, N'Siniolchu', N'3035', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (683, 1, N'Sombari', N'3036', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (684, 1, N'Soreng', N'3037', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (685, 1, N'Sosing', N'3038', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (686, 1, N'Tekhug', N'3039', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (687, 1, N'Temi', N'3040', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (688, 1, N'Tsetang', N'3041', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (689, 1, N'Tsomgo', N'3042', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (690, 1, N'Tumlong', N'3043', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (691, 1, N'Yangang', N'3044', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (692, 1, N'Yumtang', N'3045', 30, 99, CAST(N'2023-02-11T23:32:10.197' AS DateTime), CAST(N'2023-02-11T23:32:10.197' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (693, 1, N'Chennai', N'3101', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (694, 1, N'Chidambaram', N'3102', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (695, 1, N'Chingleput', N'3103', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (696, 1, N'Coimbatore', N'3104', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (697, 1, N'Courtallam', N'3105', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (698, 1, N'Cuddalore', N'3106', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (699, 1, N'Dharmapuri', N'3107', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
GO
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (700, 1, N'Dindigul', N'3108', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (701, 1, N'Erode', N'3109', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (702, 1, N'Hosur', N'3110', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (703, 1, N'Kanchipuram', N'3111', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (704, 1, N'Kanyakumari', N'3112', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (705, 1, N'Karaikudi', N'3113', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (706, 1, N'Karur', N'3114', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (707, 1, N'Kodaikanal', N'3115', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (708, 1, N'Kovilpatti', N'3116', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (709, 1, N'Krishnagiri', N'3117', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (710, 1, N'Kumbakonam', N'3118', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (711, 1, N'Madurai', N'3119', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (712, 1, N'Mayiladuthurai', N'3120', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (713, 1, N'Nagapattinam', N'3121', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (714, 1, N'Nagarcoil', N'3122', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (715, 1, N'Namakkal', N'3123', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (716, 1, N'Neyveli', N'3124', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (717, 1, N'Nilgiris', N'3125', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (718, 1, N'Ooty', N'3126', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (719, 1, N'Palani', N'3127', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (720, 1, N'Perambalur', N'3128', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (721, 1, N'Pollachi', N'3129', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (722, 1, N'Pudukkottai', N'3130', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (723, 1, N'Rajapalayam', N'3131', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (724, 1, N'Ramanathapuram', N'3132', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (725, 1, N'Salem', N'3133', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (726, 1, N'Sivaganga', N'3134', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (727, 1, N'Sivakasi', N'3135', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (728, 1, N'Thanjavur', N'3136', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (729, 1, N'Theni', N'3137', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (730, 1, N'Thoothukudi', N'3138', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (731, 1, N'Tiruchirappalli', N'3139', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (732, 1, N'Tirunelveli', N'3140', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (733, 1, N'Tirupur', N'3141', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (734, 1, N'Tiruvallur', N'3142', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (735, 1, N'Tiruvannamalai', N'3143', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (736, 1, N'Tiruvarur', N'3144', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (737, 1, N'Trichy', N'3145', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (738, 1, N'Tuticorin', N'3146', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (739, 1, N'Vellore', N'3147', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (740, 1, N'Villupuram', N'3148', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (741, 1, N'Virudhunagar', N'3149', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (742, 1, N'Yercaud', N'3150', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (743, 1, N'Hyderabad', N'3201', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (744, 1, N'Warangal', N'3202', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (745, 1, N'Khammam', N'3203', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (746, 1, N'Nalgonda', N'3204', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (747, 1, N'Ramagundam', N'3205', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (748, 1, N'Nizamabad', N'3206', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (749, 1, N'Mahabubnagar', N'3207', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (750, 1, N'Suryapet', N'3208', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (751, 1, N'Miryalaguda', N'3209', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (752, 1, N'Karimnagar', N'3210', 31, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (753, 1, N'Agartala', N'3301', 33, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (754, 1, N'Ambasa', N'3302', 33, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (755, 1, N'Bampurbari', N'3303', 33, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (756, 1, N'Belonia', N'3304', 33, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (757, 1, N'Dhalai', N'3305', 33, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (758, 1, N'Dharam Nagar', N'3306', 33, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (759, 1, N'Kailashahar', N'3307', 33, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (760, 1, N'Kamal Krishnabari', N'3308', 33, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (761, 1, N'Khopaiyapara', N'3309', 33, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (762, 1, N'Khowai', N'3310', 33, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (763, 1, N'Phuldungsei', N'3311', 33, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (764, 1, N'Radha Kishore Pur', N'3312', 33, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (765, 1, N'Tripura', N'3313', 33, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (766, 1, N'Achhnera', N'3401', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (767, 1, N'Adari', N'3402', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (768, 1, N'Agra', N'3403', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (769, 1, N'Aligarh', N'3404', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (770, 1, N'Allahabad', N'3405', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (771, 1, N'Amroha', N'3406', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (772, 1, N'Azamgarh', N'3407', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (773, 1, N'Bahraich', N'3408', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (774, 1, N'Ballia', N'3409', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (775, 1, N'Balrampur', N'3410', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (776, 1, N'Banda', N'3411', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (777, 1, N'Bareilly', N'3412', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (778, 1, N'Chandausi', N'3413', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (779, 1, N'Dadri', N'3414', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (780, 1, N'Deoria', N'3415', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (781, 1, N'Etawah', N'3416', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (782, 1, N'Fatehabad', N'3417', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (783, 1, N'Fatehpur', N'3418', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (784, 1, N'Greater Noida', N'3419', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (785, 1, N'Hamirpur', N'3420', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (786, 1, N'Hardoi', N'3421', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (787, 1, N'Jajmau', N'3422', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (788, 1, N'Jaunpur', N'3423', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (789, 1, N'Jhansi', N'3424', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (790, 1, N'Kalpi', N'3425', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (791, 1, N'Kanpur', N'3426', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (792, 1, N'Kota', N'3426', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (793, 1, N'Laharpur', N'3427', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (794, 1, N'Lakhimpur', N'3428', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (795, 1, N'Lal Gopalganj Nindaura', N'3429', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (796, 1, N'Lalganj', N'3430', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (797, 1, N'Lalitpur', N'3431', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (798, 1, N'Lar', N'3432', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (799, 1, N'Loni', N'3433', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
GO
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (800, 1, N'Lucknow', N'3434', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (801, 1, N'Mathura', N'3435', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (802, 1, N'Meerut', N'3436', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (803, 1, N'Modinagar', N'3437', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (804, 1, N'Muradnagar', N'3438', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (805, 1, N'Nagina', N'3438', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (806, 1, N'Najibabad', N'3439', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (807, 1, N'Nakur', N'3440', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (808, 1, N'Nanpara', N'3441', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (809, 1, N'Naraura', N'3442', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (810, 1, N'Naugawan Sadat', N'3443', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (811, 1, N'Nautanwa', N'3444', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (812, 1, N'Nawabganj', N'3445', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (813, 1, N'Nehtaur', N'3446', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (814, 1, N'NOIDA', N'3447', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (815, 1, N'Noorpur', N'3448', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (816, 1, N'Obra', N'3449', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (817, 1, N'Orai', N'3450', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (818, 1, N'Padrauna', N'3451', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (819, 1, N'Palia Kalan', N'3452', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (820, 1, N'Parasi', N'3453', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (821, 1, N'Phulpur', N'3454', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (822, 1, N'Pihani', N'3455', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (823, 1, N'Pilibhit', N'3456', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (824, 1, N'Pilkhuwa', N'3457', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (825, 1, N'Powayan', N'3458', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (826, 1, N'Pukhrayan', N'3459', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (827, 1, N'Puranpur', N'3460', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (828, 1, N'Purquazi', N'3461', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (829, 1, N'Purwa', N'3462', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (830, 1, N'Rae Bareli', N'3463', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (831, 1, N'Rampur', N'3464', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (832, 1, N'Rampur Maniharan', N'3465', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (833, 1, N'Rasra', N'3466', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (834, 1, N'Rath', N'3467', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (835, 1, N'Renukoot', N'3468', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (836, 1, N'Reoti', N'3469', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (837, 1, N'Robertsganj', N'3470', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (838, 1, N'Rudauli', N'3471', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (839, 1, N'Rudrapur', N'3472', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (840, 1, N'Sadabad', N'3473', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (841, 1, N'Safipur', N'3474', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (842, 1, N'Saharanpur', N'3475', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (843, 1, N'Sahaspur', N'3476', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (844, 1, N'Sahaswan', N'3477', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (845, 1, N'Sahawar', N'3478', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (846, 1, N'Sahjanwa', N'3479', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (847, 1, N'Saidpur', N'3480', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (848, 1, N'Sambhal', N'3481', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (849, 1, N'Samdhan', N'3482', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (850, 1, N'Samthar', N'3483', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (851, 1, N'Sandi', N'3484', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (852, 1, N'Sandila', N'3485', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (853, 1, N'Sardhana', N'3486', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (854, 1, N'Seohara', N'3487', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (855, 1, N'Shahganj', N'3488', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (856, 1, N'Shahjahanpur', N'3489', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (857, 1, N'Shamli', N'3490', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (858, 1, N'Sherkot', N'3491', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (859, 1, N'Shikarpur', N'3492', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (860, 1, N'Shikohabad', N'3493', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (861, 1, N'Shishgarh', N'3494', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (862, 1, N'Siana', N'3495', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (863, 1, N'Sikanderpur', N'3496', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (864, 1, N'Sikandra Rao', N'3497', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (865, 1, N'Sikandrabad', N'3498', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (866, 1, N'Sirsaganj', N'3499', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (867, 1, N'Sirsi', N'34100', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (868, 1, N'Sitapur', N'34101', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (869, 1, N'Soron', N'34102', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (870, 1, N'Suar', N'34103', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (871, 1, N'Sultanpur', N'34104', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (872, 1, N'Sumerpur', N'34105', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (873, 1, N'Tanda', N'34106', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (874, 1, N'Tetri Bazar', N'34107', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (875, 1, N'Thakurdwara', N'34108', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (876, 1, N'Thana Bhawan', N'34109', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (877, 1, N'Tilhar', N'34110', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (878, 1, N'Tirwaganj', N'34111', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (879, 1, N'Tulsipur', N'34112', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (880, 1, N'Tundla', N'34113', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (881, 1, N'Unnao', N'34114', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (882, 1, N'Utraula', N'34115', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (883, 1, N'Varanasi', N'34116', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (884, 1, N'Vrindavan', N'34117', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (885, 1, N'Warhapur', N'34118', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (886, 1, N'Zaidpur', N'34119', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (887, 1, N'Zamania', N'34120', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (888, 1, N'Muzaffarnagar', N'34121', 34, 99, CAST(N'2023-02-11T23:32:10.200' AS DateTime), CAST(N'2023-02-11T23:32:10.200' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (889, 1, N'Almora', N'3501', 35, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (890, 1, N'Bazpur', N'3502', 35, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (891, 1, N'Chamba', N'3503', 35, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (892, 1, N'Dehradun', N'3504', 35, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (893, 1, N'Haldwani', N'3505', 35, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (894, 1, N'Haridwar', N'3506', 35, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (895, 1, N'Jaspur', N'3507', 35, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (896, 1, N'Kashipur', N'3508', 35, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (897, 1, N'kichha', N'3509', 35, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (898, 1, N'Kotdwara', N'3510', 35, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (899, 1, N'Manglaur', N'3511', 35, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
GO
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (900, 1, N'Mussoorie', N'3512', 35, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (901, 1, N'Nagla', N'3513', 35, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (902, 1, N'Nainital', N'3514', 35, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (903, 1, N'Pauri', N'3515', 35, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (904, 1, N'Pithoragarh', N'3516', 35, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (905, 1, N'Ramnagar', N'3517', 35, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (906, 1, N'Rishikesh', N'3518', 35, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (907, 1, N'Roorkee', N'3519', 35, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (908, 1, N'Rudrapur', N'3520', 35, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (909, 1, N'Sitarganj', N'3521', 35, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (910, 1, N'Tehri', N'3522', 35, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (911, 1, N'Alipurduar', N'3601', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (912, 1, N'Arambagh', N'3602', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (913, 1, N'Asansol', N'3603', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (914, 1, N'Baharampur', N'3604', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (915, 1, N'Bally', N'3605', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (916, 1, N'Balurghat', N'3606', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (917, 1, N'Bankura', N'3607', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (918, 1, N'Barakar', N'3608', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (919, 1, N'Barasat', N'3609', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (920, 1, N'Bardhaman', N'3610', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (921, 1, N'Bidhan Nagar', N'3611', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (922, 1, N'Chinsura', N'3612', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (923, 1, N'Contai', N'3613', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (924, 1, N'Cooch Behar', N'3614', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (925, 1, N'Darjeeling', N'3615', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (926, 1, N'Durgapur', N'3616', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (927, 1, N'Haldia', N'3617', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (928, 1, N'Howrah', N'3618', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (929, 1, N'Islampur', N'3619', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (930, 1, N'Jhargram', N'3620', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (931, 1, N'Kharagpur', N'3621', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (932, 1, N'Kolkata', N'3622', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (933, 1, N'Mainaguri', N'3623', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (934, 1, N'Mal', N'3624', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (935, 1, N'Mathabhanga', N'3625', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (936, 1, N'Medinipur', N'3626', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (937, 1, N'Memari', N'3627', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (938, 1, N'Monoharpur', N'3628', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (939, 1, N'Murshidabad', N'3629', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (940, 1, N'Nabadwip', N'3630', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (941, 1, N'Naihati', N'3631', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (942, 1, N'Panchla', N'3632', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (943, 1, N'Pandua', N'3633', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (944, 1, N'Paschim Punropara', N'3634', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (945, 1, N'Purulia', N'3635', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (946, 1, N'Raghunathpur', N'3636', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (947, 1, N'Raiganj', N'3637', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (948, 1, N'Rampurhat', N'3638', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (949, 1, N'Ranaghat', N'3639', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (950, 1, N'Sainthia', N'3640', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (951, 1, N'Santipur', N'3641', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (952, 1, N'Siliguri', N'3642', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (953, 1, N'Sonamukhi', N'3643', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (954, 1, N'Srirampore', N'3644', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (955, 1, N'Suri', N'3645', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (956, 1, N'Taki', N'3646', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (957, 1, N'Tamluk', N'3647', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
INSERT [dbo].[LOC_City] ([CityID], [UserID], [CityName], [CityCode], [StateID], [CountryID], [CreationDate], [ModificationDate]) VALUES (958, 1, N'Tarakeswar', N'3648', 36, 99, CAST(N'2023-02-11T23:32:10.203' AS DateTime), CAST(N'2023-02-11T23:32:10.203' AS DateTime))
SET IDENTITY_INSERT [dbo].[LOC_City] OFF
GO
SET IDENTITY_INSERT [dbo].[LOC_Country] ON 

INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (1, 1, N'Afganistan', N'AFG', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-03-19T10:43:48.127' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (2, 1, N'Albania', N'ALB', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (3, 1, N'Algeria', N'DZA', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (4, 1, N'American Samoa', N'ASM', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (5, 1, N'Andorra', N'AND', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (6, 1, N'Angola', N'AGO', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (7, 1, N'Anguilla', N'AIA', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (8, 1, N'Antarctica', NULL, CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (9, 1, N'Antigua and Barbuda', N'ATG', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (10, 1, N'Argentina', N'ARG', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (11, 1, N'Armenia', N'ARM', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (12, 1, N'Aruba', N'ABW', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (13, 1, N'Australia', N'AUS', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (14, 1, N'Austria', N'AUT', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (15, 1, N'Azerbaijan', N'AZE', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (16, 1, N'Bahamas', N'BHS', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (17, 1, N'Bahrain', N'BHR', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (18, 1, N'Bangladesh', N'BGD', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (19, 1, N'Barbados', N'BRB', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (20, 1, N'Belarus', N'BLR', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (21, 1, N'Belgium', N'BEL', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (22, 1, N'Belize', N'BLZ', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (23, 1, N'Benin', N'BEN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (24, 1, N'Bermuda', N'BMU', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (25, 1, N'Bhutan', N'BTN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (26, 1, N'Bolivia', N'BOL', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (27, 1, N'Bosnia and Herzegovina', N'BIH', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (28, 1, N'Botswana', N'BWA', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (29, 1, N'Bouvet Island', NULL, CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (30, 1, N'Brazil', N'BRA', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (31, 1, N'British Indian Ocean Territory', NULL, CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (32, 1, N'Brunei Darussalam', N'BRN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (33, 1, N'Bulgaria', N'BGR', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (34, 1, N'Burkina Faso', N'BFA', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (35, 1, N'Burundi', N'BDI', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (36, 1, N'Cambodia', N'KHM', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (37, 1, N'Cameroon', N'CMR', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (38, 1, N'Canada', N'CAN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (39, 1, N'Cape Verde', N'CPV', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (40, 1, N'Cayman Islands', N'CYM', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (41, 1, N'Central African Republic', N'CAF', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (42, 1, N'Chad', N'TCD', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (43, 1, N'Chile', N'CHL', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (44, 1, N'China', N'CHN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (45, 1, N'Christmas Island', NULL, CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (46, 1, N'Cocos (Keeling) Islands', NULL, CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (47, 1, N'Colombia', N'COL', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (48, 1, N'Comoros', N'COM', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (49, 1, N'Congo', N'COG', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (50, 1, N'Congo, the Democratic Republic of the', N'COD', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (51, 1, N'Cook Islands', N'COK', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (52, 1, N'Costa Rica', N'CRI', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (53, 1, N'Cote D''Ivoire', N'CIV', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (54, 1, N'Croatia', N'HRV', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (55, 1, N'Cuba', N'CUB', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (56, 1, N'Cyprus', N'CYP', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (57, 1, N'Czech Republic', N'CZE', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (58, 1, N'Denmark', N'DNK', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (59, 1, N'Djibouti', N'DJI', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (60, 1, N'Dominica', N'DMA', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (61, 1, N'Dominican Republic', N'DOM', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (62, 1, N'Ecuador', N'ECU', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (63, 1, N'Egypt', N'EGY', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (64, 1, N'El Salvador', N'SLV', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (65, 1, N'Equatorial Guinea', N'GNQ', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (66, 1, N'Eritrea', N'ERI', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (67, 1, N'Estonia', N'EST', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (68, 1, N'Ethiopia', N'ETH', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (69, 1, N'Falkland Islands (Malvinas)', N'FLK', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (70, 1, N'Faroe Islands', N'FRO', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (71, 1, N'Fiji', N'FJI', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (72, 1, N'Finland', N'FIN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (73, 1, N'France', N'FRA', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (74, 1, N'French Guiana', N'GUF', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (75, 1, N'French Polynesia', N'PYF', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (76, 1, N'French Southern Territories', NULL, CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (77, 1, N'Gabon', N'GAB', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (78, 1, N'Gambia', N'GMB', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (79, 1, N'Georgia', N'GEO', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (80, 1, N'Germany', N'DEU', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (81, 1, N'Ghana', N'GHA', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (82, 1, N'Gibraltar', N'GIB', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (83, 1, N'Greece', N'GRC', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (84, 1, N'Greenland', N'GRL', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (85, 1, N'Grenada', N'GRD', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (86, 1, N'Guadeloupe', N'GLP', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (87, 1, N'Guam', N'GUM', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (88, 1, N'Guatemala', N'GTM', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (89, 1, N'Guinea', N'GIN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (90, 1, N'Guinea-Bissau', N'GNB', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (91, 1, N'Guyana', N'GUY', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (92, 1, N'Haiti', N'HTI', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (93, 1, N'Heard Island and Mcdonald Islands', NULL, CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (94, 1, N'Holy See (Vatican City State)', N'VAT', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (95, 1, N'Honduras', N'HND', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (96, 1, N'Hong Kong', N'HKG', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (97, 1, N'Hungary', N'HUN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (98, 1, N'Iceland', N'ISL', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (99, 1, N'India', N'IND', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
GO
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (100, 1, N'Indonesia', N'IDN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (101, 1, N'Iran, Islamic Republic of', N'IRN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (102, 1, N'Iraq', N'IRQ', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (103, 1, N'Ireland', N'IRL', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (104, 1, N'Israel', N'ISR', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (105, 1, N'Italy', N'ITA', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (106, 1, N'Jamaica', N'JAM', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (107, 1, N'Japan', N'JPN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (108, 1, N'Jordan', N'JOR', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (109, 1, N'Kazakhstan', N'KAZ', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (110, 1, N'Kenya', N'KEN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (111, 1, N'Kiribati', N'KIR', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (112, 1, N'Korea, Democratic People''s Republic of', N'PRK', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (113, 1, N'Korea, Republic of', N'KOR', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (114, 1, N'Kuwait', N'KWT', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (116, 1, N'Lao People''s Democratic Republic', N'LAO', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (117, 1, N'Latvia', N'LVA', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (118, 1, N'Lebanon', N'LBN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (119, 1, N'Lesotho', N'LSO', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (120, 1, N'Liberia', N'LBR', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (121, 1, N'Libyan Arab Jamahiriya', N'LBY', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (122, 1, N'Liechtenstein', N'LIE', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (123, 1, N'Lithuania', N'LTU', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (124, 1, N'Luxembourg', N'LUX', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (125, 1, N'Macao', N'MAC', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (126, 1, N'Macedonia, the Former Yugoslav Republic of', N'MKD', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (127, 1, N'Madagascar', N'MDG', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (128, 1, N'Malawi', N'MWI', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (129, 1, N'Malaysia', N'MYS', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (130, 1, N'Maldives', N'MDV', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (131, 1, N'Mali', N'MLI', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (132, 1, N'Malta', N'MLT', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (133, 1, N'Marshall Islands', N'MHL', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (134, 1, N'Martinique', N'MTQ', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (135, 1, N'Mauritania', N'MRT', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (136, 1, N'Mauritius', N'MUS', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (137, 1, N'Mayotte', NULL, CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (138, 1, N'Mexico', N'MEX', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (139, 1, N'Micronesia, Federated States of', N'FSM', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (140, 1, N'Moldova, Republic of', N'MDA', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (141, 1, N'Monaco', N'MCO', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (142, 1, N'Mongolia', N'MNG', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (143, 1, N'Montserrat', N'MSR', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (144, 1, N'Morocco', N'MAR', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (145, 1, N'Mozambique', N'MOZ', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (146, 1, N'Myanmar', N'MMR', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (147, 1, N'Namibia', N'NAM', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (148, 1, N'Nauru', N'NRU', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (149, 1, N'Nepal', N'NPL', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (150, 1, N'Netherlands', N'NLD', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (151, 1, N'Netherlands Antilles', N'ANT', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (152, 1, N'New Caledonia', N'NCL', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (153, 1, N'New Zealand', N'NZL', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (154, 1, N'Nicaragua', N'NIC', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (155, 1, N'Niger', N'NER', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (156, 1, N'Nigeria', N'NGA', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (157, 1, N'Niue', N'NIU', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (158, 1, N'Norfolk Island', N'NFK', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (159, 1, N'Northern Mariana Islands', N'MNP', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (160, 1, N'Norway', N'NOR', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (161, 1, N'Oman', N'OMN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (162, 1, N'Pakistan', N'PAK', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (163, 1, N'Palau', N'PLW', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (164, 1, N'Palestinian Territory, Occupied', NULL, CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (165, 1, N'Panama', N'PAN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (166, 1, N'Papua New Guinea', N'PNG', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (167, 1, N'Paraguay', N'PRY', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (168, 1, N'Peru', N'PER', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (169, 1, N'Philippines', N'PHL', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (170, 1, N'Pitcairn', N'PCN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (171, 1, N'Poland', N'POL', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (172, 1, N'Portugal', N'PRT', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (173, 1, N'Puerto Rico', N'PRI', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (174, 1, N'Qatar', N'QAT', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (175, 1, N'Reunion', N'REU', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (176, 1, N'Romania', N'ROM', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (177, 1, N'Russian Federation', N'RUS', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (178, 1, N'Rwanda', N'RWA', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (179, 1, N'Saint Helena', N'SHN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (180, 1, N'Saint Kitts and Nevis', N'KNA', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (181, 1, N'Saint Lucia', N'LCA', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (182, 1, N'Saint Pierre and Miquelon', N'SPM', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (183, 1, N'Saint Vincent and the Grenadines', N'VCT', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (184, 1, N'Samoa', N'WSM', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (185, 1, N'San Marino', N'SMR', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (186, 1, N'Sao Tome and Principe', N'STP', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (187, 1, N'Saudi Arabia', N'SAU', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (188, 1, N'Senegal', N'SEN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (189, 1, N'Serbia and Montenegro', NULL, CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (190, 1, N'Seychelles', N'SYC', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (191, 1, N'Sierra Leone', N'SLE', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (192, 1, N'Singapore', N'SGP', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (193, 1, N'Slovakia', N'SVK', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (194, 1, N'Slovenia', N'SVN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (195, 1, N'Solomon Islands', N'SLB', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (196, 1, N'Somalia', N'SOM', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (197, 1, N'South Africa', N'ZAF', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (198, 1, N'South Georgia and the South Sandwich Islands', NULL, CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (199, 1, N'Spain', N'ESP', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (200, 1, N'Sri Lanka', N'LKA', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
GO
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (201, 1, N'Sudan', N'SDN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (202, 1, N'Suriname', N'SUR', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (203, 1, N'Svalbard and Jan Mayen', N'SJM', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (204, 1, N'Swaziland', N'SWZ', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (205, 1, N'Sweden', N'SWE', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (206, 1, N'Switzerland', N'CHE', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (207, 1, N'Syrian Arab Republic', N'SYR', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (208, 1, N'Taiwan, Province of China', N'TWN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (209, 1, N'Tajikistan', N'TJK', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (210, 1, N'Tanzania, United Republic of', N'TZA', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (211, 1, N'Thailand', N'THA', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (212, 1, N'Timor-Leste', NULL, CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (213, 1, N'Togo', N'TGO', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (214, 1, N'Tokelau', N'TKL', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (215, 1, N'Tonga', N'TON', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (216, 1, N'Trinidad and Tobago', N'TTO', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (217, 1, N'Tunisia', N'TUN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (218, 1, N'Turkey', N'TUR', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (219, 1, N'Turkmenistan', N'TKM', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (220, 1, N'Turks and Caicos Islands', N'TCA', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (221, 1, N'Tuvalu', N'TUV', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (222, 1, N'Uganda', N'UGA', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (223, 1, N'Ukraine', N'UKR', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (224, 1, N'United Arab Emirates', N'ARE', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (225, 1, N'United Kingdom', N'GBR', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (226, 1, N'United States', N'USA', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (227, 1, N'United States Minor Outlying Islands', NULL, CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (228, 1, N'Uruguay', N'URY', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (229, 1, N'Uzbekistan', N'UZB', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (230, 1, N'Vanuatu', N'VUT', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (231, 1, N'Venezuela', N'VEN', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (232, 1, N'Viet Nam', N'VNM', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (233, 1, N'Virgin Islands, British', N'VGB', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (234, 1, N'Virgin Islands, U.s.', N'VIR', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (235, 1, N'Wallis and Futuna', N'WLF', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (236, 1, N'Western Sahara', N'ESH', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (237, 1, N'Yemen', N'YEM', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (238, 1, N'Zambia', N'ZMB', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
INSERT [dbo].[LOC_Country] ([CountryID], [UserID], [CountryName], [CountryCode], [CreationDate], [ModificationDate]) VALUES (239, 1, N'Zimbabwe', N'ZWE', CAST(N'2023-02-11T22:48:38.343' AS DateTime), CAST(N'2023-02-11T22:48:38.343' AS DateTime))
SET IDENTITY_INSERT [dbo].[LOC_Country] OFF
GO
SET IDENTITY_INSERT [dbo].[LOC_State] ON 

INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (1, 1, N'Andaman and Nicobar Islands', N'AN', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (2, 1, N'Andhra Pradesh', N'AP', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (3, 1, N'Arunachal Pradesh', N'AR', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (4, 1, N'Assam', N'AS', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-03-02T16:20:19.420' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (5, 1, N'Bihar', N'BR', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (6, 1, N'Chattisgarh', N'CT', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (7, 1, N'Chandigarh', N'CH', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (8, 1, N'Dadra and Nagar Haveli', N'DN', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (9, 1, N'Daman and Diu', N'DD', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (10, 1, N'Delhi', N'DL', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (11, 1, N'Goa', N'GA', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (12, 1, N'Gujarat', N'GJ', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (13, 1, N'Haryana', N'HR', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (14, 1, N'Himachal Pradesh', N'HP', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (15, 1, N'Jammu and Kashmir', N'JK', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (16, 1, N'Jharkhand', N'JH', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (17, 1, N'Karnataka', N'KA', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (18, 1, N'Kerala', N'KL', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (19, 1, N'Lakshadweep Islands', N'LD', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (20, 1, N'Madhya Pradesh', N'MP', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (21, 1, N'Maharashtra', N'MH', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (22, 1, N'Manipur', N'MN', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (23, 1, N'Meghalaya', N'ML', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (24, 1, N'Mizoram', N'MZ', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (25, 1, N'Nagaland', N'NL', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (26, 1, N'Odisha', N'OD', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (27, 1, N'Pondicherry', N'PY', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (28, 1, N'Punjab', N'PB', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (29, 1, N'Rajasthan', N'RJ', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (30, 1, N'Sikkim', N'SK', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (31, 1, N'Tamil Nadu', N'TN', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (32, 1, N'Telangana', N'TS', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (33, 1, N'Tripura', N'TR', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (34, 1, N'Uttar Pradesh', N'UP', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (35, 1, N'Uttarakhand', N'UK', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
INSERT [dbo].[LOC_State] ([StateID], [UserID], [StateName], [StateCode], [CountryID], [CreationDate], [ModificationDate]) VALUES (36, 1, N'West Bengal', N'WB', 99, CAST(N'2023-02-11T23:20:25.630' AS DateTime), CAST(N'2023-02-11T23:20:25.630' AS DateTime))
SET IDENTITY_INSERT [dbo].[LOC_State] OFF
GO
SET IDENTITY_INSERT [dbo].[MAS_Contact] ON 

INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (1, 1, N'Paddy O’Furniture', 1, N'152 A, Ignou Road', 99, 5, 111, 110068, N'29531216', N'josephine_darakjy@darakjy.org', N'1995-07-16', NULL, N'Male', N'Manager', N'Chanay, Jeffrey A Esq', N'Manager', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (2, 1, N'Olive Yew', 3, N'2nd Floor, Abv Rajasthan Touris, Navrangpura', 99, 3, 23, 380009, N'7926420657', N'art@venere.org', N'1982-08-05', NULL, N'Male', N'Assistant Manager', N'Chemel, James L Cpa', N'Assistant Manager', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (3, 1, N'Aida Bugg', 2, N'83-b, Worli Naka, Dr Annie Beasant Rd, Worli', 99, 12, 277, 400018, N'2224936052', N'lpaprocki@hotmail.com', N'1980-02-21', N'sdfjndfds', N'Male', N'Executive', N'Feltz Printing Service', N'Executive', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-03-19T13:01:52.300' AS DateTime), N'/Upload/wp6940885.webp')
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (4, 1, N'Maureen Biologist', 3, N'3, 1131, Navjivan Society, Lamington Rd, Lamington Road', 99, 10, 181, 400007, N'2223086414', N'donette.foller@cox.net', N'1996-06-27', NULL, N'Female', N'Director', N'Printing Dimensions', N'Director', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (5, 1, N'Teri Dactyl', 4, N'F-6, Gr Floor, Shreepal Indl Est,Sv Road, Oshiwara Bridge, Jogeshwari (west)', 99, 12, 322, 400102, N'2226780795', N'simona@morasca.com', N'2007-08-09', NULL, N'Male', N'Coordinator', N'Chapman Ross E Esq', N'Coordinator', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (6, 1, N'Peg Legge', 5, N'3/a Sharma Shed, New Prabhadevi Rd,Prabhadevi', 99, 17, 452, 400025, N'2224384037', N'mitsue_tollner@yahoo.com', N'1976-09-14', NULL, N'Male', N'Administrator', N'Morlong Associates', N'Administrator', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (7, 1, N'Allie Grater', 1, N'6649 N Blue Gum St', 99, 15, 683, 70116, N'504-621-8927', N'leota@hotmail.com', N'2000-09-14', NULL, N'Male', N'Controller', N'Commercial Press', N'Controller', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (8, 1, N'Liz Erd', 2, N'4 B Blue Ridge Blvd', 99, 22, 754, 48116, N'810-292-9388', N'sage_wieser@cox.net', N'1985-05-22', NULL, N'Male', N'Officer', N'Truhlar And Truhlar Attys', N'Officer', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (9, 1, N'A. Mused', 3, N'8 W Cerritos Ave #54', 99, 7, 201, 8014, N'856-636-8749', N'kris@gmail.com', N'1980-11-27', N'sdfjn', N'Female', N'Organizer', N'King, Christopher A Esq', N'Organizer', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-03-19T13:18:39.487' AS DateTime), N'/Upload/4026043.jpg')
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (10, 1, N'Constance Noring', 3, N'639 Main St', 99, 11, 243, 99501, N'907-385-4412', N'minna_amigon@yahoo.com', N'1998-12-31', NULL, N'Male', N'Supervisor', N'Dorl, James J Esq', N'Supervisor', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (11, 1, N'Lois Di Nominator', 2, N'34 Center St', 99, 31, 774, 45011, N'513-570-1893', N'amaclead@gmail.com', N'1977-11-28', NULL, N'Female', N'Superintendent', N'Rangoni Of Florence', N'Superintendent', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (12, 1, N'Minnie Van Ryder', 1, N'3 Mcauley Dr', 99, 35, 832, 44805, N'419-503-2484k', N'iley.caldarera@aol.com', N'2004-03-25', NULL, N'Male', N'Head', N'Feiner Bros', N'Head', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (13, 1, N'Lynn O’Leeum', 5, N'7 Eads St', 99, 33, 922, 60632, N'773-573-6914', N'gruta@cox.net', N'1970-01-23', NULL, N'Female', N'Overseer', N'Buckley Miller & Wright', N'Overseer', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (14, 1, N'P. Ann O’Recital', 4, N'7 W Jackson Blvd', 99, 26, 588, 95111, N'408-752-3500', N'calbares@gmail.com', N'1973-09-21', NULL, N'Female', N'Chief', N'Rousseaux, Michael Esq', N'Chief', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (15, 1, N'Ray O’Sun', 2, N'5 Boston Ave #88', 99, 30, 692, 57105, N'605-414-2147', N'mattie@aol.com', N'1970-03-23', NULL, N'Female', N'Foreman', N'Century Communications', N'Foreman', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (16, 1, N'Lee A. Sun', 1, N'	228 Runamuck Pl #2808', 99, 5, 48, 21224, N'410-655-8723', N'meaghan@hotmail.com', N'2012-04-18', NULL, N'Male', N'Controller', N'Bolton, Wilbur Esq', N'Controller', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (17, 1, N'Ray Sin', 5, N'2371 Jerrold Ave', 99, 9, 285, 19443, N'215-874-1229', N'gladys.rim@rim.org', N'1995-04-03', NULL, N'Female', N'Principal', N'T M Byxbee Company Pc', N'Principal', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (18, 1, N'Isabelle Ringing', 2, N'37275 St  Rt 17m M', 99, 17, 472, 11953, N'631-335-3414', N'yuki_whobrey@aol.com', N'1973-09-29', NULL, N'Female', N'President', N'Farmers Insurance Group', N'President', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (19, 1, N'Eileen Sideways', 3, N'25 E 75th St #69', 99, 28, 277, 90034, N'310-498-5651', N'fletcher.flosi@yahoo.com', N'2010-10-11', NULL, N'Female', N'Lead', N'Post Box Services Plus', N'Lead', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (20, 1, N'Rita Book', 5, N'98 Connecticut Ave Nw', 99, 25, 459, 44023, N'440-780-8425', N'bette_nicka@cox.net', N'1988-05-15', NULL, N'Female', N'Computer Scientist', N'Sport En Art', N'Computer Scientist', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (21, 1, N'Paige Turner', 4, N'56 E Morehead St', 99, 14, 382, 78045, N'956-537-6195', N'vinouye@aol.com', N'1998-03-09', NULL, N'Male', N'IT Professional', N'C 4 Network Inc', N'IT Professional', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (22, 1, N'Rhoda Report', 2, N'73 State Road 434 E', 99, 6, 99, 85013, N'602-277-4385', N'willard@hotmail.com', N'1996-06-12', NULL, N'Female', N'UX Designer & UI Developer', N'Ingalls, Donald R Esq', N'UX Designer & UI Developer', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (23, 1, N'Augusta Wind', 1, N'69734 E Carrillo St', 99, 33, 888, 37110, N'931-313-9635', N'mroyster@royster.com', N'2003-10-20', NULL, N'Female', N'SQL Developer', N'Franklin, Peter L Esq', N'SQL Developer', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (24, 1, N'Chris Anthemum', 5, N'322 New Horizon Blvd', 99, 22, 466, 53207, N'414-661-9598', N'alisha@slusarski.com', N'2003-03-07', NULL, N'Female', N'Web Designer', N'Wtlz Power 107 Fm', N'Web Designer', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (25, 1, N'Anne Teak', 2, N'1 State Route 27', 99, 11, 177, 48180, N'313-288-7937', N'allene_iturbide@cox.net', N'1969-02-12', NULL, N'Female', N'Web Developer', N'Ledecky, David Esq', N'Web Developer', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (26, 1, N'U.R. Nice', 1, N'394 Manchester Blvd', 99, 18, 555, 61109, N'815-828-2147', N'chanel.caudy@caudy.org', N'1995-06-01', NULL, N'Male', N'Help Desk Worker/Desktop Support', N'Professional Image Inc', N'Help Desk Worker/Desktop Support', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (27, 1, N'Anita Bath', 4, N'6 S 33rd St', 99, 27, 683, 19014, N'610-545-3615', N'ezekiel@chui.com', N'1989-06-12', NULL, N'Female', N'Software Engineer', N'Sider, Donald C Esq', N'Software Engineer', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (28, 1, N'Harriet Upp', 5, N'6 Greenleaf Ave', 99, 19, 418, 95111, N'408-540-1785', N'wkusko@yahoo.com', N'1977-11-15', NULL, N'Male', N'Data Entry', N'U Pull It', N'Data Entry', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (29, 1, N'I.M. Tired', 3, N'	618 W Yakima Ave', 99, 23, 399, 75062, N'972-303-9197', N'bfigeroa@aol.com', N'1978-02-09', NULL, N'Female', N'DevOps Engineer', N'Clark, Richard Cpa', N'DevOps Engineer', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (30, 1, N'I. Missy Ewe', 1, N'74 S Westgate St', 99, 36, 956, 12204, N'518-966-7987', N'ammie@corrio.com', N'2006-05-18', NULL, N'Female', N'Computer Programmer', N'Moskowitz, Barry S', N'Computer Programmer', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (31, 1, N'Ivana B. Withew', 2, N'3273 State St', 99, 35, 921, 8846, N'732-658-3154', N'francine_vocelka@vocelka.com', N'1982-08-20', NULL, N'Male', N'Network Administrator', N'Cascade Realty Advisors Inc', N'Network Administrator', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (32, 1, N'Anita Letterback', 1, N'1 Central Ave', 99, 24, 672, 54481, N'715-662-6764', N'ernie_stenseth@aol.com', N'1976-05-04', NULL, N'Female', N'Information Security Analyst', N'Knwz Newsradio', N'Information Security Analyst', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (33, 1, N'Hope Furaletter', 4, N'86 Nw 66th St #8673', 99, 5, 62, 66218, N'913-388-2079', N'albina@glick.com', N'2014-12-06', NULL, N'Female', N'Artificial Intelligence Engineer', N'Giampetro, Anthony D', N'Artificial Intelligence Engineer', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (34, 1, N'B. Homesoon', 5, N'2 Cedar Ave #84', 99, 33, 873, 21601, N'410-669-1642', N'asergi@gmail.com', N'1976-07-02', NULL, N'Female', N'Cloud Architect', N'Milford Enterprises Inc', N'Cloud Architect', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (35, 1, N'Bea Mine', 3, N'90991 Thorburn Ave', 99, 15, 358, 10011, N'212-582-4976', N'solange@shinko.com', N'2014-05-26', NULL, N'Female', N'IT Manager', N'Mosocco, Ronald A', N'IT Manager', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (36, 1, N'Bess Twishes', 2, N'386 9th Ave N', 99, 11, 245, 77301, N'936-336-3951', N'jose@yahoo.com', N'1961-07-29', NULL, N'Female', N'Technical Specialist', N'Tri State Refueler CO', N'Technical Specialist', CAST(N'2023-02-12T13:44:11.917' AS DateTime), CAST(N'2023-02-12T13:44:11.917' AS DateTime), NULL)
INSERT [dbo].[MAS_Contact] ([ContactID], [UserID], [ContactName], [ContactCategoryID], [ContactAddress], [CountryID], [StateID], [CityID], [ContactPincode], [ContactMobile], [ContactEmail], [ContactDOB], [ContactLinkedIN], [ContactGender], [ContactTypeOfProfession], [ContactCompanyName], [ContactDesignation], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (37, 1, N'Kutubkhan', 3, N'Bhagvati para main road', 99, 12, 285, 360003, N'08460305152', N'200540107014@darshan.ac.in', N'2023-02-09', N'Kutub_linkedin', N'Male', N'Student', N'Khan', N'dljfjhsdivukdnf vdfmnn b', CAST(N'2023-03-04T08:34:10.263' AS DateTime), CAST(N'2023-03-04T08:34:10.263' AS DateTime), N'/Upload/4545909.jpeg')
SET IDENTITY_INSERT [dbo].[MAS_Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [Password]) VALUES (1, N'Admin', N'Admin')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[ContactCategory]  WITH CHECK ADD  CONSTRAINT [FK_ContactCategory_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[ContactCategory] CHECK CONSTRAINT [FK_ContactCategory_User]
GO
ALTER TABLE [dbo].[LOC_City]  WITH CHECK ADD  CONSTRAINT [FK_LOC_City_LOC_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[LOC_Country] ([CountryID])
GO
ALTER TABLE [dbo].[LOC_City] CHECK CONSTRAINT [FK_LOC_City_LOC_Country]
GO
ALTER TABLE [dbo].[LOC_City]  WITH CHECK ADD  CONSTRAINT [FK_LOC_City_LOC_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[LOC_State] ([StateID])
GO
ALTER TABLE [dbo].[LOC_City] CHECK CONSTRAINT [FK_LOC_City_LOC_State]
GO
ALTER TABLE [dbo].[LOC_City]  WITH CHECK ADD  CONSTRAINT [FK_LOC_City_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[LOC_City] CHECK CONSTRAINT [FK_LOC_City_User]
GO
ALTER TABLE [dbo].[LOC_Country]  WITH CHECK ADD  CONSTRAINT [FK_LOC_Country_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[LOC_Country] CHECK CONSTRAINT [FK_LOC_Country_User]
GO
ALTER TABLE [dbo].[LOC_State]  WITH CHECK ADD  CONSTRAINT [FK_LOC_State_LOC_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[LOC_Country] ([CountryID])
GO
ALTER TABLE [dbo].[LOC_State] CHECK CONSTRAINT [FK_LOC_State_LOC_Country]
GO
ALTER TABLE [dbo].[LOC_State]  WITH CHECK ADD  CONSTRAINT [FK_LOC_State_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[LOC_State] CHECK CONSTRAINT [FK_LOC_State_User]
GO
ALTER TABLE [dbo].[MAS_Contact]  WITH CHECK ADD  CONSTRAINT [FK_MAS_Contact_LOC_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[LOC_City] ([CityID])
GO
ALTER TABLE [dbo].[MAS_Contact] CHECK CONSTRAINT [FK_MAS_Contact_LOC_City]
GO
ALTER TABLE [dbo].[MAS_Contact]  WITH CHECK ADD  CONSTRAINT [FK_MAS_Contact_LOC_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[LOC_Country] ([CountryID])
GO
ALTER TABLE [dbo].[MAS_Contact] CHECK CONSTRAINT [FK_MAS_Contact_LOC_Country]
GO
ALTER TABLE [dbo].[MAS_Contact]  WITH CHECK ADD  CONSTRAINT [FK_MAS_Contact_LOC_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[LOC_State] ([StateID])
GO
ALTER TABLE [dbo].[MAS_Contact] CHECK CONSTRAINT [FK_MAS_Contact_LOC_State]
GO
ALTER TABLE [dbo].[MAS_Contact]  WITH CHECK ADD  CONSTRAINT [FK_MAS_Contact_MAS_Contact] FOREIGN KEY([ContactCategoryID])
REFERENCES [dbo].[ContactCategory] ([ContactCategoryID])
GO
ALTER TABLE [dbo].[MAS_Contact] CHECK CONSTRAINT [FK_MAS_Contact_MAS_Contact]
GO
ALTER TABLE [dbo].[MAS_Contact]  WITH CHECK ADD  CONSTRAINT [FK_MAS_Contact_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[MAS_Contact] CHECK CONSTRAINT [FK_MAS_Contact_User]
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_DeleteByPK]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_ContactCategory_DeleteByPK]

@ContactCategoryID	int

AS

DELETE
FROM   [dbo].[ContactCategory]
WHERE  [dbo].[ContactCategory].ContactCategoryID=@ContactCategoryID
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_Insert]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_ContactCategory_Insert]

	@ContactCategoryName	nvarchar(50),
	@CreationDate			datetime,
	@ModificationDate		datetime

AS

INSERT INTO [dbo].[ContactCategory]
(
	UserID,
	ContactCategoryName,
	CreationDate,
	ModificationDate
)
VALUES
(
	1,
	@ContactCategoryName,
	ISNULL(@CreationDate,GETDATE()),
	ISNULL(@ModificationDate,GETDATE())
)
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_SelectAll]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_ContactCategory_SelectAll]

@UserID		int

AS

SELECT 
		[dbo].[ContactCategory].[ContactCategoryID],
		[dbo].[ContactCategory].[ContactCategoryName],
		[dbo].[ContactCategory].[CreationDate],
		[dbo].[ContactCategory].[ModificationDate]

FROM	[dbo].[ContactCategory]

WHERE	[dbo].[ContactCategory].UserID=@UserID

ORDER BY [dbo].[ContactCategory].[ContactCategoryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_SelectByPK]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_SelectByPK]

@ContactCategoryID	int
AS

SELECT 
		[dbo].[ContactCategory].[ContactCategoryID],
		[dbo].[ContactCategory].[ContactCategoryName],
		[dbo].[ContactCategory].[CreationDate],
		[dbo].[ContactCategory].[ModificationDate]
			   
FROM	[dbo].[ContactCategory]
			   
WHERE   [dbo].[ContactCategory].ContactCategoryID=@ContactCategoryID 
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_SelectForDropDown]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_SelectForDropDown]

AS

SELECT	 [dbo].[ContactCategory].[ContactCategoryID],
		 [dbo].[ContactCategory].[ContactCategoryName]
				
FROM	 [dbo].[ContactCategory]
ORDER BY [dbo].[ContactCategory].[ContactCategoryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_UpdateByPK]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_UpdateByPK]

@ContactCategoryID		  int,
@ContactCategoryName      nvarchar(50),
@ModificationDate		  datetime

AS

UPDATE [dbo].[ContactCategory]						
SET    [dbo].[ContactCategory].[ContactCategoryName]    =@ContactCategoryName,
	   [dbo].[ContactCategory].[ModificationDate]		=ISNULL (@ModificationDate,getdate())

WHERE  [dbo].[ContactCategory].ContactCategoryID=@ContactCategoryID
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_DeleteByPK]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_City_DeleteByPK]

@CityID		int,
@UserID		int

AS

DELETE
FROM   [dbo].[LOC_City]
WHERE  [dbo].[LOC_City].CityID=@CityID and
		[dbo].[LOC_City].UserID=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_Insert]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_City_Insert]

	@CityName			nvarchar(50),
	@CityCode			nvarchar(50),
	@StateID			int,
	@CountryID			int,
	@CreationDate		datetime,
	@ModificationDate   datetime

AS

INSERT INTO [dbo].[LOC_City]
(
	CityName,
	UserID,
	CityCode,
	StateID,
	CountryID,
	CreationDate,
	ModificationDate
)
VALUES
(
	@CityName,	
	1,
	@CityCode,		
	@StateID,	
	@CountryID,		
	ISNULL(@CreationDate,GETDATE()),
	ISNULL(@ModificationDate,GETDATE())
)
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_Search]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[PR_LOC_City_Search]
@CityName nvarchar(50),
@CityCode nvarchar(50)

AS
Select * from LOC_City
inner join LOC_Country on
LOC_City.CountryID=LOC_Country.CountryID

inner join LOC_State on
LOC_City.StateID=LOC_State.StateID

WHERE (@CityName is null or LOC_City.CityName like '%'+@CityName+'%')
AND   (@CityCode is null or LOC_City.CityCode like '%'+@CityCode+'%')
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_SelectAll]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_City_SelectAll]

@UserID		int

AS
SELECT 
	[dbo].[LOC_City].[CityID],
	[dbo].[LOC_City].[CityName],
	[dbo].[LOC_City].[CityCode],
	[dbo].[LOC_State].[StateName],
	[dbo].[LOC_Country].[CountryName],
	[dbo].[LOC_City].[CreationDate],
	[dbo].[LOC_City].[ModificationDate]

FROM [dbo].[LOC_City]
INNER JOIN [dbo].[LOC_State]
ON [dbo].[LOC_State].[StateID] = [dbo].[LOC_City].[StateID]
INNER JOIN [dbo].[LOC_Country]
ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_City].[CountryID]
WHERE	[dbo].[LOC_City].UserID=@UserID

ORDER BY [dbo].[LOC_City].[StateID]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_SelectByCityName]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_City_SelectByCityName]
@CityName varchar(50)
AS
SELECT
	CityName
FROM LOC_City
WHERE (@CityName IS NULL OR CityName LIKE Concat('%',@CityName,'%'))
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_SelectByPK]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_City_SelectByPK]

@CityID		int,
@UserID		int
AS

SELECT 
		[dbo].[LOC_City].[CityID],
		[dbo].[LOC_City].[CityName],
		[dbo].[LOC_City].[CityCode],
		[dbo].[LOC_City].[StateID],
		[dbo].[LOC_City].[CountryID],
		[dbo].[LOC_City].[CreationDate],
		[dbo].[LOC_City].[ModificationDate]

FROM	[dbo].[LOC_City]

WHERE   [dbo].[LOC_City].CityID=@CityID and
		[dbo].[LOC_City].UserID=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_SelectForDropDown]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_City_SelectForDropDown]
@StateID	int
AS

SELECT	 [dbo].[LOC_City].[CityID],
		 [dbo].[LOC_City].[CityName]
FROM	 [dbo].[LOC_City]
WHERE CAST ([dbo].[LOC_City].[StateID] as int) = CAST(@StateID as int)
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_UpdateByPK]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_City_UpdateByPK]

@CityID        int,
@CityName      nvarchar(50),
@CityCode      nvarchar(50),
@CountryID			int,
@StateID			int,
@ModificationDate datetime

AS

UPDATE [dbo].[LOC_City]						
SET    [dbo].[LOC_City].[CityName]        =@CityName,
	   [dbo].[LOC_City].[CityCode]        =@CityCode,
	   [dbo].[LOC_City].[CountryID]		=@CountryID,
	   [dbo].[LOC_City].[StateID]		=@StateID,
	   [dbo].[LOC_City].[ModificationDate]	=ISNULL (@ModificationDate,getdate())

WHERE  [dbo].[LOC_City].CityID=@CityID
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_DeleteByPK]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_Country_DeleteByPK]

@CountryID	int,
@UserID		int

AS

DELETE
FROM   [dbo].[LOC_Country]
WHERE  [dbo].[LOC_Country].CountryID=@CountryID and
		[dbo].[LOC_Country].UserID=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_Insert]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_Country_Insert]

	@CountryName		nvarchar(50),
	@CountryCode		nvarchar(5),
	@CreationDate		datetime,
	@ModificationDate   datetime

AS

INSERT INTO [dbo].[LOC_Country]
(
	CountryName,
	UserID,
	CountryCode,
	CreationDate,
	ModificationDate
)
VALUES
(
	@CountryName,
	1,
	@CountryCode,
	ISNULL(@CreationDate,GETDATE()),
	ISNULL(@ModificationDate,GETDATE())
)
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_Search]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_LOC_Country_Search]
@CountryName nvarchar(50)
AS
Select * from LOC_Country
WHERE (@CountryName is null or LOC_Country.CountryName like '%'+@CountryName+'%')
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_SelectAll]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_Country_SelectAll]

@UserID		int

AS

SELECT 
		[dbo].[LOC_Country].[CountryID],
		[dbo].[LOC_Country].[CountryName],
		[dbo].[LOC_Country].[CountryCode],
		[dbo].[LOC_Country].[CreationDate],
		[dbo].[LOC_Country].[ModificationDate]

FROM	[dbo].[LOC_Country]
WHERE	[dbo].[LOC_Country].UserID=@UserID

ORDER BY [dbo].[LOC_Country].[CountryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_SelectByCountryName]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_Country_SelectByCountryName]
@CountryName varchar(50)
AS
SELECT
	CountryName
FROM LOC_Country
WHERE (@CountryName IS NULL OR CountryName LIKE Concat('%',@CountryName,'%'))
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_SelectByPK]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_Country_SelectByPK]

@CountryID	int,
@UserID		int
AS

SELECT 
		[dbo].[LOC_Country].[CountryID],
		[dbo].[LOC_Country].[CountryName],
		[dbo].[LOC_Country].[CountryCode],
		[dbo].[LOC_Country].[CreationDate],
		[dbo].[LOC_Country].[ModificationDate]

FROM	[dbo].[LOC_Country]

WHERE   [dbo].[LOC_Country].CountryID=@CountryID and
		[dbo].[LOC_Country].UserID=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_SelectForDropDown]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_Country_SelectForDropDown]

AS

SELECT	 [dbo].[LOC_Country].[CountryID],
		 [dbo].[LOC_Country].[CountryName]

FROM	 [dbo].[LOC_Country]
ORDER BY [dbo].[LOC_Country].[CountryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_UpdateByPK]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_Country_UpdateByPK]

@CountryID        int,
@CountryName      nvarchar(50),
@CountryCode      nvarchar(50),
@ModificationDate datetime

AS

UPDATE [dbo].[LOC_Country]						
SET    [dbo].[LOC_Country].[CountryName]        =@CountryName,
	   [dbo].[LOC_Country].[CountryCode]        =@CountryCode,
	   [dbo].[LOC_Country].[ModificationDate]	=ISNULL (@ModificationDate,getdate())

WHERE  [dbo].[LOC_Country].CountryID=@CountryID
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_DeleteByPK]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_State_DeleteByPK]

@StateID	int,
@UserID		int

AS

DELETE
FROM   [dbo].[LOC_State]
WHERE  [dbo].[LOC_State].StateID=@StateID and
		[dbo].[LOC_State].UserID=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_Insert]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_State_Insert]

	@StateName			nvarchar(50),
	@StateCode			nvarchar(50),
	@CountryID			int,
	@CreationDate		datetime,
	@ModificationDate   datetime

AS

INSERT INTO [dbo].[LOC_State]
(
	StateName,
	UserID,
	StateCode,
	CountryID,
	CreationDate,
	ModificationDate
)
VALUES
(
	@StateName,
	1,
	@StateCode,
	@CountryID,
	ISNULL(@CreationDate,GETDATE()),
	ISNULL(@ModificationDate,GETDATE())
)
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_Search]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_LOC_State_Search]
@StateName nvarchar(50),
@StateCode nvarchar(50)

AS
Select * from LOC_State
inner join LOC_Country on
LOC_State.CountryID=LOC_Country.CountryID
WHERE (@StateName is null or LOC_State.StateName like '%'+@StateName+'%')
AND   (@StateCode is null or LOC_State.StateCode like '%'+@StateCode+'%')
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_SelectAll]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_State_SelectAll]

@UserID		int

AS
SELECT 
		[dbo].[LOC_State].[StateID],
		[dbo].[LOC_State].[StateName],
		[dbo].[LOC_State].[StateCode],
		[dbo].[LOC_Country].[CountryName],
		[dbo].[LOC_State].[CreationDate],
		[dbo].[LOC_State].[ModificationDate]

FROM	[dbo].[LOC_State]
INNER JOIN [dbo].[LOC_Country]
ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_State].[CountryID]
WHERE	[dbo].[LOC_State].UserID=@UserID

ORDER BY [dbo].[LOC_State].[StateName]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_SelectByPK]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_State_SelectByPK]

@StateID	int,
@UserID		int
AS

SELECT 
		[dbo].[LOC_State].[StateID],
		[dbo].[LOC_State].[StateName],
		[dbo].[LOC_State].[StateCode],
		[dbo].[LOC_State].[CountryID],
		[dbo].[LOC_State].[CreationDate],
		[dbo].[LOC_State].[ModificationDate]

FROM	[dbo].[LOC_State]

WHERE   [dbo].[LOC_State].StateID=@StateID  and
		[dbo].[LOC_State].UserID=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_SelectByStateName]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_State_SelectByStateName]
@StateName varchar(50)
AS
SELECT
	StateName
FROM LOC_State
WHERE (@StateName IS NULL OR StateName LIKE Concat('%',@StateName,'%'))
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_SelectForDropDownByCountryID]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_State_SelectForDropDownByCountryID]
@CountryID	int
AS

SELECT	 [dbo].[LOC_State].[StateID],
		 [dbo].[LOC_State].[StateName]
FROM	 [dbo].[LOC_State]
WHERE CAST ([dbo].[LOC_State].[CountryID] as int) = CAST(@CountryID as int) 
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_UpdateByPK]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_State_UpdateByPK]

@StateID			int,
@StateName			nvarchar(50),
@StateCode			nvarchar(50),
@CountryID			int,
@ModificationDate	datetime

AS

UPDATE [dbo].[LOC_State]						
SET    [dbo].[LOC_State].[StateName]        =@StateName,
	   [dbo].[LOC_State].[StateCode]        =@StateCode,
	   [dbo].[LOC_State].[CountryID]		=@CountryID,
	   [dbo].[LOC_State].[ModificationDate]	=ISNULL (@ModificationDate,getdate())

WHERE  [dbo].[LOC_State].StateID=@StateID
GO
/****** Object:  StoredProcedure [dbo].[PR_MAS_Contact_DeleteByPK]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MAS_Contact_DeleteByPK]

@ContactID	int

AS

DELETE
FROM	[dbo].[MAS_Contact]
WHERE	[dbo].[MAS_Contact].[ContactID] = @ContactID
GO
/****** Object:  StoredProcedure [dbo].[PR_MAS_Contact_Insert]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MAS_Contact_Insert]

	@ContactName				nvarchar(50),
	@ContactCategoryID			int,
	@ContactAddress				nvarchar(250),
	@CountryID					int,
	@StateID					int,
	@CityID						int,
	@ContactPincode				int,
	@ContactMobile				nvarchar(15),
	@ContactEmail				nvarchar(50),
	@ContactDOB					date,
	@ContactLinkedIN			nvarchar(50),
	@ContactGender				nvarchar(10),
	@ContactTypeOfProfession	nvarchar(50),
	@ContactCompanyName			nvarchar(50),
	@ContactDesignation			nvarchar(50),
	@PhotoPath					nvarchar(500),
	@CreationDate				datetime,
	@ModificationDate			datetime

AS

INSERT INTO [dbo].[MAS_Contact]
(
	ContactName,	
	UserID,
	ContactCategoryID,
	ContactAddress,	
	CountryID,			
	StateID,			
	CityID,		
	ContactPincode,			
	ContactMobile,			
	ContactEmail,			
	ContactDOB,			
	ContactLinkedIN,	
	ContactGender,			
	ContactTypeOfProfession,
	ContactCompanyName,		
	ContactDesignation,	
	PhotoPath,
	CreationDate,			
	ModificationDate		
)
VALUES
(
	@ContactName,	
	1,
	@ContactCategoryID,
	@ContactAddress,			
	@CountryID,			
	@StateID,			
	@CityID,			
	@ContactPincode,			
	@ContactMobile,			
	@ContactEmail,			
	@ContactDOB,				
	@ContactLinkedIN,		
	@ContactGender,			
	@ContactTypeOfProfession,
	@ContactCompanyName,		
	@ContactDesignation,	
	@PhotoPath,
	ISNULL(@CreationDate,GETDATE()),			
	ISNULL(@ModificationDate,GETDATE())		
)
GO
/****** Object:  StoredProcedure [dbo].[PR_MAS_Contact_SelectAll]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MAS_Contact_SelectAll]

@UserID		int

AS

SELECT
		[dbo].[MAS_Contact].[ContactID],
		[dbo].[MAS_Contact].[ContactName],
		[dbo].[ContactCategory].[ContactCategoryName],
		[dbo].[MAS_Contact].[ContactAddress],
		[dbo].[LOC_Country].[CountryName],
		[dbo].[LOC_State].[StateName],
		[dbo].[LOC_City].[CityName],
		[dbo].[MAS_Contact].[ContactPincode],
		[dbo].[MAS_Contact].[ContactMobile],
		[dbo].[MAS_Contact].[ContactEmail],
		[dbo].[MAS_Contact].[ContactDOB],
		[dbo].[MAS_Contact].[ContactLinkedIN],
		[dbo].[MAS_Contact].[ContactGender],
		[dbo].[MAS_Contact].[ContactTypeOfProfession],
		[dbo].[MAS_Contact].[ContactCompanyName],
		[dbo].[MAS_Contact].[ContactDesignation],
		[dbo].[MAS_Contact].[CreationDate],
		[dbo].[MAS_Contact].[ModificationDate],
		[dbo].[MAS_Contact].[PhotoPath]

FROM [dbo].[MAS_Contact]
INNER JOIN [dbo].[LOC_Country]
ON [dbo].[LOC_Country].[CountryID] = [dbo].[MAS_Contact].[CountryID]
INNER JOIN [dbo].[LOC_State]
ON [dbo].[LOC_State].[StateID] = [dbo].[MAS_Contact].[StateID]
INNER JOIN [dbo].[LOC_City]
ON [dbo].[LOC_City].[CityID] = [dbo].[MAS_Contact].[CityID]
INNER JOIN [dbo].[ContactCategory]
ON [dbo].[ContactCategory].[ContactCategoryID] = [dbo].[MAS_Contact].[ContactCategoryID]
WHERE	[dbo].[LOC_City].UserID=@UserID

ORDER BY [dbo].[MAS_Contact].[ContactName]
GO
/****** Object:  StoredProcedure [dbo].[PR_MAS_Contact_SelectByPK]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MAS_Contact_SelectByPK]

@ContactID	int
AS

SELECT
		[dbo].[MAS_Contact].[ContactID],
		[dbo].[MAS_Contact].[ContactName],
		[dbo].[MAS_Contact].[ContactCategoryID],
		[dbo].[MAS_Contact].[ContactAddress],
		[dbo].[MAS_Contact].[CountryID],
		[dbo].[MAS_Contact].[StateID],
		[dbo].[MAS_Contact].[CityID],
		[dbo].[MAS_Contact].[ContactPincode],
		[dbo].[MAS_Contact].[ContactMobile],
		[dbo].[MAS_Contact].[ContactEmail],
		[dbo].[MAS_Contact].[ContactDOB],
		[dbo].[MAS_Contact].[ContactLinkedIN],
		[dbo].[MAS_Contact].[ContactGender],
		[dbo].[MAS_Contact].[ContactTypeOfProfession],
		[dbo].[MAS_Contact].[ContactCompanyName],
		[dbo].[MAS_Contact].[ContactDesignation],
		[dbo].[MAS_Contact].[CreationDate],
		[dbo].[MAS_Contact].[ModificationDate],
		[dbo].[MAS_Contact].[PhotoPath]

FROM	[dbo].[MAS_Contact]
WHERE	[dbo].[MAS_Contact].[ContactID] = @ContactID
GO
/****** Object:  StoredProcedure [dbo].[PR_MAS_Contact_UpdateByPK]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MAS_Contact_UpdateByPK]

	@ContactID					int,
	@ContactName				nvarchar(50),
	@ContactCategoryID			int,
	@ContactAddress				nvarchar(250),
	@CountryID					int,
	@StateID					int,
	@CityID						int,
	@ContactPincode				int,
	@ContactMobile				nvarchar(15),
	@ContactEmail				nvarchar(50),
	@ContactDOB					date,
	@ContactLinkedIN			nvarchar(50),
	@ContactGender				nvarchar(10),
	@ContactTypeOfProfession	nvarchar(50),
	@ContactCompanyName			nvarchar(50),
	@ContactDesignation			nvarchar(50),
	@PhotoPath					nvarchar(500),
	@ModificationDate			datetime

AS

UPDATE [dbo].[MAS_Contact]
SET
		[dbo].[MAS_Contact].[ContactName]				=@ContactName,
		[dbo].[MAS_Contact].[ContactCategoryID]			=@ContactCategoryID,
		[dbo].[MAS_Contact].[ContactAddress]			=@ContactAddress,
		[dbo].[MAS_Contact].[CountryID]					=@CountryID,
		[dbo].[MAS_Contact].[StateID]					=@StateID,
		[dbo].[MAS_Contact].[CityID]					=@CityID,
		[dbo].[MAS_Contact].[ContactPincode]			=@ContactPincode,
		[dbo].[MAS_Contact].[ContactMobile]				=@ContactMobile,
		[dbo].[MAS_Contact].[ContactEmail]				=@ContactEmail,
		[dbo].[MAS_Contact].[ContactDOB]				=@ContactDOB,
		[dbo].[MAS_Contact].[ContactLinkedIN]			=@ContactLinkedIN,
		[dbo].[MAS_Contact].[ContactGender]				=@ContactGender,
		[dbo].[MAS_Contact].[ContactTypeOfProfession]	=@ContactTypeOfProfession,
		[dbo].[MAS_Contact].[ContactCompanyName]		=@ContactCompanyName,
		[dbo].[MAS_Contact].[ContactDesignation]		=@ContactDesignation,
		[dbo].[MAS_Contact].[PhotoPath]					=@PhotoPath,
		[dbo].[MAS_Contact].[ModificationDate]			=ISNULL(@ModificationDate,GETDATE())
			
WHERE	[dbo].[MAS_Contact].[ContactID] = @ContactID
GO
/****** Object:  StoredProcedure [dbo].[PR_MAS_ContactCategory_SelectForDropDown]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[PR_MAS_ContactCategory_SelectForDropDown]
AS
SELECT	 [dbo].[ContactCategory].[ContactCategoryID],
		 [dbo].[ContactCategory].[ContactCategoryName]				
FROM	 [dbo].[ContactCategory]
ORDER BY [dbo].[ContactCategory].[ContactCategoryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_User_DeleteByPK]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_User_DeleteByPK]

@UserID	int

AS

DELETE
FROM   [dbo].[User]
WHERE  [dbo].[User].UserID=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_User_Insert]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_User_Insert]

	@UserName			nvarchar(20),
	@Password			nvarchar(8)

AS

INSERT INTO [dbo].[User]
(
	UserName,
	Password
)
VALUES
(
	@UserName,
	@Password
)
GO
/****** Object:  StoredProcedure [dbo].[PR_User_SelectAll]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_User_SelectAll]
AS
SELECT 
		[dbo].[User].[UserID],
		[dbo].[User].[UserName],
		[dbo].[User].[Password]

FROM	[dbo].[User]

ORDER BY [dbo].[User].[UserName]
GO
/****** Object:  StoredProcedure [dbo].[PR_User_SelectByIDPass]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_SelectByIDPass]

@UserName		nvarchar(20),
@Password		nvarchar(8)
AS

SELECT
		[dbo].[User].[UserID],
		[dbo].[User].[UserName],
		[dbo].[User].[Password]

FROM	[dbo].[User]

WHERE   [dbo].[User].UserName = @UserName and
		[dbo].[User].Password = @Password
GO
/****** Object:  StoredProcedure [dbo].[PR_User_SelectByPK]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_SelectByPK]

@UserID	int
AS

SELECT 
		[dbo].[User].[UserName],
		[dbo].[User].[Password]

FROM	[dbo].[User]

WHERE   [dbo].[User].UserID=@UserID 
GO
/****** Object:  StoredProcedure [dbo].[PR_User_UpdateByPK]    Script Date: 20-03-2023 03:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_UpdateByPK]

@UserID				int,
@UserName			nvarchar(20),
@Password			nvarchar(8)

AS

UPDATE [dbo].[User]						
SET    [dbo].[User].[UserName]        =@UserName,
	   [dbo].[User].[Password]        =@Password

WHERE  [dbo].[User].UserID=@UserID
GO
USE [master]
GO
ALTER DATABASE [Multi_AddressBook] SET  READ_WRITE 
GO
