using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
	/// <summary>
	/// 附属课程
	/// </summary>
	public class ClassOhterCourseInfo:Entity
	{
		public Guid ClassID { get; set; } // 班级
		public Guid CourseID { get; set; } // 课程
		public Guid TeacherID { get; set; } // 教师
	}
}
