USE [master]
GO
/****** Object:  Database [Ursheev_tours]    Script Date: 17.09.2023 20:08:15 ******/
CREATE DATABASE [Ursheev_tours]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ursheev_tours', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Ursheev_tours.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ursheev_tours_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Ursheev_tours_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Ursheev_tours] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ursheev_tours].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ursheev_tours] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ursheev_tours] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ursheev_tours] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ursheev_tours] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ursheev_tours] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ursheev_tours] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ursheev_tours] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ursheev_tours] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ursheev_tours] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ursheev_tours] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ursheev_tours] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ursheev_tours] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ursheev_tours] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ursheev_tours] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ursheev_tours] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ursheev_tours] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ursheev_tours] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ursheev_tours] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ursheev_tours] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ursheev_tours] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ursheev_tours] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ursheev_tours] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ursheev_tours] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ursheev_tours] SET  MULTI_USER 
GO
ALTER DATABASE [Ursheev_tours] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ursheev_tours] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ursheev_tours] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ursheev_tours] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ursheev_tours] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ursheev_tours] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Ursheev_tours] SET QUERY_STORE = OFF
GO
USE [Ursheev_tours]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 17.09.2023 20:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Code] [nchar](2) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 17.09.2023 20:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CountofStars] [int] NOT NULL,
	[CountryCode] [nchar](2) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelComment]    Script Date: 17.09.2023 20:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelComment](
	[ID] [int] NOT NULL,
	[Hotelid] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](100) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_HotelComment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotelimage]    Script Date: 17.09.2023 20:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotelimage](
	[ID] [int] NOT NULL,
	[Hotelid] [int] NOT NULL,
	[ImageSource] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_Hotelimage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoteofTour]    Script Date: 17.09.2023 20:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoteofTour](
	[Hotelid] [int] NOT NULL,
	[TourID] [int] NOT NULL,
 CONSTRAINT [PK_HoteofTour] PRIMARY KEY CLUSTERED 
(
	[Hotelid] ASC,
	[TourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 17.09.2023 20:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[ID] [int] NOT NULL,
	[TicketCount] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Discription] [nvarchar](100) NOT NULL,
	[ImagePreview] [varbinary](max) NOT NULL,
	[isActual] [bit] NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 17.09.2023 20:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeofTour]    Script Date: 17.09.2023 20:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeofTour](
	[TourID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
 CONSTRAINT [PK_TypeofTour] PRIMARY KEY CLUSTERED 
(
	[TourID] ASC,
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([ID], [Name], [Description]) VALUES (1, N'Тип 1', NULL)
INSERT [dbo].[Type] ([ID], [Name], [Description]) VALUES (2, N'Тип 2', NULL)
INSERT [dbo].[Type] ([ID], [Name], [Description]) VALUES (3, N'Тип 3', NULL)
INSERT [dbo].[Type] ([ID], [Name], [Description]) VALUES (4, N'Тип 4', NULL)
INSERT [dbo].[Type] ([ID], [Name], [Description]) VALUES (5, N'Тип 5', NULL)
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([Code])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Country]
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_HotelComment] FOREIGN KEY([ID])
REFERENCES [dbo].[HotelComment] ([ID])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_HotelComment]
GO
ALTER TABLE [dbo].[Hotelimage]  WITH CHECK ADD  CONSTRAINT [FK_Hotelimage_HotelComment] FOREIGN KEY([ID])
REFERENCES [dbo].[HotelComment] ([ID])
GO
ALTER TABLE [dbo].[Hotelimage] CHECK CONSTRAINT [FK_Hotelimage_HotelComment]
GO
ALTER TABLE [dbo].[HoteofTour]  WITH CHECK ADD  CONSTRAINT [FK_HoteofTour_Hotel] FOREIGN KEY([Hotelid])
REFERENCES [dbo].[Hotel] ([ID])
GO
ALTER TABLE [dbo].[HoteofTour] CHECK CONSTRAINT [FK_HoteofTour_Hotel]
GO
ALTER TABLE [dbo].[HoteofTour]  WITH CHECK ADD  CONSTRAINT [FK_HoteofTour_Tour] FOREIGN KEY([Hotelid])
REFERENCES [dbo].[Tour] ([ID])
GO
ALTER TABLE [dbo].[HoteofTour] CHECK CONSTRAINT [FK_HoteofTour_Tour]
GO
ALTER TABLE [dbo].[TypeofTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeofTour_Tour] FOREIGN KEY([TourID])
REFERENCES [dbo].[Tour] ([ID])
GO
ALTER TABLE [dbo].[TypeofTour] CHECK CONSTRAINT [FK_TypeofTour_Tour]
GO
ALTER TABLE [dbo].[TypeofTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeofTour_Type] FOREIGN KEY([TourID])
REFERENCES [dbo].[Type] ([ID])
GO
ALTER TABLE [dbo].[TypeofTour] CHECK CONSTRAINT [FK_TypeofTour_Type]
GO
USE [master]
GO
ALTER DATABASE [Ursheev_tours] SET  READ_WRITE 
GO
