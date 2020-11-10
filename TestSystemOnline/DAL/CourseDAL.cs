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
    public class CourseDAL
    {
        /// <summary>
        /// 查看课程详细信息
        /// </summary>
        /// <returns></returns>
        public DataTable GetCourseDetail(Guid guid)
        {
            string sql = "select c.*,t.Name from TBL_CourseInfo c left join TBL_TeacherInfo t on c.ID = t.CourseID where c.id = @id";
            SqlParameter[] pars = {
                new SqlParameter("@id",SqlDbType.UniqueIdentifier)
            };
            pars[0].Value = guid;
            DataTable dataTable = SQLHelper.GetDataTable(sql, CommandType.Text, pars);
            return dataTable;
        }
        /// <summary>
        /// 获取课程数据总数
        /// </summary>
        /// <returns></returns>
        public int GetDataCount(string key, string value)
        {
            string sql = string.Format($"select COUNT(*) as Number from TBL_CourseInfo c left join TBL_TeacherInfo t on c.ID = t.CourseID where {key} like '%{value}%' ");
            DataTable table = SQLHelper.GetDataTable(sql, CommandType.Text, null);
            int count = Convert.ToInt32(table.Rows[0]["Number"]);
            return count;
        }
        /// <summary>
        /// 所有课程信息&课程信息查询
        /// </summary>
        /// <returns></returns>
        public DataTable GetCourseQuery(int pageSize, int skip, string key, string value)
        {
            string sql = string.Format($"select top {pageSize} *,t.Name from TBL_CourseInfo c left join TBL_TeacherInfo t on c.ID = t.CourseID where {key} like '%{value}%' and c.ID not in (select top {skip} id from TBL_CourseInfo where {key} like '%{value}%' order by ID desc) order by c.ID desc");
            
            DataTable table = SQLHelper.GetDataTable(sql, CommandType.Text, null);
            return table;
        }
    }
}
