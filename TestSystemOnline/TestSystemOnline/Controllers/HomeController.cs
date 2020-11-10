using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TestSystemOnline.Controllers
{
    // 各用户起始页
    public class HomeController : BaseController
    {
        public ActionResult Student()
        {
            return View();
        }
        public ActionResult Teacher()
        {
            return View();
        }
        public ActionResult Admin()
        {
            return View();
        }
    }
}