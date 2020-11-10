using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class StudentBLL
    {
        public StudentDAL studentDAL = null;
        public StudentBLL()
        {
            studentDAL = new StudentDAL();
        }
        /// <summary>
        /// 学生登录
        /// </summary>
        /// <param name="loginId">账号密码</param>
        /// <param name="passWord">密码</param>
        public DataTable StudentLogin(string loginId, string passWord)
        {
            return studentDAL.StudentLogin(loginId, passWord);
        }
        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="userId">账号</param>
        /// <param name="oldPass">密码</param>
        /// <returns></returns>
        public bool StudentChangePass(Guid userId, string newPass)
        {
            return studentDAL.StudentChangePass(userId, newPass);
        }
        /// <summary>
        /// 单个学生信息
        /// </summary>
        /// <param name="guid">GUID</param>
        /// <returns></returns>
		public DataTable GetStudent(Guid guid)
        {
            return studentDAL.GetStudent(guid);
        }
        /// <summary>
        /// 修改头像
        /// </summary>
        /// <param name="guid"></param>
        /// <param name="img"></param>
        /// <returns></returns>
        public bool ChangePhoto(Guid guid, string img)
        {
            return studentDAL.ChangePhoto(guid, img);
        }
        /// <summary>
        /// 获取用户职位
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        public string GetPostName(Guid guid)
        {
            return studentDAL.GetPostName(guid);
        }
    }
}
