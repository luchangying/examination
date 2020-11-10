using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class AdminBLL
    {
        public AdminDAL adminDAL = null;
        public AdminBLL()
        {
            adminDAL = new AdminDAL();
        }
        /// <summary>
        /// 管理员登录
        /// </summary>
        /// <param name="loginId">账号密码</param>
        /// <param name="passWord">密码</param>
        public DataTable AdminLogin(string loginId, string passWord)
        {
            return adminDAL.AdminLogin(loginId, passWord);
        }
        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="userId">账号</param>
        /// <param name="newPass">密码</param>
        /// <returns></returns>
        public bool AdminChangePass(Guid userId, string newPass)
        {
            return adminDAL.AdminChangePass(userId, newPass);
        }
        /// <summary>
        /// 单个管理员信息
        /// </summary>
        /// <param name="guid">GUID</param>
        /// <returns></returns>
		public DataTable GetAdmin(Guid guid)
        {
            return adminDAL.GetAdmin(guid);
        }
        /// <summary>
        /// 修改头像
        /// </summary>
        /// <param name="guid"></param>
        /// <param name="img"></param>
        /// <returns></returns>
        public bool ChangePhoto(Guid guid, string img)
        {
            return adminDAL.ChangePhoto(guid, img);
        }
        /// <summary>
        /// 获取用户职位
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        public string GetPostName(Guid guid)
        {
            return adminDAL.GetPostName(guid);
        }
    }
}
