using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class CourseBLL
    {
        public CourseDAL courseDAL = null;
        public CourseBLL()
        {
            courseDAL = new CourseDAL();
        }
        /// <summary>
        /// 查看课程详细信息
        /// </summary>
        /// <returns></returns>
        public DataTable GetCourseDetail(Guid guid)
        {
            return courseDAL.GetCourseDetail(guid);
        }
        /// <summary>
        /// 获取课程数据总数
        /// </summary>
        /// <returns></returns>
        public int GetDataCount(string key, string value)
        {
            return courseDAL.GetDataCount(key, value);
        }
        /// <summary>
        /// 所有课程信息&课程信息查询
        /// </summary>
        /// <returns></returns>
        public DataTable GetCourseQuery(int pageIndex, int pageSize, string key, string value)
        {
            int skip = pageIndex * pageSize;
            return courseDAL.GetCourseQuery(pageSize, skip, key, value);
        }
    }
}
