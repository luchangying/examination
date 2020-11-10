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
    public class JudgeDAL
    {
        /// <summary>
        /// 根据课程获取对应题库
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        public DataTable GetJudgeOptinsByCourse(Guid guid)
        {
            string sql = "select j.*,c.CourseName,t.Name from TBL_JudgeQuestion j left join TBL_CourseInfo c on j.CourseID = c.ID left join TBL_TeacherInfo t on j.TeacherID = t.ID where c.ID = @id";
            SqlParameter[] pars = {
                new SqlParameter("@id",SqlDbType.UniqueIdentifier)
            };
            pars[0].Value = guid;

            DataTable dataTable = SQLHelper.GetDataTable(sql, CommandType.Text, pars);
            return dataTable;
        }
        /// <summary>
        /// 获取教师选中的判断题
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        public DataTable GetJudgeList(string where,string order)
        {
            string sql = string.Format($"select * from TBL_JudgeQuestion where ID in({where}) order by ID {order}");
            DataTable dataTable = SQLHelper.GetDataTable(sql, CommandType.Text, null);
            return dataTable;
        }
    }
}
