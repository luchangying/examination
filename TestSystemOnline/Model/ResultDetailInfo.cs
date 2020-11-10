using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class ResultDetailInfo:Entity
    {
        public Guid PaperID { get; set; }
        public Guid StudentID { get; set; }
        public string SelectList { get; set; }
        public int ResultPoint { get; set; }
        public DateTime OverTime { get; set; }

    }
}
