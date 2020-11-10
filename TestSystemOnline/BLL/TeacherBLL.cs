using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class TeacherBLL
    {
        public TeacherDAL teacherDAL = null;
        public TeacherBLL()
        {
            teacherDAL = new TeacherDAL();
        }
        /// <summary>
        /// 教师登录
        /// </summary>
        /// <param name="loginId">账号密码</param>
        /// <param name="passWord">密码</param>
        public DataTable TeacherLogin(string loginId, string passWord)
        {
            return teacherDAL.TeacherLogin(loginId, passWord);
        }
        /// <summary>
        /// 教师密码
        /// </summary>
        /// <param name="userId">账号</param>
        /// <param name="newPass">密码</param>
        /// <returns></returns>
        public bool TeacherChangePass(Guid userId, string newPass)
        {
            return teacherDAL.TeacherChangePass(userId, newPass);
        }
        /// <summary>
        /// 单个教师信息
        /// </summary>
        /// <param name="guid">GUID</param>
        /// <returns></returns>
		public DataTable GetTeacher(Guid guid)
        {
            return teacherDAL.GetTeacher(guid);
        }
        /// <summary>
        /// 修改头像
        /// </summary>
        /// <param name="guid"></param>
        /// <param name="img"></param>
        /// <returns></returns>
        public bool ChangePhoto(Guid guid, string img)
        {
            return teacherDAL.ChangePhoto(guid, img);
        }
        /// <summary>
        /// 获取用户职位
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        public string GetPostName(Guid guid)
        {
            return teacherDAL.GetPostName(guid);
        }
    }
}
