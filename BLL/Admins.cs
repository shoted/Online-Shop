using System;
using System.Collections.Generic;
using System.Linq;
using Shop.DAL;
using Shop.Model;

namespace Shop.BLL
{
    public partial class AdminsBLL
    {

        /// <summary>
        /// 数据库操作对象
        /// </summary>
        private AdminsDAL _dao = new AdminsDAL();

        #region 向数据库中添加一条记录 +int Insert(Admins model)
        /// <summary>
        /// 向数据库中添加一条记录
        /// </summary>
        /// <param name="model">要添加的实体</param>
        /// <returns>插入数据的ID</returns>
        public int Insert(Admins model) => _dao.Insert(model);

        #endregion

        #region 删除一条记录 +int Delete(int id)
        public int Delete(int id) => _dao.Delete(id);

        public void Insert(object p) => _dao.Insert(p);
        #endregion

        #region 根据主键ID更新一条记录 +int Update(Admins model)
        /// <summary>
        /// 根据主键ID更新一条记录
        /// </summary>
        /// <param name="model">更新后的实体</param>
        /// <returns>执行结果受影响行数</returns>
        public int Update(Admins model)
        {
            return _dao.Update(model);
        }
        #endregion

        #region 分页查询一个集合 +IEnumerable<Admins> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
        /// <summary>
        /// 分页查询一个集合
        /// </summary>
        /// <param name="index">页码</param>
        /// <param name="size">页大小</param>
        /// <param name="wheres">条件匿名类</param>
        /// <param name="orderField">排序字段</param>
        /// <param name="isDesc">是否降序排序</param>
        /// <returns>实体集合</returns>
        public IEnumerable<Admins> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
        {
            return _dao.QueryList(index, size, wheres, orderField, isDesc);
        }
        #endregion

        #region 查询单个模型实体 +Admins QuerySingle(object wheres)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="wheres">条件匿名类</param>
        /// <returns>实体</returns>
        public Admins QuerySingle(object wheres)
        {
            return _dao.QuerySingle(wheres);
        }
        #endregion

        #region 查询单个模型实体 +Admins QuerySingle(int id)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="id">key</param>
        /// <returns>实体</returns>
        public Admins QuerySingle(int id)
        {
            return _dao.QuerySingle(id);
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

        public bool Login(string username,string password,out Admins admin,out string msg)
        {
            admin = null;
            Admins tmp = _dao.QuerySingle(new { LoginId = username });
            if (tmp==null)
            {
                msg = "用户名不存在";
                return false;
            }
            if (tmp.LoginPwd!=password)
            {
                msg = "密码不正确";
                return false;
            }
            admin = tmp;
            msg = "登录成功";
            return true;
        }
    }
}