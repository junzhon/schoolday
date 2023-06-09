USE [master]
/*GO
/****** Object:  Database [33]    Script Date: 2021-06-08 上午 10:21:07 ******/
CREATE DATABASE [33]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'33', FILENAME = N'D:\DataBase\33.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'33_log', FILENAME = N'D:\DataBase\33_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO*/
ALTER DATABASE [33] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [33].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [33] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [33] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [33] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [33] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [33] SET ARITHABORT OFF 
GO
ALTER DATABASE [33] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [33] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [33] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [33] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [33] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [33] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [33] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [33] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [33] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [33] SET  DISABLE_BROKER 
GO
ALTER DATABASE [33] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [33] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [33] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [33] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [33] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [33] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [33] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [33] SET RECOVERY FULL 
GO
ALTER DATABASE [33] SET  MULTI_USER 
GO
ALTER DATABASE [33] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [33] SET DB_CHAINING OFF 
GO
ALTER DATABASE [33] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [33] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [33] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'33', N'ON'
GO
ALTER DATABASE [33] SET QUERY_STORE = OFF
GO
USE [33]
GO
/****** Object:  Table [dbo].[BookInfo]    Script Date: 2021-06-08 上午 10:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookInfo](
	[ID] [int] NULL,
	[CustomerName] [varchar](255) NULL,
	[MyRemark] [nvarchar](50) NULL,
	[BookDate] [nchar](10) NULL,
	[BookSt] [nchar](50) NULL,
	[BookDuration] [float] NULL,
	[RoomNumber] [nchar](10) NULL,
	[BookEt] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomInfo]    Script Date: 2021-06-08 上午 10:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomInfo](
	[RoomNumber] [nchar](10) NOT NULL,
	[RoomType] [nchar](10) NULL,
	[RoomPeople] [nchar](10) NULL,
	[RoomStatus] [nchar](10) NULL,
	[Remarks] [nchar](10) NULL,
 CONSTRAINT [PK_RoomInfo] PRIMARY KEY CLUSTERED 
(
	[RoomNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebUser]    Script Date: 2021-06-08 上午 10:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebUser](
	[username] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[telephone] [nvarchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[BookInfo] ([ID], [CustomerName], [MyRemark], [BookDate], [BookSt], [BookDuration], [RoomNumber], [BookEt]) VALUES (19, N'test1', N'无', N'2021-05-15', N'10:00:00                                          ', 2, N'A201      ', N'11:59:59  ')
INSERT [dbo].[BookInfo] ([ID], [CustomerName], [MyRemark], [BookDate], [BookSt], [BookDuration], [RoomNumber], [BookEt]) VALUES (18, N'1075794237@qq.com', N'无', N'2021-05-15', N'00:00:00                                          ', 10, N'A201      ', N'09:59:59  ')
INSERT [dbo].[BookInfo] ([ID], [CustomerName], [MyRemark], [BookDate], [BookSt], [BookDuration], [RoomNumber], [BookEt]) VALUES (22, N'test1', N'开会用的', N'2021-06-04', N'04:00:00                                          ', 7, N'A201      ', N'10:59:59  ')
INSERT [dbo].[BookInfo] ([ID], [CustomerName], [MyRemark], [BookDate], [BookSt], [BookDuration], [RoomNumber], [BookEt]) VALUES (24, N'test1', N'开黑', N'2021-06-09', N'03:00:00                                          ', 2, N'A201      ', N'04:59:59  ')
INSERT [dbo].[BookInfo] ([ID], [CustomerName], [MyRemark], [BookDate], [BookSt], [BookDuration], [RoomNumber], [BookEt]) VALUES (20, N'test1', N'无', N'2021-05-15', N'10:00:00                                          ', 2, N'A101      ', N'11:59:59  ')
INSERT [dbo].[BookInfo] ([ID], [CustomerName], [MyRemark], [BookDate], [BookSt], [BookDuration], [RoomNumber], [BookEt]) VALUES (15, N'1075794237@qq.com', N'无', N'2021-05-14', N'01:00:00                                          ', 2, N'A201      ', N'02:59:59  ')
INSERT [dbo].[BookInfo] ([ID], [CustomerName], [MyRemark], [BookDate], [BookSt], [BookDuration], [RoomNumber], [BookEt]) VALUES (9, N'1075794237@qq.com', N'', N'2021-05-13', N'00:00:00                                          ', 3, N'A201      ', N'02:59:59  ')
INSERT [dbo].[BookInfo] ([ID], [CustomerName], [MyRemark], [BookDate], [BookSt], [BookDuration], [RoomNumber], [BookEt]) VALUES (10, N'1075794237@qq.com', N'', N'2021-05-13', N'03:00:00                                          ', 1, N'A201      ', N'03:59:59  ')
INSERT [dbo].[BookInfo] ([ID], [CustomerName], [MyRemark], [BookDate], [BookSt], [BookDuration], [RoomNumber], [BookEt]) VALUES (12, N'1075794237@qq.com', N'', N'2021-05-13', N'06:00:00                                          ', 2, N'A101      ', N'07:59:59  ')
INSERT [dbo].[BookInfo] ([ID], [CustomerName], [MyRemark], [BookDate], [BookSt], [BookDuration], [RoomNumber], [BookEt]) VALUES (16, N'1075794237@qq.com', N'无', N'2021-05-14', N'01:00:00                                          ', 2, N'A211      ', N'02:59:59  ')
INSERT [dbo].[RoomInfo] ([RoomNumber], [RoomType], [RoomPeople], [RoomStatus], [Remarks]) VALUES (N'A101      ', N'智慧教室      ', N'30        ', N'空闲        ', N'无         ')
INSERT [dbo].[RoomInfo] ([RoomNumber], [RoomType], [RoomPeople], [RoomStatus], [Remarks]) VALUES (N'A201      ', N'智慧教室      ', N'30        ', N'空闲        ', N'无         ')
INSERT [dbo].[RoomInfo] ([RoomNumber], [RoomType], [RoomPeople], [RoomStatus], [Remarks]) VALUES (N'A211      ', N'普通教室      ', N'30        ', N'空闲        ', N'无         ')
INSERT [dbo].[RoomInfo] ([RoomNumber], [RoomType], [RoomPeople], [RoomStatus], [Remarks]) VALUES (N'B201      ', N'阶梯教室      ', N'149       ', N'空闲        ', N'无         ')
INSERT [dbo].[RoomInfo] ([RoomNumber], [RoomType], [RoomPeople], [RoomStatus], [Remarks]) VALUES (N'B202      ', N'阶梯教室      ', N'149       ', N'满课        ', N'无         ')
INSERT [dbo].[RoomInfo] ([RoomNumber], [RoomType], [RoomPeople], [RoomStatus], [Remarks]) VALUES (N'B403      ', N'智慧教室      ', N'100       ', N'维修        ', N'维修中       ')
INSERT [dbo].[RoomInfo] ([RoomNumber], [RoomType], [RoomPeople], [RoomStatus], [Remarks]) VALUES (N'C101      ', N'阶梯教室      ', N'149       ', N'空闲        ', N'无         ')
INSERT [dbo].[RoomInfo] ([RoomNumber], [RoomType], [RoomPeople], [RoomStatus], [Remarks]) VALUES (N'C103      ', N'阶梯教室      ', N'149       ', N'空闲        ', N'无         ')
INSERT [dbo].[RoomInfo] ([RoomNumber], [RoomType], [RoomPeople], [RoomStatus], [Remarks]) VALUES (N'D201      ', N'普通教室      ', N'50        ', N'空闲        ', N'无         ')
INSERT [dbo].[RoomInfo] ([RoomNumber], [RoomType], [RoomPeople], [RoomStatus], [Remarks]) VALUES (N'D321      ', N'普通教室      ', N'50        ', N'维修        ', N'正在维修      ')
INSERT [dbo].[RoomInfo] ([RoomNumber], [RoomType], [RoomPeople], [RoomStatus], [Remarks]) VALUES (N'D406      ', N'普通教室      ', N'100       ', N'空闲        ', N'无         ')
INSERT [dbo].[WebUser] ([username], [password], [telephone]) VALUES (N'1075794237@qq.com', N'202CB962AC59075B964B07152D234B70', N'15763262612')
INSERT [dbo].[WebUser] ([username], [password], [telephone]) VALUES (N'test1', N'202cb962ac59075b964b07152d234b70', N'17798264020')
INSERT [dbo].[WebUser] ([username], [password], [telephone]) VALUES (N'test1', N'202cb962ac59075b964b07152d234b70', N'17798264020')
INSERT [dbo].[WebUser] ([username], [password], [telephone]) VALUES (N'test2', N'202cb962ac59075b964b07152d234b70', N'17798264013')
INSERT [dbo].[WebUser] ([username], [password], [telephone]) VALUES (N'test44', N'202cb962ac59075b964b07152d234b70', N'17798264015')
INSERT [dbo].[WebUser] ([username], [password], [telephone]) VALUES (N'test14', N'202cb962ac59075b964b07152d234b70', N'17798264013')
INSERT [dbo].[WebUser] ([username], [password], [telephone]) VALUES (N'test16', N'202cb962ac59075b964b07152d234b70', N'17798264013')
INSERT [dbo].[WebUser] ([username], [password], [telephone]) VALUES (N'test17', N'202cb962ac59075b964b07152d234b70', N'17798264015')
USE [master]
GO
ALTER DATABASE [33] SET  READ_WRITE 
GO
