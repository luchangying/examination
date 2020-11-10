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
    public class ResultDetailBLL
    {
        public ResultDetailDAL detailDAL = null;
        public ResultDetailBLL()
        {
            detailDAL = new ResultDetailDAL();
        }
        /// <summary>
        /// 提交试卷
        /// </summary>
        /// <param name="resultPaper"></param>
        /// <returns></returns>
        public bool SubmitExam(ResultDetailInfo resultPaper)
        {
            return detailDAL.SubmitExam(resultPaper);
        }
        /// <summary>
        /// 获取学生个人考试历史信息
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        public DataTable GetResultDetail(Guid guid)
        {
            return detailDAL.GetResultDetail(guid);
        }
        /// <summary>
        /// 查看历史考卷详细信息
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        public DataTable GethistoryDetailByID(Guid guid)
        {
            return detailDAL.GethistoryDetailByID(guid);
        }
    }
}
