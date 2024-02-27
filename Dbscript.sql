USE [master]
GO
/****** Object:  Database [dental]    Script Date: 2/26/2024 6:43:14 PM ******/
CREATE DATABASE [dental]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dental', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\dental.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dental_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\dental_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dental] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dental].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dental] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dental] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dental] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dental] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dental] SET ARITHABORT OFF 
GO
ALTER DATABASE [dental] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dental] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dental] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dental] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dental] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dental] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dental] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dental] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dental] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dental] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dental] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dental] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dental] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dental] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dental] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dental] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dental] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dental] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dental] SET  MULTI_USER 
GO
ALTER DATABASE [dental] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dental] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dental] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dental] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dental] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dental] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dental', N'ON'
GO
ALTER DATABASE [dental] SET QUERY_STORE = ON
GO
ALTER DATABASE [dental] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dental]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 2/26/2024 6:43:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[appointment_id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NULL,
	[patient_id] [int] NULL,
	[datetime] [date] NULL,
	[note] [nvarchar](100) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[appointment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 2/26/2024 6:43:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[prescriptionId] [int] NULL,
	[patientId] [int] NULL,
	[appointmentId] [int] NULL,
	[discount] [float] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 2/26/2024 6:43:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[material_id] [int] IDENTITY(1,1) NOT NULL,
	[material_name] [nvarchar](50) NULL,
	[supplier] [nvarchar](50) NULL,
	[unitPrice] [float] NULL,
	[quantityInStock] [int] NULL,
	[Type] [bit] NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[material_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalRecord]    Script Date: 2/26/2024 6:43:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalRecord](
	[recordId] [int] IDENTITY(1,1) NOT NULL,
	[patientId] [int] NULL,
	[appointmentId] [int] NULL,
	[serviceId] [int] NULL,
	[prescriptionId] [int] NULL,
	[diagnosis] [nvarchar](50) NULL,
 CONSTRAINT [PK_MedicalRecord] PRIMARY KEY CLUSTERED 
(
	[recordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 2/26/2024 6:43:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[manufacturer] [nvarchar](50) NULL,
	[expiry_date] [date] NULL,
	[input_day] [date] NULL,
	[price] [float] NULL,
	[quantityInStock] [int] NULL,
	[dosage] [nvarchar](50) NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Medicine] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 2/26/2024 6:43:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tittle] [nvarchar](50) NULL,
	[brief_info] [nvarchar](50) NULL,
	[description] [text] NULL,
	[author] [int] NULL,
	[created_at] [date] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 2/26/2024 6:43:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[id] [int] NOT NULL,
	[medicineId] [int] NULL,
	[quantity] [int] NULL,
	[dosageInstruction] [nvarchar](50) NULL,
 CONSTRAINT [PK_Prescription] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2/26/2024 6:43:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 2/26/2024 6:43:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[service_id] [int] IDENTITY(1,1) NOT NULL,
	[service_name] [nvarchar](50) NULL,
	[brief_info] [nvarchar](50) NULL,
	[description] [nvarchar](100) NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/26/2024 6:43:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[date_created] [date] NULL,
	[phone] [nchar](11) NULL,
	[email] [nvarchar](50) NULL,
	[img] [nvarchar](50) NULL,
	[description] [text] NULL,
	[salary] [float] NULL,
	[role] [int] NULL,
	[password] [nchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (3, NULL, NULL, CAST(N'2024-01-01' AS Date), N'Sample text', 0)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (4, NULL, NULL, CAST(N'2024-01-01' AS Date), N'Sample text', 1)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (5, NULL, NULL, CAST(N'2024-01-01' AS Date), N'Sample text', 0)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (6, NULL, NULL, CAST(N'2024-01-01' AS Date), N'Sample text', 1)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (7, NULL, NULL, CAST(N'2024-01-01' AS Date), N'Sample text', 1)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (8, NULL, NULL, CAST(N'2024-01-01' AS Date), N'Sample text', 1)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (9, NULL, NULL, CAST(N'2024-01-01' AS Date), N'Sample text', 0)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (10, NULL, NULL, CAST(N'2024-01-01' AS Date), N'Sample text', 0)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (11, NULL, NULL, CAST(N'2024-01-01' AS Date), N'Sample text', 0)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (12, NULL, NULL, CAST(N'2024-01-01' AS Date), N'Sample text', 1)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (13, NULL, NULL, CAST(N'2024-01-01' AS Date), N'Sample text', 1)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (14, NULL, NULL, CAST(N'2024-01-01' AS Date), N'Sample text', 0)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (15, NULL, NULL, CAST(N'2024-01-01' AS Date), N'Sample text', 1)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (16, NULL, NULL, CAST(N'2024-01-01' AS Date), N'Sample text', 0)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (17, NULL, NULL, CAST(N'2024-01-01' AS Date), N'Sample text', 1)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (18, NULL, NULL, CAST(N'2024-01-01' AS Date), N'Sample text', 0)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (19, NULL, NULL, CAST(N'2024-01-01' AS Date), N'Sample text', 1)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (20, NULL, NULL, CAST(N'2024-01-01' AS Date), N'Sample text', 1)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (21, NULL, NULL, CAST(N'2024-01-01' AS Date), N'Sample text', 0)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (22, NULL, NULL, CAST(N'2024-01-01' AS Date), N'Sample text', 0)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (25, 31, 21, CAST(N'2023-08-01' AS Date), N'Checkup', NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (26, 31, 22, CAST(N'2023-08-02' AS Date), N'Cleaning', NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (27, 31, 23, CAST(N'2023-08-03' AS Date), N'Filling', NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (28, 31, 24, CAST(N'2023-08-04' AS Date), N'Extraction', NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (29, 31, 25, CAST(N'2023-08-05' AS Date), N'Root canal', NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (30, 31, 26, CAST(N'2023-08-06' AS Date), N'Braces consultation', NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (31, 32, 27, CAST(N'2023-08-07' AS Date), N'Wisdom teeth consultation', NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (32, 32, 28, CAST(N'2023-08-08' AS Date), N'Dental implant consultation', NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (33, 32, 29, CAST(N'2023-08-09' AS Date), N'Checkup', NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (34, 32, 30, CAST(N'2023-08-10' AS Date), N'Cleaning', NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (35, 32, 41, CAST(N'2023-08-11' AS Date), N'Filling', NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (36, 32, 42, CAST(N'2023-08-12' AS Date), N'Extraction', NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (37, 33, 43, CAST(N'2023-08-13' AS Date), N'Root canal', NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (38, 33, 44, CAST(N'2023-08-14' AS Date), N'Braces consultation', NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (39, 33, 45, CAST(N'2023-08-15' AS Date), N'Wisdom teeth consultation', NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (40, 36, 46, CAST(N'2023-08-16' AS Date), N'Dental implant consultation', NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (41, 36, 47, CAST(N'2023-08-17' AS Date), N'Checkup', NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (42, 36, 48, CAST(N'2023-08-18' AS Date), N'Cleaning', NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (43, 36, 49, CAST(N'2023-08-19' AS Date), N'Filling', NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status]) VALUES (44, 36, 50, CAST(N'2023-08-20' AS Date), N'Extraction', NULL)
SET IDENTITY_INSERT [dbo].[Appointment] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([id], [prescriptionId], [patientId], [appointmentId], [discount]) VALUES (3, 1, 21, 21, 5)
INSERT [dbo].[Invoice] ([id], [prescriptionId], [patientId], [appointmentId], [discount]) VALUES (4, 2, 22, 22, 10)
INSERT [dbo].[Invoice] ([id], [prescriptionId], [patientId], [appointmentId], [discount]) VALUES (5, 3, 23, 3, 5)
INSERT [dbo].[Invoice] ([id], [prescriptionId], [patientId], [appointmentId], [discount]) VALUES (6, 4, 24, 4, 10)
INSERT [dbo].[Invoice] ([id], [prescriptionId], [patientId], [appointmentId], [discount]) VALUES (7, 5, 25, 5, 5)
INSERT [dbo].[Invoice] ([id], [prescriptionId], [patientId], [appointmentId], [discount]) VALUES (8, 6, 26, 6, 10)
INSERT [dbo].[Invoice] ([id], [prescriptionId], [patientId], [appointmentId], [discount]) VALUES (9, 7, 27, 7, 5)
INSERT [dbo].[Invoice] ([id], [prescriptionId], [patientId], [appointmentId], [discount]) VALUES (10, 8, 28, 8, 10)
INSERT [dbo].[Invoice] ([id], [prescriptionId], [patientId], [appointmentId], [discount]) VALUES (11, 9, 29, 9, 5)
INSERT [dbo].[Invoice] ([id], [prescriptionId], [patientId], [appointmentId], [discount]) VALUES (12, 10, 21, 10, 10)
INSERT [dbo].[Invoice] ([id], [prescriptionId], [patientId], [appointmentId], [discount]) VALUES (13, 11, 21, 11, 5)
INSERT [dbo].[Invoice] ([id], [prescriptionId], [patientId], [appointmentId], [discount]) VALUES (14, 12, 22, 12, 10)
INSERT [dbo].[Invoice] ([id], [prescriptionId], [patientId], [appointmentId], [discount]) VALUES (15, 13, 23, 13, 5)
INSERT [dbo].[Invoice] ([id], [prescriptionId], [patientId], [appointmentId], [discount]) VALUES (16, 14, 24, 14, 10)
INSERT [dbo].[Invoice] ([id], [prescriptionId], [patientId], [appointmentId], [discount]) VALUES (17, 15, 25, 15, 5)
INSERT [dbo].[Invoice] ([id], [prescriptionId], [patientId], [appointmentId], [discount]) VALUES (18, 16, 26, 16, 10)
INSERT [dbo].[Invoice] ([id], [prescriptionId], [patientId], [appointmentId], [discount]) VALUES (19, 17, 27, 17, 5)
INSERT [dbo].[Invoice] ([id], [prescriptionId], [patientId], [appointmentId], [discount]) VALUES (20, 18, 28, 18, 10)
INSERT [dbo].[Invoice] ([id], [prescriptionId], [patientId], [appointmentId], [discount]) VALUES (21, 19, 29, 19, 5)
INSERT [dbo].[Invoice] ([id], [prescriptionId], [patientId], [appointmentId], [discount]) VALUES (22, 20, 30, 20, 10)
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (1, N'Material 1', N'Supplier 1', 100, 10, 1)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (2, N'Material 2', N'Supplier 2', 200, 20, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (3, N'Material 3', N'Supplier 3', 300, 30, 1)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (4, N'Material 4', N'Supplier 4', 400, 40, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (5, N'Material 5', N'Supplier 5', 500, 50, 1)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (6, N'Material 6', N'Supplier 6', 600, 60, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (7, N'Material 7', N'Supplier 7', 700, 70, 1)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (8, N'Material 8', N'Supplier 8', 800, 80, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (9, N'Material 9', N'Supplier 9', 900, 90, 1)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (10, N'Material 10', N'Supplier 10', 1000, 100, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (11, N'Material 11', N'Supplier 11', 1100, 110, 1)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (12, N'Material 12', N'Supplier 12', 1200, 120, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (13, N'Material 13', N'Supplier 13', 1300, 130, 1)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (14, N'Material 14', N'Supplier 14', 1400, 140, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (15, N'Material 15', N'Supplier 15', 1500, 150, 1)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (16, N'Material 16', N'Supplier 16', 1600, 160, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (17, N'Material 17', N'Supplier 17', 1700, 170, 1)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (18, N'Material 18', N'Supplier 18', 1800, 180, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (19, N'Material 19', N'Supplier 19', 1900, 190, 1)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (20, N'Material 20', N'Supplier 20', 2000, 200, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (21, N'Composite', N'Supplier A', 50, 100, 1)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (22, N'Amalgam', N'Supplier B', 40, 200, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (23, N'Resin', N'Supplier C', 60, 150, 1)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (24, N'Porcelain', N'Supplier D', 70, 90, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (25, N'Gold', N'Supplier E', 100, 50, 1)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (26, N'Silver', N'Supplier F', 45, 75, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (27, N'Ceramic', N'Supplier G', 55, 80, 1)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (28, N'Plastic', N'Supplier H', 35, 120, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (29, N'Nitinol', N'Supplier I', 65, 60, 1)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (30, N'Stainless Steel', N'Supplier J', 30, 110, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (31, N'Titanium', N'Supplier K', 85, 40, 1)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (32, N'Zirconia', N'Supplier L', 95, 30, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (33, N'Composite', N'Supplier M', 50, 100, 1)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (34, N'Amalgam', N'Supplier N', 40, 200, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (35, N'Resin', N'Supplier O', 60, 150, 1)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (36, N'Porcelain', N'Supplier P', 70, 90, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (37, N'Gold', N'Supplier Q', 100, 50, 1)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (38, N'Silver', N'Supplier R', 45, 75, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (39, N'Ceramic', N'Supplier S', 55, 80, 1)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type]) VALUES (40, N'Plastic', N'Supplier T', 35, 120, 0)
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicalRecord] ON 

INSERT [dbo].[MedicalRecord] ([recordId], [patientId], [appointmentId], [serviceId], [prescriptionId], [diagnosis]) VALUES (2, 21, 21, 1, 1, N'Cavity')
INSERT [dbo].[MedicalRecord] ([recordId], [patientId], [appointmentId], [serviceId], [prescriptionId], [diagnosis]) VALUES (3, 22, 22, 2, 2, N'Gum disease')
INSERT [dbo].[MedicalRecord] ([recordId], [patientId], [appointmentId], [serviceId], [prescriptionId], [diagnosis]) VALUES (4, 23, 3, 3, 3, N'Tooth decay')
INSERT [dbo].[MedicalRecord] ([recordId], [patientId], [appointmentId], [serviceId], [prescriptionId], [diagnosis]) VALUES (5, 24, 4, 4, 4, N'Root canal infection')
INSERT [dbo].[MedicalRecord] ([recordId], [patientId], [appointmentId], [serviceId], [prescriptionId], [diagnosis]) VALUES (6, 25, 5, 5, 5, N'Periodontitis')
INSERT [dbo].[MedicalRecord] ([recordId], [patientId], [appointmentId], [serviceId], [prescriptionId], [diagnosis]) VALUES (7, 26, 6, 6, 6, N'Cracked tooth')
INSERT [dbo].[MedicalRecord] ([recordId], [patientId], [appointmentId], [serviceId], [prescriptionId], [diagnosis]) VALUES (8, 27, 7, 7, 7, N'Oral cancer screening')
INSERT [dbo].[MedicalRecord] ([recordId], [patientId], [appointmentId], [serviceId], [prescriptionId], [diagnosis]) VALUES (9, 28, 8, 8, 8, N'Wisdom tooth pain')
INSERT [dbo].[MedicalRecord] ([recordId], [patientId], [appointmentId], [serviceId], [prescriptionId], [diagnosis]) VALUES (10, 29, 9, 9, 9, N'Braces adjustment')
INSERT [dbo].[MedicalRecord] ([recordId], [patientId], [appointmentId], [serviceId], [prescriptionId], [diagnosis]) VALUES (11, 21, 10, 10, 10, N'Teeth whitening')
INSERT [dbo].[MedicalRecord] ([recordId], [patientId], [appointmentId], [serviceId], [prescriptionId], [diagnosis]) VALUES (12, 21, 11, 11, 11, N'Veneers application')
INSERT [dbo].[MedicalRecord] ([recordId], [patientId], [appointmentId], [serviceId], [prescriptionId], [diagnosis]) VALUES (13, 22, 12, 12, 12, N'Dental crown fitting')
INSERT [dbo].[MedicalRecord] ([recordId], [patientId], [appointmentId], [serviceId], [prescriptionId], [diagnosis]) VALUES (14, 23, 13, 13, 13, N'Dental bridge fitting')
INSERT [dbo].[MedicalRecord] ([recordId], [patientId], [appointmentId], [serviceId], [prescriptionId], [diagnosis]) VALUES (15, 24, 14, 14, 14, N'Denture fitting')
INSERT [dbo].[MedicalRecord] ([recordId], [patientId], [appointmentId], [serviceId], [prescriptionId], [diagnosis]) VALUES (16, 25, 15, 15, 15, N'Dental implant')
INSERT [dbo].[MedicalRecord] ([recordId], [patientId], [appointmentId], [serviceId], [prescriptionId], [diagnosis]) VALUES (17, 26, 16, 16, 16, N'Orthodontic consultation')
INSERT [dbo].[MedicalRecord] ([recordId], [patientId], [appointmentId], [serviceId], [prescriptionId], [diagnosis]) VALUES (18, 27, 17, 17, 17, N'Pediatric dentistry consultation')
INSERT [dbo].[MedicalRecord] ([recordId], [patientId], [appointmentId], [serviceId], [prescriptionId], [diagnosis]) VALUES (19, 28, 18, 18, 18, N'Cosmetic dentistry consultation')
INSERT [dbo].[MedicalRecord] ([recordId], [patientId], [appointmentId], [serviceId], [prescriptionId], [diagnosis]) VALUES (20, 29, 19, 19, 19, N'Second opinion for dental surgery')
INSERT [dbo].[MedicalRecord] ([recordId], [patientId], [appointmentId], [serviceId], [prescriptionId], [diagnosis]) VALUES (21, 30, 20, 20, 20, N'Emergency dental pain relief')
SET IDENTITY_INSERT [dbo].[MedicalRecord] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicine] ON 

INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (1, N'Ibuprofen', N'Pharma A', CAST(N'2024-12-31' AS Date), CAST(N'2023-01-01' AS Date), 10, 100, N'200mg', N'Pain reliever')
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (2, N'Acetaminophen', N'Pharma B', CAST(N'2025-12-31' AS Date), CAST(N'2023-02-01' AS Date), 12, 200, N'500mg', N'Pain reliever and fever reducer')
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (3, N'Amoxicillin', N'Pharma C', CAST(N'2024-11-30' AS Date), CAST(N'2023-03-01' AS Date), 15, 150, N'500mg', N'Antibiotic')
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (4, N'Doxycycline', N'Pharma D', CAST(N'2025-01-31' AS Date), CAST(N'2023-04-01' AS Date), 20, 120, N'100mg', N'Antibiotic for bacterial infections')
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (5, N'Metformin', N'Pharma E', CAST(N'2024-10-31' AS Date), CAST(N'2023-05-01' AS Date), 5, 300, N'500mg', N'For type 2 diabetes')
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (6, N'Atorvastatin', N'Pharma F', CAST(N'2025-02-28' AS Date), CAST(N'2023-06-01' AS Date), 25, 80, N'20mg', N'Lowers cholesterol')
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (7, N'Lisinopril', N'Pharma G', CAST(N'2024-09-30' AS Date), CAST(N'2023-07-01' AS Date), 8, 90, N'10mg', N'For high blood pressure')
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (8, N'Levothyroxine', N'Pharma H', CAST(N'2025-03-31' AS Date), CAST(N'2023-08-01' AS Date), 18, 200, N'50mcg', N'For thyroid deficiency')
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (9, N'Amlodipine', N'Pharma I', CAST(N'2024-08-31' AS Date), CAST(N'2023-09-01' AS Date), 11, 110, N'5mg', N'For high blood pressure and chest pain')
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (10, N'Hydrochlorothiazide', N'Pharma J', CAST(N'2025-04-30' AS Date), CAST(N'2023-10-01' AS Date), 9, 100, N'25mg', N'Diuretic for high blood pressure')
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (11, N'Simvastatin', N'Pharma K', CAST(N'2024-07-31' AS Date), CAST(N'2023-11-01' AS Date), 16, 150, N'20mg', N'Lowers cholesterol and triglycerides')
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (12, N'Omeprazole', N'Pharma L', CAST(N'2025-05-31' AS Date), CAST(N'2023-12-01' AS Date), 14, 140, N'20mg', N'Reduces stomach acid')
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (13, N'Losartan', N'Pharma M', CAST(N'2024-06-30' AS Date), CAST(N'2024-01-01' AS Date), 7, 160, N'50mg', N'For high blood pressure')
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (14, N'Albuterol', N'Pharma N', CAST(N'2025-06-30' AS Date), CAST(N'2024-02-01' AS Date), 21, 60, N'90mcg', N'For asthma and COPD')
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (15, N'Fluoxetine', N'Pharma O', CAST(N'2024-05-31' AS Date), CAST(N'2024-03-01' AS Date), 22, 70, N'20mg', N'Antidepressant')
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (16, N'Warfarin', N'Pharma P', CAST(N'2025-07-31' AS Date), CAST(N'2024-04-01' AS Date), 13, 130, N'5mg', N'Prevents blood clots')
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (17, N'Clopidogrel', N'Pharma Q', CAST(N'2024-04-30' AS Date), CAST(N'2024-05-01' AS Date), 19, 85, N'75mg', N'Prevents strokes and heart attacks')
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (18, N'Insulin Glargine', N'Pharma R', CAST(N'2025-08-31' AS Date), CAST(N'2024-06-01' AS Date), 45, 40, N'100 units/mL', N'Long-acting insulin')
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (19, N'Nitroglycerin', N'Pharma S', CAST(N'2024-03-31' AS Date), CAST(N'2024-07-01' AS Date), 23, 95, N'0.4mg', N'For chest pain')
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (20, N'Fentanyl', N'Pharma T', CAST(N'2025-09-30' AS Date), CAST(N'2024-08-01' AS Date), 50, 25, N'100mcg', N'Pain reliever for severe pain')
SET IDENTITY_INSERT [dbo].[Medicine] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at]) VALUES (1, N'Dental Health Month', N'Promoting Oral Health', N'February is National Dental Health Month. Here are tips to keep your smile bright.', 1, CAST(N'2023-02-01' AS Date))
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at]) VALUES (2, N'New Dental Clinic Opening', N'New Clinic in Town', N'A new dental clinic opens its doors in downtown. Offering modern dental care for all ages.', 2, CAST(N'2023-03-01' AS Date))
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at]) VALUES (3, N'Advancements in Orthodontics', N'Braces Technology', N'Exploring the latest advancements in orthodontics and what it means for patients.', 3, CAST(N'2023-04-01' AS Date))
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at]) VALUES (4, N'Tips for Healthy Gums', N'Gum Care', N'Maintaining healthy gums is crucial for overall dental health. Here are some tips.', 4, CAST(N'2023-05-01' AS Date))
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at]) VALUES (5, N'Preventing Tooth Decay', N'Cavity Prevention', N'Effective strategies to prevent tooth decay and maintain oral health.', 5, CAST(N'2023-06-01' AS Date))
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at]) VALUES (6, N'The Importance of Regular Checkups', N'Dental Checkups', N'Why regular dental checkups are important for detecting problems early.', 6, CAST(N'2023-07-01' AS Date))
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at]) VALUES (7, N'Dealing with Dental Anxiety', N'Overcoming Fear', N'Tips for dealing with dental anxiety and making your visit to the dentist a stress-free experience.', 7, CAST(N'2023-08-01' AS Date))
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at]) VALUES (8, N'Choosing the Right Toothbrush', N'Dental Tools', N'How to choose the right toothbrush for your dental care needs.', 8, CAST(N'2023-09-01' AS Date))
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at]) VALUES (9, N'Foods for Healthy Teeth', N'Nutrition and Oral Health', N'Foods that promote healthy teeth and gums.', 9, CAST(N'2023-10-01' AS Date))
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at]) VALUES (10, N'Children’s Oral Health', N'Pediatric Dentistry', N'Ensuring your children maintain good oral health.', 10, CAST(N'2023-11-01' AS Date))
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at]) VALUES (11, N'Oral Cancer Awareness', N'Cancer Prevention', N'Raising awareness about oral cancer and its prevention.', 11, CAST(N'2023-12-01' AS Date))
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at]) VALUES (12, N'Dental Implants: What to Know', N'Tooth Replacement', N'Everything you need to know about dental implants.', 12, CAST(N'2024-01-01' AS Date))
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at]) VALUES (13, N'Teeth Whitening Options', N'Cosmetic Dentistry', N'Exploring different teeth whitening options and what suits you best.', 13, CAST(N'2024-02-01' AS Date))
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at]) VALUES (14, N'The Future of Dentistry', N'Innovations in Dentistry', N'A look into the future of dentistry and upcoming technological advancements.', 14, CAST(N'2024-03-01' AS Date))
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at]) VALUES (15, N'How to Floss Properly', N'Flossing Techniques', N'A guide on how to floss properly to remove plaque and debris.', 15, CAST(N'2024-04-01' AS Date))
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at]) VALUES (16, N'Debunking Dental Myths', N'Myth Busting', N'Debunking common dental myths and misconceptions.', 16, CAST(N'2024-05-01' AS Date))
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at]) VALUES (17, N'Dental Insurance: What You Need to Know', N'Insurance Tips', N'Understanding dental insurance and how to make the most of your plan.', 17, CAST(N'2024-06-01' AS Date))
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at]) VALUES (18, N'Emergency Dental Care', N'Handling Dental Emergencies', N'What to do in case of a dental emergency.', 18, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at]) VALUES (19, N'Oral Hygiene for Seniors', N'Senior Dental Care', N'Oral hygiene tips for seniors to maintain healthy teeth and gums.', 19, CAST(N'2024-08-01' AS Date))
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at]) VALUES (20, N'Overcoming Bad Breath', N'Halitosis Solutions', N'Solutions for overcoming bad breath and maintaining fresh breath.', 20, CAST(N'2024-09-01' AS Date))
SET IDENTITY_INSERT [dbo].[News] OFF
GO
INSERT [dbo].[Prescription] ([id], [medicineId], [quantity], [dosageInstruction]) VALUES (1, 1, 2, N'Take two pills daily')
INSERT [dbo].[Prescription] ([id], [medicineId], [quantity], [dosageInstruction]) VALUES (2, 2, 1, N'Take one pill daily')
INSERT [dbo].[Prescription] ([id], [medicineId], [quantity], [dosageInstruction]) VALUES (3, 3, 3, N'Take three pills daily')
INSERT [dbo].[Prescription] ([id], [medicineId], [quantity], [dosageInstruction]) VALUES (4, 4, 1, N'Take one pill daily')
INSERT [dbo].[Prescription] ([id], [medicineId], [quantity], [dosageInstruction]) VALUES (5, 5, 2, N'Take two pills daily')
INSERT [dbo].[Prescription] ([id], [medicineId], [quantity], [dosageInstruction]) VALUES (6, 6, 1, N'Take one pill daily')
INSERT [dbo].[Prescription] ([id], [medicineId], [quantity], [dosageInstruction]) VALUES (7, 7, 3, N'Take three pills daily')
INSERT [dbo].[Prescription] ([id], [medicineId], [quantity], [dosageInstruction]) VALUES (8, 8, 1, N'Take one pill daily')
INSERT [dbo].[Prescription] ([id], [medicineId], [quantity], [dosageInstruction]) VALUES (9, 9, 2, N'Take two pills daily')
INSERT [dbo].[Prescription] ([id], [medicineId], [quantity], [dosageInstruction]) VALUES (10, 10, 1, N'Take one pill daily')
INSERT [dbo].[Prescription] ([id], [medicineId], [quantity], [dosageInstruction]) VALUES (11, 11, 3, N'Take three pills daily')
INSERT [dbo].[Prescription] ([id], [medicineId], [quantity], [dosageInstruction]) VALUES (12, 12, 1, N'Take one pill daily')
INSERT [dbo].[Prescription] ([id], [medicineId], [quantity], [dosageInstruction]) VALUES (13, 13, 2, N'Take two pills daily')
INSERT [dbo].[Prescription] ([id], [medicineId], [quantity], [dosageInstruction]) VALUES (14, 14, 1, N'Take one pill daily')
INSERT [dbo].[Prescription] ([id], [medicineId], [quantity], [dosageInstruction]) VALUES (15, 15, 3, N'Take three pills daily')
INSERT [dbo].[Prescription] ([id], [medicineId], [quantity], [dosageInstruction]) VALUES (16, 16, 1, N'Take one pill daily')
INSERT [dbo].[Prescription] ([id], [medicineId], [quantity], [dosageInstruction]) VALUES (17, 17, 2, N'Take two pills daily')
INSERT [dbo].[Prescription] ([id], [medicineId], [quantity], [dosageInstruction]) VALUES (18, 18, 1, N'Take one pill daily')
INSERT [dbo].[Prescription] ([id], [medicineId], [quantity], [dosageInstruction]) VALUES (19, 19, 3, N'Take three pills daily')
INSERT [dbo].[Prescription] ([id], [medicineId], [quantity], [dosageInstruction]) VALUES (20, 20, 1, N'Take one pill daily')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([id], [name]) VALUES (2, N'User')
INSERT [dbo].[Role] ([id], [name]) VALUES (3, N'Patient')
INSERT [dbo].[Role] ([id], [name]) VALUES (4, N'Staff')
INSERT [dbo].[Role] ([id], [name]) VALUES (5, N'Doctor')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price]) VALUES (1, N'General Checkup', N'Routine dental checkup', N'A comprehensive dental checkup to assess overall oral health.', 50)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price]) VALUES (2, N'Teeth Cleaning', N'Professional teeth cleaning', N'Removal of plaque and tartar to prevent cavities and gum disease.', 75)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price]) VALUES (3, N'Filling', N'Cavity filling', N'Restoration of decayed teeth with fillings.', 100)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price]) VALUES (4, N'Root Canal', N'Root canal treatment', N'Treatment of infected or damaged tooth pulp.', 200)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price]) VALUES (5, N'Extraction', N'Tooth extraction', N'Removal of teeth that are decayed, damaged, or causing crowding.', 150)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price]) VALUES (6, N'Teeth Whitening', N'Cosmetic teeth whitening', N'Professional bleaching to make teeth whiter.', 250)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price]) VALUES (7, N'Braces', N'Orthodontic braces', N'Alignment of teeth and correction of bite.', 3000)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price]) VALUES (8, N'Dental Implants', N'Tooth replacement with implants', N'Surgical insertion of artificial tooth roots.', 2000)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price]) VALUES (9, N'Veneers', N'Cosmetic dental veneers', N'Custom-made shells to cover the front surface of teeth.', 500)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price]) VALUES (10, N'Crown', N'Dental crown', N'A cap that covers a damaged tooth.', 400)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price]) VALUES (11, N'Bridge', N'Dental bridge', N'A structure containing artificial teeth to fill a gap.', 600)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price]) VALUES (12, N'Dentures', N'Artificial teeth', N'Removable replacement for missing teeth.', 800)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price]) VALUES (13, N'Gum Surgery', N'Periodontal surgery', N'Surgery to treat gum disease and improve oral health.', 1000)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price]) VALUES (14, N'Wisdom Teeth Removal', N'Extraction of wisdom teeth', N'Removal of one or more wisdom teeth.', 300)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price]) VALUES (15, N'Invisalign', N'Clear orthodontic aligners', N'Invisible aligners to straighten teeth without metal braces.', 3500)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price]) VALUES (16, N'Oral Cancer Screening', N'Cancer screening', N'Examination to detect oral cancer early.', 100)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price]) VALUES (17, N'Pediatric Dentistry', N'Dental care for children', N'Specialized dental care for children and adolescents.', 120)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price]) VALUES (18, N'Emergency Dental Care', N'Urgent dental treatment', N'Immediate treatment for dental emergencies.', 250)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price]) VALUES (19, N'Sleep Apnea Treatment', N'Treatment for sleep apnea', N'Dental devices to help manage sleep apnea.', 450)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price]) VALUES (20, N'TMJ Therapy', N'Treatment for TMJ disorders', N'Therapy to relieve pain and improve function of the jaw joint.', 350)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (1, N'John Doe', CAST(N'2023-01-01' AS Date), N'0123456789 ', N'johndoe@example.com', N'path/to/image1.jpg', N'A dedicated dental professional.', 60000, 1, N'password123                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (2, N'Jane Smith', CAST(N'2023-01-02' AS Date), N'0123456790 ', N'janesmith@example.com', N'path/to/image2.jpg', N'Experienced dental hygienist.', 55000, 2, N'password124                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (3, N'Mike Johnson', CAST(N'2023-01-03' AS Date), N'0123456791 ', N'mikejohnson@example.com', N'path/to/image3.jpg', N'Friendly receptionist.', 40000, 3, N'password125                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (4, N'Emily Davis', CAST(N'2023-01-04' AS Date), N'0123456792 ', N'emilydavis@example.com', N'path/to/image4.jpg', N'Skilled dental assistant.', 45000, 4, N'password126                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (5, N'David Wilson', CAST(N'2023-01-05' AS Date), N'0123456793 ', N'davidwilson@example.com', N'path/to/image5.jpg', N'Dental clinic manager.', 70000, 1, N'password127                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (6, N'Linda Taylor', CAST(N'2023-01-06' AS Date), N'0123456794 ', N'lindataylor@example.com', N'path/to/image6.jpg', N'Expert dental technician.', 48000, 2, N'password128                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (7, N'Robert Brown', CAST(N'2023-01-07' AS Date), N'0123456795 ', N'robertbrown@example.com', N'path/to/image7.jpg', N'Renowned dental surgeon.', 80000, 3, N'password129                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (8, N'Maria Miller', CAST(N'2023-01-08' AS Date), N'0123456796 ', N'mariamiller@example.com', N'path/to/image8.jpg', N'Orthodontist with a gentle touch.', 75000, 4, N'password130                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (9, N'James Wilson', CAST(N'2023-01-09' AS Date), N'0123456797 ', N'jameswilson@example.com', N'path/to/image9.jpg', N'Pediatric dentist loved by all his patients.', 65000, 1, N'password131                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (10, N'Patricia Anderson', CAST(N'2023-01-10' AS Date), N'0123456798 ', N'patriciaanderson@example.com', N'path/to/image10.jpg', N'Endodontist specializing in root canal treatments.', 68000, 2, N'password132                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (11, N'Charles Thomas', CAST(N'2023-01-11' AS Date), N'0123456799 ', N'charlesthomas@example.com', N'path/to/image11.jpg', N'Periodontist focusing on gum health.', 67000, 1, N'password133                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (12, N'Barbara Jackson', CAST(N'2023-01-12' AS Date), N'0123456800 ', N'barbarajackson@example.com', N'path/to/image12.jpg', N'Prosthodontist with expertise in dental prosthetics.', 69000, 2, N'password134                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (13, N'Susan White', CAST(N'2023-01-13' AS Date), N'0123456801 ', N'susanwhite@example.com', N'path/to/image13.jpg', N'Oral pathologist researching oral diseases.', 71000, 3, N'password135                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (14, N'Joseph Harris', CAST(N'2023-01-14' AS Date), N'0123456802 ', N'josephharris@example.com', N'path/to/image14.jpg', N'Oral radiologist specializing in dental imaging.', 73000, 4, N'password136                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (15, N'Margaret Clark', CAST(N'2023-01-15' AS Date), N'0123456803 ', N'margaretclark@example.com', N'path/to/image15.jpg', N'Dental public health specialist.', 50000, 1, N'password137                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (16, N'Thomas Moore', CAST(N'2023-01-16' AS Date), N'0123456804 ', N'thomasmoore@example.com', N'path/to/image16.jpg', N'Cosmetic dentist creating beautiful smiles.', 76000, 4, N'password138                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (17, N'Sarah Martin', CAST(N'2023-01-17' AS Date), N'0123456805 ', N'sarahmartin@example.com', N'path/to/image17.jpg', N'Implantologist with years of experience in dental implants.', 78000, 1, N'password139                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (18, N'Jessica Thompson', CAST(N'2023-01-18' AS Date), N'0123456806 ', N'jessicathompson@example.com', N'path/to/image18.jpg', N'Dental anesthesiologist ensuring pain-free procedures.', 57000, 4, N'password140                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (19, N'William Garcia', CAST(N'2023-01-19' AS Date), N'0123456807 ', N'williamgarcia@example.com', N'path/to/image19.jpg', N'Forensic dentist working with law enforcement.', 59000, 3, N'password141                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (20, N'Elizabeth Martinez', CAST(N'2023-01-20' AS Date), N'0123456808 ', N'elizabethmartinez@example.com', N'path/to/image20.jpg', N'Geriatric dentist specializing in dental care for the elderly.', 61000, 2, N'password142                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (21, N'Alex Young', CAST(N'2023-02-21' AS Date), N'0123456811 ', N'alexyoung@example.com', N'path/to/image21.jpg', N'Assistant with 5 years of experience.', 52000, 4, N'password141                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (22, N'Brittany Hart', CAST(N'2023-02-22' AS Date), N'0123456812 ', N'brittanyhart@example.com', N'path/to/image22.jpg', N'Committed dental assistant.', 53000, 4, N'password142                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (23, N'Carlos King', CAST(N'2023-02-23' AS Date), N'0123456813 ', N'carlosking@example.com', N'path/to/image23.jpg', N'Assistant specializing in pediatric dentistry.', 54000, 4, N'password143                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (24, N'Diana Prince', CAST(N'2023-02-24' AS Date), N'0123456814 ', N'dianaprince@example.com', N'path/to/image24.jpg', N'Experienced orthodontic assistant.', 55000, 4, N'password144                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (25, N'Evan Wright', CAST(N'2023-02-25' AS Date), N'0123456815 ', N'evanwright@example.com', N'path/to/image25.jpg', N'Assistant focused on patient comfort.', 56000, 4, N'password145                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (26, N'Fiona Green', CAST(N'2023-02-26' AS Date), N'0123456816 ', N'fionagreen@example.com', N'path/to/image26.jpg', N'Dental assistant with a gentle touch.', 57000, 4, N'password146                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (27, N'George Stone', CAST(N'2023-02-27' AS Date), N'0123456817 ', N'georgestone@example.com', N'path/to/image27.jpg', N'Assistant skilled in dental technology.', 58000, 4, N'password147                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (28, N'Hannah East', CAST(N'2023-02-28' AS Date), N'0123456818 ', N'hannaheast@example.com', N'path/to/image28.jpg', N'Proactive dental assistant.', 59000, 4, N'password148                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (29, N'Ian Frost', CAST(N'2023-03-01' AS Date), N'0123456819 ', N'ianfrost@example.com', N'path/to/image29.jpg', N'Assistant with expertise in endodontics.', 60000, 4, N'password149                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (30, N'Jenny Lake', CAST(N'2023-03-02' AS Date), N'0123456820 ', N'jennylake@example.com', N'path/to/image30.jpg', N'Orthodontic assistant passionate about smiles.', 61000, 4, N'password150                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (31, N'Kevin Moon', CAST(N'2023-03-03' AS Date), N'0123456821 ', N'kevinmoon@example.com', N'path/to/image31.jpg', N'Manager with a decade of experience.', 72000, 5, N'password151                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (32, N'Lily Sun', CAST(N'2023-03-04' AS Date), N'0123456822 ', N'lilysun@example.com', N'path/to/image32.jpg', N'Clinic manager ensuring operational excellence.', 73000, 5, N'password152                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (33, N'Mason Cloud', CAST(N'2023-03-05' AS Date), N'0123456823 ', N'masoncloud@example.com', N'path/to/image33.jpg', N'Manager focused on patient satisfaction.', 74000, 5, N'password153                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (34, N'Nora Rain', CAST(N'2023-03-06' AS Date), N'0123456824 ', N'norarain@example.com', N'path/to/image34.jpg', N'Dental office manager with strong leadership.', 75000, 5, N'password154                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (35, N'Oscar Field', CAST(N'2023-03-07' AS Date), N'0123456825 ', N'oscarfield@example.com', N'path/to/image35.jpg', N'Committed to excellence in dental management.', 76000, 5, N'password155                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (36, N'Piper Brook', CAST(N'2023-03-08' AS Date), N'0123456826 ', N'piperbrook@example.com', N'path/to/image36.jpg', N'Manager with a focus on team development.', 77000, 5, N'password156                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (37, N'Quinn River', CAST(N'2023-03-09' AS Date), N'0123456827 ', N'quinnriver@example.com', N'path/to/image37.jpg', N'Innovative manager improving clinic processes.', 78000, 5, N'password157                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (38, N'Riley Stone', CAST(N'2023-03-10' AS Date), N'0123456828 ', N'rileystone@example.com', N'path/to/image38.jpg', N'Manager dedicated to staff training.', 79000, 5, N'password158                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (39, N'Samantha Shore', CAST(N'2023-03-11' AS Date), N'0123456829 ', N'samanthashore@example.com', N'path/to/image39.jpg', N'Ensuring the best dental care through management.', 80000, 5, N'password159                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (40, N'Tyler Blaze', CAST(N'2023-03-12' AS Date), N'0123456830 ', N'tylerblaze@example.com', N'path/to/image40.jpg', N'Dental clinic manager with innovative ideas.', 81000, 5, N'password160                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (41, N'Alex Young', CAST(N'2023-02-21' AS Date), N'0123456811 ', N'alexyoung@example.com', N'path/to/image21.jpg', N'Assistant with 5 years of experience.', 52000, 4, N'password141                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (42, N'Brittany Hart', CAST(N'2023-02-22' AS Date), N'0123456812 ', N'brittanyhart@example.com', N'path/to/image22.jpg', N'Committed dental assistant.', 53000, 4, N'password142                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (43, N'Carlos King', CAST(N'2023-02-23' AS Date), N'0123456813 ', N'carlosking@example.com', N'path/to/image23.jpg', N'Assistant specializing in pediatric dentistry.', 54000, 4, N'password143                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (44, N'Diana Prince', CAST(N'2023-02-24' AS Date), N'0123456814 ', N'dianaprince@example.com', N'path/to/image24.jpg', N'Experienced orthodontic assistant.', 55000, 4, N'password144                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (45, N'Evan Wright', CAST(N'2023-02-25' AS Date), N'0123456815 ', N'evanwright@example.com', N'path/to/image25.jpg', N'Assistant focused on patient comfort.', 56000, 4, N'password145                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (46, N'Fiona Green', CAST(N'2023-02-26' AS Date), N'0123456816 ', N'fionagreen@example.com', N'path/to/image26.jpg', N'Dental assistant with a gentle touch.', 57000, 4, N'password146                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (47, N'George Stone', CAST(N'2023-02-27' AS Date), N'0123456817 ', N'georgestone@example.com', N'path/to/image27.jpg', N'Assistant skilled in dental technology.', 58000, 4, N'password147                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (48, N'Hannah East', CAST(N'2023-02-28' AS Date), N'0123456818 ', N'hannaheast@example.com', N'path/to/image28.jpg', N'Proactive dental assistant.', 59000, 4, N'password148                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (49, N'Ian Frost', CAST(N'2023-03-01' AS Date), N'0123456819 ', N'ianfrost@example.com', N'path/to/image29.jpg', N'Assistant with expertise in endodontics.', 60000, 4, N'password149                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (50, N'Jenny Lake', CAST(N'2023-03-02' AS Date), N'0123456820 ', N'jennylake@example.com', N'path/to/image30.jpg', N'Orthodontic assistant passionate about smiles.', 61000, 4, N'password150                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (51, N'Kevin Moon', CAST(N'2023-03-03' AS Date), N'0123456821 ', N'kevinmoon@example.com', N'path/to/image31.jpg', N'Manager with a decade of experience.', 72000, 5, N'password151                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (52, N'Lily Sun', CAST(N'2023-03-04' AS Date), N'0123456822 ', N'lilysun@example.com', N'path/to/image32.jpg', N'Clinic manager ensuring operational excellence.', 73000, 5, N'password152                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (53, N'Mason Cloud', CAST(N'2023-03-05' AS Date), N'0123456823 ', N'masoncloud@example.com', N'path/to/image33.jpg', N'Manager focused on patient satisfaction.', 74000, 5, N'password153                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (54, N'Nora Rain', CAST(N'2023-03-06' AS Date), N'0123456824 ', N'norarain@example.com', N'path/to/image34.jpg', N'Dental office manager with strong leadership.', 75000, 5, N'password154                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (55, N'Oscar Field', CAST(N'2023-03-07' AS Date), N'0123456825 ', N'oscarfield@example.com', N'path/to/image35.jpg', N'Committed to excellence in dental management.', 76000, 5, N'password155                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (56, N'Piper Brook', CAST(N'2023-03-08' AS Date), N'0123456826 ', N'piperbrook@example.com', N'path/to/image36.jpg', N'Manager with a focus on team development.', 77000, 5, N'password156                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (57, N'Quinn River', CAST(N'2023-03-09' AS Date), N'0123456827 ', N'quinnriver@example.com', N'path/to/image37.jpg', N'Innovative manager improving clinic processes.', 78000, 5, N'password157                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (58, N'Riley Stone', CAST(N'2023-03-10' AS Date), N'0123456828 ', N'rileystone@example.com', N'path/to/image38.jpg', N'Manager dedicated to staff training.', 79000, 5, N'password158                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (59, N'Samantha Shore', CAST(N'2023-03-11' AS Date), N'0123456829 ', N'samanthashore@example.com', N'path/to/image39.jpg', N'Ensuring the best dental care through management.', 80000, 5, N'password159                                       ')
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password]) VALUES (60, N'Tyler Blaze', CAST(N'2023-03-12' AS Date), N'0123456830 ', N'tylerblaze@example.com', N'path/to/image40.jpg', N'Dental clinic manager with innovative ideas.', 81000, 5, N'password160                                       ')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_User] FOREIGN KEY([employee_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_User]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_User1] FOREIGN KEY([patient_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_User1]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Appointment] FOREIGN KEY([appointmentId])
REFERENCES [dbo].[Appointment] ([appointment_id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Appointment]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Prescription] FOREIGN KEY([prescriptionId])
REFERENCES [dbo].[Prescription] ([id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Prescription]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_User] FOREIGN KEY([patientId])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_User]
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecord_Appointment] FOREIGN KEY([appointmentId])
REFERENCES [dbo].[Appointment] ([appointment_id])
GO
ALTER TABLE [dbo].[MedicalRecord] CHECK CONSTRAINT [FK_MedicalRecord_Appointment]
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecord_Prescription] FOREIGN KEY([prescriptionId])
REFERENCES [dbo].[Prescription] ([id])
GO
ALTER TABLE [dbo].[MedicalRecord] CHECK CONSTRAINT [FK_MedicalRecord_Prescription]
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecord_Service] FOREIGN KEY([serviceId])
REFERENCES [dbo].[Service] ([service_id])
GO
ALTER TABLE [dbo].[MedicalRecord] CHECK CONSTRAINT [FK_MedicalRecord_Service]
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecord_User] FOREIGN KEY([patientId])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[MedicalRecord] CHECK CONSTRAINT [FK_MedicalRecord_User]
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Medicine] FOREIGN KEY([medicineId])
REFERENCES [dbo].[Medicine] ([id])
GO
ALTER TABLE [dbo].[Prescription] CHECK CONSTRAINT [FK_Prescription_Medicine]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([role])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [dental] SET  READ_WRITE 
GO
