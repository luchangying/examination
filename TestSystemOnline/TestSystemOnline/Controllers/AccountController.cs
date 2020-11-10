using CommandTools;
using System;
using System.Web.Mvc;
using BLL;
using System.Data;
using Model;

namespace TestSystemOnline.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        public ActionResult Login()
        {
            ViewBag.Title = "用户登录";
            return View();
        }
        /// <summary>
        /// 根据用户登录端口登录
        /// </summary>
        /// <param name="rule"></param>
        public DataTable CheckRule(string userName, string userPass, string rule)
        {
            // 根据权限获取对应用户数据
            switch (rule)
            {
                case "student":
                    return new StudentBLL().StudentLogin(userName, userPass);
                case "teacher":
                    return new TeacherBLL().TeacherLogin(userName, userPass);
                case "admin":
                    return new AdminBLL().AdminLogin(userName, userPass);
                default:
                    return null;
            }
        }
        /// <summary>
        /// 用户登录
        /// </summary>
        /// <param name="loginId">账号</param>
        /// <param name="loginPass">密码</param>
        /// <param name="code">验证码</param>
        /// <param name="rule">权限</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult CheckLogin(string loginId, string loginPass, string code, string rule)
        {
            string validateCode = Session["ValidateCode"].ToString();
            DataTable result = CheckRule(loginId, loginPass, rule);
            try
            {
                if (validateCode != code)
                {
                    return Content(new AjaxResult
                    {
                        state   = ResultType.info.ToString(),
                        message = "验证码错误！"
                    }.ToJson());
                }
                else if (result.Rows.Count > 0)
                {
                    User user = new User();

                    user.ID        = ObjectToGuid(result.Rows[0]["ID"]);
                    user.LoginID   = loginId;
                    user.LoginPass = loginPass;
                    user.PassWord  = SHA1.Encrpt(loginPass);
                    user.Name      = result.Rows[0]["Name"].ToString();
                    user.RuleID    = ObjectToGuid(result.Rows[0]["RuleID"]);
                    user.RuleName  = new RuleBLL().GetRuleNameById(result.Rows[0]["RuleID"].ToString());
                    user.ImgUrl    = result.Rows[0]["ImgUrl"].ToString();// 模型绑定结束

                    Session["User"] = user;

                    return Content(new AjaxResult
                    {
                        state   = ResultType.success.ToString(),
                        message = "登录成功！"
                    }.ToJson());
                }
                else
                {
                    return Content(new AjaxResult
                    {
                        state   = ResultType.error.ToString(),
                        message = "请验证帐号及密码,或者登录端口！"
                    }.ToJson());
                }
            }
            catch (Exception ex)
            {
                return Content(new AjaxResult
                {
                    state   = ResultType.error.ToString(),
                    message = ex.Message
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
            string s = obj.ToString();
            return Guid.Parse(s);
        }
        /// <summary>
        /// 验证码的校验
        /// </summary>
        /// <returns></returns>
        public ActionResult CheckCode()
        {
            ValidateCode validateCode = new ValidateCode();
            string code = validateCode.CreateValidateCode(4);
            Session["ValidateCode"] = code;
            byte[] bytes = validateCode.CreateValidateGraphic(code);
            return File(bytes, @"image/jpeg");
        }

    }
}