using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class RuleBLL
    {
        public RuleDAL rule = null;
        public RuleBLL()
        {
            rule = new RuleDAL();
        }
        public string GetRuleNameById(string id)
        {
            DataTable table = rule.GetRuleNameById(Guid.Parse(id));
            return table.Rows[0]["RuleName"].ToString();
        }
    }
}
