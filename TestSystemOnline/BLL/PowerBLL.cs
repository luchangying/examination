using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class PowerBLL
    {
        public PowerDAL power = null;
        public PowerBLL()
        {
            power = new PowerDAL();
        }
        /// <summary>
        /// 获取用户职权菜单
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        public DataTable GetPowerEnum(string where)
        {
            return power.GetPowerEnum(where);
        }
    }
}
