using CommandTools;
using DAL.Folder;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class AdminDAL
    {
        /// <summary>
		/// 管理员登录
		/// </summary>
		/// <param name="loginId">账号密码</param>
		/// <param name="passWord">密码</param>
		/// <returns></returns>
		public DataTable AdminLogin(string loginId, string passWord)
        {
            string sql = "select * from [dbo].[TBL_AdminInfo] where LoginID = @loginId and [LoginPass] = @passWord";
            SqlParameter[] pars = {
                new SqlParameter("@loginId",SqlDbType.NVarChar),
                new SqlParameter("@passWord",SqlDbType.VarBinary)
            };
            pars[0].Value = loginId;
            pars[1].Value = SHA1.Encrpt(passWord);

            DataTable dataTable = SQLHelper.GetDataTable(sql, CommandType.Text, pars);
            return dataTable;
        }
        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="userId">账号</param>
        /// <param name="newPass">密码</param>
        /// <returns></returns>
        public bool AdminChangePass(Guid userId, string newPass)
        {
            string sql = "update TBL_AdminInfo set LoginPass = @newPass , ChangeTime = GETDATE() where ID = @userId";
            SqlParameter[] pars = {
                new SqlParameter("@userId",SqlDbType.UniqueIdentifier),
                new SqlParameter("@newPass",SqlDbType.VarBinary)
            };
            pars[0].Value = userId;
            pars[1].Value = SHA1.Encrpt(newPass);

            int result = SQLHelper.ExecutSql(sql, CommandType.Text, pars);
            return result > 0;
        }
        /// <summary>
        /// 单个管理员信息
        /// </summary>
        /// <param name="guid">GUID</param>
        /// <returns></returns>
		public DataTable GetAdmin(Guid guid)
        {
            string sql = "select * from v_get_admin where id = @id";
            SqlParameter[] pars = {
                new SqlParameter("@id",SqlDbType.UniqueIdentifier)
            };
            pars[0].Value = guid;

            DataTable dataTable = SQLHelper.GetDataTable(sql, CommandType.Text, pars);
            return dataTable;
        }
        /// <summary>
        /// 修改头像
        /// </summary>
        /// <param name="guid"></param>
        /// <param name="img"></param>
        /// <returns></returns>
        public bool ChangePhoto(Guid guid, string img)
        {
            string sql = "update TBL_AdminInfo set ImgUrl = @img where ID = @id";
            SqlParameter[] pars = {
                new SqlParameter("@id",SqlDbType.UniqueIdentifier),
                new SqlParameter("@img",SqlDbType.NVarChar)
            };
            pars[0].Value = guid;
            pars[1].Value = img;

            int result = SQLHelper.ExecutSql(sql, CommandType.Text, pars);
            return result > 0;
        }
        /// <summary>
        /// 获取用户职位
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        public string GetPostName(Guid guid)
        {
            string sql = "select post.PostName from TBL_AdminInfo temp left join TBL_PostInfo post on temp.PostID = post.ID where temp.ID = @guid";
            SqlParameter[] pars = {
                new SqlParameter("@guid",SqlDbType.UniqueIdentifier)
            };
            pars[0].Value = guid;

            DataTable dataTable = SQLHelper.GetDataTable(sql, CommandType.Text, pars);
            return dataTable.Rows[0]["PostName"].ToString();
        }
    }

}

