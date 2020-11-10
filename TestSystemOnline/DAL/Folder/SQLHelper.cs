using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Folder
{
	public class SQLHelper
	{
		/// <summary>
		/// 获取数据库连接串
		/// </summary>
		public static string connectionString = ConfigurationManager.ConnectionStrings["TestSystemOnlineConnectionString"].ToString();
		/// <summary>
		/// 查询
		/// </summary>
		/// <param name="sql">SQL语句</param>
		/// <param name="type">执行类型</param>
		/// <param name="pras">参数数组</param>
		/// <returns>数据表</returns>
		public static DataTable GetDataTable(string sql, CommandType type, SqlParameter[] pars)
		{
			using (SqlConnection conn = new SqlConnection(connectionString))
			{
				using (SqlDataAdapter ada = new SqlDataAdapter(sql, conn))
				{
					if (pars != null)
					{
						ada.SelectCommand.Parameters.AddRange(pars);
					}
					ada.SelectCommand.CommandType = CommandType.Text;
					DataTable dt = new DataTable();
					ada.Fill(dt);
					return dt;
				}
			}
		}
		/// <summary>
		/// 增删改
		/// </summary>
		/// <param name="sql">SQL语句</param>
		/// <param name="type">执行类型</param>
		/// <param name="pars">参数数组</param>
		/// <returns>受影响行数</returns>
		public static int ExecutSql(string sql, CommandType type, SqlParameter[] pars)
		{
			using (SqlConnection conn = new SqlConnection(connectionString))
			{
				conn.Open();
				using (SqlCommand com = new SqlCommand(sql, conn))
				{
					if (pars != null)
					{
						com.Parameters.AddRange(pars);
					}
					com.CommandType = CommandType.Text;
					int result = com.ExecuteNonQuery();
					conn.Close();
					return result;
				}
			}
		}
	}
}
