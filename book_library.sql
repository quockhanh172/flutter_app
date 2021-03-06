USE [master]
GO
/****** Object:  Database [Book_Library]    Script Date: 3/23/2022 2:04:20 PM ******/
CREATE DATABASE [Book_Library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Book_Library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Book_Library.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Book_Library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Book_Library_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Book_Library] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Book_Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Book_Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Book_Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Book_Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Book_Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Book_Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Book_Library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Book_Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Book_Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Book_Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Book_Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Book_Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Book_Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Book_Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Book_Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Book_Library] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Book_Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Book_Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Book_Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Book_Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Book_Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Book_Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Book_Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Book_Library] SET RECOVERY FULL 
GO
ALTER DATABASE [Book_Library] SET  MULTI_USER 
GO
ALTER DATABASE [Book_Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Book_Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Book_Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Book_Library] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Book_Library] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Book_Library] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Book_Library', N'ON'
GO
ALTER DATABASE [Book_Library] SET QUERY_STORE = OFF
GO
USE [Book_Library]
GO
/****** Object:  Table [dbo].[book]    Script Date: 3/23/2022 2:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[author] [nvarchar](50) NULL,
	[date] [date] NULL,
	[summary] [text] NULL,
	[image] [nvarchar](500) NULL,
	[id_category] [int] NULL,
 CONSTRAINT [PK_book] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 3/23/2022 2:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[book] ON 

INSERT [dbo].[book] ([id], [title], [author], [date], [summary], [image], [id_category]) VALUES (1105, N'Book1 ', N'Author1', CAST(N'2022-03-01' AS Date), N'Throughout the series, Harry is described as having his father''s perpetually untidy black hair, his mother''s bright green eyes, and a lightning bolt-shaped scar on his forehead. He is further described as "small and skinny for his age" with "a thin face" and "knobbly knees", and he wears Windsor glasses.', N'image/Book1 .jpg', 59)
INSERT [dbo].[book] ([id], [title], [author], [date], [summary], [image], [id_category]) VALUES (1106, N'Book2', N'Author2', CAST(N'2022-03-02' AS Date), N'Throughout the series, Harry is described as having his father''s perpetually untidy black hair, his mother''s bright green eyes, and a lightning bolt-shaped scar on his forehead. He is further described as "small and skinny for his age" with "a thin face" and "knobbly knees", and he wears Windsor glasses.', N'image/Book2.jpg', 60)
INSERT [dbo].[book] ([id], [title], [author], [date], [summary], [image], [id_category]) VALUES (1107, N'Book3', N'Author3', CAST(N'2022-03-03' AS Date), N'Throughout the series, Harry is described as having his father''s perpetually untidy black hair, his mother''s bright green eyes, and a lightning bolt-shaped scar on his forehead. He is further described as "small and skinny for his age" with "a thin face" and "knobbly knees", and he wears Windsor glasses.', N'image/Book3.jpg', 61)
INSERT [dbo].[book] ([id], [title], [author], [date], [summary], [image], [id_category]) VALUES (1108, N'Book4', N'Author4', CAST(N'2022-03-04' AS Date), N'Throughout the series, Harry is described as having his father''s perpetually untidy black hair, his mother''s bright green eyes, and a lightning bolt-shaped scar on his forehead. He is further described as "small and skinny for his age" with "a thin face" and "knobbly knees", and he wears Windsor glasses.', N'image/Book4.jpg', 62)
INSERT [dbo].[book] ([id], [title], [author], [date], [summary], [image], [id_category]) VALUES (1109, N'Book5', N'Author5', CAST(N'2022-03-05' AS Date), N'Throughout the series, Harry is described as having his father''s perpetually untidy black hair, his mother''s bright green eyes, and a lightning bolt-shaped scar on his forehead. He is further described as "small and skinny for his age" with "a thin face" and "knobbly knees", and he wears Windsor glasses.', N'image/Book5.jpg', 63)
INSERT [dbo].[book] ([id], [title], [author], [date], [summary], [image], [id_category]) VALUES (1110, N'Book6', N'Author6', CAST(N'2022-03-06' AS Date), N'Throughout the series, Harry is described as having his father''s perpetually untidy black hair, his mother''s bright green eyes, and a lightning bolt-shaped scar on his forehead. He is further described as "small and skinny for his age" with "a thin face" and "knobbly knees", and he wears Windsor glasses.', N'image/Book6.jpg', 65)
INSERT [dbo].[book] ([id], [title], [author], [date], [summary], [image], [id_category]) VALUES (1111, N'Book7', N'Author7', CAST(N'2022-03-07' AS Date), N'Throughout the series, Harry is described as having his father''s perpetually untidy black hair, his mother''s bright green eyes, and a lightning bolt-shaped scar on his forehead. He is further described as "small and skinny for his age" with "a thin face" and "knobbly knees", and he wears Windsor glasses.', N'image/Book7.jpg', 59)
SET IDENTITY_INSERT [dbo].[book] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [name]) VALUES (59, N'Action and advanture')
INSERT [dbo].[category] ([id], [name]) VALUES (60, N'Classic')
INSERT [dbo].[category] ([id], [name]) VALUES (61, N'Comic book')
INSERT [dbo].[category] ([id], [name]) VALUES (62, N'Graphic novel')
INSERT [dbo].[category] ([id], [name]) VALUES (63, N'Detective and mistery')
INSERT [dbo].[category] ([id], [name]) VALUES (65, N'Horror')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
ALTER TABLE [dbo].[book]  WITH CHECK ADD  CONSTRAINT [FK_book_category] FOREIGN KEY([id_category])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[book] CHECK CONSTRAINT [FK_book_category]
GO
USE [master]
GO
ALTER DATABASE [Book_Library] SET  READ_WRITE 
GO
