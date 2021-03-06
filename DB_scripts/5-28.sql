USE [master]
GO
/****** Object:  Database [Safe_DB]    Script Date: 5/28/2016 5:20:58 PM ******/
CREATE DATABASE [Safe_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Safe_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Safe_DB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Safe_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Safe_DB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Safe_DB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Safe_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Safe_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Safe_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Safe_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Safe_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Safe_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Safe_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Safe_DB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Safe_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Safe_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Safe_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Safe_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Safe_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Safe_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Safe_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Safe_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Safe_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Safe_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Safe_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Safe_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Safe_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Safe_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Safe_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Safe_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Safe_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Safe_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Safe_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Safe_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Safe_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Safe_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Safe_DB]
GO
/****** Object:  Table [dbo].[Api_Tests]    Script Date: 5/28/2016 5:20:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Api_Tests](
	[SNO] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[TCName] [nvarchar](50) NOT NULL,
	[ApiType] [nchar](10) NULL,
	[Url] [nvarchar](max) NULL,
	[Payload] [nvarchar](max) NULL,
	[ResponseType] [nchar](10) NULL,
	[ResponseParm] [nvarchar](max) NULL,
	[ExpectedValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_Api_Tests_1] PRIMARY KEY CLUSTERED 
(
	[TCName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Api_Tests_Run]    Script Date: 5/28/2016 5:20:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Api_Tests_Run](
	[SNO] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[TCName] [nvarchar](50) NOT NULL,
	[ApiType] [nchar](10) NULL,
	[Url] [nvarchar](max) NULL,
	[Payload] [nvarchar](max) NOT NULL,
	[ResponseType] [nchar](10) NULL,
	[ResponseParm] [nvarchar](max) NULL,
	[ExpectedValue] [nvarchar](max) NULL,
	[ActualValue] [nvarchar](max) NULL,
	[Result] [nchar](10) NULL,
	[DbTimestamp] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Api_Tests_Run_1] PRIMARY KEY CLUSTERED 
(
	[TCName] ASC,
	[DbTimestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Db_Tests]    Script Date: 5/28/2016 5:20:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Db_Tests](
	[SNO] [numeric](18, 0) NOT NULL,
	[TCName] [nvarchar](50) NOT NULL,
	[DBType] [nchar](10) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[DBName] [nvarchar](50) NULL,
	[DBQuery] [nvarchar](max) NULL,
	[ExpectedResult] [nvarchar](max) NULL,
	[ActualResult] [nvarchar](max) NULL,
	[Result] [nchar](10) NULL,
 CONSTRAINT [PK_Db_Tests] PRIMARY KEY CLUSTERED 
(
	[SNO] ASC,
	[TCName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Functional_TC_Main]    Script Date: 5/28/2016 5:20:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Functional_TC_Main](
	[SNO] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[TCName] [nvarchar](50) NOT NULL,
	[StepCount] [nchar](10) NULL,
 CONSTRAINT [PK_Functional_TC_Main_1] PRIMARY KEY CLUSTERED 
(
	[TCName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Functional_TC_Sub]    Script Date: 5/28/2016 5:20:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Functional_TC_Sub](
	[SNO] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[TCName] [nvarchar](50) NOT NULL,
	[StepNo] [numeric](18, 0) NOT NULL,
	[Action] [nvarchar](50) NOT NULL,
	[Locator] [nvarchar](max) NOT NULL,
	[Argument] [nvarchar](max) NULL,
 CONSTRAINT [PK_Functional_TC_Sub] PRIMARY KEY CLUSTERED 
(
	[SNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Track_Main]    Script Date: 5/28/2016 5:20:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Track_Main](
	[SNO] [numeric](18, 0) NOT NULL,
	[TCName] [nvarchar](50) NOT NULL,
	[ManualEffort] [numeric](18, 0) NOT NULL,
	[TimeStamp] [date] NOT NULL,
 CONSTRAINT [PK_Track_Main_1] PRIMARY KEY CLUSTERED 
(
	[SNO] ASC,
	[TCName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Track_Sub]    Script Date: 5/28/2016 5:20:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Track_Sub](
	[SNO] [numeric](18, 0) NOT NULL,
	[TCName] [nvarchar](50) NOT NULL,
	[AutomatedEffort] [numeric](18, 5) NOT NULL,
	[TimeStamp] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Track_Sub] PRIMARY KEY CLUSTERED 
(
	[SNO] ASC,
	[TCName] ASC,
	[TimeStamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unit_Tests]    Script Date: 5/28/2016 5:20:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit_Tests](
	[SNO] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[TCName] [nvarchar](50) NOT NULL,
	[PackageName] [nvarchar](50) NULL,
	[JavaClass] [nchar](10) NOT NULL,
	[FunctionName] [nvarchar](50) NOT NULL,
	[ArgToPass] [nvarchar](max) NULL,
	[ExpectedValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_Unit_Tests_1] PRIMARY KEY CLUSTERED 
(
	[TCName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unit_Tests_Run]    Script Date: 5/28/2016 5:20:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit_Tests_Run](
	[SNO] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[TCName] [nvarchar](50) NOT NULL,
	[PackageName] [nvarchar](50) NULL,
	[JavaClass] [nchar](10) NULL,
	[FunctionName] [nvarchar](50) NULL,
	[ArgToPass] [nvarchar](max) NULL,
	[ExpectedValue] [nvarchar](max) NULL,
	[ActualValue] [nvarchar](max) NULL,
	[Result] [nchar](10) NULL,
	[DbTimestamp] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Unit_Tests_Run] PRIMARY KEY CLUSTERED 
(
	[TCName] ASC,
	[DbTimestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Functional_TC_Sub]  WITH CHECK ADD  CONSTRAINT [FK_Functional_TC_Sub_Functional_TC_Main] FOREIGN KEY([TCName])
REFERENCES [dbo].[Functional_TC_Main] ([TCName])
GO
ALTER TABLE [dbo].[Functional_TC_Sub] CHECK CONSTRAINT [FK_Functional_TC_Sub_Functional_TC_Main]
GO
USE [master]
GO
ALTER DATABASE [Safe_DB] SET  READ_WRITE 
GO
