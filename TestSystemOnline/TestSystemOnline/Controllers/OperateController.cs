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
    public class OperateController : BaseController
    {
        /// <summary>
        /// 个人基本信息
        /// </summary>
        /// <returns></returns>
        public ActionResult OwnInfo()
        {
            User user = (User)Session["User"];
            DataTable table = null;
            switch (user.RuleName)
            {
                case "学生":
                    StudentBLL student = new StudentBLL();
                    table = student.GetStudent(user.ID);
                    ViewBag.LoginID     = table.Rows[0]["LoginID"].ToString();
                    ViewBag.Sex         = (table.Rows[0]["Sex"].ToString() == "True" ? "男" : "女");
                    ViewBag.Age         = table.Rows[0]["Age"].ToString();
                    ViewBag.RuleName    = table.Rows[0]["RuleName"].ToString();
                    ViewBag.ChangeTime  = Convert.ToDateTime(table.Rows[0]["ChangeTime"]).ToString("yyyy年MM月dd日hh时mm分");
                    ViewBag.ClassName   = table.Rows[0]["ClassName"].ToString();
                    ViewBag.ClassMaster = table.Rows[0]["TeacherName"].ToString();
                    break;
                case "教师":
                    TeacherBLL teacher = new TeacherBLL();
                    table = teacher.GetTeacher(user.ID);
                    ViewBag.LoginID     = table.Rows[0]["LoginID"].ToString();
                    ViewBag.Sex         = (table.Rows[0]["Sex"].ToString() == "True" ? "男" : "女");
                    ViewBag.Age         = table.Rows[0]["Age"].ToString();
                    ViewBag.ChangeTime  = Convert.ToDateTime(table.Rows[0]["ChangeTime"]).ToString("yyyy年MM月dd日hh时mm分");
                    ViewBag.PostName    = table.Rows[0]["PostName"].ToString();
                    ViewBag.ClassMaster = (table.Rows[0]["ClassName"].ToString() == "" ? "不是" : "是");
                    ViewBag.ClassName   = (table.Rows[0]["ClassName"].ToString() == "" ? "不定" : table.Rows[0]["ClassName"].ToString());
                    ViewBag.CourseName  = table.Rows[0]["CourseName"].ToString();
                    break;
                case "管理员":
                    AdminBLL admin = new AdminBLL();
                    table = admin.GetAdmin(user.ID);
                    ViewBag.LoginID    = table.Rows[0]["LoginID"].ToString();
                    ViewBag.Sex        = (table.Rows[0]["Sex"].ToString() == "True" ? "男" : "女");
                    ViewBag.Age        = table.Rows[0]["Age"].ToString();
                    ViewBag.RuleName   = table.Rows[0]["RuleName"].ToString();
                    ViewBag.ChangeTime = Convert.ToDateTime(table.Rows[0]["ChangeTime"]).ToString("yyyy年MM月dd日hh时mm分");
                    break;
                default:
                    break;
            }
            return View();
        }
        /// <summary>
        /// 所有班级信息
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <returns></returns>
        public ActionResult AllClassPage(int pageIndex,string key, string value)
        {
            ViewBag.ClassKey    = key;              //搜索条件
            ViewBag.SearchValue = value;            //搜索的值

            ClassBLL classBLL = new ClassBLL();

            int PageSize   = 4;                                                       //页容量
            int TotalCount = classBLL.GetDataCount(key, value);                       //数据总量
            int TotalPages = (int)Math.Ceiling(TotalCount / (double)PageSize);        //分页张数
            int PageIndex  = pageIndex;                                               //页面索引
                        
            if (PageIndex >= TotalPages)
            {
                PageIndex = TotalPages - 1;
            }
            if (PageIndex < 0)
            {
                PageIndex = 0;
            }
            PagePading(PageSize,TotalCount,TotalPages,PageIndex);// 分页

            DataTable table = classBLL.GetClassQuery(PageIndex, PageSize, key, value);
            return View(table);
        }
        /// <summary>
        /// 查看班级详细信息
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        public ActionResult GetClassDetail(Guid guid)
        {
            DataTable table = new ClassBLL().GetClassByID(guid);
            if (table.Rows.Count > 0)
            {
                return Content(new AjaxResult
                {
                    state = ResultType.success.ToString(),
                    data = table
                }.ToJson());
            }
            else
            {
                return Content(new AjaxResult
                {
                    state = ResultType.info.ToString(),
                    data = null,
                    message = "获取详细信息失败！"
                }.ToJson());
            }
        }
        /// <summary>
        /// 所有课程信息
        /// </summary>
        /// <returns></returns>
        public ActionResult AllCoursePage(int pageIndex,string key, string value)
        {
            ViewBag.CourseKey   = key;              //搜索条件
            ViewBag.SearchValue = value;            //搜索的值

            CourseBLL courseBLL = new CourseBLL();

            int PageSize   = 8;                                                        //页容量
            int TotalCount = courseBLL.GetDataCount(key, value);                       //数据总量
            int TotalPages = (int)Math.Ceiling(TotalCount / (double)PageSize);         //分页张数
            int PageIndex  = pageIndex;                                                //页面索引

            if (PageIndex >= TotalPages)
            {
                PageIndex = TotalPages - 1;
            }
            if (PageIndex < 0)
            {
                PageIndex = 0;
            }
            PagePading(PageSize, TotalCount, TotalPages, PageIndex);// 分页

            DataTable table = courseBLL.GetCourseQuery(PageIndex, PageSize, key, value);
            return View(table);

        }
        /// <summary>
        /// 查看课程详细信息
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        public ActionResult GetCourseDetail(Guid guid)
        {
            DataTable table = new CourseBLL().GetCourseDetail(guid);
            if (table.Rows.Count > 0)
            {
                return Content(new AjaxResult
                {
                    state = ResultType.success.ToString(),
                    data = table
                }.ToJson());
            }
            else
            {
                return Content(new AjaxResult
                {
                    state = ResultType.info.ToString(),
                    data = null,
                    message = "获取详细信息失败！"
                }.ToJson());
            }
        }
        /// <summary>
        /// 分页按钮
        /// </summary>
        /// <param name="pageIndex">当前页</param>
        /// <param name="table"></param>
        /// <returns></returns>
        private void PagePading(int PageSize,int TotalCount,int TotalPages,int PageIndex)
        {
            if (TotalCount == 0)
            {
                ViewBag.PageIndex  = 0;
                ViewBag.PageSize   = 0;
                ViewBag.TotalCount = 0;
                ViewBag.TotalPages = 1;
            }
            else
            {
                ViewBag.PageIndex  = PageIndex;
                ViewBag.PageSize   = PageSize;
                ViewBag.TotalCount = TotalCount;
                ViewBag.TotalPages = TotalPages;
            }
            
        }
        /// <summary>
        /// 修改个人头像页面
        /// </summary>
        /// <returns></returns>
        public ActionResult ChangePhoto()
        {
            return View();
        }
        /// <summary>
        /// 修改个人头像方法
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult ChangePhoto(FormCollection form)
        { 
            // 如果Request.Files.Count 文件数为0上传不成功
            if (Request.Files.Count == 0)
            {
                return View();
            }

            // 文件大小大（以字节为单位）为0时，做一些操作
            var file = Request.Files[0];
            if (file.ContentLength == 0)
            {
                return View();
            }
            else
            {
                file = Request.Files[0];
                string target   = Server.MapPath("\\") + ("Image\\Photo\\");    // 取得目标文件夹的路径
                string filename = file.FileName;                                // 取得文件名字
                string path     = target + filename;                            // 获取存储的目标地址
                file.SaveAs(path);

                StudentBLL student = new StudentBLL();
                User user = (User)Session["User"];

                if (user != null)
                {
                    user.ImgUrl = "/Image/Photo/" + filename;
                    if (CheckUserChange(user))
                    {
                        Session["User"] = user;
                        return RedirectToAction("../Home/" + ViewBag.RuleTemp);
                    }
                    else
                    {
                        return View();
                    }
                }
                else
                {
                    Logout();
                }
            }
            return View();
        }
        /// <summary>
        /// 确认用户权限修改头像
        /// </summary>
        /// <param name="img">头像地址</param>
        /// <returns></returns>
        public bool CheckUserChange(User user)
        {
            switch (user.RuleName)
            {
                case "学生":
                    return new StudentBLL().ChangePhoto(user.ID, user.ImgUrl);
                case "教师":
                    return new TeacherBLL().ChangePhoto(user.ID, user.ImgUrl);
                case "管理员":
                    return new AdminBLL().ChangePhoto(user.ID, user.ImgUrl);
                default:
                    return false;
            }
        }
        /// <summary>
        /// 修改密码
        /// </summary>
        /// <returns></returns>
        public ActionResult ChangePass()
        {
            return View();
        }

        /// <summary>
        /// 确认修改密码状态
        /// </summary>
        /// <param name="oldPass"></param>
        /// <param name="newPass"></param>
        /// <param name="chePass"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult ChangePass(string oldPass, string newPass, string chePass)
        {
            User user = (User)Session["User"];
            if (newPass != chePass)
            {
                return Content(new AjaxResult
                {
                    state   = ResultType.info.ToString(),
                    message = "确认密码不一致！"
                }.ToJson());
            }
            if (user.LoginPass != oldPass)
            {
                return Content(new AjaxResult
                {
                    state   = ResultType.info.ToString(),
                    message = "原始密码错误！"
                }.ToJson());
            }
            if (CheckUserChange(user, newPass))
            {
                user.LoginPass  = newPass;
                user.PassWord   = SHA1.Encrpt(newPass);
                Session["User"] = user;

                return Content(new AjaxResult
                {
                    state   = ResultType.success.ToString(),
                    message = "密码修改成功！"
                }.ToJson());
            }
            else
            {
                return Content(new AjaxResult
                {
                    state   = ResultType.info.ToString(),
                    message = "密码修改失败！"
                }.ToJson());
            }
        }
        /// <summary>
        /// 确认用户权限执行修改
        /// </summary>
        /// <param name="password">密码</param>
        /// <returns></returns>
        public bool CheckUserChange(User user, string password)
        {
            switch (user.RuleName)
            {
                case "学生":
                    return new StudentBLL().StudentChangePass(user.ID, password);
                case "教师":
                    return new TeacherBLL().TeacherChangePass(user.ID, password);
                case "管理员":
                    return new AdminBLL().AdminChangePass(user.ID, password);
                default:
                    return false;
            }
        }
        /// <summary>
        /// 切换登录
        /// </summary>
        /// <returns></returns>
        public ActionResult Logout()
        {
            Session["User"] = null;
            return RedirectToAction("../Account/Login");
        }
    }
}