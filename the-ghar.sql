USE [master]
GO
/****** Object:  Database [HFO]    Script Date: 11-05-2023 13:38:21 ******/
CREATE DATABASE [HFO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HFO', FILENAME = N'D:\SQL SERVER\MSSQL15.MSSQLSERVER\MSSQL\DATA\HFO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HFO_log', FILENAME = N'D:\SQL SERVER\MSSQL15.MSSQLSERVER\MSSQL\DATA\HFO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HFO] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HFO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HFO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HFO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HFO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HFO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HFO] SET ARITHABORT OFF 
GO
ALTER DATABASE [HFO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HFO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HFO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HFO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HFO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HFO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HFO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HFO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HFO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HFO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HFO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HFO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HFO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HFO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HFO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HFO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HFO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HFO] SET RECOVERY FULL 
GO
ALTER DATABASE [HFO] SET  MULTI_USER 
GO
ALTER DATABASE [HFO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HFO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HFO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HFO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HFO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HFO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HFO', N'ON'
GO
ALTER DATABASE [HFO] SET QUERY_STORE = OFF
GO
USE [HFO]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(2,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](100) NOT NULL,
	[StateID] [int] NOT NULL,
	[AdminID] [int] NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dish]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dish](
	[DishID] [int] IDENTITY(20,1) NOT NULL,
	[HomeID] [int] NOT NULL,
	[DishName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Category] [nvarchar](100) NOT NULL,
	[DishPhoto] [nvarchar](300) NOT NULL,
	[RecipeID] [int] NULL,
	[AdminID] [int] NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DishID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Home]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Home](
	[HomeID] [int] IDENTITY(1,1) NOT NULL,
	[HomeName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[AreaLocation] [nvarchar](100) NOT NULL,
	[Mobile] [nvarchar](20) NOT NULL,
	[Logo] [nvarchar](500) NOT NULL,
	[StateID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[CostPerPerson] [nvarchar](20) NOT NULL,
	[Categories] [nvarchar](100) NULL,
	[AdminID] [int] NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[HomeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HomeOwner]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HomeOwner](
	[HomeOwnerID] [int] IDENTITY(1,1) NOT NULL,
	[OwnerName] [nvarchar](100) NOT NULL,
	[OwnerEmail] [nvarchar](100) NOT NULL,
	[OwnerMobile] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[HomeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HomeOwnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[DishID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Total] [decimal](10, 2) NOT NULL,
	[CityID] [int] NOT NULL,
	[StateID] [int] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[HomeID] [int] NOT NULL,
	[OrderTime] [datetime] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[HomeID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[StateID] [int] NOT NULL,
	[OrderDateTime] [datetime] NOT NULL,
	[Total] [decimal](10, 2) NOT NULL,
	[OrderStatus] [nvarchar](20) NOT NULL,
	[CreationDate] [datetime] NULL,
	[ModifcationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipe]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipe](
	[RecipeID] [int] IDENTITY(8,1) NOT NULL,
	[PrepTime] [nvarchar](100) NOT NULL,
	[CookTime] [nvarchar](100) NOT NULL,
	[TotalTime] [nvarchar](100) NOT NULL,
	[Course] [nvarchar](100) NOT NULL,
	[Cuisine ] [nvarchar](100) NOT NULL,
	[Ingredients] [nvarchar](500) NOT NULL,
	[VideoURL] [nvarchar](500) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Recipe] PRIMARY KEY CLUSTERED 
(
	[RecipeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReviewOfHome]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewOfHome](
	[ReviewofHomeID] [int] IDENTITY(1,1) NOT NULL,
	[HomeID] [int] NULL,
	[UserID] [int] NOT NULL,
	[Rating] [decimal](2, 1) NOT NULL,
	[Comment] [nvarchar](200) NOT NULL,
	[ReviewDate] [datetime] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ReviewOfHome] PRIMARY KEY CLUSTERED 
(
	[ReviewofHomeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateID] [int] IDENTITY(37,1) NOT NULL,
	[StateName] [nvarchar](100) NOT NULL,
	[AdminID] [int] NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(2,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Mobile] [nvarchar](20) NOT NULL,
	[RegistrationDate] [datetime] NULL,
	[LastLoginDate] [datetime] NULL,
	[StateID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[AdminID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminID], [Name], [Email], [Password], [CreationDate], [ModificationDate]) VALUES (1, N'admin11', N'admin1@gmail.com', N'admin1', CAST(N'2023-04-06T09:03:06.497' AS DateTime), CAST(N'2023-04-15T15:45:38.043' AS DateTime))
INSERT [dbo].[Admin] ([AdminID], [Name], [Email], [Password], [CreationDate], [ModificationDate]) VALUES (4, N'admin22', N'admin222@gmail.com', N'admin22', CAST(N'2023-04-15T15:52:59.450' AS DateTime), CAST(N'2023-04-15T15:55:24.990' AS DateTime))
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (14, N'Adilabad', 2, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (15, N'Anantapur', 2, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (16, N'Chittoor', 2, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (17, N'Cuddapah', 2, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (18, N'East Godavari', 2, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (19, N'Guntur', 2, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (20, N'Srikakulam', 2, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (21, N'Visakhapatnam', 2, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (22, N'Vizianagaram', 2, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (23, N'Warangal', 2, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (24, N'West Godavari', 2, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (25, N'Anjaw', 3, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (26, N'Changlang', 3, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (27, N'Dibang Valley', 3, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (28, N'East Kameng', 3, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (29, N'East Siang', 3, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (30, N'Itanagar', 3, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (31, N'Kurung Kumey', 3, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (32, N'Lohit', 3, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (33, N'Lower Dibang Valley', 3, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (34, N'Lower Subansiri', 3, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (35, N'Papum Pare', 3, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (36, N'Tawang', 3, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (37, N'Tirap', 3, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (38, N'Upper Siang', 3, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (39, N'Upper Subansiri', 3, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (40, N'West Kameng', 3, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (41, N'West Siang', 3, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (42, N'Barpeta', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (43, N'Bongaigaon', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (44, N'Cachar', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (45, N'Darrang', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (46, N'Dhemaji', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (47, N'Dhubri', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (48, N'Dibrugarh', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (49, N'Goalpara', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (50, N'Golaghat', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (51, N'Guwahati', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (52, N'Hailakandi', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (53, N'Jorhat', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (54, N'Kamrup', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (55, N'Karbi Anglong', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (56, N'Karimganj', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (57, N'Kokrajhar', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (58, N'Lakhimpur', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (59, N'Marigaon', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (60, N'Nagaon', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (61, N'Nalbari', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (62, N'North Cachar Hills', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (63, N'Silchar', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (64, N'Sivasagar', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (65, N'Sonitpur', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (66, N'Tinsukia', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (67, N'Udalguri', 4, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (68, N'Araria', 5, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (69, N'Aurangabad', 5, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (70, N'Banka', 5, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (71, N'Begusarai', 5, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (72, N'Bhagalpur', 5, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (73, N'Bhojpur', 5, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (74, N'Patna', 5, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (75, N'Purnia', 5, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (76, N'Rohtas', 5, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (77, N'Saharsa', 5, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (78, N'Samastipur', 5, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (79, N'Saran', 5, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (80, N'Sheikhpura', 5, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (81, N'Sheohar', 5, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (82, N'Sitamarhi', 5, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (83, N'Siwan', 5, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (84, N'Supaul', 5, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (85, N'Vaishali', 5, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (86, N'West Champaran', 5, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (87, N'Chandigarh', 6, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (88, N'Mani Marja', 6, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (107, N'Amal', 8, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (108, N'Amli', 8, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (109, N'Bedpa', 8, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (110, N'Chikhli', 8, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (111, N'Dadra & Nagar Haveli', 8, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (112, N'Dahikhed', 8, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (113, N'Dolara', 8, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (114, N'Galonda', 8, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (115, N'Kanadi', 8, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (116, N'Karchond', 8, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (117, N'Khadoli', 8, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (118, N'Kharadpada', 8, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (119, N'Kherabari', 8, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (120, N'Umbarkoi', 8, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (121, N'Vansda', 8, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (122, N'Vasona', 8, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (123, N'Velugam', 8, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (124, N'Brancavare', 9, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (125, N'Dagasi', 9, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (126, N'Daman', 9, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (127, N'Diu', 9, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (128, N'Magarvara', 9, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (129, N'Nagwa', 9, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (130, N'Pariali', 9, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
GO
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (131, N'Passo Covo', 9, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (132, N'Central Delhi', 10, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (133, N'East Delhi', 10, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (134, N'New Delhi', 10, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (135, N'North Delhi', 10, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (136, N'North East Delhi', 10, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (137, N'North West Delhi', 10, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (138, N'Old Delhi', 10, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (139, N'South Delhi', 10, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (140, N'South West Delhi', 10, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (141, N'West Delhi', 10, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (142, N'Canacona', 11, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (143, N'Candolim', 11, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (144, N'Chinchinim', 11, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (145, N'Cortalim', 11, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (146, N'Goa', 11, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (147, N'Jua', 11, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (148, N'Madgaon', 11, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (149, N'Mahem', 11, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (150, N'Mapuca', 11, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (151, N'Marmagao', 11, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (152, N'Panji', 11, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (153, N'Ponda', 11, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (154, N'Sanvordem', 11, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (155, N'Terekhol', 11, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (156, N'Ahmedabad', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (157, N'Amreli', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (158, N'Anand', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (159, N'Banaskantha', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (160, N'Baroda', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (161, N'Bharuch', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (162, N'Bhavnagar', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (163, N'Dahod', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (164, N'Dang', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (165, N'Dwarka', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (166, N'Gandhinagar', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (167, N'Jamnagar', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (168, N'Junagadh', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (169, N'Kheda', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (170, N'Kutch', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (171, N'Mehsana', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (172, N'Nadiad', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (173, N'Narmada', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (174, N'Navsari', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (175, N'Panchmahals', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (176, N'Patan', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (177, N'Porbandar', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (178, N'Rajkot', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (179, N'Sabarkantha', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (180, N'Surat', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (181, N'Surendranagar', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (182, N'Vadodara', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (183, N'Valsad', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (184, N'Vapi', 12, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (185, N'Ambala', 13, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (186, N'Bhiwani', 13, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (187, N'Faridabad', 13, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (188, N'Fatehabad', 13, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (189, N'Gurgaon', 13, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (190, N'Hisar', 13, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (191, N'Sirsa', 13, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (192, N'Sonipat', 13, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (193, N'Yamunanagar', 13, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (194, N'Bilaspur', 14, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (195, N'Chamba', 14, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (196, N'Dalhousie', 14, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (197, N'Hamirpur', 14, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (198, N'Kangra', 14, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (199, N'Kinnaur', 14, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (200, N'Kullu', 14, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (201, N'Lahaul & Spiti', 14, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (202, N'Mandi', 14, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (203, N'Shimla', 14, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (204, N'Sirmaur', 14, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (205, N'Solan', 14, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (206, N'Una', 14, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (207, N'Anantnag', 15, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (208, N'Baramulla', 15, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (209, N'Budgam', 15, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (210, N'Doda', 15, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (211, N'Jammu', 15, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (212, N'Kargil', 15, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (213, N'Kathua', 15, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (214, N'Kupwara', 15, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (215, N'Leh', 15, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (216, N'Poonch', 15, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (217, N'Pulwama', 15, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (218, N'Rajauri', 15, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (219, N'Srinagar', 15, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (220, N'Udhampur', 15, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (221, N'Bokaro', 16, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (222, N'Chatra', 16, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (223, N'Deoghar', 16, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (224, N'Dhanbad', 16, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (225, N'Palamu', 16, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (226, N'Ranchi', 16, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (227, N'Sahibganj', 16, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (228, N'Seraikela', 16, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (229, N'Simdega', 16, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (230, N'West Singhbhum', 16, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
GO
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (231, N'Bagalkot', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (232, N'Bangalore', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (233, N'Bangalore Rural', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (234, N'Belgaum', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (235, N'Bellary', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (236, N'Bhatkal', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (237, N'Bidar', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (238, N'Kodagu', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (239, N'Kolar', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (240, N'Koppal', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (241, N'Madikeri', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (242, N'Mandya', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (243, N'Mangalore', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (244, N'Manipal', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (245, N'Mysore', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (246, N'Raichur', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (247, N'Shimoga', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (248, N'Sirsi', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (249, N'Sringeri', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (250, N'Srirangapatna', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (251, N'Tumkur', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (252, N'Udupi', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (253, N'Uttara Kannada', 17, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (254, N'Alappuzha', 18, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (255, N'Alleppey', 18, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (256, N'Alwaye', 18, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (257, N'Ernakulam', 18, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (258, N'Idukki', 18, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (259, N'Perumbavoor', 18, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (260, N'Thiruvananthapuram', 18, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (261, N'Thrissur', 18, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (262, N'Trichur', 18, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (263, N'Trivandrum', 18, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (264, N'Wayanad', 18, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (265, N'Agatti Island', 19, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (266, N'Bingaram Island', 19, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (267, N'Bitra Island', 19, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (268, N'Chetlat Island', 19, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (269, N'Kadmat Island', 19, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (270, N'Kalpeni Island', 19, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (271, N'Kavaratti Island', 19, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (272, N'Kiltan Island', 19, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (273, N'Lakshadweep Sea', 19, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (274, N'Minicoy Island', 19, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (275, N'North Island', 19, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (276, N'South Island', 19, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (277, N'Anuppur', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (278, N'Ashoknagar', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (279, N'Balaghat', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (280, N'Barwani', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (281, N'Betul', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (282, N'Bhind', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (283, N'Bhopal', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (284, N'Burhanpur', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (285, N'Chhatarpur', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (286, N'Chhindwara', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (287, N'Damoh', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (288, N'Datia', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (289, N'Dewas', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (290, N'Ratlam', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (291, N'Rewa', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (292, N'Sagar', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (293, N'Satna', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (294, N'Sehore', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (295, N'Seoni', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (296, N'Shahdol', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (297, N'Shajapur', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (298, N'Sheopur', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (299, N'Shivpuri', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (300, N'Sidhi', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (301, N'Tikamgarh', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (302, N'Ujjain', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (303, N'Umaria', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (304, N'Vidisha', 20, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (305, N'Beed', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (306, N'Bhandara', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (307, N'Buldhana', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (308, N'Chandrapur', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (309, N'Dhule', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (310, N'Gadchiroli', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (311, N'Gondia', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (312, N'Jalna', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (313, N'Kolhapur', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (314, N'Latur', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (315, N'Mahabaleshwar', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (316, N'Mumbai', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (317, N'Mumbai City', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (318, N'Mumbai Suburban', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (319, N'Nagpur', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (320, N'Nanded', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (321, N'Nandurbar', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (322, N'Nashik', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (323, N'Osmanabad', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (324, N'Parbhani', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (325, N'Pune', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (326, N'Raigad', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (327, N'Ratnagiri', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (328, N'Sangli', 21, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (329, N'Bishnupur', 22, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (330, N'Chandel', 22, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
GO
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (331, N'Churachandpur', 22, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (332, N'Imphal East', 22, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (333, N'Imphal West', 22, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (334, N'Senapati', 22, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (335, N'Tamenglong', 22, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (336, N'Thoubal', 22, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (337, N'Ukhrul', 22, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (338, N'East Garo Hills', 23, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (339, N'East Khasi Hills', 23, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (340, N'Jaintia Hills', 23, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (341, N'Ri Bhoi', 23, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (342, N'Shillong', 23, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (343, N'South Garo Hills', 23, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (344, N'West Garo Hills', 23, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (345, N'West Khasi Hills', 23, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (346, N'Aizawl', 24, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (347, N'Champhai', 24, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (348, N'Kolasib', 24, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (349, N'Lawngtlai', 24, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (350, N'Lunglei', 24, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (351, N'Mamit', 24, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (352, N'Saiha', 24, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (353, N'Serchhip', 24, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (354, N'Dimapur', 25, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (355, N'Kohima', 25, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (356, N'Mokokchung', 25, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (357, N'Mon', 25, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (358, N'Phek', 25, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (359, N'Tuensang', 25, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (360, N'Wokha', 25, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (361, N'Zunheboto', 25, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (362, N'Angul', 26, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (363, N'Balangir', 26, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (364, N'Balasore', 26, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (365, N'Baleswar', 26, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (366, N'Bargarh', 26, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (367, N'Berhampur', 26, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (368, N'Bhadrak', 26, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (369, N'Bhubaneswar', 26, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (370, N'Boudh', 26, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (371, N'Koraput', 26, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (372, N'Sambalpur', 26, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (373, N'Subarnapur', 26, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (374, N'Sundergarh', 26, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (375, N'Bahur', 27, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (376, N'Karaikal', 27, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (377, N'Mahe', 27, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (378, N'Pondicherry', 27, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (379, N'Purnankuppam', 27, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (380, N'Valudavur', 27, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (381, N'Villianur', 27, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (382, N'Yanam', 27, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (383, N'Amritsar', 28, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (384, N'Barnala', 28, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (385, N'Bathinda', 28, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (386, N'Faridkot', 28, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (387, N'Fatehgarh Sahib', 28, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (388, N'Ferozepur', 28, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (389, N'Gurdaspur', 28, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (390, N'Hoshiarpur', 28, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (391, N'Jalandhar', 28, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (392, N'Kapurthala', 28, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (393, N'Ludhiana', 28, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (394, N'Mansa', 28, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (395, N'Moga', 28, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (396, N'Muktsar', 28, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (397, N'Nawanshahr', 28, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (398, N'Pathankot', 28, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (399, N'Patiala', 28, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (400, N'Rupnagar', 28, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (401, N'Sangrur', 28, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (402, N'SAS Nagar', 28, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (403, N'Tarn Taran', 28, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (404, N'Ajmer', 29, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (405, N'Alwar', 29, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (406, N'Chittorgarh', 29, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (407, N'Churu', 29, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (408, N'Dausa', 29, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (409, N'Dholpur', 29, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (410, N'Dungarpur', 29, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (411, N'Hanumangarh', 29, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (412, N'Jaipur', 29, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (413, N'Jaisalmer', 29, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (414, N'Jalore', 29, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (415, N'Jhalawar', 29, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (416, N'Jhunjhunu', 29, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (417, N'Jodhpur', 29, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (418, N'Karauli', 29, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (419, N'Kota', 29, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (420, N'Nagaur', 29, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (421, N'Pali', 29, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (422, N'Pilani', 29, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (423, N'Udaipur', 29, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (424, N'Barmiak', 30, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (425, N'Be', 30, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (426, N'Bhurtuk', 30, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (427, N'Chhubakha', 30, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (428, N'Chidam', 30, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (429, N'Chubha', 30, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (430, N'Chumikteng', 30, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
GO
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (431, N'Dentam', 30, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (432, N'Dikchu', 30, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (433, N'Chennai', 31, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (434, N'Chidambaram', 31, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (435, N'Chingleput', 31, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (436, N'Coimbatore', 31, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (437, N'Courtallam', 31, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (438, N'Cuddalore', 31, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (439, N'Dharmapuri', 31, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (440, N'Dindigul', 31, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (441, N'Erode', 31, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (442, N'Hosur', 31, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (443, N'Kanchipuram', 31, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (444, N'Kanyakumari', 31, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (445, N'Karaikudi', 31, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (446, N'Agartala', 32, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (447, N'Ambasa', 32, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (448, N'Bampurbari', 32, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (449, N'Belonia', 32, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (450, N'Alipur', 1, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (451, N'Andaman Island', 1, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (452, N'Anderson Island', 1, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (453, N'Arainj-Laka-Punga', 1, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (454, N'Austinabad', 1, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (455, N'Bamboo Flat', 1, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (456, N'Barren Island', 1, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (457, N'Beadonabad', 1, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (458, N'Betapur', 1, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (459, N'Bindraban', 1, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (460, N'Bonington', 1, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (461, N'Brookesabad', 1, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (480, N'Bastar', 7, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (481, N'Bhilai', 7, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (482, N'Bijapur', 7, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (483, N'Bilaspur', 7, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (484, N'Dhamtari', 7, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (485, N'Durg', 7, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (486, N'Janjgir-Champa', 7, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (487, N'Jashpur', 7, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (488, N'Kabirdham-Kawardha', 7, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (489, N'Korba', 7, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (490, N'Korea', 7, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (491, N'Mahasamund', 7, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (492, N'Narayanpur', 7, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (493, N'Norh Bastar-Kanker', 7, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (494, N'Raigarh', 7, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (495, N'Raipur', 7, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (496, N'Rajnandgaon', 7, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (497, N'Surguja', 7, 1, CAST(N'2023-04-06T09:01:54.817' AS DateTime), CAST(N'2023-04-06T09:01:54.817' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [AdminID], [CreationDate], [ModificationDate]) VALUES (502, N'xyz', 12, 1, CAST(N'2023-04-15T11:06:09.940' AS DateTime), CAST(N'2023-04-15T11:39:10.610' AS DateTime))
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Dish] ON 

INSERT [dbo].[Dish] ([DishID], [HomeID], [DishName], [Description], [Price], [Category], [DishPhoto], [RecipeID], [AdminID], [CreationDate], [ModificationDate]) VALUES (6, 6, N'dcca', N'kkkk', CAST(666.00 AS Decimal(10, 2)), N'hnhn', N'nbn', NULL, 1, CAST(N'2023-04-11T11:22:58.873' AS DateTime), CAST(N'2023-04-11T11:22:58.873' AS DateTime))
INSERT [dbo].[Dish] ([DishID], [HomeID], [DishName], [Description], [Price], [Category], [DishPhoto], [RecipeID], [AdminID], [CreationDate], [ModificationDate]) VALUES (11, 2, N'sfd', N'dfsfs', CAST(12.00 AS Decimal(10, 2)), N'zzzzzzzzzzzz', N'sdfsf', 18, NULL, CAST(N'2023-04-18T16:50:03.897' AS DateTime), CAST(N'2023-04-18T16:50:03.897' AS DateTime))
SET IDENTITY_INSERT [dbo].[Dish] OFF
GO
SET IDENTITY_INSERT [dbo].[Home] ON 

INSERT [dbo].[Home] ([HomeID], [HomeName], [Email], [AreaLocation], [Mobile], [Logo], [StateID], [CityID], [CostPerPerson], [Categories], [AdminID], [CreationDate], [ModificationDate]) VALUES (2, N'SargamFood', N'sargamfood@gmail.com', N'Junction Plot', N'88888888', N'C:\Users\swapn\Desktop\The Ghar\sargam.jpeg', 12, 168, N'200 FOR TWO', N'Chinese, North Indian, South Indian, Burgers, Pizzas, Biryani', 1, NULL, NULL)
INSERT [dbo].[Home] ([HomeID], [HomeName], [Email], [AreaLocation], [Mobile], [Logo], [StateID], [CityID], [CostPerPerson], [Categories], [AdminID], [CreationDate], [ModificationDate]) VALUES (3, N'Jay Bhawani Vadapav', N'jaybhawani@gmail.com', N'Kalawad Road', N'77777777', N'C:\Users\swapn\Desktop\The Ghar\sargam.jpeg', 12, 168, N'200 FOR TWO', NULL, 1, NULL, NULL)
INSERT [dbo].[Home] ([HomeID], [HomeName], [Email], [AreaLocation], [Mobile], [Logo], [StateID], [CityID], [CostPerPerson], [Categories], [AdminID], [CreationDate], [ModificationDate]) VALUES (4, N'Joker Gathiya', N'jokergathiya@gmail.com', N'Limbda Chowk', N'66666666', N'C:\Users\swapn\react_project\first_project', 12, 168, N'100 FOR TWO', NULL, 1, NULL, NULL)
INSERT [dbo].[Home] ([HomeID], [HomeName], [Email], [AreaLocation], [Mobile], [Logo], [StateID], [CityID], [CostPerPerson], [Categories], [AdminID], [CreationDate], [ModificationDate]) VALUES (5, N'La Milano Pizzeria', N'lamilanopizzeria@gmail.com', N'Race Course Road', N'55555555', N'C:\Users\swapn\react_project\first_project', 12, 168, N'399 FOR TWO', NULL, 1, NULL, NULL)
INSERT [dbo].[Home] ([HomeID], [HomeName], [Email], [AreaLocation], [Mobile], [Logo], [StateID], [CityID], [CostPerPerson], [Categories], [AdminID], [CreationDate], [ModificationDate]) VALUES (6, N'Chatkaaz', N'chatkaaz@gmail.com', N'Limbda Chowk', N'44444444', N'C:\Users\swapn\react_project\first_project', 12, 168, N'200 FOR TWO', NULL, 1, NULL, NULL)
INSERT [dbo].[Home] ([HomeID], [HomeName], [Email], [AreaLocation], [Mobile], [Logo], [StateID], [CityID], [CostPerPerson], [Categories], [AdminID], [CreationDate], [ModificationDate]) VALUES (8, N'SwapnilKARestaurent', N'abc@gmail.com', N'Mayani', N'2222', N'/Upload\HomeImages/Screenshot (16).png', 12, 168, N'200 For Two', N'multi', NULL, CAST(N'2023-04-16T00:55:07.890' AS DateTime), CAST(N'2023-04-17T08:09:33.470' AS DateTime))
INSERT [dbo].[Home] ([HomeID], [HomeName], [Email], [AreaLocation], [Mobile], [Logo], [StateID], [CityID], [CostPerPerson], [Categories], [AdminID], [CreationDate], [ModificationDate]) VALUES (11, N'gfsgsd', N'yvyufyu', N'vttyfv', N'sdsdg', N'/Upload/Screenshot (6).png', 3, 28, N'yugg', N'ersers', NULL, CAST(N'2023-04-16T19:39:38.773' AS DateTime), CAST(N'2023-04-16T19:39:38.773' AS DateTime))
SET IDENTITY_INSERT [dbo].[Home] OFF
GO
SET IDENTITY_INSERT [dbo].[HomeOwner] ON 

INSERT [dbo].[HomeOwner] ([HomeOwnerID], [OwnerName], [OwnerEmail], [OwnerMobile], [Password], [HomeID]) VALUES (5, N'swapnil', N'sargamfood@gmail.com', N'888888888', N'sk', 2)
INSERT [dbo].[HomeOwner] ([HomeOwnerID], [OwnerName], [OwnerEmail], [OwnerMobile], [Password], [HomeID]) VALUES (6, N'dhruvin', N'jaybhawani@gmail.com', N'777777777', N'dhr', 3)
INSERT [dbo].[HomeOwner] ([HomeOwnerID], [OwnerName], [OwnerEmail], [OwnerMobile], [Password], [HomeID]) VALUES (8, N'swapnil', N'a@gmail.com', N'11111', N's999', 8)
INSERT [dbo].[HomeOwner] ([HomeOwnerID], [OwnerName], [OwnerEmail], [OwnerMobile], [Password], [HomeID]) VALUES (11, N'cyy', N'fyt', N'yf', N'fyuf', 11)
SET IDENTITY_INSERT [dbo].[HomeOwner] OFF
GO
SET IDENTITY_INSERT [dbo].[Recipe] ON 

INSERT [dbo].[Recipe] ([RecipeID], [PrepTime], [CookTime], [TotalTime], [Course], [Cuisine ], [Ingredients], [VideoURL], [CreationDate], [ModificationDate]) VALUES (1, N'20', N'20', N'20', N'Main', N'chinese', N'xyz', N'dsfss', CAST(N'2023-04-18T13:34:22.447' AS DateTime), CAST(N'2023-04-18T13:34:22.447' AS DateTime))
INSERT [dbo].[Recipe] ([RecipeID], [PrepTime], [CookTime], [TotalTime], [Course], [Cuisine ], [Ingredients], [VideoURL], [CreationDate], [ModificationDate]) VALUES (2, N'30', N'30', N'30', N'Main', N'Chinese', N'xcv', N'sgwsg', CAST(N'2023-04-18T16:07:22.850' AS DateTime), CAST(N'2023-04-18T16:07:22.850' AS DateTime))
INSERT [dbo].[Recipe] ([RecipeID], [PrepTime], [CookTime], [TotalTime], [Course], [Cuisine ], [Ingredients], [VideoURL], [CreationDate], [ModificationDate]) VALUES (17, N'zzzzzzzzzzzz', N'zzzzzzzzzzzz', N'zzzzzzzzzzzz', N'zzzzzzzzzzzz', N'zzzzzzzzzzzz', N'zzzzzzzzzzzz', N'fsfs', CAST(N'2023-04-18T16:45:06.753' AS DateTime), CAST(N'2023-04-18T16:45:06.753' AS DateTime))
INSERT [dbo].[Recipe] ([RecipeID], [PrepTime], [CookTime], [TotalTime], [Course], [Cuisine ], [Ingredients], [VideoURL], [CreationDate], [ModificationDate]) VALUES (18, N'zzzzzzzzzzzz', N'zzzzzzzzzzzz', N'zzzzzzzzzzzz', N'zzzzzzzzzzzz', N'zzzzzzzzzzzz', N'zzzzzzzzzzzz', N'fsfs', CAST(N'2023-04-18T16:50:04.000' AS DateTime), CAST(N'2023-04-18T16:50:04.000' AS DateTime))
INSERT [dbo].[Recipe] ([RecipeID], [PrepTime], [CookTime], [TotalTime], [Course], [Cuisine ], [Ingredients], [VideoURL], [CreationDate], [ModificationDate]) VALUES (19, N'zzzzzzzzzzzz', N'zzzzzzzzzzzz', N'zzzzzzzzzzzz', N'zzzzzzzzzzzz', N'zzzzzzzzzzzz', N'zzzzzzzzzzzz', N'fsfs', CAST(N'2023-04-18T16:50:54.967' AS DateTime), CAST(N'2023-04-18T16:50:54.967' AS DateTime))
SET IDENTITY_INSERT [dbo].[Recipe] OFF
GO
SET IDENTITY_INSERT [dbo].[ReviewOfHome] ON 

INSERT [dbo].[ReviewOfHome] ([ReviewofHomeID], [HomeID], [UserID], [Rating], [Comment], [ReviewDate], [CreationDate], [ModificationDate]) VALUES (4, 2, 1, CAST(4.4 AS Decimal(2, 1)), N'gserhyteh eth wrtth wsth shj', CAST(N'2023-03-22T18:49:04.260' AS DateTime), CAST(N'2023-04-07T18:29:48.167' AS DateTime), CAST(N'2023-04-07T18:29:48.167' AS DateTime))
SET IDENTITY_INSERT [dbo].[ReviewOfHome] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (1, N'Andaman & Nicobar', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (2, N'Andhra Pradesh', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (3, N'Arunachal Pradesh', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (4, N'Assam', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (5, N'Bihar', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (6, N'Chandigarh', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (7, N'Chhattisgarh', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (8, N'Dadra & Nagar Haveli', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (9, N'Daman & Diu', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (10, N'Delhi', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (11, N'Goa', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (12, N'Gujarat', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (13, N'Haryana', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (14, N'Himachal Pradesh', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (15, N'Jammu & Kashmir', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (16, N'Jharkhand', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (17, N'Karnataka', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (18, N'Kerala', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (19, N'Lakshadweep', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (20, N'Madhya Pradesh', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (21, N'Maharashtra', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (22, N'Manipur', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (23, N'Meghalaya', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (24, N'Mizoram', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (25, N'Nagaland', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (26, N'Orissa', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (27, N'Pondicherry', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (28, N'Punjab', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (29, N'Rajasthan', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (30, N'Sikkim', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (31, N'Tamil Nadu', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (32, N'Tripura', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (33, N'Uttar Pradesh', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (34, N'Uttaranchal', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [AdminID], [CreationDate], [ModificationDate]) VALUES (35, N'West Bengal', 1, CAST(N'2023-04-11T21:57:30.610' AS DateTime), CAST(N'2023-04-11T21:57:30.610' AS DateTime))
SET IDENTITY_INSERT [dbo].[State] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Name], [Email], [Password], [Address], [Mobile], [RegistrationDate], [LastLoginDate], [StateID], [CityID], [CreationDate], [ModificationDate], [AdminID]) VALUES (1, N'Dhruvin', N'dhruvin@gmail.com', N'dhr', N'gahiybgyuabgiuabg airwbgiuyawbgiuaenafg agargarihgaiurgh', N'54648456156', CAST(N'2023-03-22T18:14:46.377' AS DateTime), CAST(N'2023-03-22T18:14:46.377' AS DateTime), 12, 168, NULL, NULL, 1)
INSERT [dbo].[Users] ([UserID], [Name], [Email], [Password], [Address], [Mobile], [RegistrationDate], [LastLoginDate], [StateID], [CityID], [CreationDate], [ModificationDate], [AdminID]) VALUES (2, N'Dhairya', N'dhairya@gmail.com', N'hifgh', N'ghfiurwgurwg giuwrhguwrgwrg wrgiwhrg', N'54684854564', CAST(N'2023-03-22T18:15:48.373' AS DateTime), CAST(N'2023-03-22T18:15:48.373' AS DateTime), 12, 169, NULL, NULL, 1)
INSERT [dbo].[Users] ([UserID], [Name], [Email], [Password], [Address], [Mobile], [RegistrationDate], [LastLoginDate], [StateID], [CityID], [CreationDate], [ModificationDate], [AdminID]) VALUES (3, N'Swapnil Kotadiya', N'swapnilkotadiya999@gmail.com', N'swapnil9999', N'Blk no.22 , Pooja Park 3 , Mayani Chowk , Rajkot', N'7567595140', CAST(N'2023-04-03T15:54:46.453' AS DateTime), CAST(N'2023-04-03T15:54:46.453' AS DateTime), 12, 156, CAST(N'2023-04-03T15:54:46.453' AS DateTime), CAST(N'2023-04-03T15:54:46.453' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Admin] ADD  CONSTRAINT [DEFAULT_Admin_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Admin] ADD  CONSTRAINT [DEFAULT_Admin_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[City] ADD  CONSTRAINT [DEFAULT_City_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[City] ADD  CONSTRAINT [DEFAULT_City_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[Dish] ADD  CONSTRAINT [DEFAULT_Dish_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Dish] ADD  CONSTRAINT [DEFAULT_Dish_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[Home] ADD  CONSTRAINT [DEFAULT_Home_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Home] ADD  CONSTRAINT [DEFAULT_Home_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DEFAULT_OrderDetails_OrderTime]  DEFAULT (getdate()) FOR [OrderTime]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DEFAULT_OrderDetails_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DEFAULT_OrderDetails_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DEFAULT_Orders_OrderDateTime]  DEFAULT (getdate()) FOR [OrderDateTime]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DEFAULT_Orders_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DEFAULT_Orders_ModifcationDate]  DEFAULT (getdate()) FOR [ModifcationDate]
GO
ALTER TABLE [dbo].[Recipe] ADD  CONSTRAINT [DEFAULT_Recipe_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Recipe] ADD  CONSTRAINT [DEFAULT_Recipe_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[ReviewOfHome] ADD  CONSTRAINT [DEFAULT_ReviewOfHome_ReviewDate]  DEFAULT (getdate()) FOR [ReviewDate]
GO
ALTER TABLE [dbo].[ReviewOfHome] ADD  CONSTRAINT [DEFAULT_ReviewOfHome_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ReviewOfHome] ADD  CONSTRAINT [DEFAULT_ReviewOfHome_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[State] ADD  CONSTRAINT [DEFAULT_State_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[State] ADD  CONSTRAINT [DEFAULT_State_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DEFAULT_Users_RegistrationDate]  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DEFAULT_Users_LastLoginDate]  DEFAULT (getdate()) FOR [LastLoginDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DEFAULT_Users_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DEFAULT_Users_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_AdminID] FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([AdminID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_AdminID]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_CityTable_StateID] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_CityTable_StateID]
GO
ALTER TABLE [dbo].[Dish]  WITH CHECK ADD  CONSTRAINT [FK_Dish_AdminID] FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([AdminID])
GO
ALTER TABLE [dbo].[Dish] CHECK CONSTRAINT [FK_Dish_AdminID]
GO
ALTER TABLE [dbo].[Dish]  WITH CHECK ADD  CONSTRAINT [FK_Dish_HomeID] FOREIGN KEY([HomeID])
REFERENCES [dbo].[Home] ([HomeID])
GO
ALTER TABLE [dbo].[Dish] CHECK CONSTRAINT [FK_Dish_HomeID]
GO
ALTER TABLE [dbo].[Dish]  WITH CHECK ADD  CONSTRAINT [FK_Dish_RecipeID] FOREIGN KEY([RecipeID])
REFERENCES [dbo].[Recipe] ([RecipeID])
GO
ALTER TABLE [dbo].[Dish] CHECK CONSTRAINT [FK_Dish_RecipeID]
GO
ALTER TABLE [dbo].[Home]  WITH CHECK ADD  CONSTRAINT [FK_Home_AdminID] FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([AdminID])
GO
ALTER TABLE [dbo].[Home] CHECK CONSTRAINT [FK_Home_AdminID]
GO
ALTER TABLE [dbo].[Home]  WITH CHECK ADD  CONSTRAINT [FK_HomeFoodTable_CityID] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Home] CHECK CONSTRAINT [FK_HomeFoodTable_CityID]
GO
ALTER TABLE [dbo].[Home]  WITH CHECK ADD  CONSTRAINT [FK_HomeFoodTable_StateID] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[Home] CHECK CONSTRAINT [FK_HomeFoodTable_StateID]
GO
ALTER TABLE [dbo].[HomeOwner]  WITH NOCHECK ADD  CONSTRAINT [FK_HomeOwner_HomeID] FOREIGN KEY([HomeID])
REFERENCES [dbo].[Home] ([HomeID])
GO
ALTER TABLE [dbo].[HomeOwner] CHECK CONSTRAINT [FK_HomeOwner_HomeID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_HomeID] FOREIGN KEY([HomeID])
REFERENCES [dbo].[Home] ([HomeID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_HomeID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailsTable_CityID] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetailsTable_CityID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailsTable_DishID] FOREIGN KEY([DishID])
REFERENCES [dbo].[Dish] ([DishID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetailsTable_DishID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailsTable_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetailsTable_OrderID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailsTable_StateID] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetailsTable_StateID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailsTable_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetailsTable_UserID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_HomeID] FOREIGN KEY([HomeID])
REFERENCES [dbo].[Home] ([HomeID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_HomeID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_OrdersTable_CityID] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_OrdersTable_CityID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_OrdersTable_StateID] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_OrdersTable_StateID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_OrdersTable_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_OrdersTable_UserID]
GO
ALTER TABLE [dbo].[ReviewOfHome]  WITH NOCHECK ADD  CONSTRAINT [FK_Review_HomeID] FOREIGN KEY([HomeID])
REFERENCES [dbo].[Home] ([HomeID])
GO
ALTER TABLE [dbo].[ReviewOfHome] CHECK CONSTRAINT [FK_Review_HomeID]
GO
ALTER TABLE [dbo].[ReviewOfHome]  WITH CHECK ADD  CONSTRAINT [FK_ReviewOfHomeTable_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ReviewOfHome] CHECK CONSTRAINT [FK_ReviewOfHomeTable_UserID]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_AdminID] FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([AdminID])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_AdminID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_AdminID] FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([AdminID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_AdminID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_CityID] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_CityID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_StateID] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_StateID]
GO
/****** Object:  StoredProcedure [dbo].[PR_Admin_DeleteByPK]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_Admin_DeleteByPK]
	@AdminID int 
AS
Delete 
from [dbo].[Admin]
Where [dbo].[Admin].[AdminID] = @AdminID
GO
/****** Object:  StoredProcedure [dbo].[PR_Admin_GetValue_For_Edit]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Admin_GetValue_For_Edit]

	@AdminID		int
AS 

SELECT
		[dbo].[Admin].[AdminID]
		,[dbo].[Admin].[Name]
		,[dbo].[Admin].[Email]
		,[dbo].[Admin].[Password]
		,[dbo].[Admin].[CreationDate]
		,[dbo].[Admin].[ModificationDate]
		
FROM	
		[dbo].[Admin]
WHERE	
		[dbo].[Admin].[AdminID] = @AdminID
GO
/****** Object:  StoredProcedure [dbo].[PR_Admin_Insert]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Admin_Insert]
		@Name		nvarchar(100)
		,@Email		nvarchar(100)
		,@Password		nvarchar(100)
		,@CreationDate		datetime
		,@ModificationDate datetime
		
AS
INSERT INTO [dbo].[Admin]
(
	[dbo].[Admin].[Name]
	,[dbo].[Admin].[Email]
	,[dbo].[Admin].[Password]
	,[dbo].[Admin].[CreationDate]
	,[dbo].[Admin].[ModificationDate]

)
VALUES
(
	@Name
	,@Email
	,@Password	
	,ISNULL(GETDATE(), @CreationDate)
	,ISNULL(GETDATE(), @ModificationDate)
)
GO
/****** Object:  StoredProcedure [dbo].[PR_Admin_SelectAll]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Admin_SelectAll]
AS
SELECT 
	[dbo].[Admin].[AdminID]
	,[dbo].[Admin].[Name]
	,[dbo].[Admin].[Email]
	,[dbo].[Admin].[Password]
	,[dbo].[Admin].[CreationDate]
	,[dbo].[Admin].[ModificationDate]
	
 FROM 
	[dbo].[Admin]
GO
/****** Object:  StoredProcedure [dbo].[PR_Admin_UpdateByPK]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Admin_UpdateByPK]

	@AdminID				int
	,@Name			nvarchar(100)
	,@Email			nvarchar(100)
	,@Password			nvarchar(100)
	,@ModificationDate			datetime
	

AS 

UPDATE [dbo].[Admin]

SET	
		[Name] = @Name
		,[Email] = @Email
		,[Password] = @Password
		,[ModificationDate] = ISNULL(@ModificationDate,Getdate())
		
WHERE	[AdminID] = @AdminID
GO
/****** Object:  StoredProcedure [dbo].[PR_AdminLogin_SelectByEmailPassword]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_AdminLogin_SelectByEmailPassword]
	@Email nvarchar(100)
	,@Password nvarchar(100)
AS 
SELECT
		[dbo].[Admin].[AdminID]
		,[dbo].[Admin].[Name]
		,[dbo].[Admin].[Email]
		,[dbo].[Admin].[Password]
		
		
		,[dbo].[Admin].[CreationDate]
		,[dbo].[Admin].[ModificationDate]
        
		
		
		
FROM	
		[dbo].[Admin]
WHERE	
		[dbo].[Admin].[Email] = @Email
AND		[dbo].[Admin].[Password] = @Password


GO
/****** Object:  StoredProcedure [dbo].[PR_City_DeleteByPK]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_City_DeleteByPK]
	@CityID int 
AS
Delete 
from [dbo].[City]
Where [dbo].[City].[CityID] = @CityID
GO
/****** Object:  StoredProcedure [dbo].[PR_City_GetValue_For_Edit]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_City_GetValue_For_Edit]
	@CityID int

AS

Select
[dbo].City.[CityID],
[dbo].City.[StateID],
[dbo].[City].[CityName],
[dbo].City.[AdminID],
[dbo].City.[CreationDate],
[dbo].City.[ModificationDate]

from [dbo].City
where [dbo].City.[CityID] = @CityID 

Order by [dbo].City.[CityName]
GO
/****** Object:  StoredProcedure [dbo].[PR_City_Insert]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_City_Insert]


@StateID  as int,
@CityName as nvarchar(100),

@CreationDate as datetime,
@ModificationDate as datetime,
@AdminID as int

AS

Insert Into [dbo].[City]
(
	
	StateID,
	CityName,
	CreationDate,
	ModificationDate,
	AdminID

)

Values
(
	
	@StateID,
	@CityName,
	ISNULL(@CreationDate,GETDATE()),
	ISNULL(@ModificationDate,GETDATE()),
	@AdminID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectAll_By_Admin]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[PR_City_SelectAll_By_Admin]
	@AdminID int
AS

Select
[dbo].City.[CityID],
[dbo].City.[CityName],
[dbo].City.[CreationDate],
[dbo].City.[ModificationDate],
[dbo].City.[StateID],
[dbo].[State].[StateName]


from [dbo].City


INNER Join [dbo].[State]
ON [dbo].[State].[StateID] = [dbo].[City].[StateID]

INNER JOIN [dbo].[Admin]
ON [dbo].[Admin].[AdminID] = [dbo].[City].[AdminID]
WHERE [dbo].[City].[AdminID]=@AdminID

Order by [dbo].[State].[StateName]
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectPage]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_SelectPage]
		
		@StateName			nvarchar(100)
		,@CityName			nvarchar(100)
		,@AdminID			int
AS
SELECT 
		[dbo].[City].[CityID]
		
		,[dbo].[State].[StateName]
		,[dbo].[City].[CityName]
       
		,[dbo].[City].[CreationDate]
		,[dbo].[City].[ModificationDate]
		,[dbo].[City].[AdminID]
FROM
		[dbo].[City]

INNER JOIN		
		[dbo].[State]
ON 
		[dbo].[City].[StateID] = [dbo].[State].[StateID]
WHERE
		[dbo].[City].[AdminID] = @AdminID

AND		( @StateName is null or [dbo].[State].[StateName] like '%'+@StateName+'%')
AND		( @CityName is null or [dbo].[City].[CityName] like '%'+@CityName+'%')
ORDER BY
		
		[dbo].[State].[StateName]
		,[dbo].[City].[CityName]
GO
/****** Object:  StoredProcedure [dbo].[PR_City_UpdateByPK]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_City_UpdateByPK]
	@CityID int,

	@StateID int,
	@CityName nvarchar(100),
	
	@ModificationDate datetime,
	@AdminID int
AS

Update [dbo].[City]
Set 
	[dbo].[City].[StateID] = @StateID,
	[dbo].[City].[CityName] = @CityName,

	[dbo].[City].[ModificationDate]= GETDATE(),
	[dbo].City.[AdminID]=@AdminID
Where [dbo].[City].[CityID]=@CityID AND
[dbo].City.[AdminID]=@AdminID
GO
/****** Object:  StoredProcedure [dbo].[PR_Dish_And_Recipe_Insert]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Dish_And_Recipe_Insert]
(
    @HomeID int,
    @DishName NVARCHAR(100),
    @Description NVARCHAR(100),
    @Price DECIMAL(10,2),
    @Category NVARCHAR(100),
    @DishPhoto NVARCHAR(300),
    @CreationDate DATETIME,
    @ModificationDate DATETIME,
    @PrepTime NVARCHAR(100),
    @CookTime NVARCHAR(100),
    @TotalTime NVARCHAR(100),
    @Course NVARCHAR(100),
    @Cuisine NVARCHAR(100),
    @Ingredients NVARCHAR(100),
    @VideoURL NVARCHAR(500)
)
   
AS

BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    DECLARE @DishID INT;
    DECLARE @RecipeID INT;

    -- Insert data into the Dish table
    INSERT INTO Dish (DishName, Description,Price,Category,DishPhoto,CreationDate,ModificationDate,HomeID)
    VALUES (@DishName, @Description,@Price,@Category,@DishPhoto,ISNULL(@CreationDate,GETDATE()),ISNULL(@ModificationDate,GETDATE()),@HomeID);

    -- Get the newly inserted DishID
    SET @DishID = SCOPE_IDENTITY();

    -- Insert data into the Recipe table
    INSERT INTO Recipe (PrepTime,CookTime,TotalTime,Course,Cuisine,Ingredients,VideoURl)
    VALUES (@PrepTime,@CookTime,@TotalTime,@Course,@Cuisine,@Ingredients,@VideoURl);

    -- Get the newly inserted RecipeID
    SET @RecipeID = SCOPE_IDENTITY();

    -- Update the Dish table with the RecipeID
    UPDATE Dish
    SET RecipeID = @RecipeID
    WHERE DishID = @DishID;

    COMMIT TRANSACTION;
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Dish_DeleteByPK]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_Dish_DeleteByPK] 

    @DishID INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    BEGIN TRY
        -- First, delete the row from the Dish table
        DELETE FROM Dish
        WHERE DishID = @DishID;

        -- Next, delete the row from the Recipe table
        
        DELETE FROM Recipe
        WHERE RecipeID = @DishID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT ERROR_MESSAGE();
    END CATCH
END






GO
/****** Object:  StoredProcedure [dbo].[PR_Dish_GetValue_For_Edit]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_Dish_GetValue_For_Edit] 
	@DishID as int
AS

Select
[dbo].[Dish].[DishID],
[dbo].[Home].[HomeID],
[dbo].[Home].[HomeName],
[dbo].[Dish].[DishName],
[dbo].[Dish].[Description],
[dbo].[Dish].[Price],
[dbo].[Dish].[Category],
[dbo].[Dish].[DishPhoto],
[dbo].[Recipe].[RecipeID],
[dbo].[Recipe].[PrepTime],
[dbo].[Recipe].[CookTime],
[dbo].[Recipe].[TotalTime],
[dbo].[Recipe].[Course],
[dbo].[Recipe].[Cuisine ],
[dbo].[Recipe].[Ingredients] ,
[dbo].[Recipe].[VideoURL] 

from [dbo].[Dish]

INNER JOIN [dbo].[Home]
ON [dbo].[Dish].[HomeID] = [dbo].[Home].[HomeID]

INNER JOIN [dbo].[Recipe]
ON [dbo].[Dish].[RecipeID] = [dbo].[Recipe].[RecipeID]

where [dbo].[Dish].[DishID] = @DishID and Recipe.RecipeID = @DishID 


GO
/****** Object:  StoredProcedure [dbo].[PR_Dish_SelectAll_By_HomeID]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_Dish_SelectAll_By_HomeID] 
	@HomeID as int
AS

Select
[dbo].[Dish].[DishID],
[dbo].[Home].[HomeID],
[dbo].[Home].[HomeName],
[dbo].[Dish].[DishName],
[dbo].[Dish].[Description],
[dbo].[Dish].[Price],
[dbo].[Dish].[Category],
[dbo].[Dish].[DishPhoto],
[dbo].[Dish].[RecipeID],
[dbo].[Dish].[CreationDate],
[dbo].[Dish].[ModificationDate],
[dbo].[Recipe].[RecipeID],
[dbo].[Recipe].[PrepTime],
[dbo].[Recipe].[CookTime],
[dbo].[Recipe].[TotalTime],
[dbo].[Recipe].[Course],
[dbo].[Recipe].[Cuisine],
[dbo].[Recipe].[Ingredients] ,
[dbo].[Recipe].[VideoURL] 

from [dbo].[Dish]

INNER JOIN [dbo].[Home]
ON [dbo].[Dish].[HomeID] = [dbo].[Home].[HomeID]

INNER JOIN [dbo].[Recipe]
ON [dbo].[Dish].[RecipeID] = [dbo].[Recipe].[RecipeID]

where [dbo].[Dish].[HomeID] = @HomeID 


GO
/****** Object:  StoredProcedure [dbo].[PR_Dish_UpdateByPK]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[PR_Dish_UpdateByPK]
@DishID int,
@DishName NVARCHAR(100),
    @Description NVARCHAR(100),
    @Price DECIMAL(10,2),
    @Category NVARCHAR(100),
    @DishPhoto NVARCHAR(300),
    @ModificationDate DATETIME,
    @RecipeID int,
 @PrepTime NVARCHAR(100),
    @CookTime NVARCHAR(100),
    @TotalTime NVARCHAR(100),
    @Course NVARCHAR(100),
    @Cuisine NVARCHAR(100),
    @Ingredients NVARCHAR(100),
    @VideoURl NVARCHAR(500)
AS

Update [dbo].[Dish]

Set 
	[dbo].[Dish].[DishName] = @DishName,
	[dbo].[Dish].[Description] = @Description,
    [dbo].[Dish].[Price] = @Price,
    [dbo].[Dish].[Category] = @Category,
    [dbo].[Dish].[DishPhoto] = @DishPhoto,
    [dbo].[Dish].[ModificationDate] = GETDATE()
where DishID = @DishID


UPDATE [dbo].[Recipe]

SET

    [dbo].[Recipe].PrepTime = @PrepTime,
    [dbo].[Recipe].CookTime = @CookTime,
    [dbo].[Recipe].TotalTime = @TotalTime,
    [dbo].[Recipe].Course = @Course,
    [dbo].[Recipe].[Cuisine ] = @Cuisine,
    [dbo].[Recipe].Ingredients = @Ingredients,
    [dbo].[Recipe].VideoURL = @VideoURl

    where RecipeID = @RecipeID

GO
/****** Object:  StoredProcedure [dbo].[PR_Dishes_OF_Home]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_Dishes_OF_Home] 
@HomeID INT

AS

SELECT 

[dbo].[Home].[HomeName], 
dbo.Home.CostPerPerson, 
dbo.Home.AreaLocation, 
dbo.Home.Categories,
dbo.ReviewOfHome.Rating,
dbo.Dish.DishID,
dbo.Dish.DishName,
dbo.Dish.DishPhoto,
dbo.Dish.Price,
dbo.Dish.[Description]

FROM dbo.Home
INNER JOIN [dbo].[Dish] 
ON [dbo].[Dish].[HomeID]  =  [dbo].[Home].[HomeID]

INNER Join [dbo].[ReviewOfHome]
ON [dbo].[ReviewOfHome].[HomeID]=[dbo].[Home].[HomeID]

WHERE [dbo].[Dish].HomeID = @HomeID 
GO
/****** Object:  StoredProcedure [dbo].[PR_Home_And_HomeOwner_Insert]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Home_And_HomeOwner_Insert]
(
    @HomeName NVARCHAR(100),
    @Email NVARCHAR(100),
    @AreaLocation NVARCHAR(100),
    @Mobile NVARCHAR(20),
    @Logo NVARCHAR(500),
    @StateID int,
    @CityID int,
    @CostPerPerson NVARCHAR(20),
    @Categories NVARCHAR(100),
    @CreationDate DATETIME,
    @ModificationDate DATETIME,
    @OwnerName NVARCHAR(100),
    @OwnerEmail NVARCHAR(100),
    @OwnerMobile NVARCHAR(20),
    @Password NVARCHAR(100)
    
)
AS
BEGIN
    DECLARE @HomeID INT
    INSERT INTO Home (HomeName, Email, AreaLocation, Mobile , Logo ,StateID,CityID, CostPerPerson , Categories , CreationDate,ModificationDate)
    VALUES (@HomeName, @Email, @AreaLocation, @Mobile,@Logo,@StateID,@CityID,@CostPerPerson,@Categories,ISNULL(@CreationDate,GETDATE()),ISNULL(@ModificationDate,GETDATE()))
    SET @HomeID = @@IDENTITY
    
    INSERT INTO HomeOwner (OwnerName, HomeID, OwnerEmail, OwnerMobile , Password)
    VALUES (@OwnerName, @HomeID, @OwnerEmail, @OwnerMobile , @Password)
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Home_DeleteByPK]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_Home_DeleteByPK]
	@HomeID int 
AS
Delete 
from [dbo].[HomeOwner]
Where [dbo].[HomeOwner].[HomeID] = @HomeID
DELETE
from [dbo].[Home]
Where [dbo].[Home].[HomeID] = @HomeID
GO
/****** Object:  StoredProcedure [dbo].[PR_Home_GetValue_For_Edit]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[PR_Home_GetValue_For_Edit]
	@HomeID int

AS

Select
[dbo].Home.[HomeID],
[dbo].Home.[HomeName],
[dbo].Home.[Email],
[dbo].Home.[AreaLocation],
[dbo].Home.[Mobile],
[dbo].[Home].[StateID],
[dbo].[Home].[CityID],
[dbo].[Home].[CostPerPerson],
[dbo].[Home].[Categories],
[dbo].[Home].[CreationDate],
[dbo].[Home].[ModificationDate],
[dbo].[Home].[Logo],
[dbo].[HomeOwner].[HomeOwnerID],
[dbo].[HomeOwner].[OwnerName],
[dbo].[HomeOwner].[OwnerEmail],
[dbo].[HomeOwner].[OwnerMobile],
[dbo].[HomeOwner].[Password]

from [dbo].Home
INNER Join [dbo].[HomeOwner]
ON [dbo].[HomeOwner].[HomeID] = [dbo].[Home].[HomeID]
where [dbo].Home.[HomeID] = @HomeID and [dbo].HomeOwner.HomeID=@HomeID 


GO
/****** Object:  StoredProcedure [dbo].[PR_Home_SelectAll]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_Home_SelectAll]
	
AS

Select
[dbo].Home.[HomeID],
[dbo].Home.[HomeName],
[dbo].Home.[Email],
[dbo].Home.[AreaLocation],
[dbo].Home.[Mobile],
[dbo].[State].[StateName],
[dbo].[City].[CityName],
[dbo].[Home].[CostPerPerson],
[dbo].[Home].[Categories],
[dbo].[Home].[CreationDate],
[dbo].[Home].[ModificationDate],
[dbo].[Home].[Logo],
[dbo].[HomeOwner].[HomeOwnerID],
[dbo].[HomeOwner].[OwnerName],
[dbo].[HomeOwner].[OwnerEmail],
[dbo].[HomeOwner].[OwnerMobile],
[dbo].[HomeOwner].[Password]



from [dbo].Home


INNER Join [dbo].[State]
ON [dbo].[State].[StateID] = [dbo].[Home].[StateID]
INNER Join [dbo].[City]
ON [dbo].[City].[CityID] = [dbo].[Home].[CityID]
INNER Join [dbo].[HomeOwner]
ON [dbo].[HomeOwner].[HomeID] = [dbo].[Home].[HomeID]



GO
/****** Object:  StoredProcedure [dbo].[PR_Home_UpdateByPK]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_Home_UpdateByPK]
@HomeID int,
	 @HomeName nvarchar(100),
 @Email nvarchar(100),
 @AreaLocation nvarchar(100),
 @Mobile nvarchar(20),
 @Logo nvarchar(500),
 @StateID int,
 @CityID int,
 @CostPerPerson nvarchar(20),
 @Categories nvarchar(100),
 
 @ModificationDate datetime,
 @HomeOwnerID int,
 @OwnerName nvarchar(100),
 @OwnerEmail nvarchar(100),
 @OwnerMobile nvarchar(20),
 @Password nvarchar(100)
AS

Update [dbo].[Home]

Set 
	[dbo].[Home].[HomeName] = @HomeName,
	[dbo].[Home].[Email] = @Email,
    [dbo].[Home].[AreaLocation] = @AreaLocation,
    [dbo].[Home].[Mobile] = @Mobile,
    [dbo].[Home].[Logo] = @Logo,
    [dbo].[Home].[StateID] = @StateID,
    [dbo].[Home].[CityID] = @CityID,
    [dbo].[Home].[CostPerPerson] = @CostPerPerson,
    [dbo].[Home].[Categories] = @Categories,
    [dbo].[Home].[ModificationDate] = GETDATE()
where HomeID = @HomeID


UPDATE [dbo].[HomeOwner]

SET

    [dbo].[HomeOwner].OwnerName = @OwnerName,
    [dbo].[HomeOwner].OwnerEmail = @OwnerEmail,
    [dbo].[HomeOwner].OwnerMobile = @OwnerMobile,
    [dbo].[HomeOwner].Password = @Password

    where HomeOwnerID = @HomeOwnerID

GO
/****** Object:  StoredProcedure [dbo].[PR_HomePage_HomeList_SelectAll]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_HomePage_HomeList_SelectAll]
    @UserID INT
AS
BEGIN
    DECLARE @StateID INT
    DECLARE @CityID INT

    -- Get the user's state and city IDs
    SELECT @StateID = StateID, @CityID = CityID
    FROM [Users]
    WHERE UserID = @UserID

    -- Get the list of restaurants in the user's state and city
    SELECT 
    [dbo].[Home].[HomeID],
[dbo].[Home].[HomeName],
[dbo].[Home].[AreaLocation],
[dbo].[City].[CityName],
[dbo].[State].[StateName],
[dbo].[Home].[Categories],
[dbo].[Home].[CostPerPerson]
    FROM Home 
    INNER JOIN City ON Home.CityID = City.CityID
    INNER JOIN State ON City.StateID = State.StateID
    WHERE City.CityID = @CityID AND State.StateID = @StateID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_DropdownByStateID]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[PR_LOC_City_DropdownByStateID]
@StateID int
AS
SELECT [dbo].[City].[CityID],
	[dbo].[City].[CityName]
	FROM [dbo].[City]
	WHERE CAST([dbo].[City].[StateID] as Int) = CAST(@StateID as Int)
	
GO
/****** Object:  StoredProcedure [dbo].[PR_State_DeleteByPK]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[PR_State_DeleteByPK]
	@StateID int 
AS
Delete 
from [dbo].[State]
Where [dbo].[State].[StateID] = @StateID
GO
/****** Object:  StoredProcedure [dbo].[PR_State_Dropdown]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[PR_State_Dropdown]

AS
SELECT [dbo].[State].[StateID],
		[dbo].[State].[StateName]
From [dbo].[State]

GO
/****** Object:  StoredProcedure [dbo].[PR_State_GetValue_For_Edit]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[PR_State_GetValue_For_Edit]
	@StateID int
	
AS

Select
[dbo].[State].[StateID],
[dbo].[State].[StateName],
[dbo].[State].[AdminID],
[dbo].[State].[CreationDate],
[dbo].[State].[ModificationDate]

from [dbo].[State]
where [dbo].[State].[StateID] = @StateID 

Order by [dbo].[State].[StateName]
GO
/****** Object:  StoredProcedure [dbo].[PR_State_Insert]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[PR_State_Insert]


@StateName as nvarchar(100),
@AdminID as int,
@CreationDate as datetime,
@ModificationDate as datetime


AS

Insert Into [dbo].[State]
(
	

	StateName,
	AdminID,
	CreationDate,
	ModificationDate
)

Values
(
	

@StateName ,
@AdminID ,
ISNULL(@CreationDate ,GETDATE()),
ISNULL(@ModificationDate ,GETDATE())
)
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectAll_By_Admin]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_State_SelectAll_By_Admin]
	@AdminID as int
AS

Select
[dbo].[State].[StateID],
[dbo].[State].[StateName],
[dbo].[State].[AdminID],
[dbo].[State].[CreationDate],
[dbo].[State].[ModificationDate]


from [dbo].[State]

INNER JOIN [dbo].[Admin]
ON [dbo].[Admin].[AdminID] = [dbo].[Admin].[AdminID]

Where  [dbo].[State].[AdminID]=@AdminID
Order by [dbo].[State].[StateName]
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectPage]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_SelectPage]
	
		@StateName			nvarchar(100)
		,@AdminID			int
AS
SELECT 
		[dbo].[State].[StateID]
		,[dbo].[State].[StateName]
		,[dbo].[State].[CreationDate]
		,[dbo].[State].[ModificationDate]
		,[dbo].[State].[AdminID]
FROM
		[dbo].[State]

WHERE
		[dbo].[State].[AdminID] = @AdminID

AND		( @StateName is null or [dbo].[State].[StateName] like '%'+@StateName+'%')
ORDER BY
		[dbo].[State].[StateName]
GO
/****** Object:  StoredProcedure [dbo].[PR_State_UpdateByPK]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[PR_State_UpdateByPK]
	@StateID int,
	@StateName nvarchar(100),
	@ModificationDate datetime,
	@AdminID int
AS

Update [dbo].[State]
Set 
	[dbo].[State].[StateName] = @StateName,
	[dbo].[State].[ModificationDate]= GETDATE(),
	[dbo].[State].[AdminID]=@AdminID
Where [dbo].[State].[StateID]=@StateID AND
[dbo].[State].[AdminID]=@AdminID
GO
/****** Object:  StoredProcedure [dbo].[PR_UserLogin_SelectByEmailPassword]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_UserLogin_SelectByEmailPassword]
	@Email nvarchar(50)
	,@Password nvarchar(50)
AS 
SELECT
		[dbo].[Users].[UserID]
		,[dbo].[Users].[Name]
		,[dbo].[Users].[Email]
		,[dbo].[Users].[Password]
		,[dbo].[Users].[Address]
		,[dbo].[Users].[Mobile]
		
		,[dbo].[Users].[RegistrationDate]
		,[dbo].[Users].[LastLoginDate]
        
		
		
		
FROM	
		[dbo].[Users]
WHERE	
		[dbo].[Users].[Email] = @Email
AND		[dbo].[Users].[Password] = @Password


GO
/****** Object:  StoredProcedure [dbo].[PR_Users_DeleteByPK]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_Users_DeleteByPK]
	@UserID int 
AS
Delete 
from [dbo].[Users]
Where [dbo].[Users].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_Users_GetValue_For_Edit]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_Users_GetValue_For_Edit]
	@UserID int
	
AS

Select
[dbo].[Users].[Name]
	,[dbo].[Users].[Email]
	,[dbo].[Users].[Password]
	,[dbo].[Users].[Address]
	,[dbo].[Users].[Mobile]
	,[dbo].[Users].[RegistrationDate]
	,[dbo].[Users].[LastLoginDate]
	,[dbo].[Users].[CreationDate]
    ,[dbo].[Users].[ModificationDate]
    ,[dbo].[Users].[StateID]
    ,[dbo].[Users].[CityID]

from [dbo].[Users]
where [dbo].[Users].[UserID] = @UserID 


GO
/****** Object:  StoredProcedure [dbo].[PR_Users_Insert]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Users_Insert]
		@Name		nvarchar(50)
		,@Email		nvarchar(100)
		,@Password		nvarchar(20)
		,@Address		nvarchar(200)
		,@Mobile  nvarchar(20)
		,@RegistrationDate		DATETIME
        ,@LastLoginDate  DATETIME
		,@CreationDate		datetime
		,@ModificationDate		datetime
        ,@StateID int
        ,@CityID int
AS
INSERT INTO [dbo].[Users]
(
	[dbo].[Users].[Name]
	,[dbo].[Users].[Email]
	,[dbo].[Users].[Password]
	,[dbo].[Users].[Address]
	,[dbo].[Users].[Mobile]
	,[dbo].[Users].[RegistrationDate]
	,[dbo].[Users].[LastLoginDate]
	,[dbo].[Users].[CreationDate]
    ,[dbo].[Users].[ModificationDate]
    ,[dbo].[Users].[StateID]
    ,[dbo].[Users].[CityID]
    
)
VALUES
(
	@Name
	,@Email
	,@Password
    ,@Address
    ,@Mobile
    ,ISNULL(GETDATE(),@RegistrationDate)
    ,ISNULL(GETDATE(),@LastLoginDate)
	,ISNULL(GETDATE(), @CreationDate)
	,ISNULL(GETDATE(), @ModificationDate)
    ,@StateID
    ,@CityID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_Users_SelectAll]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_Users_SelectAll]

AS

Select
[dbo].[Users].[UserID],
[dbo].[Users].[Name]
	,[dbo].[Users].[Email]
	,[dbo].[Users].[Password]
	,[dbo].[Users].[Address]
	,[dbo].[Users].[Mobile]
	,[dbo].[Users].[RegistrationDate]
	,[dbo].[Users].[LastLoginDate]
	,[dbo].[Users].[CreationDate]
    ,[dbo].[Users].[ModificationDate]
    ,[dbo].[State].[StateName]
    ,[dbo].[City].[CityName]

from [dbo].[Users]

Inner Join [dbo].[State]
ON [dbo].[State].[StateID]=[Users].[StateID]

Inner Join [dbo].[City]
ON [dbo].[City].[CityID]=[Users].[CityID]


Order by [dbo].[Users].[Name]
GO
/****** Object:  StoredProcedure [dbo].[PR_Users_UpdateByPK]    Script Date: 11-05-2023 13:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[PR_Users_UpdateByPK]
        @UserID int,
	    @Name		nvarchar(100),
		@Email		nvarchar(100)
		,@Password		nvarchar(20)
		,@Address		nvarchar(200)
		,@Mobile  nvarchar(20)
		
		,@ModificationDate		datetime
        ,@StateID int
        ,@CityID int
AS

Update [dbo].[Users]
Set 
	[dbo].[Users].[Name] = @Name,
	[dbo].[Users].[ModificationDate]= GETDATE(),
	[dbo].[Users].[Email]=@Email,
    [dbo].[Users].[Password]=@Password,
    [dbo].[Users].[Address]=@Address,
    [dbo].[Users].[Mobile]=@Mobile,
    [dbo].[Users].[StateID]=@StateID,
    [dbo].[Users].[CityID]=@CityID
Where [dbo].[Users].[UserID]=@UserID 

GO
USE [master]
GO
ALTER DATABASE [HFO] SET  READ_WRITE 
GO
