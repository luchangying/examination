using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class JudgeBLL
    {
        public JudgeDAL judgeDAL = null;
        public JudgeBLL()
        {
            judgeDAL = new JudgeDAL();
        }
        /// <summary>
        /// 根据课程获取对应题库
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        public DataTable GetJudgeOptinsByCourse(Guid guid)
        {
            return judgeDAL.GetJudgeOptinsByCourse(guid);
        }
        /// <summary>
        /// 获取教师选中的判断题
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        public DataTable GetJudgeList(string where)
        {
            where = where.Substring(0, where.Length - 1);
            return judgeDAL.GetJudgeList(where,"asc");
        }
        /// <summary>
        /// 获取试卷中试题
        /// </summary>
        /// <param name="where"></param>
        /// <param name="order"></param>
        /// <returns></returns>
        public DataTable GetJudgeList(string where, string order)
        {
            return judgeDAL.GetJudgeList(where,order);
        }
    }
}
