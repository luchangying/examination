using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ExaminationBLL
    {
        public ExaminationDAL examinationDAL = null;
        public ExaminationBLL()
        {
            examinationDAL = new ExaminationDAL();
        }
        /// <summary>
        /// 确认发布考试
        /// </summary>
        /// <param name="info"></param>
        /// <returns></returns>
        public bool ReleaseExamination(ExaminationInfo info)
        {
            return examinationDAL.ReleaseExamination(info);
        }
        /// <summary>
        /// 获取未完成考试
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        public DataTable GetUnfinishedExam(Guid classId,Guid userId)
        {
            return examinationDAL.GetUnfinishedExam(classId, userId);
        }
        /// <summary>
        /// 通过ID获取未过期考试试卷
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        public DataTable GetExamByID(Guid guid)
        {
            return examinationDAL.GetExamByID(guid);
        }
        /// <summary>
        /// 检测试卷是否重名
        /// </summary>
        /// <returns></returns>
        public bool CheckExamTitle(string title)
        {
            return examinationDAL.CheckExamTitle(title);
        }
    }
}
