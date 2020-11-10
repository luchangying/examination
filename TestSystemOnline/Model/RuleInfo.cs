using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class RuleInfo:Entity
    {
        public string RuleName { get; set; }
        public RuleInfo()
        {
            this.ID = Guid.NewGuid();
        }
        public RuleInfo(string ruleName)
        {
            this.ID = Guid.NewGuid();
            this.RuleName = ruleName;
        }
    }
}
