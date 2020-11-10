using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
	/// <summary>
	/// 课程专业
	/// </summary>
	public class CourseInfo:Entity
	{
		public string CourseName { get; set; } // 课程名称
		public string CourseMess { get; set; } // 课程信息
		public string Book { get; set; } // 使用教材
		public bool Compulsory { get; set; } // 是否必修

	}
}
