USE [master]
GO
/****** Object:  Database [CTF]    Script Date: 4/4/2016 5:18:34 PM ******/
CREATE DATABASE [CTF]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CTF', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CTF.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CTF_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CTF_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CTF] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CTF].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CTF] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CTF] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CTF] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CTF] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CTF] SET ARITHABORT OFF 
GO
ALTER DATABASE [CTF] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CTF] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CTF] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CTF] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CTF] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CTF] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CTF] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CTF] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CTF] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CTF] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CTF] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CTF] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CTF] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CTF] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CTF] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CTF] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CTF] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CTF] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CTF] SET  MULTI_USER 
GO
ALTER DATABASE [CTF] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CTF] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CTF] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CTF] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CTF] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CTF]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/4/2016 5:18:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_ID] [int] IDENTITY(1,1) NOT NULL,
	[Game_ID] [int] NOT NULL,
	[Category_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Challenge]    Script Date: 4/4/2016 5:18:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Challenge](
	[Challenge_ID] [int] NOT NULL,
	[Category_ID] [int] NOT NULL,
	[Challenge_Name] [nvarchar](50) NOT NULL,
	[Challenge_Points] [int] NOT NULL,
	[Challenge_Answer] [nvarchar](50) NOT NULL,
	[Challenge_Solution] [nvarchar](max) NOT NULL,
	[Challenge_Question] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Challenge] PRIMARY KEY CLUSTERED 
(
	[Challenge_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Game]    Script Date: 4/4/2016 5:18:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[Game_ID] [int] IDENTITY(1,1) NOT NULL,
	[Game_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[Game_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Solved]    Script Date: 4/4/2016 5:18:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solved](
	[Solved_ID] [int] NOT NULL,
	[User_ID] [int] NOT NULL,
	[Challenge_ID] [int] NOT NULL,
 CONSTRAINT [PK_Solved] PRIMARY KEY CLUSTERED 
(
	[Solved_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 4/4/2016 5:18:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_UserName] [nvarchar](50) NOT NULL,
	[User_Password] [nvarchar](50) NOT NULL,
	[User_FirstName] [nvarchar](50) NOT NULL,
	[User_LastName] [nvarchar](50) NOT NULL,
	[User_Email] [nvarchar](50) NOT NULL,
	[User_AccountType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Game] FOREIGN KEY([Game_ID])
REFERENCES [dbo].[Game] ([Game_ID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Game]
GO
ALTER TABLE [dbo].[Challenge]  WITH CHECK ADD  CONSTRAINT [FK_Challenge_Category] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Category] ([Category_ID])
GO
ALTER TABLE [dbo].[Challenge] CHECK CONSTRAINT [FK_Challenge_Category]
GO
ALTER TABLE [dbo].[Solved]  WITH CHECK ADD  CONSTRAINT [FK_Solved_Challenge] FOREIGN KEY([Challenge_ID])
REFERENCES [dbo].[Challenge] ([Challenge_ID])
GO
ALTER TABLE [dbo].[Solved] CHECK CONSTRAINT [FK_Solved_Challenge]
GO
ALTER TABLE [dbo].[Solved]  WITH CHECK ADD  CONSTRAINT [FK_Solved_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[Solved] CHECK CONSTRAINT [FK_Solved_User]
GO
USE [master]
GO
ALTER DATABASE [CTF] SET  READ_WRITE 
GO
