using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TestSystemOnline.Controllers
{
    public class AdminController : BaseController
    {
        /// <summary>
        /// 学生信息管理
        /// </summary>
        /// <returns></returns>
        public ActionResult StudnetManage()
        {
            return View();
        }
        /// <summary>
        /// 教师信息管理
        /// </summary>
        /// <returns></returns>
        public ActionResult TeahcerManage()
        {
            return View();
        }
        /// <summary>
        /// 班级信息管理
        /// </summary>
        /// <returns></returns>
        public ActionResult ClassManage()
        {
            return View();
        }
    }
}