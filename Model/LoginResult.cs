using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public enum LoginResult
    {
        用户名不存在 = 0,
        密码错误 = 1,
        用户已被冻结 = 2,
        登录成功 = 3
    }
}
