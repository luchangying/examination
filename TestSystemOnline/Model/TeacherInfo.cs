using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class TeacherInfo:User
    {
        public string PostName { get; set; } 
        public PostInfo PostInfo { get; set; }
        public string CourseName { get; set; }
        public CourseInfo CourseInfo { get; set; }

    }
}
