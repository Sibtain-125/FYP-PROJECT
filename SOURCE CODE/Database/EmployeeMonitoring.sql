USE [master]
GO
/****** Object:  Database [EmployeeMonitoring]    Script Date: 12/8/2021 8:28:34 PM ******/
CREATE DATABASE [EmployeeMonitoring]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeMonitoring', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EmployeeMonitoring.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EmployeeMonitoring_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EmployeeMonitoring_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EmployeeMonitoring] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeMonitoring].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeMonitoring] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeMonitoring] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeMonitoring] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeMonitoring] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeMonitoring] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeMonitoring] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EmployeeMonitoring] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeMonitoring] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeMonitoring] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeMonitoring] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeMonitoring] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeMonitoring] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeMonitoring] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeMonitoring] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeMonitoring] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EmployeeMonitoring] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeMonitoring] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeMonitoring] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeMonitoring] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeMonitoring] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeMonitoring] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmployeeMonitoring] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeMonitoring] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmployeeMonitoring] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeMonitoring] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeMonitoring] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeMonitoring] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeMonitoring] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EmployeeMonitoring] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EmployeeMonitoring] SET QUERY_STORE = OFF
GO
USE [EmployeeMonitoring]
GO
/****** Object:  Table [dbo].[employeepayroll]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employeepayroll](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Employee_work_hours] [nvarchar](50) NULL,
	[No_of_salary] [nvarchar](50) NULL,
	[Salary_type] [nvarchar](50) NULL,
	[Salary_amount] [nvarchar](50) NULL,
	[Total_days] [nvarchar](50) NULL,
	[working_days] [nvarchar](50) NULL,
	[Total_hours] [nvarchar](50) NULL,
	[Working_hours] [nvarchar](50) NULL,
	[Total_absent] [nvarchar](50) NULL,
	[Total_leaves] [nvarchar](50) NULL,
	[Net_salary] [nvarchar](50) NULL,
 CONSTRAINT [PK_employeepayroll] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interview]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interview](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Apply_Job] [nvarchar](50) NULL,
	[UserEmail] [nvarchar](50) NULL,
	[Obtain_Score] [nvarchar](50) NULL,
	[Total_Score] [nvarchar](50) NULL,
	[Select_For_Job] [nvarchar](50) NULL,
 CONSTRAINT [PK_Interview] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leaveapplication]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leaveapplication](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserEmail] [nvarchar](50) NULL,
	[Type_of_Leave] [nvarchar](50) NULL,
	[Leave_Required_From] [date] NULL,
	[Till_Date] [date] NULL,
	[No_of_Days] [varchar](50) NULL,
	[Purpose_of_Leave] [nvarchar](50) NULL,
	[I_will_Report_Back_on] [date] NULL,
	[Form_Submission_Date] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Leave_Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Leaveapplication] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Newjobs]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Newjobs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserEmail] [nvarchar](50) NULL,
	[Available_Job] [nvarchar](50) NULL,
	[Cover_Title] [nvarchar](50) NULL,
	[Expected_Salary] [nvarchar](50) NULL,
 CONSTRAINT [PK_Newjobs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Cost] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[Discription] [nvarchar](50) NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recruitment]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recruitment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Job_Title] [nvarchar](50) NULL,
	[Business_Name] [varchar](50) NULL,
	[Job_Description] [nvarchar](50) NULL,
	[Job_Criteria] [nvarchar](50) NULL,
	[Salary_Type] [nvarchar](50) NULL,
	[Minimum_Salary] [nvarchar](50) NULL,
	[Maximum_Salary] [nvarchar](50) NULL,
	[Work_Location] [nvarchar](50) NULL,
	[Job_Type] [nvarchar](50) NULL,
	[No_of_Vacancies] [nvarchar](50) NULL,
 CONSTRAINT [PK_Recruitment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysUsers]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Uname] [nvarchar](50) NULL,
	[Mail] [nvarchar](50) NULL,
	[Pass] [nvarchar](50) NULL,
	[CPass] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[Contact] [nvarchar](50) NULL,
	[Bank] [nvarchar](50) NOT NULL,
	[CNIC] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_SysUsers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Project] [nvarchar](50) NULL,
	[Member] [nvarchar](50) NULL,
	[Date] [nvarchar](50) NULL,
	[Discription] [nvarchar](500) NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Leader] [nvarchar](50) NULL,
	[Project] [nvarchar](50) NULL,
	[M1] [nvarchar](50) NULL,
	[M2] [nvarchar](50) NULL,
	[M3] [nvarchar](50) NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[CPassword] [nvarchar](50) NULL,
	[Contact] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[CNIC] [nvarchar](50) NULL,
	[Bank] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[employeepayrollCreateOrUpdate]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[employeepayrollCreateOrUpdate]
@id int,
@Employee_work_hours nvarchar(50),
@Salary_type nvarchar(50),
@Salary_amount nvarchar(50),
@Total_days nvarchar(50),
@working_days nvarchar(50),
@Total_hours nvarchar(50),
@Working_hours nvarchar(50),
@Total_absent nvarchar(50),
@Total_leaves nvarchar(50),
@Net_salary nvarchar(50)

AS
BEGIN
if(@id=0)
BEGIN
INSERT INTO employeepayroll(Employee_work_hours,Salary_type,Salary_amount,Total_days,working_days,Total_hours,Working_hours,Total_absent,Total_leaves,Net_salary)VALUES
(@Employee_work_hours,@Salary_type,@Salary_amount,@Total_days,@working_days,@Total_hours,@Working_hours,@Total_absent,@Total_leaves,@Net_salary)
END
ELSE
BEGIN
UPDATE employeepayroll
SET
Employee_work_hours=@Employee_work_hours,
Salary_type=@Salary_type,
Salary_amount=@Salary_amount,
Total_days=@Total_days,
working_days=@working_days,
Total_hours=@Total_hours,
Working_hours=@Working_hours,
Total_absent=@Total_absent,
Total_leaves=@Total_leaves,
Net_salary=@Net_salary
WHERE id=@id
END
END
GO
/****** Object:  StoredProcedure [dbo].[employeepayrollDeletebyID]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[employeepayrollDeletebyID]
@id int
 AS
BEGIN
DELETE FROM employeepayroll
WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[employeepayrollViewAll]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[employeepayrollViewAll]
 AS
BEGIN
SELECT * FROM employeepayroll
END
GO
/****** Object:  StoredProcedure [dbo].[employeepayrollViewbyID]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[employeepayrollViewbyID]
@id int
 AS
BEGIN
SELECT * FROM employeepayroll
WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[InterviewCreateOrUpdate]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[InterviewCreateOrUpdate]
@id int,
@Apply_Job nvarchar(50),
@UserEmail nvarchar(50),
@Obtain_Score nvarchar(50),
@Total_Score nvarchar(50),
@Select_For_Job nvarchar(50)
AS
BEGIN
if(@id=0)
BEGIN
INSERT INTO Interview(Apply_Job,UserEmail,Obtain_Score,Total_Score,Select_For_Job)VALUES
(@Apply_Job,@UserEmail,@Obtain_Score,@Total_Score,@Select_For_Job)
END
ELSE
BEGIN
UPDATE Interview
SET
Apply_Job=@Apply_Job,
UserEmail=@UserEmail,
Obtain_Score=@Obtain_Score,
Total_Score=@Total_Score,
Select_For_Job=@Select_For_Job
WHERE id=@id
END
END
GO
/****** Object:  StoredProcedure [dbo].[InterviewDeletebyID]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[InterviewDeletebyID]
@id int
 AS
BEGIN
DELETE FROM Interview
WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[InterviewViewAll]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[InterviewViewAll]
 AS
BEGIN
SELECT * FROM Interview
END
GO
/****** Object:  StoredProcedure [dbo].[InterviewViewbyID]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[InterviewViewbyID]
@id int
 AS
BEGIN
SELECT * FROM Interview
WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[ProfileCreateOrUpdate]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[ProfileCreateOrUpdate]
@ID int,
@Name nvarchar(50),
@Uname nvarchar(50),
@Mail nvarchar(50),
@Pass  nvarchar(50),
@Cpass nvarchar(50),
@Add nvarchar(50),
@Con nvarchar(50),
@Bank nvarchar(50),
@CNIC  nvarchar(50),
@Type nvarchar(50),
@Status nvarchar(50)
AS
BEGIN
if(@ID=0)
BEGIN
INSERT INTO Users(Name,UserName,Email,Password,CPassword,Contact,Address,CNIC,Bank,Type,Status)VALUES
(@Name,@Uname,@Mail,@Pass,@Cpass,@Con,@Add,@CNIC,@Bank,@Type,@Status )
END
ELSE
BEGIN
UPDATE users
SET
Name=@Name,
UserName=@Uname,
Email=@Mail,
Password=@Pass,
Cpassword=@Cpass,
Contact=@con,
Address=@Add,
CNIC=@CNIC,
Bank=@Bank,
Type=@Type,
Status=@Status
 
WHERE  ID=@ID
END
END
GO
/****** Object:  StoredProcedure [dbo].[ProfileDeletebyID]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[ProfileDeletebyID]
@ID int
 AS
BEGIN
DELETE FROM Users
WHERE  ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[ProfileViewAll]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[ProfileViewAll]
 AS
BEGIN
SELECT * FROM Users
END
GO
/****** Object:  StoredProcedure [dbo].[ProfileViewbyID]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ProfileViewbyID]
@ID int
 AS
BEGIN
SELECT * FROM Users
WHERE  ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[ProjectCreateOrUpdate]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ProjectCreateOrUpdate]
@ID int,
@pname nvarchar(50),
@cost nvarchar(50),
@date date,
@Disc nvarchar(500)
AS
BEGIN
if(@ID=0)
BEGIN
INSERT INTO Project(Name,Cost,Date,Discription)VALUES
(@pname,@cost,@date,@Disc)
END
ELSE
BEGIN
UPDATE Project
SET
Name=@pname,
Cost=@cost,
Date=@date,
Discription=@Disc
WHERE ID=@ID
END
END 
GO
/****** Object:  StoredProcedure [dbo].[ProjectDeletebyID]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[ProjectDeletebyID]
@ID int
 AS
BEGIN
DELETE FROM Project
WHERE ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[ProjectViewAll]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[ProjectViewAll]
 AS
BEGIN
SELECT * FROM Project
END
GO
/****** Object:  StoredProcedure [dbo].[ProjectViewbyID]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[ProjectViewbyID]
@ID int
 AS
BEGIN
SELECT * FROM Project
WHERE ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[RecruitmentCreateOrUpdate]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[RecruitmentCreateOrUpdate]
@ID int,
@jobtitle nvarchar(50),
@BusinessName nvarchar(50),
@JobDescription nvarchar(50),
@JobCriteria nvarchar(50),
@SalaryType nvarchar(50),
@MinimumSalary nvarchar(50),
@MaximumSalary nvarchar(50),
@WorkLocation nvarchar(50),
@JobType nvarchar(50),
@NoofVacancies nvarchar(50)
AS
BEGIN
if(@ID=0)
BEGIN
INSERT INTO Recruitment(Job_Title,Business_Name,Job_Description,Job_Criteria,Salary_Type,Minimum_Salary,Maximum_Salary,Work_Location,Job_Type,No_of_Vacancies)VALUES
(@jobtitle,@BusinessName,@JobDescription,@JobCriteria,@SalaryType,@MinimumSalary,@MaximumSalary,@WorkLocation,@JobType,@NoofVacancies)
END
ELSE
BEGIN
UPDATE Recruitment
SET
Job_Title=@jobtitle,
Business_Name=@BusinessName,
Job_Description=@JobDescription,
Job_Criteria=@JobCriteria,
Salary_Type=@SalaryType,
Minimum_Salary=@MinimumSalary,
Maximum_Salary=@MaximumSalary,
Work_Location=@WorkLocation,
Job_Type=@JobType,
No_of_Vacancies=@NoofVacancies
WHERE ID=@ID
END
END
GO
/****** Object:  StoredProcedure [dbo].[RecruitmentDeletebyID]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[RecruitmentDeletebyID]
@ID int
 AS
BEGIN
DELETE FROM Recruitment
WHERE ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[RecruitmentViewAll]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[RecruitmentViewAll]
 AS
BEGIN
SELECT * FROM Recruitment
END
GO
/****** Object:  StoredProcedure [dbo].[RecruitmentViewbyID]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[RecruitmentViewbyID]
@ID int
 AS
BEGIN
SELECT * FROM Recruitment
WHERE ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[TaskCreateOrUpdate]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROC [dbo].[TaskCreateOrUpdate]
@ID int,
@Name nvarchar(50),
@Project nvarchar(50),
@Member nvarchar(50),
@Date nvarchar(50),
@Disc nvarchar(50) 
AS
BEGIN
if(@ID=0)
BEGIN
INSERT INTO Task(Name,Project,Member,Date,Discription )VALUES
(@Name,@Project,@Member,@Date,@Disc)
END
ELSE
BEGIN
UPDATE Task
SET
Name=@Name,
Project=@Project,
Member=@Member,
Date=@Date,
Discription=@Disc 
WHERE  ID=@ID
END
END
GO
/****** Object:  StoredProcedure [dbo].[TaskDeletebyID]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TaskDeletebyID]
@ID int
 AS
BEGIN
DELETE FROM Task
WHERE  ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[TaskViewAll]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TaskViewAll]
 AS
BEGIN
SELECT * FROM Task
END
GO
/****** Object:  StoredProcedure [dbo].[TaskViewbyID]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TaskViewbyID]
@ID int
 AS
BEGIN
SELECT * FROM Task
WHERE  ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[TeamCreateOrUpdate]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[TeamCreateOrUpdate]
@ID int,
@Name nvarchar(50),
@Leader nvarchar(50),
@Project nvarchar(50),
@M1 nvarchar(50),
@M2 nvarchar(50),
@M3 nvarchar(50) 
AS
BEGIN
if(@ID=0)
BEGIN
INSERT INTO Team(Name,Leader,Project,M1,M2,M3)VALUES
(@Name,@Leader,@Project,@M1,@M2,@M3)
END
ELSE
BEGIN
UPDATE Team
SET
Name=@Name,
Leader=@Leader,
Project=@Project,
M1=@M1,
M2=@M2,
M3=@M3 
WHERE TID=@ID
END
END
GO
/****** Object:  StoredProcedure [dbo].[TeamDeletebyID]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[TeamDeletebyID]
@ID int
 AS
BEGIN
DELETE FROM Team
WHERE TID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[TeamViewAll]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[TeamViewAll]
 AS
BEGIN
SELECT * FROM Team
END
GO
/****** Object:  StoredProcedure [dbo].[TeamViewbyID]    Script Date: 12/8/2021 8:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[TeamViewbyID]
@ID int
 AS
BEGIN
SELECT * FROM Team
WHERE TID=@ID
END
GO
USE [master]
GO
ALTER DATABASE [EmployeeMonitoring] SET  READ_WRITE 
GO
