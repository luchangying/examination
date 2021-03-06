use TestSystemDB
------------------权限表------------------
INSERT INTO [dbo].[TBL_RuleInfo]([ID] ,[RuleName])VALUES (NEWID(),'学生')
INSERT INTO [dbo].[TBL_RuleInfo]([ID] ,[RuleName])VALUES (NEWID(),'教师')
INSERT INTO [dbo].[TBL_RuleInfo]([ID] ,[RuleName])VALUES (NEWID(),'管理员')

------------------职务表------------------
INSERT INTO [dbo].[TBL_PostInfo]([ID],[PostName])VALUES(NEWID(),'学生')
INSERT INTO [dbo].[TBL_PostInfo]([ID],[PostName])VALUES(NEWID(),'普通教师')
INSERT INTO [dbo].[TBL_PostInfo]([ID],[PostName])VALUES(NEWID(),'教学主管')
INSERT INTO [dbo].[TBL_PostInfo]([ID],[PostName])VALUES(NEWID(),'教学秘书')
INSERT INTO [dbo].[TBL_PostInfo]([ID],[PostName])VALUES(NEWID(),'普通教师,教学主管') 
INSERT INTO [dbo].[TBL_PostInfo]([ID],[PostName])VALUES(NEWID(),'普通教师,教学秘书') 
INSERT INTO [dbo].[TBL_PostInfo]([ID],[PostName])VALUES(NEWID(),'教学主管,教学秘书') 
INSERT INTO [dbo].[TBL_PostInfo]([ID],[PostName])VALUES(NEWID(),'普通教师,教学主管,教学秘书')
INSERT INTO [dbo].[TBL_PostInfo]([ID],[PostName])VALUES(NEWID(),'班主任,普通教师')
INSERT INTO [dbo].[TBL_PostInfo]([ID],[PostName])VALUES(NEWID(),'班主任,教学主管')
INSERT INTO [dbo].[TBL_PostInfo]([ID],[PostName])VALUES(NEWID(),'班主任,教学秘书')
INSERT INTO [dbo].[TBL_PostInfo]([ID],[PostName])VALUES(NEWID(),'班主任,普通教师,教学主管') 
INSERT INTO [dbo].[TBL_PostInfo]([ID],[PostName])VALUES(NEWID(),'班主任,普通教师,教学秘书') 
INSERT INTO [dbo].[TBL_PostInfo]([ID],[PostName])VALUES(NEWID(),'班主任,教学主管,教学秘书') 
INSERT INTO [dbo].[TBL_PostInfo]([ID],[PostName])VALUES(NEWID(),'班主任,普通教师,教学主管,教学秘书')  
INSERT INTO [dbo].[TBL_PostInfo]([ID],[PostName])VALUES(NEWID(),'管理员')

------------------课程表------------------
INSERT INTO [dbo].[TBL_CourseInfo] VALUES (NEWID(),'巨量数据集合','该门课程为必修课程','SQL server',1,'/Image/Book/7030122534.jpg')
INSERT INTO [dbo].[TBL_CourseInfo] VALUES (NEWID(),'计算机信息管理','该门课程为必修课程','C#程序设计',1,'/Image/Book/711117013X.jpg')
INSERT INTO [dbo].[TBL_CourseInfo] VALUES (NEWID(),'软件技术（UI设计方向）','该门课程为必修课程','Web应用开发',1,'/Image/Book/756092771.jpg')
INSERT INTO [dbo].[TBL_CourseInfo] VALUES (NEWID(),'软件技术（软件外包服务方向）','该门课程为必修课程','Winform项目开发',1,'/Image/Book/7810823345.jpg')
INSERT INTO [dbo].[TBL_CourseInfo] VALUES (NEWID(),'意识研究中的关键词题','该门课程为必修课程','Problems in Studies',1,'/Image/Book/790063259X.jpg')
INSERT INTO [dbo].[TBL_CourseInfo] VALUES (NEWID(),'暴力行为脑机制','选修课程','Neural mechanical',0,'/Image/Book/7980007786.jpg')
INSERT INTO [dbo].[TBL_CourseInfo] VALUES (NEWID(),'当代国际政治','选修课程','Contemporary',0,'/Image/Book/9025178.jpg')
INSERT INTO [dbo].[TBL_CourseInfo] VALUES (NEWID(),'中国文化史','选修课程','History of Chinese Culture',0,'/Image/Book/9150365.jpg')
INSERT INTO [dbo].[TBL_CourseInfo] VALUES (NEWID(),'推理与决策','选修课程','Reasoning and decision Making',0,'/Image/Book/9213579.jpg')
INSERT INTO [dbo].[TBL_CourseInfo] VALUES (NEWID(),'认知科学与经济学','选修课程','Cognitive Science & Economics',0,'/Image/Book/9221944.jpg')
INSERT INTO [dbo].[TBL_CourseInfo] VALUES (NEWID(),'大学经历与学生发展','选修课程','College Experian',0,'/Image/Book/9222502.jpg')
INSERT INTO [dbo].[TBL_CourseInfo] VALUES (NEWID(),'ACM/ICPC竞赛训练','选修课程','Training',0,'/Image/Book/9226773.jpg')
INSERT INTO [dbo].[TBL_CourseInfo] VALUES (NEWID(),'经济学原理','选修课程','Principle',0,'/Image/Book/9316709.jpg')
INSERT INTO [dbo].[TBL_CourseInfo] VALUES (NEWID(),'发展经济学','选修课程','Development',0,'/Image/Book/9787030146779.jpg')
INSERT INTO [dbo].[TBL_CourseInfo] VALUES (NEWID(),'公共物理学','选修课程','Physical',0,'/Image/Book/9787030177162.jpg')
INSERT INTO [dbo].[TBL_CourseInfo] VALUES (NEWID(),'量子力学','选修课程','Advanced',0,'/Image/Book/9787030178756.jpg')
INSERT INTO [dbo].[TBL_CourseInfo] VALUES (NEWID(),'计算机视觉','选修课程','Deep Leaning',0,'/Image/Book/9787111076452.jpg')
INSERT INTO [dbo].[TBL_CourseInfo] VALUES (NEWID(),'地震概论','选修课程','Introduction',0,'/Image/Book/9787111096955.jpg')
INSERT INTO [dbo].[TBL_CourseInfo] VALUES (NEWID(),'速成法语（零起点）','选修课程','French for Reading',0,'/Image/Book/9787111199731.jpg')
INSERT INTO [dbo].[TBL_CourseInfo] VALUES (NEWID(),'圆明园的历史与现状','选修课程','Past and today',0,'/Image/Book/9787111202134.jpg')

select * from [TBL_CourseInfo]


------------------管理员信息表------------------
INSERT INTO [dbo].[TBL_AdminInfo] VALUES (NEWID(),'A011001',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'欧晶',1,27,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='管理员' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='管理员' ),'/Image/Photo/photo09.png')
INSERT INTO [dbo].[TBL_AdminInfo] VALUES (NEWID(),'A011002',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'许志',1,31,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='管理员' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='管理员' ),'/Image/Photo/photo10.png')
INSERT INTO [dbo].[TBL_AdminInfo] VALUES (NEWID(),'A011003',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'苏辉勇',1,33,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='管理员'),(select top 1 ID from [TBL_PostInfo] where [PostName]='管理员' ),null)
INSERT INTO [dbo].[TBL_AdminInfo] VALUES (NEWID(),'A011004',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'刘玉莲',0,33,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='管理员' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='管理员' ),null)

select * from [TBL_AdminInfo]

------------------教师信息表------------------
INSERT INTO [dbo].[TBL_TeacherInfo] VALUES (NEWID(),'T05601',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'安吉丽娜',0,27,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName] = '教师' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='班主任,普通教师,教学主管,教学秘书' ),(select top 1 ID from [TBL_CourseInfo] where CourseName ='巨量数据集合' ),'/Image/Photo/photo05.png')
INSERT INTO [dbo].[TBL_TeacherInfo] VALUES (NEWID(),'T05602',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'李思琪',0,26,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName] = '教师' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='班主任,普通教师' ),(select top 1 ID from [TBL_CourseInfo] where CourseName ='计算机信息管理' ),'/Image/Photo/photo06.png')
INSERT INTO [dbo].[TBL_TeacherInfo] VALUES (NEWID(),'T05603',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'陈尚俊',1,36,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName] = '教师' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='班主任,普通教师,教学主管' ),(select top 1 ID from [TBL_CourseInfo] where CourseName ='软件技术（UI设计方向）'),'/Image/Photo/photo07.png')
INSERT INTO [dbo].[TBL_TeacherInfo] VALUES (NEWID(),'T05604',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'肖琪琪',1,30,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName] = '教师' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='班主任,普通教师,教学秘书' ),(select top 1 ID from [TBL_CourseInfo] where CourseName ='软件技术（软件外包服务方向）' ),'/Image/Photo/photo08.png')
INSERT INTO [dbo].[TBL_TeacherInfo] VALUES (NEWID(),'T05605',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'蔡志廖',1,29,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName] = '教师' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='班主任,普通教师' ),(select top 1 ID from [TBL_CourseInfo] where CourseName ='意识研究中的关键词题' ),null)
INSERT INTO [dbo].[TBL_TeacherInfo] VALUES (NEWID(),'T05606',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'尚雯婕',0,31,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName] = '教师' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='普通教师,教学主管,教学秘书' ),(select top 1 ID from [TBL_CourseInfo] where CourseName ='暴力行为脑机制' ),null)
INSERT INTO [dbo].[TBL_TeacherInfo] VALUES (NEWID(),'T05607',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'吴迪迪',1,41,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName] = '教师' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='普通教师' ),(select top 1 ID from [TBL_CourseInfo] where CourseName ='当代国际政治' ),null)
INSERT INTO [dbo].[TBL_TeacherInfo] VALUES (NEWID(),'T05608',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'李丽娜',0,31,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName] = '教师' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='普通教师' ),(select top 1 ID from [TBL_CourseInfo] where CourseName ='中国文化史' ),null)
INSERT INTO [dbo].[TBL_TeacherInfo] VALUES (NEWID(),'T05609',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'余庆柳',0,31,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName] = '教师' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='普通教师' ),(select top 1 ID from [TBL_CourseInfo] where CourseName ='推理与决策' ),null)
INSERT INTO [dbo].[TBL_TeacherInfo] VALUES (NEWID(),'T05610',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'孙剑丹',1,38,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName] = '教师' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='普通教师' ),(select top 1 ID from [TBL_CourseInfo] where CourseName ='认知科学与经济学' ),null)
INSERT INTO [dbo].[TBL_TeacherInfo] VALUES (NEWID(),'T05611',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'苏俊力',1,42,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName] = '教师' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='普通教师' ),(select top 1 ID from [TBL_CourseInfo] where CourseName ='大学经历与学生发展' ),null)
INSERT INTO [dbo].[TBL_TeacherInfo] VALUES (NEWID(),'T05612',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'陆志宇',1,40,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName] = '教师' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='普通教师' ),(select top 1 ID from [TBL_CourseInfo] where CourseName ='ACM/ICPC竞赛训练' ),null)
INSERT INTO [dbo].[TBL_TeacherInfo] VALUES (NEWID(),'T05613',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'王栩栩',0,34,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName] = '教师' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='普通教师' ),(select top 1 ID from [TBL_CourseInfo] where CourseName ='经济学原理' ),null)
INSERT INTO [dbo].[TBL_TeacherInfo] VALUES (NEWID(),'T05614',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'龙丽娜',0,29,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName] = '教师' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='普通教师' ),(select top 1 ID from [TBL_CourseInfo] where CourseName ='发展经济学' ),null)
INSERT INTO [dbo].[TBL_TeacherInfo] VALUES (NEWID(),'T05615',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'吉安娜',0,35,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName] = '教师' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='普通教师' ),(select top 1 ID from [TBL_CourseInfo] where CourseName ='公共物理学' ),null)
INSERT INTO [dbo].[TBL_TeacherInfo] VALUES (NEWID(),'T05616',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'杜星宇',1,39,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName] = '教师' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='普通教师' ),(select top 1 ID from [TBL_CourseInfo] where CourseName ='量子力学' ),null)
INSERT INTO [dbo].[TBL_TeacherInfo] VALUES (NEWID(),'T05617',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'黄陵智',1,45,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName] = '教师' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='普通教师,教学主管' ),(select top 1 ID from [TBL_CourseInfo] where CourseName ='计算机视觉' ),null)
INSERT INTO [dbo].[TBL_TeacherInfo] VALUES (NEWID(),'T05618',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'朴灿莲',0,42,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName] = '教师' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='普通教师,教学主管' ),(select top 1 ID from [TBL_CourseInfo] where CourseName ='地震概论' ),null)
INSERT INTO [dbo].[TBL_TeacherInfo] VALUES (NEWID(),'T05619',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'金智江',1,40,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName] = '教师' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='普通教师,教学秘书' ),(select top 1 ID from [TBL_CourseInfo] where CourseName ='速成法语（零起点)' ),null)
INSERT INTO [dbo].[TBL_TeacherInfo] VALUES (NEWID(),'T05620',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'李菲菲',0,35,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName] = '教师' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='普通教师,教学秘书' ),(select top 1 ID from [TBL_CourseInfo] where CourseName ='圆明园的历史与现状'),null)
INSERT INTO [dbo].[TBL_TeacherInfo] VALUES (NEWID(),'T05621',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'张宇俊',1,35,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName] = '教师' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='教学秘书' ),null,null)
INSERT INTO [dbo].[TBL_TeacherInfo] VALUES (NEWID(),'T05622',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'李伟奇',1,36,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName] = '教师' ),(select top 1 ID from [TBL_PostInfo] where [PostName]='教学主管,教学秘书' ),null,null)


select * from [TBL_TeacherInfo]
------------------班级表------------------
INSERT INTO [dbo].[TBL_ClassInfo] VALUES (NEWID(),'大数据',(select top 1 ID from [TBL_TeacherInfo] where Name = '安吉丽娜'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='巨量数据集合' ),'/Image/Classroom/class01.png')
INSERT INTO [dbo].[TBL_ClassInfo] VALUES (NEWID(),'计算机管理',(select top 1 ID from [TBL_TeacherInfo] where Name = '李思琪'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='计算机信息管理' ),'/Image/Classroom/class02.png')
INSERT INTO [dbo].[TBL_ClassInfo] VALUES (NEWID(),'软件技术（UI设计方向）',(select top 1 ID from [TBL_TeacherInfo] where Name = '陈尚俊'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='软件技术（UI设计方向）' ),'/Image/Classroom/class03.png')
INSERT INTO [dbo].[TBL_ClassInfo] VALUES (NEWID(),'软件技术（服务与外包方向）',(select top 1 ID from [TBL_TeacherInfo] where Name = '肖琪琪'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='软件技术（软件外包服务方向）' ),'/Image/Classroom/class04.png')
INSERT INTO [dbo].[TBL_ClassInfo] VALUES (NEWID(),'国文研究',(select top 1 ID from [TBL_TeacherInfo] where Name = '蔡志廖'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='意识研究中的关键词题' ),null)

------------------附属课程表------------------
INSERT INTO [dbo].[TBL_ClassOhterCourse] VALUES (NEWID(),(select top 1 ID from [TBL_ClassInfo] where ClassName='大数据'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='巨量数据集合'),(select top 1 ID from [TBL_TeacherInfo] where Name='安吉丽娜'))
INSERT INTO [dbo].[TBL_ClassOhterCourse] VALUES (NEWID(),(select top 1 ID from [TBL_ClassInfo] where ClassName='大数据'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='暴力行为脑机制'),(select top 1 ID from [TBL_TeacherInfo] where Name='尚雯婕'))
INSERT INTO [dbo].[TBL_ClassOhterCourse] VALUES (NEWID(),(select top 1 ID from [TBL_ClassInfo] where ClassName='大数据'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='当代国际政治'),(select top 1 ID from [TBL_TeacherInfo] where Name='吴迪迪'))
INSERT INTO [dbo].[TBL_ClassOhterCourse] VALUES (NEWID(),(select top 1 ID from [TBL_ClassInfo] where ClassName='大数据'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='地震概论'),(select top 1 ID from [TBL_TeacherInfo] where Name='朴灿莲'))

INSERT INTO [dbo].[TBL_ClassOhterCourse] VALUES (NEWID(),(select top 1 ID from [TBL_ClassInfo] where ClassName='计算机管理'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='计算机信息管理'),(select top 1 ID from [TBL_TeacherInfo] where Name='李思琪'))
INSERT INTO [dbo].[TBL_ClassOhterCourse] VALUES (NEWID(),(select top 1 ID from [TBL_ClassInfo] where ClassName='计算机管理'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='中国文化史'),(select top 1 ID from [TBL_TeacherInfo] where Name='李丽娜'))
INSERT INTO [dbo].[TBL_ClassOhterCourse] VALUES (NEWID(),(select top 1 ID from [TBL_ClassInfo] where ClassName='计算机管理'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='推理与决策'),(select top 1 ID from [TBL_TeacherInfo] where Name='余庆柳'))
INSERT INTO [dbo].[TBL_ClassOhterCourse] VALUES (NEWID(),(select top 1 ID from [TBL_ClassInfo] where ClassName='计算机管理'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='认知科学与经济学'),(select top 1 ID from [TBL_TeacherInfo] where Name='孙剑丹'))
INSERT INTO [dbo].[TBL_ClassOhterCourse] VALUES (NEWID(),(select top 1 ID from [TBL_ClassInfo] where ClassName='计算机管理'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='地震概论'),(select top 1 ID from [TBL_TeacherInfo] where Name='朴灿莲'))


INSERT INTO [dbo].[TBL_ClassOhterCourse] VALUES (NEWID(),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（UI设计方向）'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='软件技术（UI设计方向）'),(select top 1 ID from [TBL_TeacherInfo] where Name='陈尚俊'))
INSERT INTO [dbo].[TBL_ClassOhterCourse] VALUES (NEWID(),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（UI设计方向）'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='大学经历与学生发展'),(select top 1 ID from [TBL_TeacherInfo] where Name='苏俊力'))
INSERT INTO [dbo].[TBL_ClassOhterCourse] VALUES (NEWID(),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（UI设计方向）'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='ACM/ICPC竞赛训练'),(select top 1 ID from [TBL_TeacherInfo] where Name='陆志宇'))
INSERT INTO [dbo].[TBL_ClassOhterCourse] VALUES (NEWID(),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（UI设计方向）'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='经济学原理'),(select top 1 ID from [TBL_TeacherInfo] where Name='王栩栩'))
INSERT INTO [dbo].[TBL_ClassOhterCourse] VALUES (NEWID(),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（UI设计方向）'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='计算机视觉'),(select top 1 ID from [TBL_TeacherInfo] where Name='黄陵智'))
INSERT INTO [dbo].[TBL_ClassOhterCourse] VALUES (NEWID(),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（UI设计方向）'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='地震概论'),(select top 1 ID from [TBL_TeacherInfo] where Name='朴灿莲'))
INSERT INTO [dbo].[TBL_ClassOhterCourse] VALUES (NEWID(),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（UI设计方向）'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='量子力学'),(select top 1 ID from [TBL_TeacherInfo] where Name='杜星宇'))

INSERT INTO [dbo].[TBL_ClassOhterCourse] VALUES (NEWID(),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（服务与外包方向）'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='软件技术（软件外包服务方向）'),(select top 1 ID from [TBL_TeacherInfo] where Name='肖琪琪'))
INSERT INTO [dbo].[TBL_ClassOhterCourse] VALUES (NEWID(),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（服务与外包方向）'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='发展经济学'),(select top 1 ID from [TBL_TeacherInfo] where Name='龙丽娜'))
INSERT INTO [dbo].[TBL_ClassOhterCourse] VALUES (NEWID(),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（服务与外包方向）'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='公共物理学'),(select top 1 ID from [TBL_TeacherInfo] where Name='吉安娜'))
INSERT INTO [dbo].[TBL_ClassOhterCourse] VALUES (NEWID(),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（服务与外包方向）'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='量子力学'),(select top 1 ID from [TBL_TeacherInfo] where Name='杜星宇'))
INSERT INTO [dbo].[TBL_ClassOhterCourse] VALUES (NEWID(),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（服务与外包方向）'),(select top 1 ID from [TBL_CourseInfo] where CourseName ='地震概论'),(select top 1 ID from [TBL_TeacherInfo] where Name='朴灿莲'))

select * from [TBL_ClassOhterCourse]



------------------学生信息表------------------
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031201',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'王胜安',0,17,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='大数据' ),'/Image/Photo/photo01.png')
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031202',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'李星浩',0,18,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='大数据' ),'/Image/Photo/photo02.png')
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031203',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'薛佛世',0,17,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='大数据' ),'/Image/Photo/photo03.png')
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031204',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'梁程静',0,19,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='大数据' ),'/Image/Photo/photo04.png')
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031205',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'周依依',0,18,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='大数据' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031206',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'刘昼星',1,18,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='大数据' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031207',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'魏启虎',1,17,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='大数据' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031208',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'陈国柏',1,18,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='大数据' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031209',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'迟暮鹰',1,19,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='大数据' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031210',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'邢衷晓',1,19,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='大数据' ),null)
																											
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031211',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'潘曦研',0,19,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='计算机管理' ),'/Image/Photo/photo02.png')
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031212',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'倪情爽',0,20,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='计算机管理' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031213',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'严舒爱',0,17,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='计算机管理' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031214',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'莫郡蕊',0,18,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='计算机管理' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031215',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'萧愔愔',0,19,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='计算机管理' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031216',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'郑夜州',1,20,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='计算机管理' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031217',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'刘德耿',1,17,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='计算机管理' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031218',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'韦炜熊',1,17,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='计算机管理' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031219',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'黄准先',1,18,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='计算机管理' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031220',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'赵票威',1,19,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='计算机管理' ),null)
																											
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031221',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'卫蔽珠',0,19,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（UI设计方向）' ),'/Image/Photo/photo03.png')
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031222',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'吴湘意',0,20,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（UI设计方向）' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031223',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'陈春映',0,19,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（UI设计方向）' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031224',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'涂玄意',0,17,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（UI设计方向）' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031225',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'邢妤碧',0,18,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（UI设计方向）' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031226',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'王丹河',1,19,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（UI设计方向）' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031227',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'钟满坤',1,20,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（UI设计方向）' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031228',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'方经轻',1,17,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（UI设计方向）' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031229',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'李丞佩',1,18,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（UI设计方向）' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031230',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'石凯峰',1,19,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（UI设计方向）' ),null)
																											
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031231',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'刘意郡',0,19,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（服务与外包方向）' ),'/Image/Photo/photo04.png')
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031232',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'毕可音',0,19,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（服务与外包方向）' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031233',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'蔡妮玥',0,20,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（服务与外包方向）' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031234',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'韦简先',0,18,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（服务与外包方向）' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031235',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'袁琪琴',0,17,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（服务与外包方向）' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031236',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'盛俊宇',1,17,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（服务与外包方向）' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031237',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'岑修聪',1,18,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（服务与外包方向）' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031238',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'文可可',1,19,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（服务与外包方向）' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031239',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'陈晨含',1,20,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（服务与外包方向）' ),null)
INSERT INTO [dbo].[TBL_StudentInfo] VALUES (NEWID(),'2016031240',0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF,'陶益河',1,20,GETDATE(),(select top 1 ID from [TBL_RuleInfo] where [RuleName]='学生'),(select top 1 ID from [TBL_PostInfo] where [PostName]='学生' ),(select top 1 ID from [TBL_ClassInfo] where ClassName='软件技术（服务与外包方向）' ),null)


select * from [TBL_StudentInfo]

------------------职权连接信息------------------
INSERT INTO TBL_PowerInfo VALUES (NEWID(),'学生',3,'题库信息查看','/Student/QuestionBankView')
INSERT INTO TBL_PowerInfo VALUES (NEWID(),'学生',2,'历史考试信息','/Student/ExamQuery')
INSERT INTO TBL_PowerInfo VALUES (NEWID(),'学生',1,'在线考试入口','/Student/ExamOnline')
INSERT INTO TBL_PowerInfo VALUES (NEWID(),'普通教师',1,'发布学生考试','/Teacher/ExamRelease')
INSERT INTO TBL_PowerInfo VALUES (NEWID(),'普通教师',4,'题库信息管理','/Teacher/QuestionBankManage')
INSERT INTO TBL_PowerInfo VALUES (NEWID(),'普通教师',2,'带班学生信息','/Teacher/TakeClassStudent')
INSERT INTO TBL_PowerInfo VALUES (NEWID(),'普通教师',3,'带班考试信息','/Teacher/TakeClassExam')
INSERT INTO TBL_PowerInfo VALUES (NEWID(),'班主任',1,'本班考试信息','/Teacher/TheClassExam')
INSERT INTO TBL_PowerInfo VALUES (NEWID(),'教学主管',3,'修改课程信息','/Teacher/ChangeCourse')
INSERT INTO TBL_PowerInfo VALUES (NEWID(),'教学主管',1,'所有教师学生','/Teacher/AllTeacherAndStudent')
INSERT INTO TBL_PowerInfo VALUES (NEWID(),'教学主管',2,'所有考试信息','/Teacher/AllStudentExam')
INSERT INTO TBL_PowerInfo VALUES (NEWID(),'教学秘书',1,'修改班级信息','/Teacher/ChangeClass')
INSERT INTO TBL_PowerInfo VALUES (NEWID(),'管理员',1,'管理学生信息','/Admin/StudnetManage')
INSERT INTO TBL_PowerInfo VALUES (NEWID(),'管理员',2,'管理教师信息','/Admin/TeacherManage')
INSERT INTO TBL_PowerInfo VALUES (NEWID(),'管理员',3,'管理班级信息','/Admin/ClassManage')
