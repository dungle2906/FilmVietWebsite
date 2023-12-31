USE [master]
GO
/****** Object:  Database [FilmViet]    Script Date: 9/10/2023 11:28:12 PM ******/
CREATE DATABASE [FilmViet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FilmViet', FILENAME = N'D:\Major\Semester 5\SWP391 (Project)\BackEnd\FilmViet.mdf' , SIZE = 1024000KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FilmViet_log', FILENAME = N'D:\Major\Semester 5\SWP391 (Project)\BackEnd\FilmViet_log.ldf' , SIZE = 1024000KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FilmViet] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FilmViet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FilmViet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FilmViet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FilmViet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FilmViet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FilmViet] SET ARITHABORT OFF 
GO
ALTER DATABASE [FilmViet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FilmViet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FilmViet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FilmViet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FilmViet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FilmViet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FilmViet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FilmViet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FilmViet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FilmViet] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FilmViet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FilmViet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FilmViet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FilmViet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FilmViet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FilmViet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FilmViet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FilmViet] SET RECOVERY FULL 
GO
ALTER DATABASE [FilmViet] SET  MULTI_USER 
GO
ALTER DATABASE [FilmViet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FilmViet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FilmViet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FilmViet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FilmViet] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FilmViet', N'ON'
GO
ALTER DATABASE [FilmViet] SET QUERY_STORE = OFF
GO
USE [FilmViet]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [FilmViet]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 9/10/2023 11:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[videoId] [int] NULL,
	[comment] [nvarchar](max) NOT NULL,
	[commentDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 9/10/2023 11:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[videoId] [int] NULL,
	[viewedDate] [datetime] NOT NULL,
	[isLiked] [bit] NOT NULL,
	[likedDate] [datetime] NULL,
 CONSTRAINT [PK__history__3213E83F0FBDE858] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hoadon]    Script Date: 9/10/2023 11:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hoadon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vnp_TxnRef] [nchar](8) NOT NULL,
	[videoId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[vnp_OrderInfo] [nchar](30) NOT NULL,
	[vnp_ResponseCode] [nchar](2) NOT NULL,
	[vnp_TransactionNo] [nchar](8) NOT NULL,
	[vnp_Amount] [int] NULL,
	[vnp_BankCode] [nchar](20) NOT NULL,
	[vnp_PayDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Hoadon_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 9/10/2023 11:28:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[videoId] [int] NULL,
	[rating] [int] NOT NULL,
	[ratingDate] [datetime] NOT NULL,
 CONSTRAINT [PK__rating__3213E83FBF03A521] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Share]    Script Date: 9/10/2023 11:28:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Share](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[videoId] [int] NULL,
	[email] [varchar](200) NOT NULL,
	[shareDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/10/2023 11:28:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[phone] [char](11) NOT NULL,
	[fullname] [nvarchar](100) NOT NULL,
	[isAdmin] [bit] NOT NULL,
	[isActive] [bit] NOT NULL,
	[token] [nchar](20) NULL,
 CONSTRAINT [PK__user__3213E83F7ADEAF30] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 9/10/2023 11:28:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[href] [varchar](50) NOT NULL,
	[poster] [varchar](max) NOT NULL,
	[views] [int] NOT NULL,
	[shares] [int] NOT NULL,
	[daodien] [nvarchar](max) NOT NULL,
	[dienvien] [nvarchar](max) NOT NULL,
	[theloai] [nvarchar](max) NOT NULL,
	[mota] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[price] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
	[addDate] [datetime] NOT NULL,
 CONSTRAINT [PK__video__3213E83F51084390] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (12, 1, 1, N'Phim con nhót mót chồng này quá anh em ơi
', CAST(N'2023-07-18T21:33:28.263' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (13, 4, 1, N'Phim này hay lắm nha nên em nha anh em
', CAST(N'2023-07-18T22:02:05.467' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (14, 3, 1, N'Trời ơi ước gì được xem phim này sớm hơn', CAST(N'2023-07-18T22:02:20.837' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (15, 4, 1, N'Phim này đệ nhứt số một rồi ', CAST(N'2023-07-18T22:07:03.747' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (16, 1, 2, N'Doraemon ơi
', CAST(N'2023-07-18T22:53:24.503' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (17, 4, 4, N'Ước gì doraemon có ngoài đời hihi', CAST(N'2023-07-18T23:53:08.163' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (21, 3, 2, N'Yêu Doraemon quá đi thoaiiiii ', CAST(N'2023-07-19T13:09:35.057' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (22, 1, 2, N'Phim này hay lắm nè chồ ô', CAST(N'2023-07-19T13:30:38.757' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (23, 1, 1, N'xem phim này đi hay lắm nha mng ', CAST(N'2023-07-19T13:31:00.587' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (24, 15, 2, N'Phim này đỉnh lắm nha anh em
', CAST(N'2023-07-19T22:23:48.630' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (26, 15, 2, N'Tôi yêu phim Việt Nam quá đi mất 
', CAST(N'2023-07-19T22:26:40.953' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (27, 15, 4, N'Phim việt nam đỉnh quá', CAST(N'2023-07-19T22:28:34.060' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (29, 20, 64, N'Vinh râu diễn hay quá ạ ', CAST(N'2023-07-19T23:22:08.253' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (31, 20, 72, N'Ribi sachi sao mà đỉnh quá dị nè', CAST(N'2023-07-19T23:24:19.953' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (32, 20, 72, N'Yêu phim quá', CAST(N'2023-07-19T23:24:25.980' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (33, 1, 72, N'Thích nhất là thái vũ đó nha', CAST(N'2023-07-19T23:24:41.997' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (34, 1, 63, N'Coi phim hơi sợ ma nha ', CAST(N'2023-07-19T23:39:13.180' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (35, 1, 71, N'Nhìn thái vũ ghét quá', CAST(N'2023-07-19T23:40:50.413' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (36, 21, 41, N'Video này thật tuyệt vời! Cảm ơn tác giả đã chia sẻ kiến thức bổ ích này với chúng ta.

', CAST(N'2023-07-21T01:40:06.387' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (37, 21, 48, N'Tôi thực sự cảm phục sự cống hiến và nỗ lực của nhà làm video. Đây là một tác phẩm đáng để xem', CAST(N'2023-07-21T01:40:32.593' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (38, 21, 69, N'Người thực hiện video đã thể hiện rõ sự chuyên nghiệp và tâm huyết trong mỗi khung hình. Rất thích!', CAST(N'2023-07-21T01:41:02.870' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (39, 21, 75, N'Nội dung video rất thú vị và hấp dẫn. Tôi đã học được nhiều điều bổ ích từ nó.', CAST(N'2023-07-21T01:41:18.667' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (40, 21, 89, N'Video này đưa ra cái nhìn rất sáng suốt về vấn đề. Hy vọng nó sẽ được lan truyền rộng rãi.', CAST(N'2023-07-21T01:41:52.427' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (41, 24, 1, N'Phim này hay lắm giờ mới được xem hihi
', CAST(N'2023-07-24T00:23:36.903' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (78, 55, 4, N'Phim mắc quá ', CAST(N'2023-08-03T15:38:23.233' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (80, 5, 48, N'Phim miễn phí lại còn hay ahh ~~', CAST(N'2023-08-04T18:03:37.530' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (81, 15, 16, N'Phim hay quá ', CAST(N'2023-08-05T02:34:28.490' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (82, 15, 16, N'Ôi phim hay quá ', CAST(N'2023-08-05T02:34:43.250' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (83, 3, 16, N'Trời ơi ghiền ghê luôn ', CAST(N'2023-08-05T02:35:04.870' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (84, 58, 118, N'Mê phim này lắm giờ mới được xem', CAST(N'2023-08-06T13:59:45.303' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (85, 67, 101, N'Phim hay quá
', CAST(N'2023-08-08T17:03:37.300' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (86, 67, 1, N'fafaefae', CAST(N'2023-08-08T17:03:45.607' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[History] ON 

INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (44, 21, 1, CAST(N'2023-07-14T21:54:42.323' AS DateTime), 1, CAST(N'2023-07-15T01:40:44.247' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (45, 1, 1, CAST(N'2023-07-14T21:58:07.670' AS DateTime), 1, CAST(N'2023-08-02T00:25:27.087' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (46, 4, 1, CAST(N'2023-07-15T00:54:38.747' AS DateTime), 1, CAST(N'2023-07-28T13:10:06.617' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (47, 1, 4, CAST(N'2023-07-15T00:54:44.807' AS DateTime), 1, CAST(N'2023-08-04T10:37:50.523' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (48, 32, 2, CAST(N'2023-07-15T01:40:28.517' AS DateTime), 1, CAST(N'2023-07-28T13:10:43.007' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (49, 1, 1, CAST(N'2023-07-15T01:40:45.827' AS DateTime), 1, CAST(N'2023-07-28T02:27:58.930' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (50, 20, 1, CAST(N'2023-07-15T01:41:28.940' AS DateTime), 1, CAST(N'2023-07-18T18:19:27.357' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (51, 1, 1, CAST(N'2023-07-15T01:41:40.270' AS DateTime), 1, CAST(N'2023-07-15T01:40:44.247' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (52, 1, 1, CAST(N'2023-07-17T17:05:10.647' AS DateTime), 1, CAST(N'2023-07-15T01:40:44.247' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (53, 1, 4, CAST(N'2023-07-17T17:08:42.847' AS DateTime), 1, CAST(N'2023-07-15T01:40:44.247' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (54, 21, 2, CAST(N'2023-07-17T17:08:48.920' AS DateTime), 1, CAST(N'2023-07-15T01:40:44.247' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (55, 1, 1, CAST(N'2023-07-17T17:24:43.430' AS DateTime), 1, CAST(N'2023-07-26T17:38:27.850' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (56, 4, 1, CAST(N'2023-07-17T19:05:31.983' AS DateTime), 1, CAST(N'2023-07-15T01:40:44.247' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (57, 3, 1, CAST(N'2023-07-17T19:05:33.717' AS DateTime), 1, CAST(N'2023-08-05T02:48:59.643' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (58, 4, 1, CAST(N'2023-07-17T19:05:35.623' AS DateTime), 1, CAST(N'2023-07-15T01:40:44.247' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (59, 4, 1, CAST(N'2023-07-17T19:06:52.013' AS DateTime), 1, CAST(N'2023-07-15T01:40:44.247' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (60, 1, 1, CAST(N'2023-07-17T20:50:11.593' AS DateTime), 1, CAST(N'2023-07-26T17:38:22.760' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (61, 5, 1, CAST(N'2023-07-18T20:58:56.943' AS DateTime), 1, CAST(N'2023-07-15T01:40:44.247' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (62, 5, 76, CAST(N'2023-07-18T20:59:10.713' AS DateTime), 0, CAST(N'2023-07-15T01:40:44.247' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (63, 5, 16, CAST(N'2023-07-18T20:59:13.617' AS DateTime), 0, CAST(N'2023-07-15T01:40:44.247' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (64, 15, 2, CAST(N'2023-07-19T22:19:26.497' AS DateTime), 0, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (65, 15, 4, CAST(N'2023-07-19T22:28:28.750' AS DateTime), 1, CAST(N'2023-07-24T19:05:11.837' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (66, 15, 1, CAST(N'2023-07-19T22:32:47.190' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (67, 15, 64, CAST(N'2023-07-19T23:03:38.463' AS DateTime), 0, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (68, 20, 1, CAST(N'2023-07-19T23:21:42.387' AS DateTime), 1, CAST(N'2023-07-19T23:21:43.783' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (69, 20, 2, CAST(N'2023-07-19T23:21:51.080' AS DateTime), 0, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (70, 20, 64, CAST(N'2023-07-19T23:21:57.807' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (71, 20, 72, CAST(N'2023-07-19T23:24:09.060' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (72, 1, 83, CAST(N'2023-07-20T17:15:51.943' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (73, 21, 41, CAST(N'2023-07-21T01:39:25.070' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (74, 21, 16, CAST(N'2023-07-21T01:40:14.867' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (75, 21, 1, CAST(N'2023-07-21T01:40:18.933' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (76, 21, 2, CAST(N'2023-07-21T01:40:20.357' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (77, 21, 4, CAST(N'2023-07-21T01:40:21.987' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (78, 21, 48, CAST(N'2023-07-21T01:40:29.847' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (79, 21, 69, CAST(N'2023-07-21T01:40:56.867' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (80, 21, 71, CAST(N'2023-07-21T01:41:06.993' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (81, 21, 72, CAST(N'2023-07-21T01:41:08.843' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (82, 21, 75, CAST(N'2023-07-21T01:41:10.303' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (83, 21, 64, CAST(N'2023-07-21T01:41:28.750' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (84, 21, 63, CAST(N'2023-07-21T01:41:30.217' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (85, 21, 89, CAST(N'2023-07-21T01:41:50.603' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (86, 1, 93, CAST(N'2023-07-22T23:20:28.197' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (87, 24, 1, CAST(N'2023-07-24T00:23:21.490' AS DateTime), 1, CAST(N'2023-07-24T00:23:41.137' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (88, 24, 2, CAST(N'2023-07-24T00:24:45.510' AS DateTime), 1, CAST(N'2023-07-26T22:32:00.460' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (93, 1, 95, CAST(N'2023-07-24T18:56:57.150' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (94, 1, 90, CAST(N'2023-07-24T18:57:49.597' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (95, 15, 100, CAST(N'2023-07-24T19:04:01.777' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (96, 15, 16, CAST(N'2023-07-24T19:04:07.453' AS DateTime), 1, CAST(N'2023-08-05T02:34:18.640' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (97, 15, 41, CAST(N'2023-07-24T19:04:08.370' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (98, 15, 48, CAST(N'2023-07-24T19:04:16.593' AS DateTime), 1, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (99, 15, 63, CAST(N'2023-07-24T19:04:17.560' AS DateTime), 0, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (100, 15, 109, CAST(N'2023-07-24T19:10:48.223' AS DateTime), 0, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (101, 15, 101, CAST(N'2023-07-24T19:10:53.680' AS DateTime), 0, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (102, 15, 110, CAST(N'2023-07-24T19:13:47.393' AS DateTime), 0, CAST(N'2023-07-26T23:18:15.700' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (113, 1, 110, CAST(N'2023-07-25T13:47:45.847' AS DateTime), 0, CAST(N'2023-07-26T23:18:15.700' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (115, 24, 4, CAST(N'2023-07-26T22:32:06.000' AS DateTime), 0, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (116, 24, 16, CAST(N'2023-07-26T22:32:08.467' AS DateTime), 0, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (117, 24, 41, CAST(N'2023-07-26T22:32:11.720' AS DateTime), 0, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (118, 24, 48, CAST(N'2023-07-26T22:32:12.840' AS DateTime), 0, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (119, 24, 63, CAST(N'2023-07-26T22:32:14.250' AS DateTime), 0, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (120, 24, 64, CAST(N'2023-07-26T22:32:15.740' AS DateTime), 0, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (121, 24, 69, CAST(N'2023-07-26T22:32:17.487' AS DateTime), 0, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (122, 24, 71, CAST(N'2023-07-26T22:32:18.693' AS DateTime), 0, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (123, 24, 72, CAST(N'2023-07-26T22:32:20.043' AS DateTime), 0, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (124, 24, 75, CAST(N'2023-07-26T22:32:21.963' AS DateTime), 0, CAST(N'2023-07-26T23:18:15.700' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (125, 24, 76, CAST(N'2023-07-26T22:32:23.133' AS DateTime), 0, CAST(N'2023-07-26T23:18:15.700' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (126, 24, 83, CAST(N'2023-07-26T22:32:25.953' AS DateTime), 0, CAST(N'2023-07-26T23:18:15.700' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (127, 24, 84, CAST(N'2023-07-26T22:32:26.960' AS DateTime), 0, CAST(N'2023-07-26T23:18:15.700' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (128, 24, 87, CAST(N'2023-07-26T22:32:28.040' AS DateTime), 0, CAST(N'2023-07-26T23:18:15.700' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (129, 24, 89, CAST(N'2023-07-26T22:32:29.880' AS DateTime), 0, CAST(N'2023-07-26T23:18:15.700' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (130, 24, 90, CAST(N'2023-07-26T22:32:32.353' AS DateTime), 0, CAST(N'2023-07-26T23:18:15.700' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (131, 24, 92, CAST(N'2023-07-26T22:32:33.403' AS DateTime), 0, CAST(N'2023-07-26T23:18:15.700' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (132, 24, 93, CAST(N'2023-07-26T22:32:34.873' AS DateTime), 0, CAST(N'2023-07-26T23:18:15.700' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (133, 29, 2, CAST(N'2023-07-26T22:38:27.447' AS DateTime), 1, CAST(N'2023-07-26T23:18:15.700' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (134, 29, 4, CAST(N'2023-07-26T22:38:58.223' AS DateTime), 1, CAST(N'2023-07-28T13:23:17.013' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (135, 29, 75, CAST(N'2023-07-26T22:39:44.403' AS DateTime), 1, CAST(N'2023-07-27T15:42:02.817' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (136, 29, 72, CAST(N'2023-07-26T22:39:46.640' AS DateTime), 0, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (137, 29, 63, CAST(N'2023-07-26T22:39:49.033' AS DateTime), 0, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (138, 29, 84, CAST(N'2023-07-26T22:39:52.607' AS DateTime), 0, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (139, 29, 16, CAST(N'2023-07-26T22:39:55.783' AS DateTime), 0, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (140, 29, 48, CAST(N'2023-07-26T22:39:57.130' AS DateTime), 1, CAST(N'2023-07-27T15:37:41.570' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (141, 29, 41, CAST(N'2023-07-26T22:39:58.480' AS DateTime), 0, CAST(N'2023-07-24T19:07:29.870' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (142, 29, 100, CAST(N'2023-07-27T15:37:08.407' AS DateTime), 1, CAST(N'2023-07-27T15:37:09.487' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (143, 29, 110, CAST(N'2023-07-27T15:40:34.710' AS DateTime), 1, CAST(N'2023-07-27T15:41:17.263' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (144, 1, 84, CAST(N'2023-07-27T17:01:07.697' AS DateTime), 0, CAST(N'2023-07-27T15:41:17.263' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (145, 1, 2, CAST(N'2023-07-30T00:55:26.720' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (146, 1, 41, CAST(N'2023-07-30T01:50:19.937' AS DateTime), 1, CAST(N'2023-07-31T15:53:40.423' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (147, 1, 64, CAST(N'2023-07-30T01:50:49.053' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (148, 1, 63, CAST(N'2023-07-30T01:50:51.327' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (149, 1, 69, CAST(N'2023-07-30T01:51:17.937' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (150, 1, 75, CAST(N'2023-07-30T01:51:19.587' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (151, 1, 48, CAST(N'2023-07-30T01:51:56.507' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (152, 1, 16, CAST(N'2023-07-30T20:35:57.813' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (153, 29, 1, CAST(N'2023-07-31T09:46:59.577' AS DateTime), 1, CAST(N'2023-08-02T23:44:17.657' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (154, 29, 64, CAST(N'2023-07-31T15:31:09.690' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (155, 29, 69, CAST(N'2023-07-31T15:31:11.290' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (156, 51, 1, CAST(N'2023-07-31T16:43:29.877' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (157, 51, 4, CAST(N'2023-07-31T16:46:04.637' AS DateTime), 0, NULL)
GO
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (158, 1, 94, CAST(N'2023-08-01T14:08:44.517' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (159, 1, 76, CAST(N'2023-08-01T14:11:38.550' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (160, 55, 1, CAST(N'2023-08-01T23:03:57.997' AS DateTime), 1, CAST(N'2023-08-03T15:40:42.807' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (161, 55, 41, CAST(N'2023-08-02T00:34:26.033' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (162, 55, 4, CAST(N'2023-08-02T00:34:38.900' AS DateTime), 1, CAST(N'2023-08-03T15:38:37.153' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (163, 55, 16, CAST(N'2023-08-02T00:36:22.887' AS DateTime), 1, CAST(N'2023-08-02T01:09:34.523' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (164, 55, 63, CAST(N'2023-08-03T15:43:06.827' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (165, 1, 71, CAST(N'2023-08-04T00:34:42.393' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (166, 1, 115, CAST(N'2023-08-04T02:33:28.073' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (167, 1, 112, CAST(N'2023-08-04T02:43:49.707' AS DateTime), 1, CAST(N'2023-08-04T16:49:04.430' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (168, 1, 115, CAST(N'2023-08-04T02:51:42.367' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (169, 1, 115, CAST(N'2023-08-04T02:51:48.137' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (170, 1, 115, CAST(N'2023-08-04T02:51:49.790' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (171, 1, 115, CAST(N'2023-08-04T02:51:51.260' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (172, 1, 111, CAST(N'2023-08-04T16:50:58.713' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (173, 4, 63, CAST(N'2023-08-04T17:58:10.817' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (174, 5, 48, CAST(N'2023-08-04T18:03:21.763' AS DateTime), 1, CAST(N'2023-08-04T18:03:41.670' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (175, 5, 4, CAST(N'2023-08-04T18:03:49.170' AS DateTime), 1, CAST(N'2023-08-04T18:05:35.503' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (176, 3, 4, CAST(N'2023-08-04T19:47:04.287' AS DateTime), 1, CAST(N'2023-08-07T10:41:40.937' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (177, 3, 16, CAST(N'2023-08-05T00:13:38.873' AS DateTime), 1, CAST(N'2023-08-05T02:35:20.980' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (178, 3, 41, CAST(N'2023-08-05T02:25:00.717' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (179, 15, 75, CAST(N'2023-08-05T02:33:37.257' AS DateTime), 1, CAST(N'2023-08-05T02:33:40.610' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (180, 15, 71, CAST(N'2023-08-05T02:33:51.860' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (181, 15, 72, CAST(N'2023-08-05T02:33:55.147' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (182, 3, 112, CAST(N'2023-08-05T02:36:27.753' AS DateTime), 1, CAST(N'2023-08-05T02:36:43.457' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (183, 3, 71, CAST(N'2023-08-05T02:39:26.797' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (184, 3, 48, CAST(N'2023-08-05T02:41:07.667' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (185, 29, 117, CAST(N'2023-08-05T02:45:39.537' AS DateTime), 1, CAST(N'2023-08-05T02:45:57.957' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (186, 3, 117, CAST(N'2023-08-05T14:07:26.680' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (187, 57, 4, CAST(N'2023-08-05T16:49:38.193' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (188, 3, 63, CAST(N'2023-08-05T16:50:10.433' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (189, 3, 69, CAST(N'2023-08-05T22:39:53.587' AS DateTime), 1, CAST(N'2023-08-05T22:39:55.777' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (190, 3, 76, CAST(N'2023-08-06T11:11:14.900' AS DateTime), 1, CAST(N'2023-08-06T11:11:29.260' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (191, 58, 118, CAST(N'2023-08-06T13:59:27.287' AS DateTime), 1, CAST(N'2023-08-06T13:59:29.620' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (192, 58, 4, CAST(N'2023-08-06T14:01:23.633' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (193, 58, 1, CAST(N'2023-08-06T14:26:59.667' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (194, 58, 16, CAST(N'2023-08-06T14:27:01.637' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (195, 3, 118, CAST(N'2023-08-07T11:10:16.430' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (196, 29, 118, CAST(N'2023-08-07T13:48:03.507' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (197, 66, 16, CAST(N'2023-08-07T13:55:33.020' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (198, 55, 48, CAST(N'2023-08-07T15:09:24.877' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (199, 55, 117, CAST(N'2023-08-07T15:09:28.537' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (200, 55, 2, CAST(N'2023-08-07T15:09:35.563' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (201, 55, 118, CAST(N'2023-08-07T15:10:00.593' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (202, 3, 2, CAST(N'2023-08-07T23:15:13.087' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (203, 67, 1, CAST(N'2023-08-08T16:52:42.953' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (204, 67, 2, CAST(N'2023-08-08T17:01:19.053' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (205, 67, 75, CAST(N'2023-08-08T17:03:25.950' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (206, 67, 101, CAST(N'2023-08-08T17:03:29.773' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (207, 67, 16, CAST(N'2023-08-08T17:14:51.417' AS DateTime), 1, CAST(N'2023-08-08T17:14:52.603' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (208, 67, 118, CAST(N'2023-09-10T13:06:49.080' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (209, 67, 117, CAST(N'2023-09-10T23:03:59.727' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (210, 67, 112, CAST(N'2023-09-10T23:04:38.170' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (211, 29, 111, CAST(N'2023-09-10T23:09:43.050' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (212, 68, 118, CAST(N'2023-09-10T23:26:41.823' AS DateTime), 0, NULL)
SET IDENTITY_INSERT [dbo].[History] OFF
SET IDENTITY_INSERT [dbo].[Hoadon] ON 

INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (38, N'59836674', 1, 1, N'Thanh toan don hang:59836674  ', N'00', N'14084747', 1000000, N'OCB                 ', CAST(N'2023-08-04T17:43:51.147' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (39, N'73526453', 4, 1, N'Thanh toan don hang:73526453  ', N'24', N'0       ', 1000000, N'VNPAY               ', CAST(N'2023-08-04T17:46:12.407' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (48, N'87334615', 16, 55, N'Thanh toan don hang:87334615  ', N'00', N'14084752', 1500000, N'JCB                 ', CAST(N'2023-08-04T17:50:52.900' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (49, N'43297020', 4, 5, N'Thanh toan don hang:43297020  ', N'00', N'14084772', 1000000, N'MASTERCARD          ', CAST(N'2023-08-04T18:05:04.557' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (50, N'94497026', 63, 55, N'Thanh toan don hang:94497026  ', N'00', N'14084942', 2500000, N'OCB                 ', CAST(N'2023-08-05T00:19:46.840' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (51, N'43220687', 1, 29, N'Thanh toan don hang:43220687  ', N'00', N'14084954', 1000000, N'OCB                 ', CAST(N'2023-08-05T00:56:29.530' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (52, N'44063870', 16, 3, N'Thanh toan don hang:44063870  ', N'00', N'14084971', 1500000, N'OCB                 ', CAST(N'2023-08-05T02:37:47.477' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (54, N'82595397', 4, 3, N'Thanh toan don hang:82595397  ', N'00', N'14084972', 1000000, N'OCB                 ', CAST(N'2023-08-05T02:39:10.143' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (55, N'94734173', 1, 3, N'Thanh toan don hang:94734173  ', N'00', N'14084973', 2000000, N'OCB                 ', CAST(N'2023-08-05T02:41:55.133' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (56, N'28997598', 4, 29, N'Thanh toan don hang:28997598  ', N'24', N'0       ', 1000000, N'VNPAY               ', CAST(N'2023-08-05T02:42:42.237' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (57, N'54025200', 117, 3, N'Thanh toan don hang:54025200  ', N'00', N'14085139', 10000000, N'OCB                 ', CAST(N'2023-08-05T14:07:42.013' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (58, N'60371807', 63, 3, N'Thanh toan don hang:60371807  ', N'00', N'14085354', 2500000, N'OCB                 ', CAST(N'2023-08-05T22:38:21.807' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (59, N'49070913', 76, 3, N'Thanh toan don hang:49070913  ', N'24', N'0       ', 5100000, N'VNPAY               ', CAST(N'2023-08-06T11:11:22.020' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (63, N'27999988', 118, 58, N'Thanh toan don hang:27999988  ', N'00', N'14085505', 3200000, N'VISA                ', CAST(N'2023-08-06T14:01:06.787' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (64, N'50348066', 16, 66, N'Thanh toan don hang:50348066  ', N'24', N'0       ', 1500000, N'VNPAY               ', CAST(N'2023-08-07T13:55:50.543' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (67, N'89057702', 1, 55, N'Thanh toan don hang:89057702  ', N'24', N'14086261', 2100000, N'VIB                 ', CAST(N'2023-08-07T15:14:50.420' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (68, N'91374224', 2, 29, N'Thanh toan don hang:91374224  ', N'24', N'0       ', 2200000, N'VNPAY               ', CAST(N'2023-08-07T23:02:39.017' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (69, N'10860753', 118, 29, N'Thanh toan don hang:10860753  ', N'00', N'14086709', 3200000, N'OCB                 ', CAST(N'2023-08-07T23:08:24.977' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (70, N'38611820', 1, 67, N'Thanh toan don hang:38611820  ', N'00', N'14087518', 2100000, N'OCB                 ', CAST(N'2023-08-08T17:00:34.587' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (72, N'01892667', 117, 29, N'Thanh toan don hang:01892667  ', N'00', N'14110087', 2000000, N'NCB                 ', CAST(N'2023-09-08T10:58:31.833' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (73, N'56965677', 118, 67, N'Thanh toan don hang:56965677  ', N'00', N'14111301', 3200000, N'NCB                 ', CAST(N'2023-09-10T23:12:58.833' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (75, N'34267201', 118, 68, N'Thanh toan don hang:34267201  ', N'00', N'14111306', 3200000, N'NCB                 ', CAST(N'2023-09-10T23:27:36.090' AS DateTime))
SET IDENTITY_INSERT [dbo].[Hoadon] OFF
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (1, 1, 2, 4, CAST(N'2023-07-21T00:47:09.257' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (2, 1, 41, 4, CAST(N'2023-07-20T00:48:19.377' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (3, 1, 71, 4, CAST(N'2023-07-17T17:09:11.030' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (4, 1, 1, 4, CAST(N'2023-08-03T23:59:48.037' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (5, 1, 4, 4, CAST(N'2023-08-04T10:37:55.250' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (6, 1, 72, 5, CAST(N'2023-07-18T15:17:43.350' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (7, 4, 4, 3, CAST(N'2023-07-17T19:06:36.023' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (8, 1, 16, 5, CAST(N'2023-08-02T02:23:26.850' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (9, 1, 75, 4, CAST(N'2023-07-23T02:08:46.990' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (10, 1, 63, 4, CAST(N'2023-07-17T21:23:37.127' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (11, 1, 48, 3, CAST(N'2023-07-28T01:08:38.987' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (12, 1, 76, 5, CAST(N'2023-08-02T01:55:59.707' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (13, 1, 64, 5, CAST(N'2023-07-18T16:40:22.717' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (14, 15, 2, 4, CAST(N'2023-07-19T22:26:43.320' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (15, 15, 1, 3, CAST(N'2023-07-19T23:03:14.690' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (16, 1, 69, 5, CAST(N'2023-07-20T01:22:37.163' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (17, 21, 41, 3, CAST(N'2023-07-21T01:40:10.277' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (18, 21, 48, 4, CAST(N'2023-07-21T01:40:36.370' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (19, 21, 1, 5, CAST(N'2023-08-04T18:24:33.467' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (20, 21, 75, 2, CAST(N'2023-07-21T01:41:21.180' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (21, 21, 89, 2, CAST(N'2023-07-21T01:41:55.327' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (22, 21, 4, 2, CAST(N'2023-07-21T01:42:06.540' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (23, 24, 1, 3, CAST(N'2023-07-24T00:23:23.747' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (25, 15, 4, 5, CAST(N'2023-07-24T19:05:10.683' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (27, 24, 2, 3, CAST(N'2023-07-26T22:32:03.600' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (28, 29, 2, 5, CAST(N'2023-08-07T22:29:43.773' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (29, 29, 48, 3, CAST(N'2023-07-27T15:37:42.570' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (30, 29, 110, 5, CAST(N'2023-07-27T15:42:05.590' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (31, 29, 4, 2, CAST(N'2023-07-28T13:23:18.500' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (32, 29, 16, 3, CAST(N'2023-08-02T01:07:11.223' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (33, 55, 1, 5, CAST(N'2023-08-03T15:40:06.677' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (34, 29, 1, 3, CAST(N'2023-08-04T00:01:06.290' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (35, 55, 4, 4, CAST(N'2023-08-03T15:38:11.397' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (36, 1, 115, 4, CAST(N'2023-08-04T02:33:30.723' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (37, 1, 112, 3, CAST(N'2023-08-04T16:49:03.530' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (38, 55, 16, 3, CAST(N'2023-08-04T17:47:24.307' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (39, 4, 63, 3, CAST(N'2023-08-04T17:58:12.380' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (40, 5, 48, 5, CAST(N'2023-08-04T18:03:43.057' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (41, 5, 4, 4, CAST(N'2023-08-04T18:05:34.503' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (42, 5, 1, 5, CAST(N'2023-08-04T18:07:44.010' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (43, 3, 4, 3, CAST(N'2023-08-04T19:47:05.967' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (44, 3, 1, 4, CAST(N'2023-08-05T02:32:12.747' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (45, 15, 75, 5, CAST(N'2023-08-05T02:33:39.917' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (46, 15, 16, 4, CAST(N'2023-08-05T02:34:17.637' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (47, 3, 16, 4, CAST(N'2023-08-05T02:35:21.573' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (48, 3, 112, 5, CAST(N'2023-08-05T02:36:42.633' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (49, 29, 117, 5, CAST(N'2023-08-05T02:45:56.017' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (50, 3, 63, 5, CAST(N'2023-08-05T16:51:29.907' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (51, 3, 48, 4, CAST(N'2023-08-05T22:06:17.203' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (52, 3, 117, 4, CAST(N'2023-08-05T22:38:39.547' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (53, 3, 76, 5, CAST(N'2023-08-06T11:11:30.850' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (54, 58, 118, 4, CAST(N'2023-08-06T13:59:29.013' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (55, 66, 16, 3, CAST(N'2023-08-07T13:55:42.540' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (56, 3, 2, 5, CAST(N'2023-08-07T23:15:19.427' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (57, 67, 1, 5, CAST(N'2023-08-08T16:52:50.637' AS DateTime))
INSERT [dbo].[Rating] ([id], [userId], [videoId], [rating], [ratingDate]) VALUES (58, 67, 118, 4, CAST(N'2023-09-10T23:24:06.040' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rating] OFF
SET IDENTITY_INSERT [dbo].[Share] ON 

INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [shareDate]) VALUES (7, 1, 41, N'zwf89160@omeie.com', CAST(N'2023-07-17T15:23:53.337' AS DateTime))
INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [shareDate]) VALUES (8, 1, 16, N'gqh86232@omeie.com', CAST(N'2023-07-17T21:21:50.350' AS DateTime))
INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [shareDate]) VALUES (9, 24, 1, N'nhut.thanthien17@gmail.com', CAST(N'2023-07-24T00:23:56.470' AS DateTime))
INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [shareDate]) VALUES (10, 1, 4, N'nhut.thanthien17@gmail.com', CAST(N'2023-07-26T23:06:27.947' AS DateTime))
INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [shareDate]) VALUES (11, 1, 48, N'nhut.thanthien17@gmail.com', CAST(N'2023-07-26T23:12:46.870' AS DateTime))
INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [shareDate]) VALUES (12, 29, 2, N'nhut.thanthien17@gmail.com', CAST(N'2023-07-26T23:21:09.627' AS DateTime))
INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [shareDate]) VALUES (13, 29, 4, N'ypx60202@omeie.com', CAST(N'2023-08-01T14:16:45.230' AS DateTime))
INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [shareDate]) VALUES (14, 29, 1, N'nhut.thanthien17@gmail.com', CAST(N'2023-08-01T23:34:29.593' AS DateTime))
INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [shareDate]) VALUES (15, 55, 1, N'ewunehuok@email1.io', CAST(N'2023-08-02T00:35:31.040' AS DateTime))
INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [shareDate]) VALUES (16, 21, 1, N'ewunehuok@email1.io', CAST(N'2023-08-04T18:24:02.630' AS DateTime))
INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [shareDate]) VALUES (17, 3, 1, N'ewunehuok@email1.io', CAST(N'2023-08-05T02:31:36.660' AS DateTime))
INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [shareDate]) VALUES (18, 29, 41, N'nhut.thanthien17@gmail.com', CAST(N'2023-08-05T02:50:50.903' AS DateTime))
INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [shareDate]) VALUES (19, 67, 1, N'nhut.thanthien17@gmail.com', CAST(N'2023-08-08T16:58:22.920' AS DateTime))
INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [shareDate]) VALUES (20, 29, 118, N'nhut.thanthien17@gmail.com', CAST(N'2023-09-10T23:21:54.187' AS DateTime))
INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [shareDate]) VALUES (21, 67, 118, N'nhutlqpc04797@fpt.edu.vn', CAST(N'2023-09-10T23:23:36.447' AS DateTime))
SET IDENTITY_INSERT [dbo].[Share] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (1, N'admin', N'admin', N'84967363343', N'Lê Quang Nhựt', 1, 1, NULL)
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (3, N'nhut.thanthien27@gmail.com', N'lequangnhut', N'84905015900', N'Lê Quang Nhựt', 0, 0, NULL)
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (4, N'nhannt237@gmail.com', N'123123', N'0869996530 ', N'Nguyễn Thanh Nhàn', 0, 1, NULL)
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (5, N'phuongtri122@gmail.com', N'123123', N'0904050145 ', N'Trần Thanh Tâm', 0, 1, NULL)
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (15, N'phuongnguyen28@gmail.com', N'123123', N'0904050145 ', N'Nguyễn Huỳnh Phương', 0, 1, NULL)
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (20, N'thaipq21@gmail.com', N'123123', N'0904050134 ', N'Phan Quốc Thái', 0, 1, NULL)
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (21, N'khangndpc04359@fpt.edu.vn', N'123123', N'0905015940 ', N'Nguyễn Dỹ Khang', 0, 0, NULL)
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (22, N'ngochuyen@gmail.com', N'123123', N'0869929653 ', N'Nguyễn hồng hiếu', 0, 1, NULL)
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (23, N'tripheo@gmail.com', N'123123', N'0905015900 ', N'Nguyễn Thị Thuý Kiều', 0, 1, NULL)
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (24, N'ypx60202@omeie.com', N'123123', N'0905015902 ', N'Trần Trung Hiếu', 0, 1, NULL)
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (29, N'nhutlqpc04797@fpt.edu.vn', N't4uQ1H', N'0396040853 ', N'Lee Wang Nhut', 0, 1, NULL)
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (30, N'aow26378@nezid.com', N'123123', N'0905123456 ', N'Nguyễn Thị Thu Hương', 0, 1, N'uQuNAD42kY5j        ')
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (32, N'ioi53384@nezid.com', N'123123', N'0987654322 ', N'Đỗ Văn Thành', 0, 0, N'OOXkiShLlrg4        ')
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (51, N'nguyenyqn297@gmail.com', N'Pxn681', N'0727631560 ', N'Ngô Thủy', 0, 1, NULL)
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (54, N'kpt34658@nezid.com', N'123123', N'0869992530 ', N'Nguyễn Huỳnh Phương', 0, 1, N'GoD5kacXOcpK        ')
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (55, N'ewunehuok@email1.io', N'123123', N'0918451012 ', N'Trần Thanh Tân', 0, 1, N'x0v80zPP6b87        ')
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (57, N'khangndpc04859@fpt.edu.vn', N'123123', N'0905051900 ', N'Nguyễn Dỹ Khang', 0, 1, N'L3JRiTKrOJNb        ')
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (58, N'dga75722@zslsz.com', N'123123', N'0912345678 ', N'Nguyễn Văn Anh', 0, 0, N'73PKxvT0Njny        ')
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (66, N'rakucogey@britishpreschool.net', N'123123', N'0869296530 ', N'Vũ Phạm Đình Thái', 0, 0, N'Mu12msXEGJlK        ')
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (67, N'nhut.thanthien127@gmail.com', N'123123', N'0919405121 ', N'Lê Quang Nhựt', 0, 1, N'gCkPk6hyK8ZK        ')
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (68, N'nhut.thanthien17@gmail.com', N'123123', N'08699965302', N'Lê Quang Nhựt', 0, 0, N'kR4qpHeXCY7f        ')
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[Video] ON 

INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (1, N'Con Bạn Lấy Chồng - Ờ Phương x Vinh Z x Blackbi | OST CON NHÓT MÓT CHỒNG – ĐANG CHIẾU TẠI RẠP', N'BfARUE6Tx1U', N'https://img.youtube.com/vi/BfARUE6Tx1U/maxresdefault.jpg', 3, 3, N'Tiến Luật, Thu Trang', N'Thu Trang, Thái Hòa, Tiến Luật', N' Phim  Tình cảm', N'Tình cảm gia đình', N'Nhót, người phụ nữ “chưa kịp già” đã sắp bị mãn kinh, vội vàng đi tìm chồng. Nhưng sâu thẳm trong cô là khao khát có một đứa con và luôn muốn hàn gắn với người cha suốt ngày say xỉn của mình.', 21000, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (2, N'[S6] Doraemon Tập 298 - Hồn Ma Xuất Hiện - Tiếng Việt', N'R5aLRIu3Sxs', N'https://img.youtube.com/vi/R5aLRIu3Sxs/maxresdefault.jpg', 5, 4, N'Nguyễn Ngọc Ngân', N'#doraemontiengviet #nobita #doraemon', N'Phim hoạt hình', N'🎉🎉Đăng ký POPS Kids Learn để tham gia các khóa học online tương tác với giảng viên ngay nhé 👉 https://popskids.onelink.me/X36W/POPS...', N'Doraemon được mua bản quyền và được cập nhật phát sóng trên ứng dụng giải trí POPS Kids & kênh YouTube POPS Kids. Đây là bộ phim chuyển thể từ truyện tranh hấp dẫn nhất Nhật Bản: Doraemon của tác giả Fujiko Fujio sáng tác từ năm 1969. 

Bộ truyện kể về một chú mèo máy tên Doraemon đến từ thế kỉ 22 để giúp một cậu bé lớp 5 hậu đậu tên là Nobi Nobita. Sewashi (Nobito), cháu ba đời của Nobita gửi Doraemon về quá khứ nhằm giúp đỡ ông mình, qua đó cải thiện được hoàn cảnh của con cháu Nobita sau này. 

Các tập phim Doraemon thường xoay quanh những rắc rối hay xảy ra với cậu bé Nobita. Cốt truyện thường gặp nhất là Nobita trở về nhà khóc lóc với Doraemon vì những rắc rối mà cậu gặp phải ở trường học hoặc với bạn bè. Sau khi bị cậu van nài hoặc thúc giục, Doraemon sẽ lấy ra một bảo bối trong chiếc túi thần kỳ trước bụng để giúp Nobita giải quyết rắc rối của mình. 

Nhưng Nobita sẽ lại thường đi quá xa so với dự định ban đầu của Doraemon. Cậu thường lấy sự ưu việt của bảo bối để trêu ghẹo mọi người nên cuối cùng bị phản tác dụng, bị bảo bối gây phiền phức. Có đôi khi những người bạn của Nobita, thường là Suneo hoặc Jaian lại lấy trộm những bảo bối và sử dụng chúng không đúng mục đích. Kết thúc mỗi câu chuyện, những ai sử dụng sai mục đích bảo bối sẽ phải chịu hậu quả do mình gây ra, từ đó khán giả sẽ rút ra được bài học cho riêng mình.', 10000, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (4, N'[S6] Doraemon Tập 299 - Kế Hoạch Ngày Sinh Nhật, Máy Cải Lão Hoàn Đồng - Tiếng Việt', N'0HOa-A0rt_Q', N'https://img.youtube.com/vi/0HOa-A0rt_Q/maxresdefault.jpg', 1, 2, N'Nguyễn Ngọc Ngạn', N'#doraemontiengviet #nobita #doraemon', N'Phim hoạt hình', N'🎉🎉Đăng ký POPS Kids Learn để tham gia các khóa học online tương tác với giảng viên ngay nhé 👉 https://popskids.onelink.me/X36W/POPS...', N'Doraemon được mua bản quyền và được cập nhật phát sóng trên ứng dụng giải trí POPS Kids & kênh YouTube POPS Kids. Đây là bộ phim chuyển thể từ truyện tranh hấp dẫn nhất Nhật Bản: Doraemon của tác giả Fujiko Fujio sáng tác từ năm 1969. 

Bộ truyện kể về một chú mèo máy tên Doraemon đến từ thế kỉ 22 để giúp một cậu bé lớp 5 hậu đậu tên là Nobi Nobita. Sewashi (Nobito), cháu ba đời của Nobita gửi Doraemon về quá khứ nhằm giúp đỡ ông mình, qua đó cải thiện được hoàn cảnh của con cháu Nobita sau này. 

Các tập phim Doraemon thường xoay quanh những rắc rối hay xảy ra với cậu bé Nobita. Cốt truyện thường gặp nhất là Nobita trở về nhà khóc lóc với Doraemon vì những rắc rối mà cậu gặp phải ở trường học hoặc với bạn bè. Sau khi bị cậu van nài hoặc thúc giục, Doraemon sẽ lấy ra một bảo bối trong chiếc túi thần kỳ trước bụng để giúp Nobita giải quyết rắc rối của mình. 

Nhưng Nobita sẽ lại thường đi quá xa so với dự định ban đầu của Doraemon. Cậu thường lấy sự ưu việt của bảo bối để trêu ghẹo mọi người nên cuối cùng bị phản tác dụng, bị bảo bối gây phiền phức. Có đôi khi những người bạn của Nobita, thường là Suneo hoặc Jaian lại lấy trộm những bảo bối và sử dụng chúng không đúng mục đích. Kết thúc mỗi câu chuyện, những ai sử dụng sai mục đích bảo bối sẽ phải chịu hậu quả do mình gây ra, từ đó khán giả sẽ rút ra được bài học cho riêng mình.
', 10000, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (16, N'FAPtv Cơm Nguội: Tập 216 - Ba Chàng Trai Hạnh Phúc
', N'4FLO4ic6GNg', N'https://img.youtube.com/vi/4FLO4ic6GNg/maxresdefault.jpg', 0, 0, N'Trần Đức Viễn', N' Thái Vũ, Huỳnh Phương,Vinh Râu, Ribi, Thúy Kiều, Phương Nam,Thông Nguyễn, Kim Suri ,Quốc Trường, Mr Park Sungho, Minh Lộc, Đức Duy, Khánh Huy, Hải ngân cùng với một số diễn viên khác....', N'Phim hài', N'Phim Hài', N'Khởi nghiệp đơn giản với Gà chiên Chicken Plus: https://www.facebook.com/CHICKENPLUS.VN/
Lao động là vinh quang, lang thang là chết đói kkkk', 15000, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (41, N'Mùa Hè Rực Rỡ : Tập 4 - Vạch Mặt || FAPtv Phim Tuổi Teen', N'n5MJDZkX3Rs', N'https://img.youtube.com/vi/n5MJDZkX3Rs/maxresdefault.jpg', 2, 2, N'Trần Đức Viễn', N'Doramon', N'Phim hài', N'#FAPTV #phimhay #phimtinhcam #Muaherucro #phimhai #leadwithlove  #lofmalto ', N'Mùa Hè Rực Rỡ : Tập 4 - Vạch Mặt || FAPtv Phim Tuổi Teen
Phim được phát sóng vào 19h tối thứ 7 mỗi tuần, mời các bạn đón xem!
Sữa Lúa Mạch Sôcôla Lof Malto - Lead with Lof - Năng lượng cho GenZ, mua đi chờ chi mấy homies. Mua hàng tại: https://bit.ly/mualofmaltongay', 0, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (48, N'Mùa Hè Rực Rỡ : Tập 3 - Người Lạ Mà Quen || FAPtv Phim Tuổi Teen', N'WWreBGNp6cg', N'https://img.youtube.com/vi/WWreBGNp6cg/maxresdefault.jpg', 2, 3, N'Trần Đức Viễn, Vinh Râu', N'Đức Viễn, Vinh Râu,Thái Vũ, Huỳnh Phương, Nikola , Thúy Kiều, Diễm Châu, Yến Vy, Kim Thảo, Phúc Vũ, Quốc Hưng, Mai Thy, Minh Thảo,Bảo Quyên', N'Phim Hài', N'Phim Hài', N'Mùa Hè Rực Rỡ : Tập 3 - Người Lạ Mà Quen || FAPtv Phim Tuổi Teen
Phim được phát sóng vào 19h tối thứ 7 mỗi tuần, mời các bạn đón xem!
Sữa Lúa Mạch Sôcôla Lof Malto - Lead with Lof - Năng lượng cho GenZ, mua đi chờ chi mấy homies. Mua hàng tại: https://bit.ly/mualofmaltongay', 0, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (63, N'Mùa Hè Rực Rỡ : Tập 2 - Bí Mật Ngôi Nhà Hoang || FAPtv Phim Tuổi Teen', N'KFzlcUtLu24', N'https://img.youtube.com/vi/KFzlcUtLu24/maxresdefault.jpg', 2, 3, N'Trần Đức Viễn, Vinh Râu', N'Đức Viễn, Vinh Râu,Thái Vũ, Huỳnh Phương, Nikola , Thúy Kiều, Diễm Châu, Yến Vy, Kim Thảo, Phúc Vũ, Quốc Hưng, Mai Thy, Minh Thảo,Bảo Quyên', N'Phim Hài', N'Phim Hài', N'Mùa Hè Rực Rỡ : Tập 2 - Bí Mật Ngôi Nhà Hoang || FAPtv Phim Tuổi Teen
Phim được phát sóng vào 19h tối thứ 7 mỗi tuần, mời các bạn đón xem!
Sữa Lúa Mạch Sôcôla Lof Malto - Lead with Lof - Năng lượng cho GenZ, mua đi chờ chi mấy homies.', 25000, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (64, N'Mùa Hè Rực Rỡ : Tập 1 - Về Miền Tây || FAPtv Phim Tuổi Teen
', N'UE5VYYkbW0Q', N'https://img.youtube.com/vi/UE5VYYkbW0Q/maxresdefault.jpg', 2, 3, N'Trần Đức Viễn, Vinh Râu', N'Đức Viễn, Vinh Râu,Thái Vũ, Huỳnh Phương, Nikola , Thúy Kiều, Diễm Châu, Yến Vy, Kim Thảo, Phúc Vũ, Quốc Hưng, Mai Thy, Minh Thảo,Bảo Quyên', N'Phim Hài', N'Phim Hài', N'Mùa Hè Rực Rỡ : Tập 1 - Về Miền Tây || FAPtv Phim Tuổi Teen
Phim được phát sóng vào 19h tối thứ 7 mỗi tuần, mời các bạn đón xem!
Sữa Lúa Mạch Sôcôla Lof Malto - Lead with Lof - Năng lượng cho GenZ, mua đi chờ chi mấy homies. Mua hàng tại: https://bit.ly/mualofmaltongay', 0, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (69, N'FAPtv Cơm Nguội: Tập 290: Cú Ngã Đầu Đời', N'GalCJ-ZAd0k', N'https://img.youtube.com/vi/GalCJ-ZAd0k/maxresdefault.jpg', 2, 3, N'Trần Đức Viễn', N'Ribi Sachi, Vinh Râu, Thái Vũ, Trang Nơ, Uy Trần', N'Phim Hài', N'#FAPTV #cơmnguội  #chongnanghiruscar #suachongnanghiruscar #hiruscarpostacne', N'Trải nghiệm trọn bộ Routine Hiruscar tại : Shopee: https://bit.ly/HIRUSCARxFAPTV
hoặc mua ngay tại các cửa hàng, nhà thuốc Long Châu, An Khang, Pharmacity, Guardian, Watson và Medicare ', 17000, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (71, N'FAPtv Cơm Nguội Tập 289 : Cô Shipper Và Hoàng Tử', N'zimJ6o8wzAo', N'https://img.youtube.com/vi/zimJ6o8wzAo/maxresdefault.jpg', 4, 1, N'Trần Đức Viễn', N'Ribi Sachi, Vinh Râu, Thái Vũ, Trang Nơ, Uy Trần', N'Phim Hài', N'#FAPTV #cơmnguội  #chongnanghiruscar #suachongnanghiruscar #serumhiruscar', N'Trải nghiệm trọn bộ Routine Hiruscar tại : Shopee: https://bit.ly/HIRUSCARxFAPTV
hoặc mua ngay tại các nhà thuốc, các cửa hàng Guardian, Watson và Medicare', 0, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (72, N'FAPtv Cơm Nguội 288: Đi Học Cùng Con', N'8ThM36Os_OA', N'https://img.youtube.com/vi/8ThM36Os_OA/maxresdefault.jpg', 1, 5, N'Trần Đức Viễn', N' Ribi Sachi, Vinh Râu, Thái Vũ, Trang Nơ, Uy Trần, Mai Xuân Thứ, Tuyết Nguyễn, Kim SuriLớp học diễn viên : Minh Thành, Nguyễn Hường, Susu Võ, Phú Quí, Hà Vy  ', N'Phim Hài', N'#FAPTV #cơmnguội #Hiruscar #HiruscarSpotGel ', N'Trải nghiệm trọn bộ Routine Hiruscar tại : Shopee: https://shopee.vn/hiruscar_vietnam
hoặc mua ngay tại các nhà thuốc, các cửa hàng Guardian, Watson và Medicare', 19999, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (75, N'FAPtv Cơm Nguội 287 : Hai Chàng Một Tình Yêu', N'rdwl9WrSYY0', N'https://img.youtube.com/vi/rdwl9WrSYY0/maxresdefault.jpg', 5, 1, N'Trần Đức Viễn', N'Vinh Râu, Thái Vũ, Huỳnh Phương, Ribi Sachi, Thuý Kiều, Trang Nơ, Uy Trần', N'Phim Hài', N'#FAPTV #comnguoi #Cơmnguội #thaivu #vinhrau #huynhphuong #ribisachi #phimhai2023', N'Chúc cả nhà có một kỳ nghỉ lễ thật vui vẻ bên gia đình và người thân. Cùng nhau quây quần xem Cơm Nguội với những tiếng cười vui vẻ nhennnn <3', 0, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (76, N'FAPtv Cơm Nguội 280: Về Nhà Với Mẹ - Phim HÀI TẾT 2023', N'xe2AY0LnVms', N'https://img.youtube.com/vi/xe2AY0LnVms/maxresdefault.jpg', 22, 1, N'Trần Đức Viễn', N'Ribi Sachi, Vinh Râu, Thái Vũ, Huỳnh Phương, Thuý Kiều, Trang Nơ, Uy Trần', N'Phim Hài', N'#FAPTV #comnguoi #Cơmnguội #thaivu #vinhrau #huynhphuong #ribisachi #phimhai2023', N'Chúc các bạn iu xem phim vui vẻ, nhớ cho chúng mình xin ý kiến nhen!!', 51000, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (83, N'FAPtv Cơm Nguội: Tập 140 - Ba Anh Yêu Mẹ Em', N'tqfzul636Ko', N'https://img.youtube.com/vi/tqfzul636Ko/maxresdefault.jpg', 0, 0, N'Trần Đức Viễn', N'Vinh Râu, Thái Vũ, Ribi Sachi, Thúy Kiều, Kim Suri,  Fap Team.', N'Phim hài', N'Xin cảm ơn Trung Tâm Hướng Nghiệp Á Âu đã tài trợ địa điểm quay làm bánh cho ekip', N'FAPtv Cơm Nguội: Tập 140 - Ba Anh Yêu Mẹ Em
Bánh kem sữa tươi Rosio với bốn hương vị: Trà xanh Nhật Bản, Hạt chia Peru, Phô mai Úc và Red Velvet Hoa Kỳ. Cốt bánh mềm mịn quyện cùng lớp kem được làm từ 100% sữa tươi mang đến vị ngon khó cưỡng
❤ Fanpage: https://www.facebook.com/BanhRosio/
❤ Website: https://goo.gl/X7TibQ', 0, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (84, N'FAPtv Cơm Nguội: Tập 215 - Mỗi Khi Em Cười', N'D9w-5LqvJbg', N'https://img.youtube.com/vi/D9w-5LqvJbg/maxresdefault.jpg', 0, 0, N'Trần Đức Viễn', N'Vinh Râu, Thái Vũ, Ribi Sachi, Thúy Kiều, Kim Suri,  Fap Team.', N'Phim hài', N'Xin cảm ơn Trung Tâm Hướng Nghiệp Á Âu đã tài trợ địa điểm quay làm bánh cho ekip', N'qwwdqwqdwdwdq', 0, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (87, N'FAPtv Cơm Nguội : Tập 248 - Chuyện Kiều', N'2ajGlMbyc0Q', N'https://img.youtube.com/vi/2ajGlMbyc0Q/maxresdefault.jpg', 0, 0, N'Trần Đức Viễn', N'Thái Vũ, Vinh Râu, Huỳnh Phương, Uy Trần, Ribi Sachi, Thúy Kiều, Trang Nơ, cùng với một số diễn viên khác....', N'Phim hài', N'#FAPTV #Cơmnguội #Hiruscar #ChuyenKieu #TruyenKieu', N'FAPtv Cơm Nguội : Tập 248 - Chuyện Kiều
Hiruscar Silicone Pro đang có chương trình khuyến mãi hấp dẫn tại Lazada: https://bit.ly/lazada-hiruscar từ 20 đến 31/03. Các bạn mua ngay kẻo lỡ nhé!
*/// Nếu trong khi xem phim có xuất hiện quảng cáo, hãy xem hoặc click quảng cáo để ủng hộ chúng tôi ///**', 45000, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (89, N'FAPtv Cơm Nguội: Tập 203 - Duyên Phận', N'qhUhGKVampw', N'https://img.youtube.com/vi/qhUhGKVampw/maxresdefault.jpg', 0, 0, N'Trần Đức Viễn', N'Vinh Râu, Thái Vũ, Huỳnh Phương, Ribi, Hào Wong, Hải Lê... Cùng với các bạn diễn viên khác.', N'Phim hài', N'*/// Nếu trong khi xem phim có xuất hiện quảng cáo, hãy xem hoặc click quảng cáo để ủng hộ chúng tôi ///**', N'FAPtv Cơm Nguội: Tập 203 - Duyên Phận
Chớp mắt sương sương phát thôi mà vỡ tan bao thứ! Thôi lỗi tại duyên phận nó vậy đành chịu...
#FAPTV #Cơmnguội #Duyenphan #DuyênPhận', 0, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (90, N'FAPtv Cơm Nguội: Tập 176 - Quán Cafe Bất Ổn: Tình Đồng Chí', N'JhO59Hjc-CQ', N'https://img.youtube.com/vi/JhO59Hjc-CQ/maxresdefault.jpg', 0, 0, N'Trần Đức Viễn', N'Vinh Râu, Thái Vũ, Huỳnh Phương, Ribi,Thúy Kiều,Hoàng Siêm, Hào Wong,... Cùng với các bạn diễn viên khác.', N'Phim hài', N'*/// Nếu trong khi xem phim có xuất hiện quảng cáo, hãy xem hoặc click quảng cáo để ủng hộ chúng tôi ///**', N'FAPtv Cơm Nguội: Tập 176 -  Sự trở lại của Quán Cafe Bất Ổn: Tình Đồng Chí
Chỉ trong ngày 11.08, chơi Free Fire - Trúng Iphone X và nhiều quà kỷ niệm 1 năm tuổi nha. Tải game ngay: https://goo.gl/aUpz49 để chơi cùng FAPTV nhé!!!', 0, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (92, N'FAPtv Cơm Nguội: Tập 239 : Bạn Gái Tôi Là Ngôi Sao', N'kK-TOQuegas', N'https://img.youtube.com/vi/kK-TOQuegas/maxresdefault.jpg', 0, 0, N'Trần Đức Viễn', N'Thái Vũ, Vinh Râu, Huỳnh Phương, Uy Trần, Ribi Sachi, Kim Ngân, Thúy Kiều, Mai Xuân Thứ, Tuyết Nguyễn, Huỳnh Sơn....  cùng với một số diễn viên khác....', N'Phim hài', N'#FAPTV #Cơmnguội #KoreanStrawberry */// Nếu trong khi xem phim có xuất hiện quảng cáo, hãy xem hoặc click quảng cáo để ủng hộ chúng tôi ///**', N'FAPtv Cơm Nguội: Tập 239 : Bạn Gái Tôi Là Ngôi Sao
Dâu Tây Hàn Quốc hiện đăng có bán tại các siêu thị và cửa hàng tiện lợi, nhanh tay sở hữu ngay 1 hộp và làm quà tặng cho mùa Giáng Sinh này nhé!
Trong clip chúng tôi sử dụng bài hát trong tập cơm nguội Bạn Gái Tôi Là Ngôi Sao 
Call Me Out - Loving Caliber', 72000, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (93, N'FAPtv Cơm Nguội: Tập 239 : Bạn Gái Tôi Là Ngôi Sao', N'ATd0zK5yRxQ', N'https://img.youtube.com/vi/ATd0zK5yRxQ/maxresdefault.jpg', 0, 0, N'Trần Đức Viễn', N'Thái Vũ, Vinh Râu, Huỳnh Phương, Uy Trần, Ribi Sachi, Kim Ngân, Thúy Kiều, Mai Xuân Thứ, Tuyết Nguyễn, Huỳnh Sơn....  cùng với một số diễn viên khác....', N'Phim hài', N'*/// Nếu trong khi xem phim có xuất hiện quảng cáo, hãy xem hoặc click quảng cáo để ủng hộ chúng tôi ///**', N'FAPtv Cơm Nguội: Tập 239 : Bạn Gái Tôi Là Ngôi Sao
Dâu Tây Hàn Quốc hiện đăng có bán tại các siêu thị và cửa hàng tiện lợi, nhanh tay sở hữu ngay 1 hộp và làm quà tặng cho mùa Giáng Sinh này nhé!
Trong clip chúng tôi sử dụng bài hát trong tập cơm nguội Bạn Gái Tôi Là Ngôi Sao 
Call Me Out - Loving Caliber', 0, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (94, N'FAPtv Cơm Nguội: Tập 111 - Theo Đuổi Đam Mê', N'OivYGG7BVNI', N'https://img.youtube.com/vi/OivYGG7BVNI/maxresdefault.jpg', 0, 0, N'Trần Đức Viễn', N'Thái Vũ, Vinh Râu, Huỳnh Phương, Uy Trần, Ribi Sachi, Kim Ngân, Thúy Kiều, Mai Xuân Thứ, Tuyết Nguyễn, Huỳnh Sơn....  cùng với một số diễn viên khác....', N'Phim hài', N'*/// Nếu trong khi xem phim có xuất hiện quảng cáo, hãy xem hoặc click quảng cáo để ủng hộ chúng tôi ///**', N'FAPtv Cơm Nguội: Tập 239 : Bạn Gái Tôi Là Ngôi Sao
Dâu Tây Hàn Quốc hiện đăng có bán tại các siêu thị và cửa hàng tiện lợi, nhanh tay sở hữu ngay 1 hộp và làm quà tặng cho mùa Giáng Sinh này nhé!
Trong clip chúng tôi sử dụng bài hát trong tập cơm nguội Bạn Gái Tôi Là Ngôi Sao 
Call Me Out - Loving Caliber', 0, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (95, N'Mùa Hè Rực Rỡ : Tập 6 - Lời Xin Lỗi || FAPtv Phim Tuổi Teen', N'-YspL3peIRw', N'https://img.youtube.com/vi/-YspL3peIRw/maxresdefault.jpg', 0, 0, N'Trần Đức Viễn', N'Đức Viễn, Vinh Râu,Thái Vũ, Huỳnh Phương, Nikola , Thúy Kiều, Diễm Châu, Yến Vy, Kim Thảo, Phúc Vũ, Quốc Hưng, Mai Thy, Minh Thảo, Bảo Quyên', N'Phim hài', N'Link TVC Lof Malto:      • SỮA CHUA UỐNG LOF...  ', N'Mùa Hè Rực Rỡ : Tập 6 - Lời Xin Lỗi || FAPtv Phim Tuổi Teen
Phim được phát sóng vào 19h tối thứ 7 mỗi tuần, mời các bạn đón xem!
Sữa Lúa Mạch Sôcôla Lof Malto - Lead with Lof - Năng lượng cho GenZ, mua đi chờ chi mấy homies. Mua hàng tại: https://bit.ly/mualofmaltongay', 51000, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (98, N'FAPtv Cơm Nguội: Tập 111 - Theo Đuổi Đam Mê', N'MqoEVy_IcuM', N'https://img.youtube.com/vi/MqoEVy_IcuM/maxresdefault.jpg', 0, 0, N'Trần Đức Viễn', N'Vinh Râu, Thái Vũ, Ribi Sachi, Thúy Kiều, Kim Suri,  Fap Team.', N'Phim hài', N'Xin cảm ơn Trung Tâm Hướng Nghiệp Á Âu đã tài trợ địa điểm quay làm bánh cho ekip', N'Dynasty Warriors: Unleashed – Huyền thoại vẫn mãi là huyền thoại
-Tải game tại: https://i.nx.com/34B
-Trang chủ:http://unleashed.nexon.com/vn 
-Fanpage: https://www.facebook.com/dwUNLEASHED/ ', 0, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (100, N'FAPtv Cơm Nguội: Tập 118 - Thi Rớt', N'4MfSPmHQMxk', N'https://img.youtube.com/vi/4MfSPmHQMxk/maxresdefault.jpg', 0, 0, N'Trần Đức Viễn', N'Vinh Râu, Thái Vũ, Huỳnh Phương, Ribi Sachi, Kim Suri,Quốc Trường,Gia lâm, Fap Team.', N'Phim hài', N'Vì sao Huỳnh Phương học giỏi mà thi rớt, còn Vinh và Thái học dốt lại thi.... rớt luôn???', N'"Học cao đẳng tại FPT Polytechnic
Đào tạo cực chuẩn không thiếu gì
2 năm 4 tháng làm được việc
Doanh nghiệp chào đón, chẳng sợ chi."', 0, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (101, N'Tuy Hai Mà Một - Tập Full | FAPTV', N'6dJBEHP8ESg', N'https://img.youtube.com/vi/6dJBEHP8ESg/maxresdefault.jpg', 0, 0, N'Trần Đức Viễn', N'Thái Vũ, Huỳnh Phương, Vinh Râu, Uy Trần, Ribi Sachi, Mai Xuân Thứ, Kim Ngân, cùng với một số diễn viên khác....', N'Phim hài', N'*/// Nếu trong khi xem phim có xuất hiện quảng cáo, hãy xem hoặc click quảng cáo để ủng hộ chúng tôi ///**', N'Tải Free Fire ngay để nhập vai, bắn súng và chinh phục Top 1: https://freefire.onelink.me/Io8U/38a3
#FAPTV #Cơmnguội #FreeFire ', 11000, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (109, N'BỐ GIÀ [FULL] - PHIM GIA ĐÌNH | TRẤN THÀNH, MÁ GIÀU, LÊ GIANG, ANH ĐỨC, TUẤN TRẦN, UYỂN ÂN', N'oA-BhGNK7qw', N'https://img.youtube.com/vi/oA-BhGNK7qw/maxresdefault.jpg', 0, 0, N'TRẤN THÀNH', N'TRẤN THÀNH, MÁ GIÀU, LÊ GIANG, ANH ĐỨC, TUẤN TRẦN, UYỂN ÂNN, LÊ QUỐC NAM, LÂM VỸ DẠ, QUỐC KHÁNH, TRÚC NHÂN, ALI HOÀNG DƯƠNG, TRANG HÝ, BÀ TÂN VLOG.', N'Tình cảm', N'#bogia #tranthanh #hariwon #ngocgiau #legiang #trucnhan #huynhuyenan #lamvyda #anhduc #tuantran #tranghy  #phimchieurap #phimgiadinh', N'BỐ GIÀ là một bộ phim Web drama tình cảm gia đình, một dự án phim hài Tết 2020 của Trấn Thành. Trong phim, Trấn Thành đóng vai chính - một ông bố tính cục súc, bảo thủ nhưng rất thương con, luôn quan tâm gia đình. Phim xoay quanh đề tài thế giới giang hồ, xoáy vào chuyện giữ bản chất lương thiện hay chạy theo tiền bạc. Êkíp quay trong 11 ngày. Đạo diễn là Mr. Tô - người thực hiện các web-drama Thập tam muội, Thập tứ cô nương, Vi Cá tiền truyện... Ngoài Lê Giang, Tuấn Trần, em gái Trấn Thành cũng tham gia một vai.
-------
Chào mừng bạn đến với Youtube chính thức được trực tiếp quản lý bởi MC Trấn Thành, những thành viên của gia đình TRAN THANH Official và METUB Network.
Các bạn nhớ Subscribe, Like và Share để ủng hộ tinh thần cho Trấn Thành và nhận được những thông tin, video mới nhất về các hoạt động nghệ thuật của MC Trấn Thành  nhé.
Fanpage chính thức:
https://www.facebook.com/tran.thanh.ne
Kênh youtube chính thức: http://metub.net/tranthanh
Rất cảm ơn các anh chị, các bạn đã ủng hộ chúng tôi trong suốt thời gian qua!', 25000, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (110, N'Siêu Sao Siêu Ngố Full HD - Trường Giang | Hài Tết Việt Nam Mới Nhất 2023', N'o00gSlZcwnQ', N'https://img.youtube.com/vi/o00gSlZcwnQ/maxresdefault.jpg', 0, 0, N'Trường Giang', N'Trường Giang, Sam, và cùng các diễn viên khác', N'Phim hài tết', N' #truonggiang #haitet ', N'Siêu Sao Siêu Ngố Full HD - Trường Giang | Hài Tết Việt Nam Mới Nhất 2023
 #truonggiang #haitet 
Duyên Kiếp Full Bộ : https://bit.ly/3cSDwAn
Đấu Trí Full :   

 • Danh sách phát  
', 0, 1, CAST(N'2023-08-01T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (111, N'FAPtv || Lớp Chuyên ', N'1P62c7UYcx8', N'https://img.youtube.com/vi/1P62c7UYcx8/maxresdefault.jpg', 0, 0, N'Trần Đức Viễn', N'Vinh Râu, Thái Vũ, Ribi Sachi, Thúy Kiều, Kim Suri,  Fap Team.', N'Phim hài', N'#cơmnguội  #thaivu  #vinhrau  #huynhphuong  #ribisachi  #phimhocduong2022  #lopchuyen #cabiet', N'FAPtv || Lớp Chuyên "Cá Biệt": Tập 11 (Tập Cuối)
Thể loại phim: học đường, tình cảm, hài hước
#FAPTV #Cơmnguội  #leadwithLOF
#cơmnguội  #thaivu  #vinhrau  #huynhphuong  #ribisachi  #phimhocduong2022  #lopchuyen #cabiet
-------------
Sữa Lúa Mạch Sôcôla Lof Malto - Lead with Lof - Năng lượng cho GenZ, mua đi chờ chi mấy homies.
Mua hàng tại: https://bit.ly/mualofmaltongay', 0, 1, CAST(N'2023-08-02T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (112, N'FAPtv Cơm Nguội: Tập 164 - Trại Hè Cuồng Nhiệt Phần 2', N'z3v4zgUp8ao', N'https://img.youtube.com/vi/z3v4zgUp8ao/maxresdefault.jpg', 0, 0, N'Trần Đức Viễn, Vinh Râu', N'Vinh Râu, Thái Vũ, Ribi Sachi, Thúy Kiều, Kim Suri,  Fap Team.', N'Phim hài', N'*/// Nếu trong khi xem phim có xuất hiện quảng cáo, hãy xem hoặc click quảng cáo để ủng hộ chúng tôi ///**', N'FAPtv Cơm Nguội - TRẠI HÈ CUỒNG NHIỆT phần 2 tiết lộ nhiều mẫu thuẫn của nhóm, và đỉnh điểm là sự chia rẽ khiến cho chuyến đi có thể bị dừng lại. Chuyện gì đã xảy ra nhỉ? Xem phim hay nhận quà liền tay từ Sunplay: http://bit.ly/SPYTFTV1 Đón xem Phần 3 vào ngày: 25/05/2018', 13000, 1, CAST(N'2023-08-02T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (114, N'TĂNG PHÚC |"SÀI GÒN YẾU ĐUỐI BIẾT DỰA VÀO AI?"(Huỳnh Quốc Huy) | Live in THE ROOFTOP SHOW 25.07.2020', N'gCMUPGC7rQc', N'https://img.youtube.com/vi/gCMUPGC7rQc/maxresdefault.jpg', 0, 0, N'NHẬT NGUYỄN', N'FAPtv Cơm Nguội: Tập 176 - Quán Cafe Bất Ổn: Tình Đồng Chí', N'Nhạc', N'Xin cảm ơn Trung Tâm Hướng Nghiệp Á Âu đã tài trợ địa điểm quay làm bánh cho ekip', N'▶ More information about Tăng Phúc:   ♫ Youtube: http://popsww.com/tangphuc ♫ Instagram: https://www.instagram.com/tang._.phuc/ ♫ Facebook: https://www.facebook.com/tangphucoffi... ♫ Fanpage: https://www.facebook.com/tangphucoffi...', 25000, 0, CAST(N'2023-08-04T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (115, N'FAPtv Cơm Nguội: Tập 204 - Người Cha Đãng Trí', N'RPnIq_59dJc', N'https://img.youtube.com/vi/RPnIq_59dJc/maxresdefault.jpg', 0, 0, N'Trần Đức Viễn', N'FAPtv Cơm Nguội: Tập 176 - Quán Cafe Bất Ổn: Tình Đồng Chí', N'Phim hài', N'Xin cảm ơn Trung Tâm Hướng Nghiệp Á Âu đã tài trợ địa điểm quay làm bánh cho ekip', N'FAPtv Cơm Nguội: Tập 204 - Người Cha Đãng Trí 
FPT Play: Xem phim và truyền hình trực tuyến không giới hạn
★ Website: https://go.onelink.me/1862450885/FPTP...
★ FPT PLAY Box: https://fptplay.tv
#FAPTV, #Cơmnguội, #FPTPlay', 12000, 0, CAST(N'2023-08-04T01:28:47.693' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (116, N'FAPtv Cơm Nguội: Tập 132 - Chuyện Nghề Diễn', N'tAyqv7qX1BA', N'https://img.youtube.com/vi/tAyqv7qX1BA/maxresdefault.jpg', 0, 0, N'Trần Đức Viễn, Vinh Râu', N'Vinh Râu, Thái Vũ, Ribi Sachi, Thúy Kiều, Kim Suri,  Fap Team.', N'Phim hài', N'🎉🎉Đăng ký POPS Kids Learn để tham gia các khóa học online tương tác với giảng viên ngay nhé 👉 https://popskids.onelink.me/X36W/POPS...', N'Vì lý do bản quyền nên Tập FAPtv Cơm Nguội cũ sẽ gỡ xuống, chúng tôi xin upload lại tập này hôm nay.
FAPtv Cơm Nguội: Tập 132 - Chuyện Nghề Diễn
Muốn trị hói đầu và đẩy nhanh tiến trình tái tạo, ngăn ngừa việc rụng tóc? Chọn Maxxhair như Vinh Râu và Thái Vũ trong clip này ngay:  http://bit.ly/2zuYFYZ', 10000, 0, CAST(N'2023-08-04T02:58:06.603' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (117, N'FAPtv Cơm Nguội 279: Xóm Nước Đen', N'hMRoaEuTnoM', N'https://img.youtube.com/vi/hMRoaEuTnoM/maxresdefault.jpg', 0, 0, N'Trần Đức Viễn', N'Vinh Râu, Thái Vũ, Ribi Sachi, Thúy Kiều, Kim Suri,  Fap Team.', N'Phim hài', N'FAPtv Cơm Nguội: Tập 176 - Quán Cafe Bất Ổn: Tình Đồng Chí', N'FAPtv Cơm Nguội 279: Xóm Nước Đen', 20000, 1, CAST(N'2023-08-05T02:44:19.413' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (118, N'Mùa Hè Rực Rỡ : Tập 7 - Si Tình || FAPtv Phim Tuổi Teen', N'HIWRgpNSzcw', N'https://img.youtube.com/vi/HIWRgpNSzcw/maxresdefault.jpg', 0, 0, N'Trần Đức Viễn, Vinh Râu', N'Vinh Râu, Thái Vũ, Ribi Sachi, Thúy Kiều, Kim Suri,  Fap Team.', N'Phim hài', N'#FAPTV #sitình #phimhay  #phimtinhcam #muaherucro  #phimhai #leadwithlove  #lofmalto  ', N'Mùa Hè Rực Rỡ : Tập 7 - Si Tình || FAPtv Phim Tuổi Teen
Phim được phát sóng vào 19h tối thứ 7 mỗi tuần, mời các bạn đón xem!
Sữa Lúa Mạch Sôcôla Lof Malto - Lead with Lof - Năng lượng cho GenZ, mua đi chờ chi mấy homies. Mua hàng tại: https://bit.ly/mualofmaltongay
Link TVC Lof Malto:   

 • SỮA CHUA UỐNG LOF MALTO - ƯNG CÁI BỤN...  ', 32000, 1, CAST(N'2023-08-05T22:42:32.133' AS DateTime))
SET IDENTITY_INSERT [dbo].[Video] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__video__7FF10F055E7CC556]    Script Date: 9/10/2023 11:28:13 PM ******/
ALTER TABLE [dbo].[Video] ADD  CONSTRAINT [UQ__video__7FF10F055E7CC556] UNIQUE NONCLUSTERED 
(
	[href] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[History] ADD  CONSTRAINT [DF__history__viewedD__300424B4]  DEFAULT (getdate()) FOR [viewedDate]
GO
ALTER TABLE [dbo].[History] ADD  CONSTRAINT [DF__history__isLiked__30F848ED]  DEFAULT ((0)) FOR [isLiked]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__user__isAdmin__24927208]  DEFAULT ((0)) FOR [isAdmin]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__user__isActive__25869641]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Video] ADD  CONSTRAINT [DF__video__views__29572725]  DEFAULT ((0)) FOR [views]
GO
ALTER TABLE [dbo].[Video] ADD  CONSTRAINT [DF__video__shares__2A4B4B5E]  DEFAULT ((0)) FOR [shares]
GO
ALTER TABLE [dbo].[Video] ADD  CONSTRAINT [DF__video__isActive__2B3F6F97]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__comment__userId__7F2BE32F] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__comment__userId__7F2BE32F]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__comment__videoId__00200768] FOREIGN KEY([videoId])
REFERENCES [dbo].[Video] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__comment__videoId__00200768]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK__history__userId__2E1BDC42] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK__history__userId__2E1BDC42]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK__history__videoId__2F10007B] FOREIGN KEY([videoId])
REFERENCES [dbo].[Video] ([id])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK__history__videoId__2F10007B]
GO
ALTER TABLE [dbo].[Hoadon]  WITH CHECK ADD  CONSTRAINT [FK_Hoadon_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Hoadon] CHECK CONSTRAINT [FK_Hoadon_User]
GO
ALTER TABLE [dbo].[Hoadon]  WITH CHECK ADD  CONSTRAINT [FK_Hoadon_Video] FOREIGN KEY([videoId])
REFERENCES [dbo].[Video] ([id])
GO
ALTER TABLE [dbo].[Hoadon] CHECK CONSTRAINT [FK_Hoadon_Video]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK__rating__userId__73BA3083] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK__rating__userId__73BA3083]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK__rating__videoId__74AE54BC] FOREIGN KEY([videoId])
REFERENCES [dbo].[Video] ([id])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK__rating__videoId__74AE54BC]
GO
ALTER TABLE [dbo].[Share]  WITH CHECK ADD  CONSTRAINT [FK__share__userId__33D4B598] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Share] CHECK CONSTRAINT [FK__share__userId__33D4B598]
GO
ALTER TABLE [dbo].[Share]  WITH CHECK ADD  CONSTRAINT [FK__share__videoId__34C8D9D1] FOREIGN KEY([videoId])
REFERENCES [dbo].[Video] ([id])
GO
ALTER TABLE [dbo].[Share] CHECK CONSTRAINT [FK__share__videoId__34C8D9D1]
GO
/****** Object:  StoredProcedure [dbo].[SP_PaymentVnpay]    Script Date: 9/10/2023 11:28:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_PaymentVnpay](@videoHref varchar(50))
AS BEGIN
SELECT u.id, u.email, u.password, u.phone, u.isAdmin, u.isActive, u.token , vnp_TxnRef, v.title, u.fullname, vnp_BankCode, SUM(vnp_Amount), vnp_ResponseCode FROM Hoadon h
JOIN dbo.[user] u ON u.id = h.userId 
JOIN dbo.video v ON v.id = h.videoId
WHERE v.href = @videoHref
GROUP BY u.id, u.email, u.password, u.phone, u.isAdmin, u.isActive, u.token , vnp_TxnRef, v.title, u.fullname, vnp_BankCode, vnp_ResponseCode
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectUsersLikedVideoByVideoHref]    Script Date: 9/10/2023 11:28:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectUsersLikedVideoByVideoHref](@videoHref varchar(50))
AS BEGIN 
	SELECT u.id, u.email, u.password, u.phone, u.fullname, u.isAdmin, u.isActive, h.likedDate, u.token
	FROM dbo.video v JOIN dbo.history h ON v.id = h.videoId
					JOIN dbo.[user] u ON u.id = h.userId
	WHERE v.href = @videoHref AND u.isActive = 1 AND v.isActive = 1 AND h.isLiked = 1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UserShareVideoByHref]    Script Date: 9/10/2023 11:28:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UserShareVideoByHref](@videoHref varchar(50))
AS BEGIN 
	SELECT v.title, v.href, u.fullname, u.email AS 'Gui', s.email AS 'Nhan', s.shareDate, u.id, u.email, u.password, u.phone, u.fullname, u.isAdmin, u.isActive, u.token FROM dbo.share s 
	JOIN dbo.[user] u ON u.id = s.userId 
	JOIN dbo.video v ON v.id = s.videoId
	WHERE v.href = @videoHref
	GROUP BY v.title, v.href, u.fullname, u.email, s.email, s.shareDate, u.id, u.email, u.password, u.phone, u.fullname, u.isAdmin, u.isActive, u.token
	ORDER BY s.shareDate DESC
END
GO
USE [master]
GO
ALTER DATABASE [FilmViet] SET  READ_WRITE 
GO
