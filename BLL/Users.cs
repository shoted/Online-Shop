using System;
using System.Collections.Generic;
using System.Linq;
using Model;
using Shop.DAL;
using Shop.Model;

namespace Shop.BLL
{
    public partial class UsersBLL
    {

        /// <summary>
        /// 数据库操作对象
        /// </summary>
        private UsersDAL _dao = new UsersDAL();

        #region 向数据库中添加一条记录 +int Insert(Users model)
        /// <summary>
        /// 向数据库中添加一条记录
        /// </summary>
        /// <param name="model">要添加的实体</param>
        /// <returns>插入数据的ID</returns>
        public int Insert(Users model)
        {
            return _dao.Insert(model);
        }
        #endregion

        #region 删除一条记录 +int Delete(int userid)
        public int Delete(int userid)
        {
            return _dao.Delete(userid);
        }
        #endregion

        #region 根据主键ID更新一条记录 +int Update(Users model)
        /// <summary>
        /// 根据主键ID更新一条记录
        /// </summary>
        /// <param name="model">更新后的实体</param>
        /// <returns>执行结果受影响行数</returns>
        public int Update(Users model)
        {
            return _dao.Update(model);
        }


        #endregion

        #region 分页查询一个集合 +IEnumerable<Users> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
        /// <summary>
        /// 分页查询一个集合
        /// </summary>
        /// <param name="index">页码</param>
        /// <param name="size">页大小</param>
        /// <param name="wheres">条件匿名类</param>
        /// <param name="orderField">排序字段</param>
        /// <param name="isDesc">是否降序排序</param>
        /// <returns>实体集合</returns>
        public IEnumerable<Users> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
        {
            return _dao.QueryList(index, size, wheres, orderField, isDesc);
        }
        #endregion

        #region 查询单个模型实体 +Users QuerySingle(object wheres)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="wheres">条件匿名类</param>
        /// <returns>实体</returns>
        public Users QuerySingle(object wheres)
        {
            return _dao.QuerySingle(wheres);
        }
        #endregion

        #region 查询单个模型实体 +Users QuerySingle(int userid)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="userid">key</param>
        /// <returns>实体</returns>
        public Users QuerySingle(int userid)
        {
            return _dao.QuerySingle(userid);
        }
        #endregion

        #region 查询条数 +int QueryCount(object wheres)
        /// <summary>
        /// 查询条数
        /// </summary>
        /// <param name="wheres">查询条件</param>
        /// <returns>实体</returns>
        public int QueryCount(object wheres)
        {
            return _dao.QueryCount(wheres);
        }
        #endregion

        public LoginResult Login(string username, string password, out Users user)
        {
            user = null;
            // 根据用户名检索数据
            var temp = QuerySingle(new { userName = username });

            // 判断有没有查到
            if (temp == null)
            {
                return LoginResult.用户名不存在;
            }

            // 用户存在
            if (temp.userPassword != password.Md5()) // 密码加密
            {
                return LoginResult.密码错误;
            }

            if (temp.userStatus == 0)
            {
                return LoginResult.用户已被冻结;
            }
            temp.last_time = DateTime.Now;
            _dao.Update(temp);
            user = temp;
            return LoginResult.登录成功;
        }

        public LoginResult CookieLogin(string username, string password, out Users user)
        {
            user = null;
            // 根据用户名检索数据
            var temp = QuerySingle(new { userName = username });

            // 判断有没有查到
            if (temp == null)
            {
                return LoginResult.用户名不存在;
            }

            // 用户存在
            if (temp.userPassword != password) // 密码无需加密比对  因为cookie中本来就是加密的
            {
                return LoginResult.密码错误;
            }

            if (temp.userStatus == 0)
            {
                return LoginResult.用户已被冻结;
            }
            temp.last_time = DateTime.Now;
            _dao.Update(temp);
            user = temp;
            return LoginResult.登录成功;
        }

        public RegisterResult Register(string login, string password, out Users user)
        {
            user = null;
            // 校验用户名合法性
            var count = this.QueryCount(new { userName = login });
            if (count > 0)
            {
                // 数据库已存在
                return RegisterResult.用户名已存在;
            }
            Users model = new Users
            {
                userName = login,
                userPassword = password.Md5(), // 一定要加密 
                add_time = DateTime.Now,
                last_time = DateTime.Now,
                userStatus = 1,
                userStone = 0

            };
            //model.userStatus = 0;

            if (this.Insert(model) > 0)
            {
                user = QuerySingle(new { userName = login });
                if (user != null)
                {
                    return RegisterResult.注册成功;
                }

            }
            return RegisterResult.注册失败;
        }

        public ChangePwdResult ChangePwd(int userid,string oldPwd,string newPwd,string confirmPwd)
        {
            if (!newPwd.Equals(confirmPwd))
            {
                return ChangePwdResult.两次输入密码不一致;
            }
            Users user = new Users();
            user=_dao.QuerySingle(userid);
            if (user==null)
            {
                return ChangePwdResult.用户不存在;
            }
            if (!oldPwd.Md5().Equals(user.userPassword))
            {
                return ChangePwdResult.旧密码错误;
            }
            user.userPassword = newPwd.Md5();
            _dao.Update(user);
            return ChangePwdResult.修改成功;
            
        }
    }
}