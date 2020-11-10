using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class SingleBLL
    {
        public SingleDAL singleDAL = null;
        public SingleBLL()
        {
            singleDAL = new SingleDAL();
        }
        /// <summary>
        /// 根据课程获取对应题库
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        public DataTable GetSingleOptinsByCourse(Guid guid)
        {
            return singleDAL.GetSingleOptinsByCourse(guid);
        }
        /// <summary>
        /// 获取教师选中的选择题
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        public DataTable GetSingleList(string where)
        {
            where = where.Substring(0, where.Length - 1);
            return singleDAL.GetSingleList(where, "asc");
        }
        /// <summary>
        /// 获取试卷中试题
        /// </summary>
        /// <param name="where"></param>
        /// <param name="order"></param>
        /// <returns></returns>
        public DataTable GetSingleList(string where,string order)
        {
            return singleDAL.GetSingleList(where, order);
        }
    }
}
