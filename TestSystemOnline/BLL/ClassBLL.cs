using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ClassBLL
    {
        public ClassDAL classDAL = null;
        public ClassBLL()
        {
            classDAL = new ClassDAL();
        }
        /// <summary>
        /// 根据ID获取班级信息
        /// </summary>
        /// <returns></returns>
        public DataTable GetClassByID(Guid guid)
        {
            return classDAL.GetClassByID(guid);
        }
        /// <summary>
        /// 获取班级数据总数
        /// </summary>
        /// <returns></returns>
        public int GetDataCount(string key, string value)
        {
            return classDAL.GetDataCount(key, value);
        }
        /// <summary>
        /// 所有班级信息&班级信息查询
        /// </summary>
        /// <returns></returns>
        public DataTable GetClassQuery(int pageIndex, int pageSize, string key, string value)
        {
            int skip = pageIndex * pageSize;
            return classDAL.GetClassQuery(pageSize, skip, key, value);
        }
        /// <summary>
        /// 获取教师任课的所有班级
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        public DataTable GetTeacherAllClass(Guid guid)
        {
            return classDAL.GetTeacherAllClass(guid);
        }
    }
};