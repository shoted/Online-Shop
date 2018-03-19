using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public enum ChangePwdResult
    {
        旧密码错误 = 0,
        两次输入密码不一致 = 1,
        修改成功 = 2,
        用户不存在=3
    }
}
