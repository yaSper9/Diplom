USE [master]
GO
/****** Object:  Database [AirBase]    Script Date: 18.06.2024 17:06:23 ******/
CREATE DATABASE [AirBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AirBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AirBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AirBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AirBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AirBase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AirBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AirBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AirBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AirBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AirBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AirBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [AirBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AirBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AirBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AirBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AirBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AirBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AirBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AirBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AirBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AirBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AirBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AirBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AirBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AirBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AirBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AirBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AirBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AirBase] SET RECOVERY FULL 
GO
ALTER DATABASE [AirBase] SET  MULTI_USER 
GO
ALTER DATABASE [AirBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AirBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AirBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AirBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AirBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AirBase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AirBase', N'ON'
GO
ALTER DATABASE [AirBase] SET QUERY_STORE = ON
GO
ALTER DATABASE [AirBase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AirBase]
GO
/****** Object:  Table [dbo].[Departures]    Script Date: 18.06.2024 17:06:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departures](
	[CodeDeparture] [int] IDENTITY(1,1) NOT NULL,
	[Flight] [int] NOT NULL,
	[DepartureTime] [datetime] NOT NULL,
	[Plane] [int] NOT NULL,
	[CrewCommander] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Departures] PRIMARY KEY CLUSTERED 
(
	[CodeDeparture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DestinationAirports]    Script Date: 18.06.2024 17:06:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DestinationAirports](
	[AirportCode] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_DestinationAirports] PRIMARY KEY CLUSTERED 
(
	[AirportCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flights]    Script Date: 18.06.2024 17:06:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flights](
	[FlightCode] [int] IDENTITY(1,1) NOT NULL,
	[FlightNumber] [int] NOT NULL,
	[DepartureAirport] [nvarchar](100) NOT NULL,
	[DestAirport] [int] NOT NULL,
	[FlightDuration] [int] NOT NULL,
	[TicketPrice] [smallmoney] NOT NULL,
 CONSTRAINT [PK_Flights] PRIMARY KEY CLUSTERED 
(
	[FlightCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passengers]    Script Date: 18.06.2024 17:06:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passengers](
	[CodePassenger] [int] IDENTITY(1,1) NOT NULL,
	[Departure] [int] NOT NULL,
	[SeatNumber] [int] NOT NULL,
	[FIO] [nvarchar](100) NOT NULL,
	[Passport] [nchar](11) NOT NULL,
 CONSTRAINT [PK_Passengers] PRIMARY KEY CLUSTERED 
(
	[CodePassenger] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Planes]    Script Date: 18.06.2024 17:06:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planes](
	[PlaneCode] [int] IDENTITY(1,1) NOT NULL,
	[TypePlane] [nvarchar](100) NOT NULL,
	[NumberSeat] [int] NOT NULL,
	[FlightRange] [int] NOT NULL,
 CONSTRAINT [PK_Planes] PRIMARY KEY CLUSTERED 
(
	[PlaneCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18.06.2024 17:06:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserCode] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Departures] ON 

INSERT [dbo].[Departures] ([CodeDeparture], [Flight], [DepartureTime], [Plane], [CrewCommander]) VALUES (1, 1, CAST(N'2024-03-23T13:00:00.000' AS DateTime), 1, N'Орлов СО')
INSERT [dbo].[Departures] ([CodeDeparture], [Flight], [DepartureTime], [Plane], [CrewCommander]) VALUES (2, 2, CAST(N'2024-03-23T14:00:00.000' AS DateTime), 2, N'Соколов ИА')
INSERT [dbo].[Departures] ([CodeDeparture], [Flight], [DepartureTime], [Plane], [CrewCommander]) VALUES (3, 3, CAST(N'2024-03-24T16:00:00.000' AS DateTime), 5, N'Ястребов ВВ')
SET IDENTITY_INSERT [dbo].[Departures] OFF
GO
SET IDENTITY_INSERT [dbo].[DestinationAirports] ON 

INSERT [dbo].[DestinationAirports] ([AirportCode], [Title]) VALUES (1, N'Аэропорт Пулково')
INSERT [dbo].[DestinationAirports] ([AirportCode], [Title]) VALUES (2, N'Аэропорт Ржевка')
INSERT [dbo].[DestinationAirports] ([AirportCode], [Title]) VALUES (3, N'Аэропорт Дубая')
INSERT [dbo].[DestinationAirports] ([AirportCode], [Title]) VALUES (4, N'Аэропорт Лондона')
SET IDENTITY_INSERT [dbo].[DestinationAirports] OFF
GO
SET IDENTITY_INSERT [dbo].[Flights] ON 

INSERT [dbo].[Flights] ([FlightCode], [FlightNumber], [DepartureAirport], [DestAirport], [FlightDuration], [TicketPrice]) VALUES (1, 2331303, N'Аэропорт Шереметьево', 1, 4, 8000.0000)
INSERT [dbo].[Flights] ([FlightCode], [FlightNumber], [DepartureAirport], [DestAirport], [FlightDuration], [TicketPrice]) VALUES (2, 2213042, N'Аэропорт Домодедово', 2, 5, 10000.0000)
INSERT [dbo].[Flights] ([FlightCode], [FlightNumber], [DepartureAirport], [DestAirport], [FlightDuration], [TicketPrice]) VALUES (3, 3130523, N'Аэропорт Жуковский', 3, 24, 26000.0000)
SET IDENTITY_INSERT [dbo].[Flights] OFF
GO
SET IDENTITY_INSERT [dbo].[Passengers] ON 

INSERT [dbo].[Passengers] ([CodePassenger], [Departure], [SeatNumber], [FIO], [Passport]) VALUES (1, 1, 13, N'Иванов ИИ', N'3213 904889')
INSERT [dbo].[Passengers] ([CodePassenger], [Departure], [SeatNumber], [FIO], [Passport]) VALUES (2, 2, 34, N'Смирнов ВА', N'4532 302414')
INSERT [dbo].[Passengers] ([CodePassenger], [Departure], [SeatNumber], [FIO], [Passport]) VALUES (3, 3, 11, N'Соколова АИ', N'3414 708662')
SET IDENTITY_INSERT [dbo].[Passengers] OFF
GO
SET IDENTITY_INSERT [dbo].[Planes] ON 

INSERT [dbo].[Planes] ([PlaneCode], [TypePlane], [NumberSeat], [FlightRange]) VALUES (1, N'ТУ-134', 96, 2800)
INSERT [dbo].[Planes] ([PlaneCode], [TypePlane], [NumberSeat], [FlightRange]) VALUES (2, N'ТУ-154', 180, 3000)
INSERT [dbo].[Planes] ([PlaneCode], [TypePlane], [NumberSeat], [FlightRange]) VALUES (3, N'ТУ-204', 214, 4000)
INSERT [dbo].[Planes] ([PlaneCode], [TypePlane], [NumberSeat], [FlightRange]) VALUES (4, N'Сухой Суперджет-100', 98, 4500)
INSERT [dbo].[Planes] ([PlaneCode], [TypePlane], [NumberSeat], [FlightRange]) VALUES (5, N'ИЛ-62', 198, 10000)
INSERT [dbo].[Planes] ([PlaneCode], [TypePlane], [NumberSeat], [FlightRange]) VALUES (6, N'ИЛ-86', 314, 4350)
INSERT [dbo].[Planes] ([PlaneCode], [TypePlane], [NumberSeat], [FlightRange]) VALUES (7, N'ИЛ-96-300', 300, 12100)
SET IDENTITY_INSERT [dbo].[Planes] OFF
GO
INSERT [dbo].[Users] ([UserCode], [Login], [Password]) VALUES (1, N'admin', N'admin')
INSERT [dbo].[Users] ([UserCode], [Login], [Password]) VALUES (2, N'nikita', N'belyaev')
GO
ALTER TABLE [dbo].[Departures]  WITH CHECK ADD  CONSTRAINT [FK_Departures_Flights] FOREIGN KEY([Flight])
REFERENCES [dbo].[Flights] ([FlightCode])
GO
ALTER TABLE [dbo].[Departures] CHECK CONSTRAINT [FK_Departures_Flights]
GO
ALTER TABLE [dbo].[Departures]  WITH CHECK ADD  CONSTRAINT [FK_Departures_Planes] FOREIGN KEY([Plane])
REFERENCES [dbo].[Planes] ([PlaneCode])
GO
ALTER TABLE [dbo].[Departures] CHECK CONSTRAINT [FK_Departures_Planes]
GO
ALTER TABLE [dbo].[Flights]  WITH CHECK ADD  CONSTRAINT [FK_Flights_DestinationAirports] FOREIGN KEY([DestAirport])
REFERENCES [dbo].[DestinationAirports] ([AirportCode])
GO
ALTER TABLE [dbo].[Flights] CHECK CONSTRAINT [FK_Flights_DestinationAirports]
GO
ALTER TABLE [dbo].[Passengers]  WITH CHECK ADD  CONSTRAINT [FK_Passengers_Departures] FOREIGN KEY([Departure])
REFERENCES [dbo].[Departures] ([CodeDeparture])
GO
ALTER TABLE [dbo].[Passengers] CHECK CONSTRAINT [FK_Passengers_Departures]
GO
USE [master]
GO
ALTER DATABASE [AirBase] SET  READ_WRITE 
GO
