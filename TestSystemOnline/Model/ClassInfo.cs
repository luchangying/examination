using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
	/// <summary>
	/// 班级信息
	/// </summary>
	public class ClassInfo:Entity
	{
		public string ClassName { get; set; } // 班级名称
		public string ClassMaster { get; set; } // 班主任
		public string CourseID { get; set; } // 专业课程
	}
}
