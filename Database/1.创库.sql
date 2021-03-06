USE [master]
GO
/****** Object:  Database [TestSystemDB]    Script Date: 2018/9/11 22:18:22 ******/
CREATE DATABASE [TestSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestSystemDB', FILENAME = N'D:\TestSystemDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TestSystemDB_log', FILENAME = N'D:\TestSystemDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TestSystemDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestSystemDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TestSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [TestSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TestSystemDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestSystemDB', N'ON'
GO
ALTER DATABASE [TestSystemDB] SET QUERY_STORE = OFF
GO
USE [TestSystemDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [TestSystemDB]
GO
/****** Object:  Table [dbo].[TBL_RuleInfo]    Script Date: 2018/9/11 22:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_RuleInfo](
	[ID] [uniqueidentifier] NOT NULL,
	[RuleName] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_TBL_RuleInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_PostInfo]    Script Date: 2018/9/11 22:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_PostInfo](
	[ID] [uniqueidentifier] NOT NULL,
	[PostName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TBL_PostInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_AdminInfo]    Script Date: 2018/9/11 22:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_AdminInfo](
	[ID] [uniqueidentifier] NOT NULL,
	[LoginID] [nvarchar](10) NOT NULL,
	[LoginPass] [varbinary](50) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Sex] [bit] NULL,
	[Age] [int] NULL,
	[ChangeTime] [datetime] NOT NULL,
	[RuleID] [uniqueidentifier] NOT NULL,
	[PostID] [uniqueidentifier] NOT NULL,
	[ImgUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_TBL_AdminInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[v_get_admin]    Script Date: 2018/9/11 22:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_get_admin]
AS
SELECT   a.ID, a.LoginID, a.LoginPass, a.Name, a.Sex, a.Age, a.ChangeTime, a.RuleID, a.PostID, a.ImgUrl, 
                r.RuleName AS RuleName, p.PostName
FROM      dbo.TBL_AdminInfo AS a LEFT OUTER JOIN
                dbo.TBL_RuleInfo AS r ON a.RuleID = r.ID LEFT OUTER JOIN
                dbo.TBL_PostInfo AS p ON a.PostID = p.ID






GO
/****** Object:  Table [dbo].[TBL_ClassInfo]    Script Date: 2018/9/11 22:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_ClassInfo](
	[ID] [uniqueidentifier] NOT NULL,
	[ClassName] [nvarchar](50) NOT NULL,
	[ClassMaster] [uniqueidentifier] NOT NULL,
	[CourseID] [uniqueidentifier] NOT NULL,
	[ClassImg] [nvarchar](max) NULL,
 CONSTRAINT [PK_TBL_ClassInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_TeacherInfo]    Script Date: 2018/9/11 22:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_TeacherInfo](
	[ID] [uniqueidentifier] NOT NULL,
	[LoginID] [nvarchar](10) NOT NULL,
	[LoginPass] [varbinary](50) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Sex] [bit] NULL,
	[Age] [int] NULL,
	[ChangeTime] [datetime] NOT NULL,
	[RuleID] [uniqueidentifier] NOT NULL,
	[PostID] [uniqueidentifier] NOT NULL,
	[CourseID] [uniqueidentifier] NULL,
	[ImgUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_TBL_TeacherInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_StudentInfo]    Script Date: 2018/9/11 22:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_StudentInfo](
	[ID] [uniqueidentifier] NOT NULL,
	[LoginID] [nvarchar](10) NOT NULL,
	[LoginPass] [varbinary](50) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Sex] [bit] NULL,
	[Age] [int] NULL,
	[ChangeTime] [datetime] NOT NULL,
	[RuleID] [uniqueidentifier] NOT NULL,
	[PostID] [uniqueidentifier] NOT NULL,
	[ClassID] [uniqueidentifier] NOT NULL,
	[ImgUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_TBL_StudentInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[v_get_student]    Script Date: 2018/9/11 22:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_get_student]
AS
SELECT   s.ID AS SId, s.LoginID, s.Name, s.Sex, s.Age, s.ChangeTime, s.ImgUrl, r.RuleName, c.ClassName, 
                t.Name AS TeacherName, s.ClassID
FROM      dbo.TBL_StudentInfo AS s LEFT OUTER JOIN
                dbo.TBL_RuleInfo AS r ON s.RuleID = r.ID LEFT OUTER JOIN
                dbo.TBL_ClassInfo AS c ON s.ClassID = c.ID LEFT OUTER JOIN
                dbo.TBL_TeacherInfo AS t ON c.ClassMaster = t.ID




GO
/****** Object:  Table [dbo].[TBL_CourseInfo]    Script Date: 2018/9/11 22:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_CourseInfo](
	[ID] [uniqueidentifier] NOT NULL,
	[CourseName] [nvarchar](50) NOT NULL,
	[CourseMess] [nvarchar](max) NULL,
	[Book] [nvarchar](50) NULL,
	[Compulsory] [bit] NOT NULL,
	[BookImg] [nvarchar](max) NULL,
 CONSTRAINT [PK_TBL_CourseInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[v_get_teacher]    Script Date: 2018/9/11 22:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_get_teacher]
AS
SELECT   t.ID AS TId, t.LoginID, t.Name, t.Sex, t.Age, t.ChangeTime, t.CourseID, t.ImgUrl, r.RuleName, p.PostName, cl.ClassName, 
                c.CourseName
FROM      dbo.TBL_TeacherInfo AS t LEFT OUTER JOIN
                dbo.TBL_RuleInfo AS r ON t.RuleID = r.ID LEFT OUTER JOIN
                dbo.TBL_PostInfo AS p ON t.PostID = p.ID LEFT OUTER JOIN
                dbo.TBL_CourseInfo AS c ON t.CourseID = c.ID LEFT OUTER JOIN
                dbo.TBL_ClassInfo AS cl ON t.ID = cl.ClassMaster





GO
/****** Object:  View [dbo].[view_class_student_count]    Script Date: 2018/9/11 22:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[view_class_student_count] as
select class.ClassName , COUNT(student.Name) 'Number' from TBL_ClassInfo class 
left join TBL_StudentInfo student on class.ID = student.ClassID
group by class.ClassName






GO
/****** Object:  Table [dbo].[TBL_ClassOhterCourse]    Script Date: 2018/9/11 22:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_ClassOhterCourse](
	[ID] [uniqueidentifier] NOT NULL,
	[CLassID] [uniqueidentifier] NOT NULL,
	[CourseID] [uniqueidentifier] NOT NULL,
	[TeacherID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TBL_ClassOhterCourse] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[view_class_ohter_course]    Script Date: 2018/9/11 22:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_class_ohter_course]
AS
SELECT   class.ID, class.ClassName, classcourse.CourseName, class.ClassImg, teacher.Name, 
                course.CourseName AS OtherCourse
FROM      dbo.TBL_ClassInfo AS class LEFT OUTER JOIN
                dbo.TBL_CourseInfo AS classcourse ON class.CourseID = classcourse.ID LEFT OUTER JOIN
                dbo.TBL_TeacherInfo AS teacher ON teacher.ID = class.ClassMaster LEFT OUTER JOIN
                dbo.TBL_ClassOhterCourse AS other ON class.ID = other.CLassID LEFT OUTER JOIN
                dbo.TBL_CourseInfo AS course ON other.CourseID = course.ID







GO
/****** Object:  View [dbo].[view_class_teacher]    Script Date: 2018/9/11 22:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[view_class_teacher] as
select class.ID,class.ClassName,class.ClassImg,teacher.Name from TBL_ClassInfo class
left join TBL_TeacherInfo teacher on teacher.ID = class.ClassMaster






GO
/****** Object:  View [dbo].[view_teacher_ohter_class]    Script Date: 2018/9/11 22:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create view [dbo].[view_teacher_ohter_class] as
  select teacher.ID as ID, teacher.LoginID,teacher.Name,course.CourseName,class.ID as ClassID,class.ClassName from TBL_ClassOhterCourse ohter
  left join TBL_ClassInfo class on ohter.CLassID = class.ID
  left join TBL_TeacherInfo teacher on ohter.TeacherID = teacher.ID
  left join TBL_CourseInfo course on teacher.CourseID = course.ID




GO
/****** Object:  Table [dbo].[TBL_ExaminationPaper]    Script Date: 2018/9/11 22:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_ExaminationPaper](
	[ID] [uniqueidentifier] NOT NULL,
	[PaperTitle] [nvarchar](50) NOT NULL,
	[SingleList] [nvarchar](max) NOT NULL,
	[SingleOption] [nvarchar](max) NOT NULL,
	[JudgeList] [nvarchar](max) NOT NULL,
	[JudgeOption] [nvarchar](max) NOT NULL,
	[ClassID] [uniqueidentifier] NOT NULL,
	[TeacherID] [uniqueidentifier] NOT NULL,
	[CourseID] [uniqueidentifier] NOT NULL,
	[ReleaseTime] [datetime] NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[RollOutTime] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TBL_ExaminationPaper] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[view_exam_class_teacher_course]    Script Date: 2018/9/11 22:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_exam_class_teacher_course]
AS
SELECT   e.*, t.Name, c.CourseName, i.ClassName
FROM      dbo.TBL_ExaminationPaper AS e LEFT OUTER JOIN
                dbo.TBL_ClassInfo AS i ON i.ID = e.ClassID LEFT OUTER JOIN
                dbo.TBL_TeacherInfo AS t ON t.ID = e.TeacherID LEFT OUTER JOIN
                dbo.TBL_CourseInfo AS c ON c.ID = e.CourseID
WHERE   (e.TestTime >= CONVERT(varchar(50), GETDATE(), 20))




GO
/****** Object:  Table [dbo].[TBL_ResultDetail]    Script Date: 2018/9/11 22:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_ResultDetail](
	[ID] [uniqueidentifier] NOT NULL,
	[PaperID] [uniqueidentifier] NOT NULL,
	[StudentID] [uniqueidentifier] NOT NULL,
	[SelectList] [nvarchar](max) NOT NULL,
	[Result] [int] NOT NULL,
	[OverTime] [datetime] NOT NULL,
 CONSTRAINT [PK_TBL_RsultDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[view_result_exam]    Script Date: 2018/9/11 22:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[view_result_exam] as
select r.ID,r.PaperID,r.StudentID,r.SelectList,r.Result,r.OverTime,e.PaperTitle,e.SingleList,e.JudgeList,e.SingleOption,e.JudgeOption,c.ClassName,t.Name,o.CourseName,e.ReleaseTime,e.TestTime,e.RollOutTime from TBL_ResultDetail r 
left join TBL_ExaminationPaper e on r.PaperID = e.ID
left join TBL_ClassInfo c on e.ClassID = c.ID
left join TBL_TeacherInfo t on e.TeacherID = t.ID
left join TBL_CourseInfo o on e.CourseID = o.ID

GO
/****** Object:  Table [dbo].[TBL_JudgeQuestion]    Script Date: 2018/9/11 22:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_JudgeQuestion](
	[ID] [uniqueidentifier] NOT NULL,
	[TitleSkip] [nvarchar](max) NOT NULL,
	[OptionTrueA] [nvarchar](max) NOT NULL,
	[OptionB] [nvarchar](max) NOT NULL,
	[CourseID] [uniqueidentifier] NOT NULL,
	[TeacherID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TBL_JudgeQuestion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_PowerInfo]    Script Date: 2018/9/11 22:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_PowerInfo](
	[ID] [uniqueidentifier] NOT NULL,
	[PostName] [nvarchar](50) NOT NULL,
	[Sort] [int] NOT NULL,
	[PowerName] [nvarchar](50) NOT NULL,
	[PowerURL] [nvarchar](50) NULL,
 CONSTRAINT [PK_Power] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_SingleQuestion]    Script Date: 2018/9/11 22:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_SingleQuestion](
	[ID] [uniqueidentifier] NOT NULL,
	[TitleSkip] [nvarchar](max) NOT NULL,
	[OptionTrueA] [nvarchar](max) NOT NULL,
	[OptionB] [nvarchar](max) NOT NULL,
	[OptionC] [nvarchar](max) NOT NULL,
	[OptionD] [nvarchar](max) NOT NULL,
	[CourseID] [uniqueidentifier] NOT NULL,
	[TeacherID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TBL_SingleQuestion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[TBL_PowerInfo] ADD  CONSTRAINT [DF_TBL_PowerInfo_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[TBL_AdminInfo]  WITH CHECK ADD  CONSTRAINT [FK_TBL_AdminInfo_TBL_PostInfo] FOREIGN KEY([PostID])
REFERENCES [dbo].[TBL_PostInfo] ([ID])
GO
ALTER TABLE [dbo].[TBL_AdminInfo] CHECK CONSTRAINT [FK_TBL_AdminInfo_TBL_PostInfo]
GO
ALTER TABLE [dbo].[TBL_AdminInfo]  WITH CHECK ADD  CONSTRAINT [FK_TBL_AdminInfo_TBL_RuleInfo] FOREIGN KEY([RuleID])
REFERENCES [dbo].[TBL_RuleInfo] ([ID])
GO
ALTER TABLE [dbo].[TBL_AdminInfo] CHECK CONSTRAINT [FK_TBL_AdminInfo_TBL_RuleInfo]
GO
ALTER TABLE [dbo].[TBL_ClassInfo]  WITH CHECK ADD  CONSTRAINT [FK_TBL_ClassInfo_TBL_TeacherInfo] FOREIGN KEY([ClassMaster])
REFERENCES [dbo].[TBL_TeacherInfo] ([ID])
GO
ALTER TABLE [dbo].[TBL_ClassInfo] CHECK CONSTRAINT [FK_TBL_ClassInfo_TBL_TeacherInfo]
GO
ALTER TABLE [dbo].[TBL_ClassOhterCourse]  WITH CHECK ADD  CONSTRAINT [FK_TBL_ClassOhterCourse_TBL_ClassInfo] FOREIGN KEY([CLassID])
REFERENCES [dbo].[TBL_ClassInfo] ([ID])
GO
ALTER TABLE [dbo].[TBL_ClassOhterCourse] CHECK CONSTRAINT [FK_TBL_ClassOhterCourse_TBL_ClassInfo]
GO
ALTER TABLE [dbo].[TBL_ClassOhterCourse]  WITH CHECK ADD  CONSTRAINT [FK_TBL_ClassOhterCourse_TBL_CourseInfo] FOREIGN KEY([CourseID])
REFERENCES [dbo].[TBL_CourseInfo] ([ID])
GO
ALTER TABLE [dbo].[TBL_ClassOhterCourse] CHECK CONSTRAINT [FK_TBL_ClassOhterCourse_TBL_CourseInfo]
GO
ALTER TABLE [dbo].[TBL_ClassOhterCourse]  WITH CHECK ADD  CONSTRAINT [FK_TBL_ClassOhterCourse_TBL_TeacherInfo] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[TBL_TeacherInfo] ([ID])
GO
ALTER TABLE [dbo].[TBL_ClassOhterCourse] CHECK CONSTRAINT [FK_TBL_ClassOhterCourse_TBL_TeacherInfo]
GO
ALTER TABLE [dbo].[TBL_ExaminationPaper]  WITH CHECK ADD  CONSTRAINT [FK_TBL_ExaminationPaper_TBL_ClassInfo] FOREIGN KEY([ClassID])
REFERENCES [dbo].[TBL_ClassInfo] ([ID])
GO
ALTER TABLE [dbo].[TBL_ExaminationPaper] CHECK CONSTRAINT [FK_TBL_ExaminationPaper_TBL_ClassInfo]
GO
ALTER TABLE [dbo].[TBL_ExaminationPaper]  WITH CHECK ADD  CONSTRAINT [FK_TBL_ExaminationPaper_TBL_CourseInfo] FOREIGN KEY([CourseID])
REFERENCES [dbo].[TBL_CourseInfo] ([ID])
GO
ALTER TABLE [dbo].[TBL_ExaminationPaper] CHECK CONSTRAINT [FK_TBL_ExaminationPaper_TBL_CourseInfo]
GO
ALTER TABLE [dbo].[TBL_ExaminationPaper]  WITH CHECK ADD  CONSTRAINT [FK_TBL_ExaminationPaper_TBL_TeacherInfo] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[TBL_TeacherInfo] ([ID])
GO
ALTER TABLE [dbo].[TBL_ExaminationPaper] CHECK CONSTRAINT [FK_TBL_ExaminationPaper_TBL_TeacherInfo]
GO
ALTER TABLE [dbo].[TBL_JudgeQuestion]  WITH CHECK ADD  CONSTRAINT [FK_TBL_JudgeQuestion_TBL_CourseInfo] FOREIGN KEY([CourseID])
REFERENCES [dbo].[TBL_CourseInfo] ([ID])
GO
ALTER TABLE [dbo].[TBL_JudgeQuestion] CHECK CONSTRAINT [FK_TBL_JudgeQuestion_TBL_CourseInfo]
GO
ALTER TABLE [dbo].[TBL_JudgeQuestion]  WITH CHECK ADD  CONSTRAINT [FK_TBL_JudgeQuestion_TBL_TeacherInfo] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[TBL_TeacherInfo] ([ID])
GO
ALTER TABLE [dbo].[TBL_JudgeQuestion] CHECK CONSTRAINT [FK_TBL_JudgeQuestion_TBL_TeacherInfo]
GO
ALTER TABLE [dbo].[TBL_ResultDetail]  WITH CHECK ADD  CONSTRAINT [FK_TBL_ResultDetail_TBL_ExaminationPaper] FOREIGN KEY([PaperID])
REFERENCES [dbo].[TBL_ExaminationPaper] ([ID])
GO
ALTER TABLE [dbo].[TBL_ResultDetail] CHECK CONSTRAINT [FK_TBL_ResultDetail_TBL_ExaminationPaper]
GO
ALTER TABLE [dbo].[TBL_ResultDetail]  WITH CHECK ADD  CONSTRAINT [FK_TBL_ResultDetail_TBL_StudentInfo] FOREIGN KEY([StudentID])
REFERENCES [dbo].[TBL_StudentInfo] ([ID])
GO
ALTER TABLE [dbo].[TBL_ResultDetail] CHECK CONSTRAINT [FK_TBL_ResultDetail_TBL_StudentInfo]
GO
ALTER TABLE [dbo].[TBL_SingleQuestion]  WITH CHECK ADD  CONSTRAINT [FK_TBL_SingleQuestion_TBL_CourseInfo] FOREIGN KEY([CourseID])
REFERENCES [dbo].[TBL_CourseInfo] ([ID])
GO
ALTER TABLE [dbo].[TBL_SingleQuestion] CHECK CONSTRAINT [FK_TBL_SingleQuestion_TBL_CourseInfo]
GO
ALTER TABLE [dbo].[TBL_SingleQuestion]  WITH CHECK ADD  CONSTRAINT [FK_TBL_SingleQuestion_TBL_TeacherInfo] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[TBL_TeacherInfo] ([ID])
GO
ALTER TABLE [dbo].[TBL_SingleQuestion] CHECK CONSTRAINT [FK_TBL_SingleQuestion_TBL_TeacherInfo]
GO
ALTER TABLE [dbo].[TBL_StudentInfo]  WITH CHECK ADD  CONSTRAINT [FK_TBL_StudentInfo_TBL_ClassInfo] FOREIGN KEY([ClassID])
REFERENCES [dbo].[TBL_ClassInfo] ([ID])
GO
ALTER TABLE [dbo].[TBL_StudentInfo] CHECK CONSTRAINT [FK_TBL_StudentInfo_TBL_ClassInfo]
GO
ALTER TABLE [dbo].[TBL_StudentInfo]  WITH CHECK ADD  CONSTRAINT [FK_TBL_StudentInfo_TBL_PostInfo] FOREIGN KEY([PostID])
REFERENCES [dbo].[TBL_PostInfo] ([ID])
GO
ALTER TABLE [dbo].[TBL_StudentInfo] CHECK CONSTRAINT [FK_TBL_StudentInfo_TBL_PostInfo]
GO
ALTER TABLE [dbo].[TBL_StudentInfo]  WITH CHECK ADD  CONSTRAINT [FK_TBL_StudentInfo_TBL_RuleInfo] FOREIGN KEY([RuleID])
REFERENCES [dbo].[TBL_RuleInfo] ([ID])
GO
ALTER TABLE [dbo].[TBL_StudentInfo] CHECK CONSTRAINT [FK_TBL_StudentInfo_TBL_RuleInfo]
GO
ALTER TABLE [dbo].[TBL_TeacherInfo]  WITH CHECK ADD  CONSTRAINT [FK_TBL_TeacherInfo_TBL_PostInfo] FOREIGN KEY([PostID])
REFERENCES [dbo].[TBL_PostInfo] ([ID])
GO
ALTER TABLE [dbo].[TBL_TeacherInfo] CHECK CONSTRAINT [FK_TBL_TeacherInfo_TBL_PostInfo]
GO
ALTER TABLE [dbo].[TBL_TeacherInfo]  WITH CHECK ADD  CONSTRAINT [FK_TBL_TeacherInfo_TBL_RuleInfo] FOREIGN KEY([RuleID])
REFERENCES [dbo].[TBL_RuleInfo] ([ID])
GO
ALTER TABLE [dbo].[TBL_TeacherInfo] CHECK CONSTRAINT [FK_TBL_TeacherInfo_TBL_RuleInfo]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_AdminInfo', @level2type=N'COLUMN',@level2name=N'LoginID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_AdminInfo', @level2type=N'COLUMN',@level2name=N'LoginPass'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_AdminInfo', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_AdminInfo', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年龄' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_AdminInfo', @level2type=N'COLUMN',@level2name=N'Age'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_AdminInfo', @level2type=N'COLUMN',@level2name=N'ChangeTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_AdminInfo', @level2type=N'COLUMN',@level2name=N'RuleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_AdminInfo', @level2type=N'COLUMN',@level2name=N'ImgUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班级名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_ClassInfo', @level2type=N'COLUMN',@level2name=N'ClassName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班主任' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_ClassInfo', @level2type=N'COLUMN',@level2name=N'ClassMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专业课程' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_ClassInfo', @level2type=N'COLUMN',@level2name=N'CourseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_ClassOhterCourse', @level2type=N'COLUMN',@level2name=N'CLassID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课程' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_ClassOhterCourse', @level2type=N'COLUMN',@level2name=N'CourseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'教师' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_ClassOhterCourse', @level2type=N'COLUMN',@level2name=N'TeacherID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课程名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_CourseInfo', @level2type=N'COLUMN',@level2name=N'CourseName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课程信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_CourseInfo', @level2type=N'COLUMN',@level2name=N'CourseMess'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用教材' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_CourseInfo', @level2type=N'COLUMN',@level2name=N'Book'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否必修' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_CourseInfo', @level2type=N'COLUMN',@level2name=N'Compulsory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_ExaminationPaper', @level2type=N'COLUMN',@level2name=N'PaperTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单选列表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_ExaminationPaper', @level2type=N'COLUMN',@level2name=N'SingleList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'判断列表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_ExaminationPaper', @level2type=N'COLUMN',@level2name=N'JudgeList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试班级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_ExaminationPaper', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布教师' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_ExaminationPaper', @level2type=N'COLUMN',@level2name=N'TeacherID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'科目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_ExaminationPaper', @level2type=N'COLUMN',@level2name=N'CourseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_ExaminationPaper', @level2type=N'COLUMN',@level2name=N'TestTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试时长' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_ExaminationPaper', @level2type=N'COLUMN',@level2name=N'RollOutTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_JudgeQuestion', @level2type=N'COLUMN',@level2name=N'TitleSkip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'正确答案' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_JudgeQuestion', @level2type=N'COLUMN',@level2name=N'OptionTrueA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'选项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_JudgeQuestion', @level2type=N'COLUMN',@level2name=N'OptionB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课程类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_JudgeQuestion', @level2type=N'COLUMN',@level2name=N'CourseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'教师' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_JudgeQuestion', @level2type=N'COLUMN',@level2name=N'TeacherID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职务名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_PostInfo', @level2type=N'COLUMN',@level2name=N'PostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_ResultDetail', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_ResultDetail', @level2type=N'COLUMN',@level2name=N'PaperID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学生编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_ResultDetail', @level2type=N'COLUMN',@level2name=N'StudentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_ResultDetail', @level2type=N'COLUMN',@level2name=N'OverTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_RuleInfo', @level2type=N'COLUMN',@level2name=N'RuleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_SingleQuestion', @level2type=N'COLUMN',@level2name=N'TitleSkip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'正确答案' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_SingleQuestion', @level2type=N'COLUMN',@level2name=N'OptionTrueA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'选项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_SingleQuestion', @level2type=N'COLUMN',@level2name=N'OptionB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'选项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_SingleQuestion', @level2type=N'COLUMN',@level2name=N'OptionC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'选项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_SingleQuestion', @level2type=N'COLUMN',@level2name=N'OptionD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课程类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_SingleQuestion', @level2type=N'COLUMN',@level2name=N'CourseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'教师' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_SingleQuestion', @level2type=N'COLUMN',@level2name=N'TeacherID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_StudentInfo', @level2type=N'COLUMN',@level2name=N'LoginID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_StudentInfo', @level2type=N'COLUMN',@level2name=N'LoginPass'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_StudentInfo', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年龄' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_StudentInfo', @level2type=N'COLUMN',@level2name=N'Age'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_StudentInfo', @level2type=N'COLUMN',@level2name=N'ChangeTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_StudentInfo', @level2type=N'COLUMN',@level2name=N'RuleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_StudentInfo', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_StudentInfo', @level2type=N'COLUMN',@level2name=N'ImgUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_TeacherInfo', @level2type=N'COLUMN',@level2name=N'LoginID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_TeacherInfo', @level2type=N'COLUMN',@level2name=N'LoginPass'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_TeacherInfo', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_TeacherInfo', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年龄' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_TeacherInfo', @level2type=N'COLUMN',@level2name=N'Age'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_TeacherInfo', @level2type=N'COLUMN',@level2name=N'ChangeTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_TeacherInfo', @level2type=N'COLUMN',@level2name=N'RuleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_TeacherInfo', @level2type=N'COLUMN',@level2name=N'PostID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'科目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_TeacherInfo', @level2type=N'COLUMN',@level2name=N'CourseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBL_TeacherInfo', @level2type=N'COLUMN',@level2name=N'ImgUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 310
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "r"
            Begin Extent = 
               Top = 46
               Left = 354
               Bottom = 253
               Right = 503
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 541
               Bottom = 108
               Right = 690
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_get_admin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_get_admin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 20
               Left = 14
               Bottom = 253
               Right = 175
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "r"
            Begin Extent = 
               Top = 6
               Left = 237
               Bottom = 160
               Right = 386
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 143
               Left = 442
               Bottom = 283
               Right = 602
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 116
               Left = 212
               Bottom = 284
               Right = 373
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_get_student'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_get_student'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "r"
            Begin Extent = 
               Top = 6
               Left = 237
               Bottom = 108
               Right = 386
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 108
               Left = 237
               Bottom = 210
               Right = 386
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cl"
            Begin Extent = 
               Top = 210
               Left = 241
               Bottom = 350
               Right = 401
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Outpu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_get_teacher'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N't = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_get_teacher'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_get_teacher'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "class"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "classcourse"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 146
               Right = 401
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "teacher"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "other"
            Begin Extent = 
               Top = 150
               Left = 237
               Bottom = 290
               Right = 385
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "course"
            Begin Extent = 
               Top = 294
               Left = 38
               Bottom = 434
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         T' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_class_ohter_course'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'able = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_class_ohter_course'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_class_ohter_course'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "i"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 220
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 233
               Right = 401
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 439
               Bottom = 288
               Right = 603
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 641
               Bottom = 190
               Right = 802
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 35
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
     ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_exam_class_teacher_course'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'    Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_exam_class_teacher_course'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_exam_class_teacher_course'
GO
USE [master]
GO
ALTER DATABASE [TestSystemDB] SET  READ_WRITE 
GO
