using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace CommandTools
{
	public class SHA1
	{
		/// <summary>
		/// 加密方法，SHA1为单向加密，无解密方法,受强攻击能力比MD5强
		/// </summary>
		/// <param name="pass">PassWord字段</param>
		/// <returns>二进制数组</returns>
		public static byte[] Encrpt(string pass)
		{

			var sha = new SHA1Managed();             // 使用.NET自带加密类
			var ascen = new ASCIIEncoding();

			byte[] ascpwd = ascen.GetBytes(pass);    // 把字符转ASCII
			return sha.ComputeHash(ascpwd);
		}
	}
}
