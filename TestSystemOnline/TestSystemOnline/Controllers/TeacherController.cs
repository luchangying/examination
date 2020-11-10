using BLL;
using CommandTools;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace TestSystemOnline.Controllers
{
    public class TeacherController : BaseController
    {
        /// <summary>
        /// 班级学生所有考试信息
        /// </summary>
        /// <returns></returns>
        public ActionResult TheClassExam()
        {
            return View();
        }
        /// <summary>
        /// 题库信息管理
        /// </summary>
        /// <returns></returns>
        public ActionResult QuestionBankManage()
        {
            return View();
        }
        /// <summary>
        /// 考试信息发布页面显示
        /// </summary>
        /// <returns></returns>
        public ActionResult ExamRelease()
        {
            // 获取教师信息
            User user   = (User)Session["User"];
            Guid userId = user.ID;
            DataTable userTable = new TeacherBLL().GetTeacher(userId);
            ViewBag.TeacherName = userTable.Rows[0]["Name"];
            ViewBag.CourseName  = userTable.Rows[0]["CourseName"];


            // 教师任课的所有班级
            DataTable classTable = new ClassBLL().GetTeacherAllClass(userId);

            // 教师专业的题库数据
            Guid courseId = Guid.Parse(userTable.Rows[0]["CourseID"].ToString());
            DataTable singleTable = new SingleBLL().GetSingleOptinsByCourse(courseId);
            DataTable judegTable  = new JudgeBLL().GetJudgeOptinsByCourse(courseId);

            // 打包DataSet传到前端
            DataSet ds = new DataSet();
            ds.Tables.Add(singleTable);
            ds.Tables.Add(judegTable);
            ds.Tables.Add(classTable);

            return View(ds);
        }
        /// <summary>
        /// 考卷预览试卷
        /// </summary>
        /// <param name="singleList"></param>
        /// <param name="judgeList"></param>
        /// <returns></returns>
        public ActionResult ViewSelectedPaper(string paperTitle, string singleList, string judgeList)
        {
            // 教师选中的试卷题目数据
            DataTable singleTable = new SingleBLL().GetSingleList(singleList);
            DataTable judgeTable  = new JudgeBLL().GetJudgeList(judgeList);

            DataSet dataSet = new DataSet();
            dataSet.Tables.Add(singleTable);
            dataSet.Tables.Add(judgeTable);

            if (singleTable.Rows.Count > 0 && judgeTable.Rows.Count > 0)
            {
                return Content(new AjaxResult
                {
                    state = ResultType.success.ToString(),
                    data  = dataSet
                }.ToJson());
            }
            else
            {
                return Content(new AjaxResult
                {
                    state   = ResultType.info.ToString(),
                    data    = null,
                    message = "试卷预览失败，题量出错！"
                }.ToJson());
            }
        }
        /// <summary>
        /// 考卷发布确认提交
        /// </summary>
        /// <param name="paperTitle">试卷名称</param>
        /// <param name="singleList">选择列表</param>
        /// <param name="judgeList">判断列表</param>
        /// <param name="classId">考试班级</param>
        /// <param name="testTime">考试结束时间</param>
        /// <param name="rollOutTime">考试时长</param>
        /// <returns></returns>
        public ActionResult ReleaseCheck(string paperTitle, string singleList, string judgeList, string classId, string testTime, string rollOutTime)
        {
            #region 取出教师信息，随机排序考题选项
            User user     = (User)Session["User"];
            Guid userId   = user.ID; // 教师ID
            Guid courseId = Guid.Parse(new TeacherBLL().GetTeacher(userId).Rows[0]["CourseID"].ToString());// 科目ID

            string single_options = GetSingleOptionSrot();         // 随机选择题排序规则 例：ABCD，CBDA...           
            string judge_options  = GetJudgeOptionSrot();          // 随机判断题排序规则 例：BA，AB...
            #endregion

            // 检测试卷名是否唯一
            bool checkTitle = new ExaminationBLL().CheckExamTitle(paperTitle);
            if (checkTitle)
            {
                return Content(new AjaxResult
                {
                    state   = ResultType.info.ToString(),
                    message = string.Format($"试卷名重复！")
                }.ToJson());
            }

            // 整合考试信息Model
            ExaminationInfo examination = new ExaminationInfo();
            examination.PaperTitle   = paperTitle.Trim();
            examination.SingleList   = singleList.Substring(0, singleList.Length - 1);
            examination.SingleOption = single_options;
            examination.JudgeList    = judgeList.Substring(0, judgeList.Length - 1);
            examination.JudgeOption  = judge_options;
            examination.ClassID      = Guid.Parse(classId);
            examination.TeacherID    = userId;
            examination.CourseID     = courseId;
            examination.TestTime     = DateTime.Parse(testTime);
            examination.RollOutTime  = rollOutTime;

            // 提交结果
            bool release = new ExaminationBLL().ReleaseExamination(examination);
            switch (release)
            {
                case true:
                    return Content(new AjaxResult
                    {
                        state   = ResultType.info.ToString(),
                        message = string.Format($"《{paperTitle}》 发布成功！")
                    }.ToJson());
                case false:
                    return Content(new AjaxResult
                    {
                        state   = ResultType.info.ToString(),
                        message = string.Format($"《{paperTitle}》 发布失败！")
                    }.ToJson());
                default:
                    return Content(new AjaxResult
                    {
                        state   = ResultType.error.ToString(),
                        message = string.Format($"未知错误！")
                    }.ToJson());
            }
        }
        /// <summary>
        /// 单选题的随机选项排序
        /// </summary>
        /// <returns></returns>
        public string GetSingleOptionSrot()
        {
            StringBuilder options_sort = new StringBuilder();
            List<string> options = new List<string> { "A", "B", "C", "D" };
            for (int i = 0; i < 20; i++)
            {
                Random random = new Random(Guid.NewGuid().GetHashCode());
                List<string> new_options = new List<string>();
                foreach (string item in options)
                {
                    new_options.Insert(random.Next(new_options.Count + 1), item);
                }
                foreach (string item in new_options)
                {
                    options_sort.Append(item);
                }
                options_sort.Append(",");
            }
            return options_sort.ToString().Substring(0, options_sort.Length - 1);
        }
        /// <summary>
        /// 判断题的随机选项排序
        /// </summary>
        /// <returns></returns>
        public string GetJudgeOptionSrot()
        {
            StringBuilder options_sort = new StringBuilder();
            for (int i = 0; i < 10; i++)
            {
                int num = new Random(Guid.NewGuid().GetHashCode()).Next(10);
                string temp = num > 4 ? "AB," : "BA,";
                options_sort.Append(temp);
            }
            return options_sort.ToString().Substring(0, options_sort.Length - 1);
        }
        /// <summary>
        /// 所带班级学生信息
        /// </summary>
        /// <returns></returns>
        public ActionResult TakeClassStudent()
        {
            return View();
        }
        /// <summary>
        /// 所带班级专业考试信息
        /// </summary>
        /// <returns></returns>
        public ActionResult TakeClassExam()
        {
            return View();
        }
        /// <summary>
        /// 修改课程信息
        /// </summary>
        /// <returns></returns>
        public ActionResult ChangeCourse()
        {
            return View();
        }
        /// <summary>
        /// 所有教师学生信息
        /// </summary>
        /// <returns></returns>
        public ActionResult AllTeacherAndStudent()
        {
            return View();
        }
        /// <summary>
        /// 所有学生考试信息
        /// </summary>
        /// <returns></returns>
        public ActionResult AllStudentExam()
        {
            return View();
        }
        /// <summary>
        /// 修改班级信息
        /// </summary>
        /// <returns></returns>
        public ActionResult ChangeClass()
        {
            return View();
        }
    }
}