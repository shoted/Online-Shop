using Shop.DAL;
using Shop.Model;
using System.Collections.Generic;

namespace Shop.BLL
{
    public partial class AddressBLL
	{
   		     
		/// <summary>
        /// 数据库操作对象
        /// </summary>
        private AddressDAL _dao = new AddressDAL();

        #region 向数据库中添加一条记录 +int Insert(Address model)
        /// <summary>
        /// 向数据库中添加一条记录
        /// </summary>
        /// <param name="model">要添加的实体</param>
        /// <returns>插入数据的ID</returns>
        public int Insert(Address model)
        {
            return _dao.Insert(model);
        }
        #endregion

        #region 删除一条记录 +int Delete(int postid)
        public int Delete(int postid)
        {
            return _dao.Delete(postid);
        }
        #endregion

        #region 根据主键ID更新一条记录 +int Update(Address model)
        /// <summary>
        /// 根据主键ID更新一条记录
        /// </summary>
        /// <param name="model">更新后的实体</param>
        /// <returns>执行结果受影响行数</returns>
        public int Update(Address model)
        {
            return _dao.Update(model);
        }
        #endregion

        #region 分页查询一个集合 +IEnumerable<Address> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
        /// <summary>
        /// 分页查询一个集合
        /// </summary>
        /// <param name="index">页码</param>
        /// <param name="size">页大小</param>
        /// <param name="wheres">条件匿名类</param>
        /// <param name="orderField">排序字段</param>
        /// <param name="isDesc">是否降序排序</param>
        /// <returns>实体集合</returns>
        public IEnumerable<Address> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
        {
            return _dao.QueryList(index, size, wheres, orderField, isDesc);
        }
        #endregion

        #region 查询单个模型实体 +Address QuerySingle(object wheres)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="wheres">条件匿名类</param>
        /// <returns>实体</returns>
        public Address QuerySingle(object wheres)
        {
            return _dao.QuerySingle(wheres);
        }
        #endregion
        
        #region 查询单个模型实体 +Address QuerySingle(int postid)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="postid">key</param>
        /// <returns>实体</returns>
        public Address QuerySingle(int postid)
        {
            return _dao.QuerySingle(postid);
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

        public bool AddressDefault(int postid,int userid)
        {
            return _dao.AddressDefalut(postid, userid);
        }
	}
}