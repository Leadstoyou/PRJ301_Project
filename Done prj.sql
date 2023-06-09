USE [master]
GO
/****** Object:  Database [GenshinFood]    Script Date: 11/2/2022 3:15:54 PM ******/
CREATE DATABASE [GenshinFood]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GenshinFood', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GenshinFood.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GenshinFood_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GenshinFood_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GenshinFood] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GenshinFood].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GenshinFood] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GenshinFood] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GenshinFood] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GenshinFood] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GenshinFood] SET ARITHABORT OFF 
GO
ALTER DATABASE [GenshinFood] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GenshinFood] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GenshinFood] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GenshinFood] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GenshinFood] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GenshinFood] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GenshinFood] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GenshinFood] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GenshinFood] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GenshinFood] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GenshinFood] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GenshinFood] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GenshinFood] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GenshinFood] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GenshinFood] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GenshinFood] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GenshinFood] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GenshinFood] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GenshinFood] SET  MULTI_USER 
GO
ALTER DATABASE [GenshinFood] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GenshinFood] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GenshinFood] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GenshinFood] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GenshinFood] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GenshinFood] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GenshinFood] SET QUERY_STORE = OFF
GO
USE [GenshinFood]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/2/2022 3:15:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[AccountName] [nvarchar](30) NULL,
	[UserName] [varchar](30) NULL,
	[PassWord] [varchar](30) NULL,
	[UserNumber] [char](10) NULL,
	[UserAddress] [nvarchar](50) NULL,
	[UserRole] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 11/2/2022 3:15:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Bill_ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[DateBill] [datetime] NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[Bill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 11/2/2022 3:15:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogId] [int] IDENTITY(1,1) NOT NULL,
	[BlogName] [nvarchar](100) NULL,
	[BlogDate] [date] NULL,
	[Author] [nvarchar](30) NULL,
	[BlogDetail] [nvarchar](500) NULL,
	[BlogImage] [nvarchar](20) NULL,
	[BlogCategory] [int] NULL,
	[Links] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogCategory]    Script Date: 11/2/2022 3:15:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogCategory](
	[BlogCategoryId] [int] NOT NULL,
	[BlogCategoryName] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[BlogCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/2/2022 3:15:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
	[CategoryDescribe] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 11/2/2022 3:15:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[FoodID] [int] IDENTITY(1,1) NOT NULL,
	[FoodName] [nvarchar](100) NULL,
	[Price] [numeric](5, 2) NULL,
	[Quatity] [int] NULL,
	[Describe] [nvarchar](400) NULL,
	[Region] [nvarchar](10) NULL,
	[FoodImage] [nvarchar](max) NULL,
	[CategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food_Customer]    Script Date: 11/2/2022 3:15:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food_Customer](
	[FoodID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
	[FoodLike] [bit] NULL,
	[FoodAddToCart] [bit] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC,
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order Detail]    Script Date: 11/2/2022 3:15:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order Detail](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[FoodID] [int] NULL,
	[FoodQuatity] [int] NULL,
	[OrderDate] [datetime2](7) NULL,
	[Bill_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order Detail History]    Script Date: 11/2/2022 3:15:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order Detail History](
	[OrderID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
	[FoodID] [int] NOT NULL,
	[FoodQuatity] [int] NULL,
	[Vote] [int] NULL,
	[DateOrder] [datetime] NULL,
	[Bill_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 11/2/2022 3:15:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[AddCartDate] [datetime] NULL,
	[AddCartValue] [numeric](10, 2) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountID], [AccountName], [UserName], [PassWord], [UserNumber], [UserAddress], [UserRole]) VALUES (1, N'Trinh Tien Dat', N'Leadstoyou', N'abcdghik', N'0947257842', N'Ha Noi', N'admin')
INSERT [dbo].[Account] ([AccountID], [AccountName], [UserName], [PassWord], [UserNumber], [UserAddress], [UserRole]) VALUES (2, N'customer', N'sa', N'sa', N'14123     ', N'Ha Noi', N'customer')
INSERT [dbo].[Account] ([AccountID], [AccountName], [UserName], [PassWord], [UserNumber], [UserAddress], [UserRole]) VALUES (3, N'hehe', N'hehe1234', N'huhu', N'098765432 ', N'ha noi', N'customer')
INSERT [dbo].[Account] ([AccountID], [AccountName], [UserName], [PassWord], [UserNumber], [UserAddress], [UserRole]) VALUES (4, N'LmaoLMao', N'lmao', N'1234', N'123123    ', N'adsad', N'customer')
INSERT [dbo].[Account] ([AccountID], [AccountName], [UserName], [PassWord], [UserNumber], [UserAddress], [UserRole]) VALUES (5, N'jadsdas', N'1234', N'1234', N'13123     ', N'asd', N'customer')
INSERT [dbo].[Account] ([AccountID], [AccountName], [UserName], [PassWord], [UserNumber], [UserAddress], [UserRole]) VALUES (6, N'Tester', N'Tester1', N'1234', N'123124123 ', N'ha noi', N'customer')
INSERT [dbo].[Account] ([AccountID], [AccountName], [UserName], [PassWord], [UserNumber], [UserAddress], [UserRole]) VALUES (7, N'dattt', N'final1', N'1234', N'012345678 ', N'ha noi', N'customer')
INSERT [dbo].[Account] ([AccountID], [AccountName], [UserName], [PassWord], [UserNumber], [UserAddress], [UserRole]) VALUES (8, N'LmaoLmao', N'123456', N'123456', N'123456    ', N'hung yen', N'customer')
INSERT [dbo].[Account] ([AccountID], [AccountName], [UserName], [PassWord], [UserNumber], [UserAddress], [UserRole]) VALUES (9, N'Dat', N'sa1', N'123', N'0947257842', N'Hung Yen', N'customer')
INSERT [dbo].[Account] ([AccountID], [AccountName], [UserName], [PassWord], [UserNumber], [UserAddress], [UserRole]) VALUES (10, N'tester123', N'test123', N'123', N'1234567   ', N'Hung Yen', N'customer')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (1, 2, CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (2, 8, CAST(N'2022-10-31T11:30:24.767' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (3, 8, CAST(N'2022-10-31T12:29:36.653' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (4, 8, CAST(N'2022-10-31T12:29:36.670' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (5, 8, CAST(N'2022-10-31T12:30:55.027' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (6, 8, CAST(N'2022-10-31T12:37:11.827' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (7, 8, CAST(N'2022-10-31T13:28:24.717' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (8, 8, CAST(N'2022-10-31T13:30:51.103' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (9, 8, CAST(N'2022-10-31T13:31:49.430' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (10, 8, CAST(N'2022-10-31T14:40:26.853' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (11, 8, CAST(N'2022-10-31T14:44:42.177' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (12, 8, CAST(N'2022-10-31T15:04:02.167' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (13, 8, CAST(N'2022-10-31T15:06:12.707' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (14, 8, CAST(N'2022-10-31T15:09:34.883' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (15, 8, CAST(N'2022-10-31T15:38:42.400' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (16, 8, CAST(N'2022-10-31T15:45:49.567' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (17, 2, CAST(N'2022-10-31T15:47:07.640' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (18, 2, CAST(N'2022-11-02T12:10:15.450' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (19, 2, CAST(N'2022-11-02T12:10:40.367' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (20, 2, CAST(N'2022-11-02T13:16:39.933' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (21, 1, CAST(N'2022-11-02T13:26:34.183' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (22, 1, CAST(N'2022-11-02T13:53:20.067' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (23, 1, CAST(N'2022-11-02T13:55:57.363' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (24, 9, CAST(N'2022-11-02T14:02:59.467' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (25, 9, CAST(N'2022-11-02T14:05:23.667' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (26, 9, CAST(N'2022-11-02T14:06:30.483' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (27, 9, CAST(N'2022-11-02T14:07:22.997' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (28, 9, CAST(N'2022-11-02T14:08:01.600' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (29, 9, CAST(N'2022-11-02T14:08:41.353' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (30, 10, CAST(N'2022-11-02T14:10:37.610' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (31, 9, CAST(N'2022-11-02T14:12:39.413' AS DateTime))
INSERT [dbo].[Bill] ([Bill_ID], [AccountID], [DateBill]) VALUES (32, 9, CAST(N'2022-11-02T14:28:20.310' AS DateTime))
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([BlogId], [BlogName], [BlogDate], [Author], [BlogDetail], [BlogImage], [BlogCategory], [Links]) VALUES (1, N'Noelle Cosplay From Genshin Impact KFC Collaboration', CAST(N'2021-06-06' AS Date), N'Genshin Impact Official', N'Few days ago community has been hearing a lot about Genshin Impact collaboration with KFC China. At first it’s just be treated as rumor, and then image of Diluc as butler and Noelle as maid in KFC surfacing until until the official news released.', N'Image/blog1.png', 4, N'https://genshindb.org/cosplay/noelle-cosplay-from-genshin-impact-kfc-collaboration')
INSERT [dbo].[Blog] ([BlogId], [BlogName], [BlogDate], [Author], [BlogDetail], [BlogImage], [BlogCategory], [Links]) VALUES (2, N'Scenery and Sentiment: Mondstadt Edition', CAST(N'2022-10-21' AS Date), N'Genshin Impact Official', N'While searching for the meaning of your journey, don''''t forget the sights that once accompanied you on your travels.

As the river of time flows on, the whispers of the wind carry an everlasting song that has traveled across the mountains and seas.

Production: HoYoverse & Sun Creature Studio

Music: HOYO-MiX', N'Image/blog2.png', 2, N'https://www.youtube.com/watch?v=_XwlRU2lrPM')
INSERT [dbo].[Blog] ([BlogId], [BlogName], [BlogDate], [Author], [BlogDetail], [BlogImage], [BlogCategory], [Links]) VALUES (3, N'Paimon''''s Gastronomical Journey', CAST(N'2022-09-12' AS Date), N'Genshin Impact Official', N'Dear Travelers, 

Genshin Impact x Domino''''s Pizza Collaboration Event will be available in Malaysia, Singapore, and Thailand soon! 

Travellers can purchase Genshin Impact x Domino''''s Pizza Emergency Food combos from all Domino''''s Pizza outlets, while stocks last. Details of the Emergency Food combo can be found at https://hoyo.link/635VxBA6!

Selected Domino''''s Pizza outlets will be decorated with Genshin Impact x Domino''''s Pizza elements during the event.', N'Image/blog3.png', 4, N'https://www.hoyolab.com/article/8829299')
INSERT [dbo].[Blog] ([BlogId], [BlogName], [BlogDate], [Author], [BlogDetail], [BlogImage], [BlogCategory], [Links]) VALUES (4, N'Character Demo - "Nilou: Dance of the Delicate Lotus"', CAST(N'2022-10-13' AS Date), N'Genshin Impact Official', N'''Although a performance stage has spatial constraints, dance always inspires infinite imagination.

Amid free-spirited steps, the night sky transforms into a starry dome, becoming a stage where one can dance to their heart''''s content.', N'Image/blog4.png', 1, N'https://www.youtube.com/watch?v=P5DeAD_uXE0&t=24s')
INSERT [dbo].[Blog] ([BlogId], [BlogName], [BlogDate], [Author], [BlogDetail], [BlogImage], [BlogCategory], [Links]) VALUES (5, N'''Gourmet Tour: "Liyue''''s Cuisine Collection" Issue No. 1', CAST(N'2022-10-09' AS Date), N'Genshin Impact Official', N'Slow-Cooked Bamboo Shoot Soup is a dish that comes with thousands of years of Liyue culinary culture behind it. We''''re sure that even Rex Lapis himself must have been very fond of it.', N'Image/blog5.png', 4, N'https://www.hoyolab.com/article/11796573')
INSERT [dbo].[Blog] ([BlogId], [BlogName], [BlogDate], [Author], [BlogDetail], [BlogImage], [BlogCategory], [Links]) VALUES (6, N'GENSHIN CONCERT 2022 "Melodies of an Endless Journey"', CAST(N'2022-10-02' AS Date), N'Genshin Impact Official', N'While enjoying the wonderful music, please leave a message in the comments section and tell Paimon your favorite tracks and reasons. Leave a comment successfully and you have a chance to win concert merchandise', N'Image/blog6.png', 3, N'https://www.youtube.com/watch?v=LrqsaO9Cf2M&t=3834s')
INSERT [dbo].[Blog] ([BlogId], [BlogName], [BlogDate], [Author], [BlogDetail], [BlogImage], [BlogCategory], [Links]) VALUES (7, N'Happy Birthday, Kamisato Ayaka!', CAST(N'2022-09-28' AS Date), N'Genshin Impact Official', N'Even though it''''s the same location, my feelings are different each time I visit...
Blissful moments like this are always brief. Perhaps... that''''s why I hold them close to my heart.
Would you accept this bouquet?
I hope that the scent of flowers will always be by your side.', N'Image/blog7.png', 1, N'https://www.youtube.com/shorts/HMreGTw5Y3c')
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
INSERT [dbo].[BlogCategory] ([BlogCategoryId], [BlogCategoryName]) VALUES (1, N'Character')
INSERT [dbo].[BlogCategory] ([BlogCategoryId], [BlogCategoryName]) VALUES (2, N'In-Game')
INSERT [dbo].[BlogCategory] ([BlogCategoryId], [BlogCategoryName]) VALUES (3, N'Events')
INSERT [dbo].[BlogCategory] ([BlogCategoryId], [BlogCategoryName]) VALUES (4, N'Collab')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescribe]) VALUES (1, N'Boosting Dishes', N'Increases all party members attack or dependent parameter.In Co-Op Mode, this effect only applies to your own character(s).')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescribe]) VALUES (2, N'Recovery Dishes', N'Revives the selected character or restores HP or both')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescribe]) VALUES (3, N'Essential Oils', N'Increases all party members an element DMG')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescribe]) VALUES (4, N'Adventurer Dishes', N'Restores Stamina or Decreases all party member climbing and sprinting Stamina ')
GO
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (1, N'Suspicious Jade Parcels', CAST(16.00 AS Numeric(5, 2)), 686, N'An exquisite-looking dish. Food ingredients of different degrees of doneness are wrapped in shriveled vegetables. It looks depressing to say the least.', N'Mondstadt', N'Image/1.png', 4)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (2, N'Suspicious Golden Crab', CAST(12.00 AS Numeric(5, 2)), 998, N'A crab dish cooked in the ancient ways. The flour granules within have congealed like gravel, and have some crab shell mixed in. But compared to the blandness of the crab meat, the taste of crab shell is at least worth having a go at.', N'Liyue', N'Image/2.png', 3)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (3, N'Once Upon a Time in Mondstadt', CAST(5.00 AS Numeric(5, 2)), 999, N'A rich, meaty dish. Originally a Mondstadt dish made of steaks, potatoes, and cheese, it has since become synonymous with Ludi Harpastum.', N'Mondstadt', N'Image/3.png', 2)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (4, N'A Buoyant Breeze', CAST(16.00 AS Numeric(5, 2)), 994, N'Other than the Cecilia flowers used for decoration, the ingredients are no different from normal. But if you taste it carefully, you can taste the flavor of "a wind that brings hope and tiny twists of fate." Perhaps...this is exactly what he wants.', N'Mondstadt', N'Image/4.png', 4)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (5, N'Tianshu Meat', CAST(5.00 AS Numeric(5, 2)), 1000, N'A braised meat dish. The cut of meat is a happy medium between lean and fatty, and has been braised to smoking perfection. The ingredients glisten, and are soft but not greasy. Word has it that the Tianshu of a certain generation of the Liyue Qixing invented this dish after much painstaking development.', N'Liyue', N'Image/5.png', 2)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (6, N'Moon Pie', CAST(14.00 AS Numeric(5, 2)), 985, N'A traditional staple from Mondstadt. Not only is the pickled meat within deeply flavorful, but the meringue has also maintained its sweetness and moisture through the baking process. This dish is not to be missed at any festival in Mondstadt.', N'Liyue', N'Image/6.png', 4)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (7, N'Sashimi Platter', CAST(2.00 AS Numeric(5, 2)), 1000, N'A seafood dish made using fresh ingredients. The fish and shellfish are cut into pieces and arranged neatly. The slices have an elegant and tender taste, providing rich and high-quality nutrition. The lingering sweet aftertaste is derived fully from the ingredients freshness, and every bite is an enjoyment worth closing one eyes and savoring.', N'Inazuma', N'Image/7.png', 3)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (8, N'Butter Crab', CAST(16.00 AS Numeric(5, 2)), 1000, N'A grilled crab dish. Appropriate heat control has allowed the crab meat to stay moist and fatty. The butter has seeped into the crab meat, producing an aroma that has people salivating even from afar.', N'Inazuma', N'Image/8.png', 1)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (9, N'Bountiful Year', CAST(5.00 AS Numeric(5, 2)), 1000, N'Luxurious and exquisite raw fish. The fish is sliced thinly and arranged in the shape of a flower before a ring of side dishes is set all around it. Normally, the side dishes will be mixed with the raw fish according to one taste before consumption — this act is said to ensure that things will be smooth sailing in the coming days.', N'Liyue', N'Image/9.png', 2)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (10, N'Biryani', CAST(6.00 AS Numeric(5, 2)), 1000, N'An aromatic rice dish. Stir-fry the meat such that it is crispy on the outside and tender on the inside. Then stew it with condiments and long-grain rice. Sprinkle a few Padisarah petals before serving. Every grain is saturated with the aroma of fatty meat and condiments. The dish has an exquisite taste only found in Sumeru.', N'Sumeru', N'Image/10.png', 2)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (11, N'Tandoori Roast Chicken', CAST(3.00 AS Numeric(5, 2)), 1000, N'A signature chicken dish of Sumeru. The chicken was first marinated with red spices, and then roasted in a tandoor. The process of making this Sumeru classic does not involve any fancy skills, and the use of such a humble clay oven might be surprising to some. In Sumeru, a tandoor to a veteran chef is as important as a trusty sword to an adventurer.', N'Sumeru', N'Image/11.png', 3)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (12, N'Chicken Tofu Pudding', CAST(15.00 AS Numeric(5, 2)), 1000, N'A dish made with great precision. The finely-diced chicken breast is stirred strongly and added into a soup that has various other minced meats within, before being cooked over a small flame. The result is light and elegant, and it tastes like tofu pudding.', N'Liyue', N'Image/12.png', 4)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (13, N'Butter Chicken', CAST(19.00 AS Numeric(5, 2)), 998, N'A flavorful dish. Spice and chopped tomatoes were mixed with warm butter, and then cooked into a creamy sauce. Into it went marinated and pan-fried chicken pieces. People from Sumeru prefer eating the dish with rice or flatbread, which allows them to savor the dish enticing flavor better.', N'Sumeru', N'Image/13.png', 3)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (14, N'Coconut Charcoal Cake', CAST(16.00 AS Numeric(5, 2)), 998, N'A dark-colored pastry. The Ajilenakh Nuts were first roasted and powdered before being sieved, added to a batter, mixed evenly, and then baked. The final product by no means looks impressive, but it exudes the fresh aroma of Ajilenakh Nuts, and it tastes better still with some jam.', N'Sumeru', N'Image/14.png', 4)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (15, N'Adeptus Temptation', CAST(1.00 AS Numeric(5, 2)), 991, N'A complex, famous type of Liyue cuisine, in which specially selected ingredients are submerged and slowly bowled into soup stock. The recipe scribbled from memory alone was enough to urge the adepti to once again return to the world of men.', N'Liyue', N'Image/15.png', 4)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (16, N'Aaru Mixed Rice', CAST(5.00 AS Numeric(5, 2)), 1000, N'A large serving of filling staple food. In this dish that combines rice, noodles, and beans together, the secret of great taste lies in the sweet and sour flavor imparted by tomatoes. Owing to its common nature and low price, this dish is a great choice for sating one hunger — which is one of the key reasons why this recipe has spread from Aaru Village to the rest of Sumeru.', N'Sumeru', N'Image/16.png', 3)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (17, N'Candied Ajilenakh Nut', CAST(16.00 AS Numeric(5, 2)), 992, N'A rich dessert. First, the syrup is boiled till clear, then mixed with fillings and sesame paste from Sumeru. Then at last, the evenly-mixed syrup is poured into a mold and allowed to solidify into this crunchy form. It is said that the cold lands of Snezhnaya are a host to a similar dish, with a slightly different flavor profile.', N'Sumeru', N'Image/17.png', 1)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (18, N'Chili-Mince Cornbread Buns', CAST(18.00 AS Numeric(5, 2)), 998, N'A traditional snack from Liyue. The fresh dough is turned out into a round, rested, and then placed inside a cage to steam. The meat and vegetables are then washed, diced, before being fried quickly in an oiled wok. When eaten, the fried condiments must be placed into the empty space in the middle of the buns before they are eaten together.', N'Liyue', N'Image/18.png', 3)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (19, N'Barbatos Ratatouille', CAST(9.00 AS Numeric(5, 2)), 977, N'A simple chowder with a long history. The ingredients are similarly traditional and simple. No matter where you are, a piping-hot chowder of this sort can always give you a sense of real and unsurpassed satisfaction.', N'Mondstadt', N'Image/19.png', 1)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (20, N'Tahchin', CAST(5.00 AS Numeric(5, 2)), 996, N'A classic staple served in large quantities. Cooked rice is mixed with meat that was marinated in yogurt, then baked until its surface turns crispy. Dont forget to add a handful of Padisarah petals before serving! Both the rice and meat are enough to keep one stomach full for a long time, making it a very popular dish at the Grand Bazaar.', N'Sumeru', N'Image/20.png', 1)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (21, N'Baklava', CAST(19.00 AS Numeric(5, 2)), 1000, N'A traditional Sumeru dessert. This puff pastry contains chopped nuts and has been baked after having butter drizzled atop it — and not forgetting some syrup once it comes out of the oven. Some researchers will specially order this veritable "fortress of sweetness" to replenish their energies before an exam. This is also why this dish has great pride of place as the Akademiya  favorite dessert.', N'Mondstadt', N'Image/21.png', 1)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (22, N'Golden Fried Chicken', CAST(15.00 AS Numeric(5, 2)), 1000, N'Fowl that has been seasoned and then fried. The golden outer skin has all but sealed the abundant juices into the meat, leading to absolute enjoyment with each bite. The taste at your fingertips will linger in memory far longer than the instant it takes to reduce the meal to nothing but slim bones.', N'Liyue', N'Image/22.png', 1)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (23, N'Meat Lovers Mushroom Pizza', CAST(13.00 AS Numeric(5, 2)), 946, N'A pizza freshly baked from the oven. The crust is dotted with large chunks of meat and fresh mushroom slices. The sweet, stretchy cheese further adds to the charm. You have no doubt that every slice will be snatched away the moment it is served. Speed, therefore, is a gourmet best buddy when this pizza is on the table.', N'Mondstadt', N'Image/23.png', 4)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (24, N'Stormcrest Pie', CAST(13.00 AS Numeric(5, 2)), 997, N'Eulas specialty. Its hard to say if the fang-like crescent shape is meant to flout tradition or express her "tooth for tooth" ethos. A salty, fresh, smoked flavor emanates from under the golden outer crust, its body and intensity likely unmatched by anyone else in Mondstadt. Best not to tell her that, though, lest she "remember" it.', N'Mondstadt', N'Image/24.png', 2)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (25, N'Prosperous Peace', CAST(19.00 AS Numeric(5, 2)), 991, N'Ganyu specialty. The image of a resting qilin is by itself enough to calm a person down. Ganyu has put her well-wishes for all that is lovely in this world into this dish — and she is saved some of her favorite Qingxin flowers for you, too.', N'Liyue', N'Image/25.png', 3)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (26, N'Sweet Madame', CAST(9.00 AS Numeric(5, 2)), 1000, N'Honey-roasted fowl. The honey and sweet flowers come together to compliment the tender fowl meat.', N'Mondstadt', N'Image/26.png', 3)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (27, N'Sakura Mochi', CAST(15.00 AS Numeric(5, 2)), 997, N'A delicate and elegant snack. The dark green leaf adds complexity to the overall warm color palette. Just looking at it gives you a sense of its quiet beauty. Tis a shame that its lovely flavor is like a blooming flower in transience — yet do not let that dissuade you from taking a bite', N'Inazuma', N'Image/27.png', 3)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (28, N'Squirrel Fish', CAST(18.00 AS Numeric(5, 2)), 1000, N'A hard-to-prepare fish dish. The fish is first completely deboned before crisscross cuts are made on the skin. The fish is then coated in flour and deep-fried to a golden-brown color, then served with ketchup drizzled on top. It is tender and juicy on the inside and crispy on the outside. The dish resembles a squirrel tail to a certain degree, hence the name.', N'Sumeru', N'Image/28.png', 4)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (29, N'Tri-Flavored Skewer', CAST(16.00 AS Numeric(5, 2)), 1000, N'A pieced-together skewer. Three different cooking processes can be tasted at a go in this dish, which has made it very popular. If you are ever at a loss at to what to pair with some wine, there no going wrong with one of these.', N'Sumeru', N'Image/29.png', 4)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (30, N'Sakura Tempura', CAST(3.00 AS Numeric(5, 2)), 991, N'A dish deep-fried in oil. Incorporate the marinated sakura blossom petals into the batter before giving the fresh shrimp and vegetables an even coating, frying, and then draining the oil. This all sounds simple enough, but good tempura making is not something achieved in a mere day.', N'Inazuma', N'Image/30.png', 4)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (31, N'Minty Meat Rolls', CAST(17.00 AS Numeric(5, 2)), 994, N'A sour-and-spicy dish. The marinated meat has been thinly sliced and rolled into the mint leaves, before being brushed with a sauce blend containing Jueyun Chilis. The unique mint flavor adds the finishing touch to this dish, turning it into an excellent addition to any cold platter.', N'Liyue', N'Image/31.png', 2)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (32, N'Tricolor Dango', CAST(2.00 AS Numeric(5, 2)), 993, N'A soft, glutinous snack. Glutinous rice has been grown into powder and rolled into a ball before being steamed. The Sakura Bloom and Snapdragon colors lend an extra liveliness to these dango.', N'Inazuma', N'Image/32.png', 3)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (33, N'Lantern Rite Special Come and Get It', CAST(17.00 AS Numeric(5, 2)), 1000, N'Traditional cuisine made to celebrate Lantern Rite. There is no great refinement in the making of this food, and it appears in Liyue often during festival season. Whenever this dish is served up, the person at the head of the table will invite everyone to dig in, saying "Come on, eat, eat," hence the name.', N'Liyue', N'Image/33.png', 3)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (34, N'Rice Pudding', CAST(6.00 AS Numeric(5, 2)), 1000, N'A dessert made from rice. After cooking the rice beforehand, it is placed into a pot together with the other ingredients, stirred evenly, and steamed. The mouthfeel is fragrant and soft, a perfect denouement to any meal.', N'Liyue', N'Image/34.png', 3)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (35, N'Fruits of the Festival', CAST(7.00 AS Numeric(5, 2)), 1000, N'A brightly colored non-alcoholic beverage. Freshly squeezed Sunsettia and Wolfhook juices have been poured into a cup in a specific order. The cool and refreshing flavor and vibrant color remind people of the beautiful holiday times. Do not mess the order up if you want to get the gradient effect right!', N'Mondstadt', N'Image/35.png', 2)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (36, N'Golden Chicken Burger', CAST(5.00 AS Numeric(5, 2)), 997, N'A hamburger in which the fowl meat is the main star. The fluffy bread sandwiches slices of fresh vegetables and a flavorful, crispy fowl fillet. No utensils required here: Just grab it in your hands and bite down on that bundle of rich, satisfying succulence with a hearty "ker-runch"!', N'Mondstadt', N'Image/36.png', 2)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (37, N'Tuna Sushi', CAST(5.00 AS Numeric(5, 2)), 996, N'A traditional dish made with one’s bare hands. The delicate fat lines the fish slices like hoarfrost falling on a road, and the balance of fat and lean is perfect. The make of this dish is not fancy in the slightest, but has imparted both the profundity of field and sea to the tasting tongue', N'Inazuma', N'Image/37.png', 2)
INSERT [dbo].[Food] ([FoodID], [FoodName], [Price], [Quatity], [Describe], [Region], [FoodImage], [CategoryID]) VALUES (38, N'Forest Watchers Choice', CAST(23.00 AS Numeric(5, 2)), 997, N'Tighnari’s specialty. The Forest Watcher personally picked out these edible mushrooms — not only the common ones but also a few mysterious-looking shrooms that you have never seen before. No condiments were added, for the limelight should go to the ingredients’ unmarred freshness. It must have taken him quite some time to prepare this delicious dish.', N'Sumeru', N'Image/40.png', 4)
SET IDENTITY_INSERT [dbo].[Food] OFF
GO
INSERT [dbo].[Food_Customer] ([FoodID], [AccountID], [FoodLike], [FoodAddToCart], [quantity]) VALUES (9, 1, 1, 0, 0)
INSERT [dbo].[Food_Customer] ([FoodID], [AccountID], [FoodLike], [FoodAddToCart], [quantity]) VALUES (11, 1, 1, 0, 0)
INSERT [dbo].[Food_Customer] ([FoodID], [AccountID], [FoodLike], [FoodAddToCart], [quantity]) VALUES (22, 1, 1, 0, 0)
INSERT [dbo].[Food_Customer] ([FoodID], [AccountID], [FoodLike], [FoodAddToCart], [quantity]) VALUES (23, 3, 0, 1, 10)
INSERT [dbo].[Food_Customer] ([FoodID], [AccountID], [FoodLike], [FoodAddToCart], [quantity]) VALUES (5, 5, 0, 1, 0)
INSERT [dbo].[Food_Customer] ([FoodID], [AccountID], [FoodLike], [FoodAddToCart], [quantity]) VALUES (1, 10, 0, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[Order Detail] ON 

INSERT [dbo].[Order Detail] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [OrderDate], [Bill_ID]) VALUES (101, 8, 1, 1, CAST(N'2022-10-31T15:45:49.5750000' AS DateTime2), 16)
INSERT [dbo].[Order Detail] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [OrderDate], [Bill_ID]) VALUES (113, 9, 1, 8, CAST(N'2022-11-02T14:08:01.6090000' AS DateTime2), 28)
INSERT [dbo].[Order Detail] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [OrderDate], [Bill_ID]) VALUES (115, 9, 1, 1, CAST(N'2022-11-02T14:28:20.3490000' AS DateTime2), 32)
SET IDENTITY_INSERT [dbo].[Order Detail] OFF
GO
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (81, 8, 17, 2, 5, CAST(N'2022-10-31T11:30:24.800' AS DateTime), 2)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (82, 8, 1, 3, 5, CAST(N'2022-10-31T12:29:36.663' AS DateTime), 3)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (83, 8, 6, 5, 5, CAST(N'2022-10-31T12:29:36.670' AS DateTime), 4)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (84, 8, 19, 4, 5, CAST(N'2022-10-31T12:30:55.033' AS DateTime), 5)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (85, 8, 31, 3, 5, CAST(N'2022-10-31T12:30:55.037' AS DateTime), 5)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (86, 8, 1, 1, 5, CAST(N'2022-10-31T12:37:11.840' AS DateTime), 6)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (87, 8, 1, 6, 5, CAST(N'2022-10-31T13:28:24.760' AS DateTime), 7)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (88, 8, 1, 3, 5, CAST(N'2022-10-31T13:30:51.140' AS DateTime), 8)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (89, 8, 19, 6, 5, CAST(N'2022-10-31T13:31:49.450' AS DateTime), 9)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (90, 8, 24, 3, 5, CAST(N'2022-10-31T13:31:49.460' AS DateTime), 9)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (91, 8, 32, 4, 5, CAST(N'2022-10-31T13:31:49.463' AS DateTime), 9)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (92, 8, 1, 10, 5, CAST(N'2022-10-31T14:40:26.860' AS DateTime), 10)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (93, 8, 1, 9, 5, CAST(N'2022-10-31T14:44:42.187' AS DateTime), 11)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (94, 8, 15, 9, 5, CAST(N'2022-10-31T15:04:02.177' AS DateTime), 12)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (95, 8, 19, 4, 5, CAST(N'2022-10-31T15:04:02.180' AS DateTime), 12)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (96, 8, 23, 2, 5, CAST(N'2022-10-31T15:04:02.180' AS DateTime), 12)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (97, 8, 1, 3, 0, CAST(N'2022-10-31T15:06:12.710' AS DateTime), 13)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (98, 8, 1, 4, 5, CAST(N'2022-10-31T15:09:34.890' AS DateTime), 14)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (99, 8, 1, 3, 5, CAST(N'2022-10-31T15:38:42.407' AS DateTime), 15)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (100, 8, 6, 3, 5, CAST(N'2022-10-31T15:38:42.410' AS DateTime), 15)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (102, 2, 1, 8, 5, CAST(N'2022-10-31T15:47:07.643' AS DateTime), 17)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (103, 2, 6, 3, 5, CAST(N'2022-10-31T15:47:07.647' AS DateTime), 17)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (104, 2, 23, 6, 5, CAST(N'2022-10-31T15:47:07.647' AS DateTime), 17)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (105, 2, 17, 3, 5, CAST(N'2022-11-02T12:10:15.467' AS DateTime), 18)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (106, 2, 30, 3, 5, CAST(N'2022-11-02T12:10:15.473' AS DateTime), 18)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (107, 2, 1, 5, 5, CAST(N'2022-11-02T12:10:40.370' AS DateTime), 19)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (108, 2, 17, 1, 5, CAST(N'2022-11-02T13:16:39.957' AS DateTime), 20)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (109, 1, 23, 2, 0, CAST(N'2022-11-02T13:26:34.203' AS DateTime), 21)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (110, 1, 38, 3, 0, CAST(N'2022-11-02T13:26:34.210' AS DateTime), 21)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (111, 1, 1, 9, 5, CAST(N'2022-11-02T13:53:20.107' AS DateTime), 22)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (112, 1, 19, 4, 5, CAST(N'2022-11-02T13:55:57.373' AS DateTime), 23)
INSERT [dbo].[Order Detail History] ([OrderID], [AccountID], [FoodID], [FoodQuatity], [Vote], [DateOrder], [Bill_ID]) VALUES (114, 10, 1, 3, 5, CAST(N'2022-11-02T14:10:37.627' AS DateTime), 30)
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (1, 1, CAST(N'2022-10-20T00:00:00.000' AS DateTime), CAST(50.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (2, 1, CAST(N'2022-10-21T00:00:00.000' AS DateTime), CAST(70.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (3, 2, CAST(N'2022-10-21T00:00:00.000' AS DateTime), CAST(50.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (6, 1, CAST(N'2022-10-24T00:00:00.000' AS DateTime), CAST(100.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (7, 1, CAST(N'2022-10-24T00:00:00.000' AS DateTime), CAST(50.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (8, 1, CAST(N'2022-10-24T00:00:00.000' AS DateTime), CAST(60.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (9, 2, CAST(N'2022-10-24T00:00:00.000' AS DateTime), CAST(70.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (10, 2, CAST(N'2022-10-24T00:00:00.000' AS DateTime), CAST(120.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (11, 1, CAST(N'2022-10-24T00:00:00.000' AS DateTime), CAST(299.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (12, 1, CAST(N'2022-10-25T00:00:00.000' AS DateTime), CAST(100.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (13, 2, CAST(N'2022-10-26T00:00:00.000' AS DateTime), CAST(500.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (14, 2, CAST(N'2022-10-26T00:00:00.000' AS DateTime), CAST(1000.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (15, 1, CAST(N'2022-10-26T00:00:00.000' AS DateTime), CAST(1777.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (16, 2, CAST(N'2022-10-28T00:00:00.000' AS DateTime), CAST(45.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (17, 3, CAST(N'2022-10-28T00:00:00.000' AS DateTime), CAST(23.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (18, 5, CAST(N'2022-10-28T00:00:00.000' AS DateTime), CAST(123.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (19, 3, CAST(N'2022-10-29T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (20, 3, CAST(N'2022-10-29T00:00:00.000' AS DateTime), CAST(32.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (21, 3, CAST(N'2022-10-29T22:36:59.090' AS DateTime), CAST(12.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (22, 3, CAST(N'2022-10-29T22:40:16.757' AS DateTime), CAST(1.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (23, 3, CAST(N'2022-10-29T22:50:43.087' AS DateTime), CAST(33.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (24, 3, CAST(N'2022-10-29T22:55:29.650' AS DateTime), CAST(32.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (25, 3, CAST(N'2022-10-29T22:55:32.327' AS DateTime), CAST(12.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (26, 3, CAST(N'2022-10-29T22:56:38.920' AS DateTime), CAST(122.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (27, 6, CAST(N'2022-10-29T23:33:07.637' AS DateTime), CAST(32.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (28, 6, CAST(N'2022-10-29T23:33:12.703' AS DateTime), CAST(123.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (29, 6, CAST(N'2022-10-30T00:01:38.097' AS DateTime), CAST(123.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (30, 6, CAST(N'2022-10-30T00:03:19.380' AS DateTime), CAST(12.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (31, 6, CAST(N'2022-10-30T00:16:31.240' AS DateTime), CAST(500.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (32, 6, CAST(N'2022-10-30T07:45:47.967' AS DateTime), CAST(500.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (33, 6, CAST(N'2022-10-30T07:46:23.380' AS DateTime), CAST(15000.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (34, 5, CAST(N'2022-10-30T07:56:13.927' AS DateTime), CAST(1000.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (35, 7, CAST(N'2022-10-30T08:25:54.767' AS DateTime), CAST(50.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (36, 3, CAST(N'2022-10-30T12:00:58.023' AS DateTime), CAST(10000.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (37, 7, CAST(N'2022-10-30T13:24:15.367' AS DateTime), CAST(50.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (38, 7, CAST(N'2022-10-30T13:29:02.320' AS DateTime), CAST(300.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (39, 7, CAST(N'2022-10-30T13:34:28.773' AS DateTime), CAST(2.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (40, 7, CAST(N'2022-10-30T13:34:31.290' AS DateTime), CAST(23.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (41, 7, CAST(N'2022-10-30T13:35:35.663' AS DateTime), CAST(80.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (42, 7, CAST(N'2022-10-30T13:39:28.157' AS DateTime), CAST(12.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (43, 7, CAST(N'2022-10-30T13:39:31.580' AS DateTime), CAST(12.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (44, 8, CAST(N'2022-10-30T15:09:12.837' AS DateTime), CAST(1000.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (45, 8, CAST(N'2022-10-30T16:55:25.330' AS DateTime), CAST(500.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (46, 8, CAST(N'2022-10-31T14:44:22.347' AS DateTime), CAST(12.00 AS Numeric(10, 2)), 0)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (47, 8, CAST(N'2022-10-31T14:44:42.187' AS DateTime), CAST(144.00 AS Numeric(10, 2)), 0)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (48, 8, CAST(N'2022-10-31T14:57:48.630' AS DateTime), CAST(10.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (49, 8, CAST(N'2022-10-31T15:04:02.183' AS DateTime), CAST(71.00 AS Numeric(10, 2)), 0)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (50, 8, CAST(N'2022-10-31T15:06:12.713' AS DateTime), CAST(48.00 AS Numeric(10, 2)), 0)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (51, 8, CAST(N'2022-10-31T15:09:34.890' AS DateTime), CAST(64.00 AS Numeric(10, 2)), 0)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (52, 8, CAST(N'2022-10-31T15:38:42.410' AS DateTime), CAST(90.00 AS Numeric(10, 2)), 0)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (53, 8, CAST(N'2022-10-31T15:45:49.580' AS DateTime), CAST(16.00 AS Numeric(10, 2)), 0)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (54, 2, CAST(N'2022-10-31T15:47:07.647' AS DateTime), CAST(248.00 AS Numeric(10, 2)), 0)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (55, 2, CAST(N'2022-11-02T12:10:15.473' AS DateTime), CAST(57.00 AS Numeric(10, 2)), 0)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (56, 2, CAST(N'2022-11-02T12:10:40.370' AS DateTime), CAST(80.00 AS Numeric(10, 2)), 0)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (57, 2, CAST(N'2022-11-02T13:16:39.967' AS DateTime), CAST(16.00 AS Numeric(10, 2)), 0)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (58, 1, CAST(N'2022-11-02T13:26:34.217' AS DateTime), CAST(95.00 AS Numeric(10, 2)), 0)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (59, 1, CAST(N'2022-11-02T13:53:20.117' AS DateTime), CAST(144.00 AS Numeric(10, 2)), 0)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (60, 1, CAST(N'2022-11-02T13:55:57.387' AS DateTime), CAST(36.00 AS Numeric(10, 2)), 0)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (61, 9, CAST(N'2022-11-02T14:00:04.230' AS DateTime), CAST(20.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (62, 9, CAST(N'2022-11-02T14:02:39.493' AS DateTime), CAST(100000.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (63, 9, CAST(N'2022-11-02T14:02:59.557' AS DateTime), CAST(16000.00 AS Numeric(10, 2)), 0)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (64, 9, CAST(N'2022-11-02T14:08:01.620' AS DateTime), CAST(128.00 AS Numeric(10, 2)), 0)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (65, 10, CAST(N'2022-11-02T14:10:28.030' AS DateTime), CAST(123.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (66, 10, CAST(N'2022-11-02T14:10:37.647' AS DateTime), CAST(48.00 AS Numeric(10, 2)), 0)
INSERT [dbo].[Payment] ([PaymentID], [AccountID], [AddCartDate], [AddCartValue], [Status]) VALUES (67, 9, CAST(N'2022-11-02T14:28:20.360' AS DateTime), CAST(16.00 AS Numeric(10, 2)), 0)
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Account]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD FOREIGN KEY([BlogCategory])
REFERENCES [dbo].[BlogCategory] ([BlogCategoryId])
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Food_Customer]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Food_Customer]  WITH CHECK ADD FOREIGN KEY([FoodID])
REFERENCES [dbo].[Food] ([FoodID])
GO
ALTER TABLE [dbo].[Order Detail]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Order Detail]  WITH CHECK ADD FOREIGN KEY([FoodID])
REFERENCES [dbo].[Food] ([FoodID])
GO
ALTER TABLE [dbo].[Order Detail History]  WITH CHECK ADD  CONSTRAINT [FK_Order Detail History_Bill] FOREIGN KEY([Bill_ID])
REFERENCES [dbo].[Bill] ([Bill_ID])
GO
ALTER TABLE [dbo].[Order Detail History] CHECK CONSTRAINT [FK_Order Detail History_Bill]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
USE [master]
GO
ALTER DATABASE [GenshinFood] SET  READ_WRITE 
GO
