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
    public class RuleDAL
    {
        public DataTable GetRuleNameById(Guid id)
        {
            string sql = "select * from [dbo].[TBL_RuleInfo] where ID = @Id";
            SqlParameter[] pars = {
                new SqlParameter("@Id",SqlDbType.UniqueIdentifier)
            };
            pars[0].Value = id;
            DataTable table = SQLHelper.GetDataTable(sql, CommandType.Text, pars);
            return table;
        }
    }
}
