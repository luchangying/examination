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
    public class SingleDAL
    {
        /// <summary>
        /// 根据课程获取对应题库
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        public DataTable GetSingleOptinsByCourse(Guid guid)
        {
            string sql = "select s.*,c.CourseName,t.Name from TBL_SingleQuestion s left join TBL_CourseInfo c on s.CourseID = c.ID left join TBL_TeacherInfo t on s.TeacherID = t.ID where c.ID = @id";
            SqlParameter[] pars = {
                new SqlParameter("@id",SqlDbType.UniqueIdentifier)
            };
            pars[0].Value = guid;

            DataTable dataTable = SQLHelper.GetDataTable(sql, CommandType.Text, pars);
            return dataTable;
        }
        /// <summary>
        /// 获取教师选中的选择题
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        public DataTable GetSingleList(string where,string order)
        {
            string sql = string.Format($"select * from TBL_SingleQuestion where ID in({where}) order by ID {order}");
            DataTable dataTable = SQLHelper.GetDataTable(sql, CommandType.Text, null);
            return dataTable;
        }
    }
}
