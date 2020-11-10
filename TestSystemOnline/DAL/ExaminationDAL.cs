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
    public class ExaminationDAL
    {
        /// <summary>
        /// 确认发布考试
        /// </summary>
        /// <param name="info"></param>
        /// <returns></returns>
        public bool ReleaseExamination(ExaminationInfo info)
        {
            string sql = "insert into TBL_ExaminationPaper values (NEWID(),@paperTitle,@singleList,@singleOption,@judgeList,@judgeOption,@classId,@teacherId,@courseId,GETDATE(),@testTime,@rollOutTime)";

            SqlParameter[] pars = {
                new SqlParameter("@paperTitle",SqlDbType.NVarChar),
                new SqlParameter("@singleList",SqlDbType.NVarChar),
                new SqlParameter("@singleOption",SqlDbType.NVarChar),
                new SqlParameter("@judgeList",SqlDbType.NVarChar),
                new SqlParameter("@judgeOption",SqlDbType.NVarChar),
                new SqlParameter("@classId",SqlDbType.UniqueIdentifier),
                new SqlParameter("@teacherId",SqlDbType.UniqueIdentifier),
                new SqlParameter("@courseId",SqlDbType.UniqueIdentifier),
                new SqlParameter("@testTime",SqlDbType.NVarChar),
                new SqlParameter("@rollOutTime",SqlDbType.NVarChar)
            };
            pars[0].Value = info.PaperTitle;
            pars[1].Value = info.SingleList;
            pars[2].Value = info.SingleOption;
            pars[3].Value = info.JudgeList;
            pars[4].Value = info.JudgeOption;
            pars[5].Value = info.ClassID;
            pars[6].Value = info.TeacherID;
            pars[7].Value = info.CourseID;
            pars[8].Value = info.TestTime;
            pars[9].Value = info.RollOutTime;

            int result = SQLHelper.ExecutSql(sql, CommandType.Text, pars);
            return result > 0;
        }
        /// <summary>
        /// 获取未完成考试
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        public DataTable GetUnfinishedExam(Guid classId, Guid userId)
        {
            string sql = string.Format($"select * from view_exam_class_teacher_course where ClassID = @classId and ID not in (select PaperID from TBL_ResultDetail where StudentID = @userId) order by ReleaseTime desc");
            SqlParameter[] pars = {
                new SqlParameter("@classId",SqlDbType.UniqueIdentifier),
                new SqlParameter("@userId",SqlDbType.UniqueIdentifier)
            };
            pars[0].Value = classId;
            pars[1].Value = userId;

            DataTable table = SQLHelper.GetDataTable(sql, CommandType.Text, pars);
            return table;
        }
        /// <summary>
        /// 通过ID获取未过期考试试卷
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        public DataTable GetExamByID(Guid guid)
        {
            string sql = "select * from view_exam_class_teacher_course where ID = @id";
            SqlParameter[] pars = {
                new SqlParameter("@id",SqlDbType.UniqueIdentifier)
            };
            pars[0].Value = guid;

            DataTable table = SQLHelper.GetDataTable(sql, CommandType.Text, pars);
            return table;
        }
        /// <summary>
        /// 检测试卷是否重名
        /// </summary>
        /// <returns></returns>
        public bool CheckExamTitle(string title)
        {
            string sql = "select * from TBL_ExaminationPaper where PaperTitle = @title";
            SqlParameter[] pars = {
                new SqlParameter("@title",SqlDbType.NVarChar)
            };
            pars[0].Value = title;

            DataTable table = SQLHelper.GetDataTable(sql, CommandType.Text, pars);
            return table.Rows.Count > 0;
        }
    }
}
