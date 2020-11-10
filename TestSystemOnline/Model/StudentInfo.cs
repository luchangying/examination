using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
	/// <summary>
	/// 学生信息
	/// </summary>
	public class StudentInfo:User
	{
		public string ClassName { get; set; } // 班级名称
		public ClassInfo ClassInfo { get; set; } // 班级
	}
}
