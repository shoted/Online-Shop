using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using Shop.Model;
using Shop.CommonHelper;

namespace Shop.DAL
{
    public partial class CartInfoDAL
    {
        #region 向数据库中添加一条记录 +int Insert(CartInfo model)
        /// <summary>
        /// 向数据库中添加一条记录
        /// </summary>
        /// <param name="model">要添加的实体</param>
        /// <returns>插入数据的ID</returns>
        public int Insert(CartInfo model)
        {
            #region SQL语句
            const string sql = @"
INSERT INTO [dbo].[CartInfo] (
	[cartId]
	,[productInventory]
	,[add_time]
	,[productStatus]
	,[productStone]
	,[userId]
	,[productId]
	,[productCount]
	,[addTime]
	,[productName]
	,[categoryId]
	,[productPrice]
	,[productIMG]
)
VALUES (
	@cartId
	,@productInventory
	,@add_time
	,@productStatus
	,@productStone
	,@userId
	,@productId
	,@productCount
	,@addTime
	,@productName
	,@categoryId
	,@productPrice
	,@productIMG
);select @@IDENTITY";
            #endregion
            var res = SqlHelper.ExecuteScalar(sql,
                    new SqlParameter("@cartId", model.cartId),
                    new SqlParameter("@productInventory", model.productInventory),
                    new SqlParameter("@add_time", model.add_time),
                    new SqlParameter("@productStatus", model.productStatus),
                    new SqlParameter("@productStone", model.productStone),
                    new SqlParameter("@userId", model.userId),
                    new SqlParameter("@productId", model.productId),
                    new SqlParameter("@productCount", model.productCount),
                    new SqlParameter("@addTime", model.addTime),
                    new SqlParameter("@productName", model.productName),
                    new SqlParameter("@categoryId", model.categoryId),
                    new SqlParameter("@productPrice", model.productPrice),
                    new SqlParameter("@productIMG", model.productIMG)
                );
            return res == null ? 0 : Convert.ToInt32(res);
        }
        #endregion

        #region 删除一条记录 +int Delete(int cartid)
        public int Delete(int cartid)
        {
            const string sql = "DELETE FROM [dbo].[CartInfo] WHERE [cartId] = @cartId";
            return SqlHelper.ExecuteNonQuery(sql, new SqlParameter("@cartId", cartid));
        }
        #endregion

        #region 根据主键ID更新一条记录 +int Update(CartInfo model)
        /// <summary>
        /// 根据主键ID更新一条记录
        /// </summary>
        /// <param name="model">更新后的实体</param>
        /// <returns>执行结果受影响行数</returns>
        public int Update(CartInfo model)
        {
            #region SQL语句
            const string sql = @"
UPDATE [dbo].[CartInfo]
SET 
	[cartId] = @cartId
	,[productInventory] = @productInventory
	,[add_time] = @add_time
	,[productStatus] = @productStatus
	,[productStone] = @productStone
	,[userId] = @userId
	,[productId] = @productId
	,[productCount] = @productCount
	,[addTime] = @addTime
	,[productName] = @productName
	,[categoryId] = @categoryId
	,[productPrice] = @productPrice
	,[productIMG] = @productIMG
WHERE [cartId] = @cartId";
            #endregion
            return SqlHelper.ExecuteNonQuery(sql,
                    new SqlParameter("@cartId", model.cartId),
                    new SqlParameter("@productInventory", model.productInventory),
                    new SqlParameter("@add_time", model.add_time),
                    new SqlParameter("@productStatus", model.productStatus),
                    new SqlParameter("@productStone", model.productStone),
                    new SqlParameter("@userId", model.userId),
                    new SqlParameter("@productId", model.productId),
                    new SqlParameter("@productCount", model.productCount),
                    new SqlParameter("@addTime", model.addTime),
                    new SqlParameter("@productName", model.productName),
                    new SqlParameter("@categoryId", model.categoryId),
                    new SqlParameter("@productPrice", model.productPrice),
                    new SqlParameter("@productIMG", model.productIMG)
                );
        }
        #endregion

        #region 分页查询一个集合 +IEnumerable<CartInfo> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
        /// <summary>
        /// 分页查询一个集合
        /// </summary>
        /// <param name="index">页码</param>
        /// <param name="size">页大小</param>
        /// <param name="wheres">条件匿名类</param>
        /// <param name="orderField">排序字段</param>
        /// <param name="isDesc">是否降序排序</param>
        /// <returns>实体集合</returns>
        public IEnumerable<CartInfo> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
        {
            var parameters = new List<SqlParameter>();
            var whereBuilder = new System.Text.StringBuilder();
            if (wheres != null)
            {
                var props = wheres.GetType().GetProperties();
                foreach (var prop in props)
                {
                    if (prop.Name.Equals("__o", StringComparison.InvariantCultureIgnoreCase))
                    {
                        // 操作符
                        if (whereBuilder.Length > 3)
                        {
                            whereBuilder.Remove(whereBuilder.Length - 3, 3);
                        }
                        whereBuilder.AppendFormat(" {0} ", prop.GetValue(wheres, null).ToString());
                    }
                    else
                    {
                        var val = prop.GetValue(wheres, null).ToString();
                        whereBuilder.AppendFormat(" [{0}] = @{0} ", prop.Name);
                        whereBuilder.Append("  and");
                        parameters.Add(new SqlParameter("@" + prop.Name, val));
                    }
                }
                whereBuilder.Remove(whereBuilder.Length - 3, 3);
            }
            var sql = SqlHelper.GenerateQuerySql("CartInfo", new[] { "cartId", "productInventory", "add_time", "productStatus", "productStone", "userId", "productId", "productCount", "addTime", "productName", "categoryId", "productPrice", "productIMG" }, index, size, whereBuilder.ToString(), orderField, isDesc);
            using (var reader = SqlHelper.ExecuteReader(sql, parameters.ToArray()))
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        yield return SqlHelper.MapEntity<CartInfo>(reader);
                    }
                }
            }
        }
        #endregion

        #region 查询单个模型实体 +CartInfo QuerySingle(object wheres)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="wheres">条件匿名类</param>
        /// <returns>实体</returns>
        public CartInfo QuerySingle(object wheres)
        {
            var list = QueryList(1, 1, wheres, null);
            return list != null && list.Any() ? list.FirstOrDefault() : null;
        }
        #endregion

        #region 查询单个模型实体 +CartInfo QuerySingle(int cartid)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="cartid">key</param>
        /// <returns>实体</returns>
        public CartInfo QuerySingle(int cartid)
        {
            const string sql = "SELECT TOP 1 [cartId], [productInventory], [add_time], [productStatus], [productStone], [userId], [productId], [productCount], [addTime], [productName], [categoryId], [productPrice], [productIMG] FROM [dbo].[CartInfo] WHERE [cartId] = @cartId";
            using (var reader = SqlHelper.ExecuteReader(sql, new SqlParameter("@cartId", cartid)))
            {
                if (reader.HasRows)
                {
                    reader.Read();
                    return SqlHelper.MapEntity<CartInfo>(reader);
                }
                else
                {
                    return null;
                }
            }
        }
        #endregion

        #region 查询条数 +int QueryCount(object wheres)
        /// <summary>
        /// 查询条数
        /// </summary>
        /// <param name="wheres">查询条件</param>
        /// <returns>条数</returns>
        public int QueryCount(object wheres)
        {
            var parameters = new List<SqlParameter>();
            var whereBuilder = new System.Text.StringBuilder();
            if (wheres != null)
            {
                var props = wheres.GetType().GetProperties();
                foreach (var prop in props)
                {
                    if (prop.Name.Equals("__o", StringComparison.InvariantCultureIgnoreCase))
                    {
                        // 操作符
                        whereBuilder.AppendFormat(" {0} ", prop.GetValue(wheres, null).ToString());
                    }
                    else
                    {
                        var val = prop.GetValue(wheres, null).ToString();
                        whereBuilder.AppendFormat(" [{0}] = @{0} ", prop.Name);
                        parameters.Add(new SqlParameter("@" + prop.Name, val));
                    }
                }
            }
            var sql = SqlHelper.GenerateQuerySql("CartInfo", new[] { "COUNT(1)" }, whereBuilder.ToString(), string.Empty);
            var res = SqlHelper.ExecuteScalar(sql, parameters.ToArray());
            return res == null ? 0 : Convert.ToInt32(res);
        }
        #endregion
    }
}