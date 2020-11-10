using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.Mvc;

namespace TestSystemOnline.Controllers
{
    public class BaseController : Controller
    {
        // GET: Base 过滤器
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            base.OnActionExecuting(filterContext);

            User user = (User)Session["User"];
            if (user != null)
            {
                // 绑定前台显示的用户名、权限名以及头像图片
                ViewBag.Name  = user.Name;        
                ViewBag.Title = user.RuleName;
                ViewBag.Photo = user.ImgUrl == "" ? "/Image/Photo/temp.png" : user.ImgUrl;

                string postName = "";
                switch (user.RuleName) 
                {
                    case "学生":
                        ViewBag.RuleTemp = "Student";// 定向导航标识 作用于部分页面的导航URL

                        postName = new StudentBLL().GetPostName(user.ID);
                        ViewBag.PowerEnum = GetPowerEnum(postName);
                        break;
                    case "教师":
                        ViewBag.RuleTemp = "Teacher";// 定向导航标识 作用于部分页面的导航URL

                        postName = new TeacherBLL().GetPostName(user.ID);
                        ViewBag.PowerEnum = GetPowerEnum(postName);
                        break;
                    case "管理员":
                        ViewBag.RuleTemp = "Admin"; // 定向导航标识 作用于部分页面的导航URL

                        postName = new AdminBLL().GetPostName(user.ID);
                        ViewBag.PowerEnum = GetPowerEnum(postName);
                        break;
                    default:
                        break;
                }
            }
            else
            {
                filterContext.Result = RedirectToRoute("Default", new { Controller = "Account", Action = "Login" });
            }

        }
        /// <summary>
        /// 获取职权菜单
        /// </summary>
        /// <param name="postName"></param>
        /// <returns></returns>
        public DataTable GetPowerEnum(string postName)
        {
            string postList = string.Format($"'{postName}'");
            if (postName.Contains(","))
            {
                postList = postList.Replace(",", "','");
            }
            PowerBLL power = new PowerBLL();
            return power.GetPowerEnum(postList);
        }
    }
}