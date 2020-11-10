using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
	/// <summary>
	/// 用户类，用户实体继承此类
	/// </summary>
	public class User:Entity 
	{
		public String LoginID { get; set; }           // 登录账号
		public byte[] PassWord { get; set; }        // 密码
        public string LoginPass { get; set;}
		public string Name { get; set; }            // 用户名
		public bool Sex { get; set; }                // 性别
		public int Age { get; set; }                 // 年龄
		public DateTime ChangeTime { get; set; }    // 密码最后修改时间
		public Guid RuleID { get; set; }             //   权限编号
		public string RuleName { get; set; }        //  权限名称
		public string ImgUrl { get; set; }          //  用户头像
	}
}
