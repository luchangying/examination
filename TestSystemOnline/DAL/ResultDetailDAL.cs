using DAL.Folder;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class ResultDetailDAL
    {
        /// <summary>
        /// 提交试卷
        /// </summary>
        /// <param name="resultPaper"></param>
        /// <returns></returns>
        public bool SubmitExam(ResultDetailInfo resultPaper)
        {
            string sql = "insert into TBL_ResultDetail values (NEWID(),@paperId,@userId,@selectList,@result,GETDATE())";
            SqlParameter[] pars = {
                new SqlParameter("@paperId",SqlDbType.UniqueIdentifier),
                new SqlParameter("@userId",SqlDbType.UniqueIdentifier),
                new SqlParameter("@selectList",SqlDbType.NVarChar),
                new SqlParameter("@result",SqlDbType.Int)
            };
            pars[0].Value = resultPaper.PaperID;
            pars[1].Value = resultPaper.StudentID;
            pars[2].Value = resultPaper.SelectList;
            pars[3].Value = resultPaper.ResultPoint;

            int result = SQLHelper.ExecutSql(sql, CommandType.Text, pars);
            return result > 0;
        }
        /// <summary>
        /// 获取学生个人考试历史信息
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        public DataTable GetResultDetail(Guid guid)
        {
            string sql = "select * from view_result_exam where studentid = @guid order by OverTime desc";
            SqlParameter[] pars = {
                new SqlParameter("@guid",SqlDbType.UniqueIdentifier)
            };
            pars[0].Value = guid;

            DataTable table = SQLHelper.GetDataTable(sql, CommandType.Text, pars);
            return table;
        }
        /// <summary>
        /// 查看历史考卷详细信息
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        public DataTable GethistoryDetailByID(Guid guid)
        {
            string sql = "select * from view_result_exam where ID = @guid";
            SqlParameter[] pars = {
                new SqlParameter("@guid",SqlDbType.UniqueIdentifier)
            };
            pars[0].Value = guid;

            DataTable table = SQLHelper.GetDataTable(sql, CommandType.Text, pars);
            return table;
        }
    }
}
