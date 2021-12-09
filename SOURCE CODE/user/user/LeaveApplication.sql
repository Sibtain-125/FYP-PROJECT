USE [DBME]
GO

/****** Object:  Table [dbo].[Leaveapplication]    Script Date: 01/12/2021 6:01:01 pm ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Leaveapplication](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Type_of_Leave] [nvarchar](50) NULL,
	[Leave_Required_From] [date] NULL,
	[Till_Date] [date] NULL,
	[No_of_Days] [varchar](50) NULL,
	[Purpose_of_Leave] [nvarchar](50) NULL,
	[I_will_Report_Back_on] [date] NULL,
	[Form_Submission_Date] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Leaveapplication] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

