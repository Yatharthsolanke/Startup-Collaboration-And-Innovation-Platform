USE [master]
GO
/****** Object:  Database [startup]    Script Date: 26-02-2025 3:27:24 PM ******/
CREATE DATABASE [startup]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'startup', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.LOCALHOST\MSSQL\DATA\startup.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'startup_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.LOCALHOST\MSSQL\DATA\startup_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [startup] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [startup].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [startup] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [startup] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [startup] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [startup] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [startup] SET ARITHABORT OFF 
GO
ALTER DATABASE [startup] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [startup] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [startup] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [startup] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [startup] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [startup] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [startup] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [startup] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [startup] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [startup] SET  DISABLE_BROKER 
GO
ALTER DATABASE [startup] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [startup] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [startup] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [startup] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [startup] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [startup] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [startup] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [startup] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [startup] SET  MULTI_USER 
GO
ALTER DATABASE [startup] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [startup] SET DB_CHAINING OFF 
GO
ALTER DATABASE [startup] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [startup] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [startup] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [startup] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [startup] SET QUERY_STORE = ON
GO
ALTER DATABASE [startup] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [startup]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 26-02-2025 3:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Investor_intrest]    Script Date: 26-02-2025 3:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Investor_intrest](
	[intrest_id] [int] IDENTITY(1,1) NOT NULL,
	[in_id] [int] NULL,
	[st_id] [int] NULL,
	[pi_id] [int] NULL,
	[Query] [nvarchar](max) NULL,
 CONSTRAINT [PK_Investor_intrest] PRIMARY KEY CLUSTERED 
(
	[intrest_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvestorRegistration]    Script Date: 26-02-2025 3:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvestorRegistration](
	[in_id] [int] IDENTITY(1,1) NOT NULL,
	[logo] [nvarchar](max) NULL,
	[FirmName] [varchar](255) NULL,
	[InvestorName] [varchar](255) NULL,
	[RegistrationNumber] [varchar](100) NULL,
	[GSTNumber] [varchar](15) NULL,
	[MobileNumber] [varchar](15) NULL,
	[Category] [varchar](50) NULL,
	[Email] [varchar](255) NULL,
	[IWebsite] [varchar](255) NULL,
	[Contact] [varchar](100) NULL,
	[Password] [varchar](255) NULL,
 CONSTRAINT [PK_InvestorRegistration] PRIMARY KEY CLUSTERED 
(
	[in_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project_Requirement]    Script Date: 26-02-2025 3:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project_Requirement](
	[req_id] [int] IDENTITY(1,1) NOT NULL,
	[pi_id] [int] NULL,
	[st_id] [int] NULL,
	[req_skill] [nvarchar](max) NULL,
	[requirements] [nvarchar](max) NULL,
	[salary_range] [nvarchar](max) NULL,
	[location] [nvarchar](max) NULL,
	[date_posted] [nvarchar](max) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Project_Requirement] PRIMARY KEY CLUSTERED 
(
	[req_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 26-02-2025 3:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[u_id] [int] IDENTITY(1,1) NOT NULL,
	[fname] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[password] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Star_UpRegistration]    Script Date: 26-02-2025 3:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Star_UpRegistration](
	[st_id] [int] IDENTITY(1,1) NOT NULL,
	[logo] [nvarchar](max) NULL,
	[FirmName] [nvarchar](max) NULL,
	[InvestorName] [nvarchar](max) NULL,
	[RegistrationNumber] [nvarchar](max) NULL,
	[GSTNumber] [nvarchar](50) NULL,
	[MobileNumber] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[Email] [nvarchar](max) NULL,
	[IWebsite] [nvarchar](max) NULL,
	[Contact] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
 CONSTRAINT [PK_Star_UpRegistration] PRIMARY KEY CLUSTERED 
(
	[st_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_intrest]    Script Date: 26-02-2025 3:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_intrest](
	[application_id] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[pi_id] [int] NULL,
	[st_id] [int] NULL,
	[req_id] [int] NULL,
	[date_applied] [nvarchar](50) NULL,
	[resume_file] [nvarchar](max) NULL,
 CONSTRAINT [PK_student_intrest] PRIMARY KEY CLUSTERED 
(
	[application_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students_Registration]    Script Date: 26-02-2025 3:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students_Registration](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [varchar](100) NULL,
	[CollegeName] [varchar](100) NULL,
	[Degree] [varchar](100) NULL,
	[Experience] [varchar](100) NULL,
	[Languages] [varchar](100) NULL,
	[MobileNumber] [varchar](15) NULL,
	[EmailAddress] [varchar](100) NULL,
	[Password] [varchar](255) NULL,
	[Resume] [varchar](255) NULL,
	[PortfolioLink] [varchar](255) NULL,
	[logo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Upload_Project_Idea]    Script Date: 26-02-2025 3:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Upload_Project_Idea](
	[pi_id] [int] IDENTITY(1,1) NOT NULL,
	[Projectname] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[P_Category] [nvarchar](max) NULL,
	[Technology] [nvarchar](max) NOT NULL,
	[Budget] [int] NOT NULL,
	[videolink] [nvarchar](max) NOT NULL,
	[ProjectImage] [nvarchar](max) NULL,
	[Website] [nvarchar](max) NOT NULL,
	[Pub_date] [date] NULL,
	[st_id] [int] NULL,
 CONSTRAINT [PK_Upload_Project_Idea] PRIMARY KEY CLUSTERED 
(
	[pi_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Money market funds')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Retirement plans')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Insurance policies ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Corporate investors')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'Institutional investors')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'Angel investors')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (7, N'Mutual funds')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (8, N'Equity')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (9, N'Cash or cash equivalents')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Investor_intrest] ON 

INSERT [dbo].[Investor_intrest] ([intrest_id], [in_id], [st_id], [pi_id], [Query]) VALUES (1, 1, 1, 11, N'I Am Interested. ')
SET IDENTITY_INSERT [dbo].[Investor_intrest] OFF
GO
SET IDENTITY_INSERT [dbo].[InvestorRegistration] ON 

INSERT [dbo].[InvestorRegistration] ([in_id], [logo], [FirmName], [InvestorName], [RegistrationNumber], [GSTNumber], [MobileNumber], [Category], [Email], [IWebsite], [Contact], [Password]) VALUES (1, N'team-01.png', N'Indra The Tiger', N'Satyam ', N'RT34543', N'ER456Y676Y', N'8523698569', N'Money market funds', N'indra@gmail.com', N'-', N'8574589658', N'8520')
SET IDENTITY_INSERT [dbo].[InvestorRegistration] OFF
GO
SET IDENTITY_INSERT [dbo].[Project_Requirement] ON 

INSERT [dbo].[Project_Requirement] ([req_id], [pi_id], [st_id], [req_skill], [requirements], [salary_range], [location], [date_posted], [status]) VALUES (6, 11, 1, N'JavaScript, Node.js, WebSockets', N'2+ years experience in web development, knowledge of real-time communication', N'$60,000 - $90,000', N'Remote, USA', N'20-01-2025', N'deactivate')
INSERT [dbo].[Project_Requirement] ([req_id], [pi_id], [st_id], [req_skill], [requirements], [salary_range], [location], [date_posted], [status]) VALUES (7, 12, 1, N'Python, TensorFlow, Kubernetes', N'Strong background in AI/ML, experience with cloud platforms like AWS', N'$100,000 - $150,000', N'San Francisco, CA', N'21-01-2025', N'Active')
INSERT [dbo].[Project_Requirement] ([req_id], [pi_id], [st_id], [req_skill], [requirements], [salary_range], [location], [date_posted], [status]) VALUES (8, 13, 1, N'JavaScript, React, Node.js', N'Experience in building educational platforms, good communication skills', N'$45,000 - $70,000', N'Remote, Global', N'22-01-2025', N'Active')
INSERT [dbo].[Project_Requirement] ([req_id], [pi_id], [st_id], [req_skill], [requirements], [salary_range], [location], [date_posted], [status]) VALUES (9, 14, 2, N'Python, AI, Machine Learning', N'Proficient in AI technologies, experience with freelance platforms', N'$75,000 - $110,000', N'New York, NY', N'23-01-2025', N'Active')
INSERT [dbo].[Project_Requirement] ([req_id], [pi_id], [st_id], [req_skill], [requirements], [salary_range], [location], [date_posted], [status]) VALUES (10, 15, 2, N'AWS, Azure, Docker, Kubernetes', N'Expertise in cloud infrastructure, experience with DevOps practices', N'$120,000 - $160,000', N'Austin, TX', N'24-01-2025', N'Active')
SET IDENTITY_INSERT [dbo].[Project_Requirement] OFF
GO
SET IDENTITY_INSERT [dbo].[Registration] ON 

INSERT [dbo].[Registration] ([u_id], [fname], [email], [password]) VALUES (1, N'Rudra Koli', N'r@gmail.com', N'1122')
SET IDENTITY_INSERT [dbo].[Registration] OFF
GO
SET IDENTITY_INSERT [dbo].[Star_UpRegistration] ON 

INSERT [dbo].[Star_UpRegistration] ([st_id], [logo], [FirmName], [InvestorName], [RegistrationNumber], [GSTNumber], [MobileNumber], [Category], [Email], [IWebsite], [Contact], [Password]) VALUES (1, N'Capture.JPG', N'Liksh it ', N'Software', N'74GRT4876', N'GT789547845812', N'8523698569', N'Coding', N'r@gmail.com', N'http://localhost:51751/Sign_in.aspx', N'7458962358', N'1122')
INSERT [dbo].[Star_UpRegistration] ([st_id], [logo], [FirmName], [InvestorName], [RegistrationNumber], [GSTNumber], [MobileNumber], [Category], [Email], [IWebsite], [Contact], [Password]) VALUES (2, N'Capture.JPG', N'JAVA HUB', N'Jay Sha', N'741REWF78', N'GSTR44574552', N'7458965874', N'Coding', N'ur@gmail.com', N'https://web.whatsapp.com/', N'2589635848', N'5544')
SET IDENTITY_INSERT [dbo].[Star_UpRegistration] OFF
GO
SET IDENTITY_INSERT [dbo].[student_intrest] ON 

INSERT [dbo].[student_intrest] ([application_id], [StudentID], [pi_id], [st_id], [req_id], [date_applied], [resume_file]) VALUES (1, 2, 12, 2, 7, N'Feb 24 2025  2:28PM', N'Examiner Appointment System _Synopsis.docx')
SET IDENTITY_INSERT [dbo].[student_intrest] OFF
GO
SET IDENTITY_INSERT [dbo].[Students_Registration] ON 

INSERT [dbo].[Students_Registration] ([StudentID], [StudentName], [CollegeName], [Degree], [Experience], [Languages], [MobileNumber], [EmailAddress], [Password], [Resume], [PortfolioLink], [logo]) VALUES (1, N'Sham Kale', N'Ram mege', N'BSC', N'5 Java', N'Java,R Lag,C#, Asp.net', N'7458965825', N'pq@gmail.com', N'7410', NULL, NULL, N'WIN_20241121_16_23_57_Pro_638759264235921160.jpg')
INSERT [dbo].[Students_Registration] ([StudentID], [StudentName], [CollegeName], [Degree], [Experience], [Languages], [MobileNumber], [EmailAddress], [Password], [Resume], [PortfolioLink], [logo]) VALUES (2, N'Raja Ram Zade', N'Pote Collage Amravti', N'BE', N'4', N'Java, C, C#', N'7458962358', N're@gmail.com', N'1122', NULL, NULL, N'WIN_20241121_16_23_57_Pro_638759296475198734.jpg')
SET IDENTITY_INSERT [dbo].[Students_Registration] OFF
GO
SET IDENTITY_INSERT [dbo].[Upload_Project_Idea] ON 

INSERT [dbo].[Upload_Project_Idea] ([pi_id], [Projectname], [Description], [P_Category], [Technology], [Budget], [videolink], [ProjectImage], [Website], [Pub_date], [st_id]) VALUES (11, N'CodeStream', N'A collaborative platform for developers to code in real-time', N'Web Development', N'JavaScript, Node.js, WebSockets', 50000, N'https://link-to-video.com', N'blog-02.png', N'https://codestream.com', CAST(N'2025-01-28' AS Date), 2)
INSERT [dbo].[Upload_Project_Idea] ([pi_id], [Projectname], [Description], [P_Category], [Technology], [Budget], [videolink], [ProjectImage], [Website], [Pub_date], [st_id]) VALUES (12, N'AutoBot', N'An AI-powered automation tool for business workflows', N'AI & Automation', N'Python, TensorFlow, Kubernetes', 120000, N'https://autobot-video.com', N'blog-02.png', N'https://autobot.com', CAST(N'2025-01-28' AS Date), 2)
INSERT [dbo].[Upload_Project_Idea] ([pi_id], [Projectname], [Description], [P_Category], [Technology], [Budget], [videolink], [ProjectImage], [Website], [Pub_date], [st_id]) VALUES (13, N'LearnCode', N'A platform that teaches coding to kids through games', N'EdTech', N'JavaScript, React, Node.js', 35000, N'https://learncode-video.com', N'blog-02.png', N'https://learncode.com', CAST(N'2025-01-28' AS Date), 1)
INSERT [dbo].[Upload_Project_Idea] ([pi_id], [Projectname], [Description], [P_Category], [Technology], [Budget], [videolink], [ProjectImage], [Website], [Pub_date], [st_id]) VALUES (14, N'DevMatch', N'A freelance developer matching platform using AI', N'Web Development', N'AI, Python, Machine Learning', 80000, N'https://devmatch-video.com', N'blog-02.png', N'https://devmatch.com', CAST(N'2025-01-28' AS Date), 2)
INSERT [dbo].[Upload_Project_Idea] ([pi_id], [Projectname], [Description], [P_Category], [Technology], [Budget], [videolink], [ProjectImage], [Website], [Pub_date], [st_id]) VALUES (15, N'CloudHealth', N'A dashboard tool for monitoring cloud infrastructure health', N'Cloud & DevOps', N'AWS, Azure, Docker, Kubernetes', 150000, N'https://cloudhealth-video.com', N'blog-02.png', N'https://cloudhealth.com', CAST(N'2025-01-28' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Upload_Project_Idea] OFF
GO
USE [master]
GO
ALTER DATABASE [startup] SET  READ_WRITE 
GO
