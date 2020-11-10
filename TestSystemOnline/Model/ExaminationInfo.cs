using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class ExaminationInfo:Entity
    {
        public string PaperTitle { get; set; }
        public string SingleList { get; set;}
        public string SingleOption { get; set; }
        public string JudgeList { get; set;}
        public string JudgeOption { get; set; }
        public Guid ClassID { get; set; }
        public Guid TeacherID { get; set; }
        public Guid CourseID { get; set; }
        public DateTime TestTime { get; set; }
        public string RollOutTime { get; set;}
    }
}
