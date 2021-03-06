USE [master]
GO
/****** Object:  Database [AutoCorner]    Script Date: 22-Sep-20 5:16:46 PM ******/
CREATE DATABASE [AutoCorner]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AutoCorner', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\AutoCorner.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AutoCorner_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\AutoCorner_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AutoCorner] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AutoCorner].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AutoCorner] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AutoCorner] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AutoCorner] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AutoCorner] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AutoCorner] SET ARITHABORT OFF 
GO
ALTER DATABASE [AutoCorner] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AutoCorner] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AutoCorner] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AutoCorner] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AutoCorner] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AutoCorner] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AutoCorner] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AutoCorner] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AutoCorner] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AutoCorner] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AutoCorner] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AutoCorner] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AutoCorner] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AutoCorner] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AutoCorner] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AutoCorner] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AutoCorner] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AutoCorner] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AutoCorner] SET  MULTI_USER 
GO
ALTER DATABASE [AutoCorner] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AutoCorner] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AutoCorner] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AutoCorner] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AutoCorner] SET DELAYED_DURABILITY = DISABLED 
GO
USE [AutoCorner]
GO
/****** Object:  Table [dbo].[ADINFO]    Script Date: 22-Sep-20 5:16:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADINFO](
	[AdministratorID] [int] NULL,
	[Email] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ADMINISTRATOR]    Script Date: 22-Sep-20 5:16:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADMINISTRATOR](
	[AdministratorID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[MobileNumber] [int] NOT NULL,
	[CustomerID] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdministratorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 22-Sep-20 5:16:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[CustomerID] [varchar](50) NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[Address] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[MobileNumber] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CUSTOMERVEHICLE]    Script Date: 22-Sep-20 5:16:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMERVEHICLE](
	[CustomerID] [varchar](50) NULL,
	[RegistrationNumber] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CUSTOMIZE]    Script Date: 22-Sep-20 5:16:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMIZE](
	[CustomizeNumber] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [varchar](50) NOT NULL,
	[VehicleNumber] [int] NOT NULL,
	[Silencer] [varchar](50) NULL,
	[Interior] [varchar](50) NULL,
	[Engine] [varchar](50) NULL,
	[Color] [varchar](50) NULL,
	[Lights] [varchar](50) NULL,
	[Transmission] [varchar](50) NULL,
	[Others] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomizeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GENERATE]    Script Date: 22-Sep-20 5:16:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GENERATE](
	[Time] [datetime] NOT NULL,
	[AdministratorID] [int] NOT NULL,
	[Discount] [varchar](50) NULL,
	[ReceiptID] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GOESTO]    Script Date: 22-Sep-20 5:16:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GOESTO](
	[Time] [datetime] NOT NULL,
	[VehicleNumber] [int] NOT NULL,
	[Cost] [int] NOT NULL,
	[RepairID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOGIN]    Script Date: 22-Sep-20 5:16:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOGIN](
	[AdministratorLoginID] [varchar](50) NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MAKINGRECEIPT]    Script Date: 22-Sep-20 5:16:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MAKINGRECEIPT](
	[RepairID] [int] IDENTITY(1,1) NOT NULL,
	[MakingID] [varchar](50) NULL,
	[Discount] [int] NULL,
	[WorkedOn] [varchar](50) NULL,
	[AmountToBePaid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RepairID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MANAGE]    Script Date: 22-Sep-20 5:16:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MANAGE](
	[AdministratorID] [int] NOT NULL,
	[CustomerID] [varchar](50) NOT NULL,
	[Preview] [varchar](50) NULL,
	[PromoCode] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MONEYRECEIPT]    Script Date: 22-Sep-20 5:16:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MONEYRECEIPT](
	[ReceiptID] [int] IDENTITY(1,1) NOT NULL,
	[AdministratorID] [int] NOT NULL,
	[CustomerID] [varchar](50) NOT NULL,
	[VehicleNumber] [int] NOT NULL,
	[TotalAmount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReceiptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NEEDSTO]    Script Date: 22-Sep-20 5:16:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NEEDSTO](
	[Time] [datetime] NOT NULL,
	[Cost] [int] NOT NULL,
	[CustomerID] [varchar](50) NOT NULL,
	[VehicleNumber] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REPAIR]    Script Date: 22-Sep-20 5:16:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REPAIR](
	[RepairID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [varchar](50) NOT NULL,
	[VehicleNumber] [int] NOT NULL,
	[Wheel] [varchar](50) NULL,
	[ElectricalConnections] [varchar](50) NULL,
	[Engine] [varchar](50) NULL,
	[AC] [varchar](50) NULL,
	[Lights] [varchar](50) NULL,
	[Others] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RepairID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SCHEDULE]    Script Date: 22-Sep-20 5:16:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SCHEDULE](
	[CustomerID] [varchar](50) NULL,
	[Timee] [varchar](50) NULL,
	[Inout] [varchar](50) NULL,
	[button] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USES]    Script Date: 22-Sep-20 5:16:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USES](
	[CustomerID] [varchar](50) NOT NULL,
	[VehicleNumber] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VEHICLE]    Script Date: 22-Sep-20 5:16:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VEHICLE](
	[VehicleNumber] [int] IDENTITY(1,1) NOT NULL,
	[Color] [varchar](50) NULL,
	[Manufacturer] [varchar](50) NULL,
	[VehicleType] [varchar](50) NULL,
	[FuelCapacity] [varchar](50) NULL,
	[RegistrationNumber] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VehicleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ADINFO] ([AdministratorID], [Email]) VALUES (26, NULL)
INSERT [dbo].[ADMINISTRATOR] ([AdministratorID], [Name], [Email], [Password], [Address], [MobileNumber], [CustomerID]) VALUES (1, N'Mr.Rahim', N'rahim@gmail.com', N'123456', NULL, 1912345678, N'tom@gmail.com')
INSERT [dbo].[ADMINISTRATOR] ([AdministratorID], [Name], [Email], [Password], [Address], [MobileNumber], [CustomerID]) VALUES (2, N'Mr.Sumon', N'sumon@gmail.com', N'123456', NULL, 191465678, N'bob@gmail.com')
INSERT [dbo].[ADMINISTRATOR] ([AdministratorID], [Name], [Email], [Password], [Address], [MobileNumber], [CustomerID]) VALUES (3, N'Mr.Karim', N'karim@gmail.com', N'123456', NULL, 1912454678, N'mac@gmail.com')
INSERT [dbo].[CUSTOMER] ([CustomerID], [CustomerName], [Address], [Password], [MobileNumber]) VALUES (N'bob@gmail.com', N'Mr. Bob', N'Gulshan', N'127256', 1754345678)
INSERT [dbo].[CUSTOMER] ([CustomerID], [CustomerName], [Address], [Password], [MobileNumber]) VALUES (N'mac@gmail.com', N'Mr. Mac', N'Baridhara', N'985456', 1712549678)
INSERT [dbo].[CUSTOMER] ([CustomerID], [CustomerName], [Address], [Password], [MobileNumber]) VALUES (N'tom@gmail.com', N'Mr. Tom', N'Dhanmondi', N'123456', 1712345678)
SET IDENTITY_INSERT [dbo].[CUSTOMIZE] ON 

INSERT [dbo].[CUSTOMIZE] ([CustomizeNumber], [CustomerID], [VehicleNumber], [Silencer], [Interior], [Engine], [Color], [Lights], [Transmission], [Others]) VALUES (1, N'tom@gmail.com', 1, N'No', NULL, N'No', N'Yes', N'Yes', N'No', N'No')
INSERT [dbo].[CUSTOMIZE] ([CustomizeNumber], [CustomerID], [VehicleNumber], [Silencer], [Interior], [Engine], [Color], [Lights], [Transmission], [Others]) VALUES (2, N'bob@gmail.com', 2, N'No', NULL, N'No', N'Yes', N'Yes', N'No', N'No')
INSERT [dbo].[CUSTOMIZE] ([CustomizeNumber], [CustomerID], [VehicleNumber], [Silencer], [Interior], [Engine], [Color], [Lights], [Transmission], [Others]) VALUES (3, N'mac@gmail.com', 3, N'No', NULL, N'No', N'Yes', N'Yes', N'No', N'No')
SET IDENTITY_INSERT [dbo].[CUSTOMIZE] OFF
INSERT [dbo].[GENERATE] ([Time], [AdministratorID], [Discount], [ReceiptID]) VALUES (CAST(N'1900-01-01 10:00:00.000' AS DateTime), 1, N'5%', 1)
INSERT [dbo].[GENERATE] ([Time], [AdministratorID], [Discount], [ReceiptID]) VALUES (CAST(N'1900-01-01 22:00:00.000' AS DateTime), 2, N'7%', 2)
INSERT [dbo].[GENERATE] ([Time], [AdministratorID], [Discount], [ReceiptID]) VALUES (CAST(N'1900-01-01 12:00:00.000' AS DateTime), 3, N'9%', 3)
INSERT [dbo].[GOESTO] ([Time], [VehicleNumber], [Cost], [RepairID]) VALUES (CAST(N'1900-01-01 10:00:00.000' AS DateTime), 1, 5000, 1)
INSERT [dbo].[GOESTO] ([Time], [VehicleNumber], [Cost], [RepairID]) VALUES (CAST(N'1900-01-01 11:00:00.000' AS DateTime), 2, 5000, 1)
INSERT [dbo].[GOESTO] ([Time], [VehicleNumber], [Cost], [RepairID]) VALUES (CAST(N'1900-01-01 12:00:00.000' AS DateTime), 3, 5000, 1)
SET IDENTITY_INSERT [dbo].[MAKINGRECEIPT] ON 

INSERT [dbo].[MAKINGRECEIPT] ([RepairID], [MakingID], [Discount], [WorkedOn], [AmountToBePaid]) VALUES (1, N'tom@gmail.com', 100, N'color', 10000)
INSERT [dbo].[MAKINGRECEIPT] ([RepairID], [MakingID], [Discount], [WorkedOn], [AmountToBePaid]) VALUES (2, N'bob@gmail.com', 200, N'wheel', 10000)
INSERT [dbo].[MAKINGRECEIPT] ([RepairID], [MakingID], [Discount], [WorkedOn], [AmountToBePaid]) VALUES (3, N'mac@gmail.com', 500, N'engine', 10000)
INSERT [dbo].[MAKINGRECEIPT] ([RepairID], [MakingID], [Discount], [WorkedOn], [AmountToBePaid]) VALUES (4, N'bob@gmail.com', 3000, N'gear', 4990)
SET IDENTITY_INSERT [dbo].[MAKINGRECEIPT] OFF
SET IDENTITY_INSERT [dbo].[MONEYRECEIPT] ON 

INSERT [dbo].[MONEYRECEIPT] ([ReceiptID], [AdministratorID], [CustomerID], [VehicleNumber], [TotalAmount]) VALUES (1, 1, N'tom@gmail.com', 1, 10000)
INSERT [dbo].[MONEYRECEIPT] ([ReceiptID], [AdministratorID], [CustomerID], [VehicleNumber], [TotalAmount]) VALUES (2, 2, N'bob@gmail.com', 2, 10000)
INSERT [dbo].[MONEYRECEIPT] ([ReceiptID], [AdministratorID], [CustomerID], [VehicleNumber], [TotalAmount]) VALUES (3, 3, N'mac@gmail.com', 3, 10000)
SET IDENTITY_INSERT [dbo].[MONEYRECEIPT] OFF
SET IDENTITY_INSERT [dbo].[REPAIR] ON 

INSERT [dbo].[REPAIR] ([RepairID], [CustomerID], [VehicleNumber], [Wheel], [ElectricalConnections], [Engine], [AC], [Lights], [Others]) VALUES (1, N'tom@gmail.com', 1, N'Yes', N'No', N'Yes', N'No', NULL, N'No')
INSERT [dbo].[REPAIR] ([RepairID], [CustomerID], [VehicleNumber], [Wheel], [ElectricalConnections], [Engine], [AC], [Lights], [Others]) VALUES (2, N'bob@gmail.com', 2, N'Yes', N'No', N'Yes', N'No', NULL, N'No')
INSERT [dbo].[REPAIR] ([RepairID], [CustomerID], [VehicleNumber], [Wheel], [ElectricalConnections], [Engine], [AC], [Lights], [Others]) VALUES (3, N'mac@gmail.com', 3, N'Yes', N'No', N'Yes', N'No', NULL, N'No')
SET IDENTITY_INSERT [dbo].[REPAIR] OFF
INSERT [dbo].[SCHEDULE] ([CustomerID], [Timee], [Inout], [button]) VALUES (N'tom@gmail.com', N'9:30-10:30', N'yes', N'b1')
INSERT [dbo].[SCHEDULE] ([CustomerID], [Timee], [Inout], [button]) VALUES (N'himm@gmail.com', N'10:30-11:30', N'yes', N'b2')
INSERT [dbo].[SCHEDULE] ([CustomerID], [Timee], [Inout], [button]) VALUES (N'jery@gmail.com', N'11:30-12:30', N'no', N'b3')
INSERT [dbo].[SCHEDULE] ([CustomerID], [Timee], [Inout], [button]) VALUES (N'shitul@gmail.com', N'12:30-13:30', N'no', N'b4')
INSERT [dbo].[SCHEDULE] ([CustomerID], [Timee], [Inout], [button]) VALUES (N'm@gmail.com', N'13:30-14:30', N'yes', N'b5')
INSERT [dbo].[SCHEDULE] ([CustomerID], [Timee], [Inout], [button]) VALUES (N'him@gmail.com', N'14:30-15:30', N'yes', N'b6')
INSERT [dbo].[SCHEDULE] ([CustomerID], [Timee], [Inout], [button]) VALUES (N'mac@gmail.com', N'15:30-16:30', N'no', N'b7')
INSERT [dbo].[SCHEDULE] ([CustomerID], [Timee], [Inout], [button]) VALUES (N'tul@gmail.com', N'16:30-17:30', N'no', N'b8')
SET IDENTITY_INSERT [dbo].[VEHICLE] ON 

INSERT [dbo].[VEHICLE] ([VehicleNumber], [Color], [Manufacturer], [VehicleType], [FuelCapacity], [RegistrationNumber]) VALUES (1, N'Yes', N'Yes', N'Car', N'50litre', N'Dhaka metro kha-35282')
INSERT [dbo].[VEHICLE] ([VehicleNumber], [Color], [Manufacturer], [VehicleType], [FuelCapacity], [RegistrationNumber]) VALUES (2, N'Yes', N'No', N'Car', N'60litre', N'Dhaka metro ka-38282')
INSERT [dbo].[VEHICLE] ([VehicleNumber], [Color], [Manufacturer], [VehicleType], [FuelCapacity], [RegistrationNumber]) VALUES (3, N'No', N'Yes', N'Car', N'70litre', N'Dhaka metro ga-35452')
SET IDENTITY_INSERT [dbo].[VEHICLE] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__ADINFO__A9D10534F71C8768]    Script Date: 22-Sep-20 5:16:46 PM ******/
ALTER TABLE [dbo].[ADINFO] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__ADMINIST__250375B102C5FD99]    Script Date: 22-Sep-20 5:16:46 PM ******/
ALTER TABLE [dbo].[ADMINISTRATOR] ADD UNIQUE NONCLUSTERED 
(
	[MobileNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__ADMINIST__A9D10534D882F1D6]    Script Date: 22-Sep-20 5:16:46 PM ******/
ALTER TABLE [dbo].[ADMINISTRATOR] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__CUSTOMER__E8864602DD648D29]    Script Date: 22-Sep-20 5:16:46 PM ******/
ALTER TABLE [dbo].[CUSTOMERVEHICLE] ADD UNIQUE NONCLUSTERED 
(
	[RegistrationNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__VEHICLE__E886460289384973]    Script Date: 22-Sep-20 5:16:46 PM ******/
ALTER TABLE [dbo].[VEHICLE] ADD UNIQUE NONCLUSTERED 
(
	[RegistrationNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADMINISTRATOR]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CUSTOMER] ([CustomerID])
GO
ALTER TABLE [dbo].[CUSTOMIZE]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CUSTOMER] ([CustomerID])
GO
ALTER TABLE [dbo].[CUSTOMIZE]  WITH CHECK ADD FOREIGN KEY([VehicleNumber])
REFERENCES [dbo].[VEHICLE] ([VehicleNumber])
GO
ALTER TABLE [dbo].[GENERATE]  WITH CHECK ADD FOREIGN KEY([AdministratorID])
REFERENCES [dbo].[ADMINISTRATOR] ([AdministratorID])
GO
ALTER TABLE [dbo].[GENERATE]  WITH CHECK ADD FOREIGN KEY([ReceiptID])
REFERENCES [dbo].[MONEYRECEIPT] ([ReceiptID])
GO
ALTER TABLE [dbo].[GOESTO]  WITH CHECK ADD FOREIGN KEY([RepairID])
REFERENCES [dbo].[REPAIR] ([RepairID])
GO
ALTER TABLE [dbo].[GOESTO]  WITH CHECK ADD FOREIGN KEY([VehicleNumber])
REFERENCES [dbo].[VEHICLE] ([VehicleNumber])
GO
ALTER TABLE [dbo].[MANAGE]  WITH CHECK ADD FOREIGN KEY([AdministratorID])
REFERENCES [dbo].[ADMINISTRATOR] ([AdministratorID])
GO
ALTER TABLE [dbo].[MANAGE]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CUSTOMER] ([CustomerID])
GO
ALTER TABLE [dbo].[MONEYRECEIPT]  WITH CHECK ADD FOREIGN KEY([AdministratorID])
REFERENCES [dbo].[ADMINISTRATOR] ([AdministratorID])
GO
ALTER TABLE [dbo].[MONEYRECEIPT]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CUSTOMER] ([CustomerID])
GO
ALTER TABLE [dbo].[MONEYRECEIPT]  WITH CHECK ADD FOREIGN KEY([VehicleNumber])
REFERENCES [dbo].[VEHICLE] ([VehicleNumber])
GO
ALTER TABLE [dbo].[NEEDSTO]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CUSTOMER] ([CustomerID])
GO
ALTER TABLE [dbo].[NEEDSTO]  WITH CHECK ADD FOREIGN KEY([VehicleNumber])
REFERENCES [dbo].[VEHICLE] ([VehicleNumber])
GO
ALTER TABLE [dbo].[REPAIR]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CUSTOMER] ([CustomerID])
GO
ALTER TABLE [dbo].[REPAIR]  WITH CHECK ADD FOREIGN KEY([VehicleNumber])
REFERENCES [dbo].[VEHICLE] ([VehicleNumber])
GO
ALTER TABLE [dbo].[USES]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CUSTOMER] ([CustomerID])
GO
ALTER TABLE [dbo].[USES]  WITH CHECK ADD FOREIGN KEY([VehicleNumber])
REFERENCES [dbo].[VEHICLE] ([VehicleNumber])
GO
USE [master]
GO
ALTER DATABASE [AutoCorner] SET  READ_WRITE 
GO
