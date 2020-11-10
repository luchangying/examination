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
    public class ClassDAL
    {
        /// <summary>
        /// 根据ID获取班级信息
        /// </summary>
        /// <returns></returns>
        public DataTable GetClassByID(Guid guid)
        {
            string sql = "select a.*,b.Number from view_class_ohter_course a left join view_class_student_count b on a.ClassName = b.ClassName where a.ID = @id";
            SqlParameter[] pars = {
                new SqlParameter("@id",SqlDbType.UniqueIdentifier)
            };
            pars[0].Value = guid;
            DataTable dataTable = SQLHelper.GetDataTable(sql, CommandType.Text, pars);
            return dataTable;
        }
        /// <summary>
        /// 获取班级数据总数
        /// </summary>
        /// <returns></returns>
        public int GetDataCount(string key, string value)
        {
            string sql = string.Format($"select COUNT(*) as Number from view_class_teacher  where {key} like '%{value}%'");
            DataTable table = SQLHelper.GetDataTable(sql, CommandType.Text, null);
            int count = Convert.ToInt32(table.Rows[0]["Number"]);
            return count;
        }
        /// <summary>
        /// 所有班级信息&班级信息查询
        /// </summary>
        /// <returns></returns>
        public DataTable GetClassQuery(int pageSize, int skip, string key, string value)
        {
            string sql = string.Format($"select top {pageSize} * from view_class_teacher where {key} like '%{value}%' and ID not in (select top {skip} id from view_class_teacher where {key} like '%{value}%' order by ID desc) order by ID desc");
            DataTable table = SQLHelper.GetDataTable(sql, CommandType.Text, null);
            return table;
        }
        /// <summary>
        /// 获取教师任课的所有班级
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        public DataTable GetTeacherAllClass(Guid guid)
        {
            string sql = "select * from view_teacher_ohter_class where ID = @guid";
            SqlParameter[] pars = {
                new SqlParameter("@guid",SqlDbType.UniqueIdentifier)
            };
            pars[0].Value = guid;
            DataTable dataTable = SQLHelper.GetDataTable(sql, CommandType.Text, pars);
            return dataTable;
        }
    }
}
