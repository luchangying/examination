using BLL;
using CommandTools;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TestSystemOnline.Controllers
{
    public class StudentController : BaseController
    {
        /// <summary>
        /// 题库查看
        /// </summary>
        /// <returns></returns>
        public ActionResult QuestionBankView()
        {
            return View();
        }
        /// <summary>
        /// 学生历史考试
        /// </summary>
        /// <returns></returns>
        public ActionResult ExamQuery()
        {
            User user = (User)Session["User"];
            
            DataTable table = new ResultDetailBLL().GetResultDetail(user.ID);               // 查询该学生所有历史考试

            return View(table);
        }
        /// <summary>
        /// 历史考试详细信息
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        public ActionResult HistoryExam(Guid guid)
        {
            DataTable table_paper = new ResultDetailBLL().GethistoryDetailByID(guid);             // 获取试卷信息

            // 给前台传递试卷信息
            ViewBag.PaperName   = table_paper.Rows[0]["PaperTitle"].ToString();                                                      // 试卷名称
            ViewBag.ReleaseTime = Convert.ToDateTime(table_paper.Rows[0]["ReleaseTime"]).ToString("yyyy年MM月dd日HH时mm分");          // 发布时间
            ViewBag.CourseName  = table_paper.Rows[0]["CourseName"].ToString();                                                      // 科目名
            ViewBag.TeacherName = table_paper.Rows[0]["Name"].ToString();                                                            // 教师名
            ViewBag.RollOutTime = table_paper.Rows[0]["RollOutTime"].ToString();
            ViewBag.ResultPoint = table_paper.Rows[0]["Result"].ToString();
            ViewBag.OverTime    = Convert.ToDateTime(table_paper.Rows[0]["OverTime"]).ToString("yyyy/MM/dd HH:mm");                  // 提交时间

            // 选择题信息
            string single_list = table_paper.Rows[0]["SingleList"].ToString();
            DataTable single_table = new SingleBLL().GetSingleList(single_list, "desc");                // 选择题信息列表   

            // 判断题信息
            string judge_list = table_paper.Rows[0]["JudgeList"].ToString();
            DataTable judge_table = new JudgeBLL().GetJudgeList(judge_list, "desc");                    // 判断题信息列表  

            // 选择题排序规则
            string single_option = table_paper.Rows[0]["SingleOption"].ToString();
            DataTable s_option_table = GetOptionsTable(single_option);                                  // 选择题选项排序规则

            // 判断题排序规则
            string judge_option = table_paper.Rows[0]["JudgeOption"].ToString();
            DataTable j_option_table = GetOptionsTable(judge_option);                                   // 判断题选项排序规则

            // 用户选择答案
            string user_select = table_paper.Rows[0]["SelectList"].ToString();
            DataTable select_table = GetOptionsTable(user_select);

            // 打包提交
            DataSet dataSet = new DataSet();
            dataSet.Tables.Add(single_table);
            dataSet.Tables.Add(s_option_table);
            dataSet.Tables.Add(judge_table);
            dataSet.Tables.Add(j_option_table);
            dataSet.Tables.Add(select_table);

            return View(dataSet);
        }
        /// <summary>
        /// 在线考试
        /// </summary>
        /// <returns></returns>
        public ActionResult ExamOnline()
        {
            User user = (User)Session["User"];
            Guid userId = user.ID;

            Guid classId = ObjectToGuid(new StudentBLL().GetStudent(userId).Rows[0]["ClassID"]);    // 获取班级ID
            
            DataTable table = new ExaminationBLL().GetUnfinishedExam(classId,userId);               // 查询该班级所有未过期的未考测试

            return View(table);
        }
        /// <summary>
        /// 开始考试
        /// </summary>
        /// <returns></returns>
        public ActionResult BeginExam(Guid guid)
        {
            DataTable table_paper = new ExaminationBLL().GetExamByID(guid);             // 获取试卷信息

            // 检测考试是否过期
            if (table_paper.Rows.Count == 0)
            {
                return RedirectToAction("../Student/ExamOnline");
            }
            // 给前台传递试卷信息
            ViewBag.PaperName   = table_paper.Rows[0]["PaperTitle"].ToString();                                                      // 试卷名称
            ViewBag.ReleaseTime = Convert.ToDateTime(table_paper.Rows[0]["ReleaseTime"]).ToString("yyyy年MM月dd日HH时mm分");          // 发布时间
            ViewBag.CourseName  = table_paper.Rows[0]["CourseName"].ToString();                                                      // 科目名
            ViewBag.TeacherName = table_paper.Rows[0]["Name"].ToString();                                                            // 教师名
            ViewBag.RollOutTime = table_paper.Rows[0]["RollOutTime"].ToString();                                                     // 考试时长

            // 选择题信息
            string single_list     = table_paper.Rows[0]["SingleList"].ToString();         
            DataTable single_table = new SingleBLL().GetSingleList(single_list, "desc");                // 选择题信息列表   

            // 判断题信息
            string judge_list     = table_paper.Rows[0]["JudgeList"].ToString();           
            DataTable judge_table = new JudgeBLL().GetJudgeList(judge_list, "desc");                    // 判断题信息列表  

            // 选择题排序规则
            string single_option     = table_paper.Rows[0]["SingleOption"].ToString();
            DataTable s_option_table = GetOptionsTable(single_option);                                  // 选择题选项排序规则

            // 判断题排序规则
            string judge_option      = table_paper.Rows[0]["JudgeOption"].ToString();
            DataTable j_option_table = GetOptionsTable(judge_option);                                   // 判断题选项排序规则

            // 打包提交
            DataSet dataSet = new DataSet();
            dataSet.Tables.Add(single_table);
            dataSet.Tables.Add(s_option_table);
            dataSet.Tables.Add(judge_table);
            dataSet.Tables.Add(j_option_table);


            // 试卷信息
            Session["PaperID"] = guid;
            Session["PaperOptions"] = dataSet; // 试卷题目所有信息（包含排序规则）

            return View(dataSet);
        }
        /// <summary>
        /// 试题排序字符串转表格
        /// </summary>
        /// <param name="list">试卷排序字符串</param>
        /// <returns></returns>
        public DataTable GetOptionsTable(string list)
        {
            DataTable option_table = new DataTable();
            DataColumn column = new DataColumn("Option", Type.GetType("System.String"));
            option_table.Columns.Add(column);
            
            string[] optionArray = list.Split(',');
            foreach (var item in optionArray)
            {
                option_table.Rows.Add(item);
            }
            return option_table;
        }
        /// <summary>
        /// 试卷提交
        /// </summary>
        /// <param name="singleList"></param>
        /// <param name="judgeList"></param>
        /// <returns></returns>
        public ActionResult SubmitExam(string selectList)
        {
            // 基本信息
            User user       = (User)Session["User"];
            Guid userId     = user.ID;
            Guid paperId    = (Guid)Session["PaperID"];
            DataSet dataSet = (DataSet)Session["PaperOptions"];

            // 考题排序规则整合
            DataTable option_paper = dataSet.Tables[1];
            foreach (DataRow item in dataSet.Tables[3].Rows)
            {
                option_paper.Rows.Add(item.ItemArray);
            }

            // 学生答题
            List<int> vs = new List<int>();
            string list = selectList;                      // 学生选中项
            list = list.Substring(0, list.Length - 1);     
            string[] option_submit = list.Split(',');      

            // 学生选中项位置
            foreach (var item in option_submit)
            {
                switch (item)  
                {
                    case "A":
                        vs.Add(0);
                        break;
                    case "B":
                        vs.Add(1);
                        break;
                    case "C":
                        vs.Add(2);
                        break;
                    case "D":
                        vs.Add(3);
                        break;
                    default:
                        vs.Add(-1);
                        break;
                }
            }
            // 改卷
            int resultPoint = 0;
            for (int i = 0; i < 30; i++)
            {
                string option = option_paper.Rows[i]["Option"].ToString();
                int select    = vs[i];

                if (select == -1)
                {
                    resultPoint += 0;// 未选中零分
                    continue;
                }
                if (option[select] == 'A')
                {
                    resultPoint += i < 20 ? 3 : 4;// 选项为A正确，前20题选择题每题3分，后10题判断题每题4分
                }
            }
            ResultDetailInfo result = new ResultDetailInfo();
            result.PaperID     = paperId;
            result.StudentID   = userId;
            result.SelectList  = list;
            result.ResultPoint = resultPoint;
            
            bool resultDetail = new ResultDetailBLL().SubmitExam(result);
            if (resultDetail)
            {
                return Content(new AjaxResult
                {
                    state   = ResultType.success.ToString(),
                    message = "提交成功！成绩：" + resultPoint + "分"
                }.ToJson());
            }
            else
            {
                return Content(new AjaxResult
                {
                    state   = ResultType.info.ToString(),
                    message = "提交失败！请重新考试！"
                }.ToJson());
            }
        }
        /// <summary>
        /// Object转型Guid
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public Guid ObjectToGuid(object obj)
        {
            return Guid.Parse(obj.ToString());
        }
    }
}