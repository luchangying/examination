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
    public class PowerDAL
    {
        /// <summary>
        /// 获取用户职权菜单
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        public DataTable GetPowerEnum(string where)
        {
            string sql = "select * from TBL_PowerInfo where PostName in (" + where + ") order by Sort";

            DataTable dataTable = SQLHelper.GetDataTable(sql, CommandType.Text, null);
            return dataTable;
        }
    }
}
