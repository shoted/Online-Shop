using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using Shop.Model;
using Shop.CommonHelper;

namespace Shop.DAL
{
	public partial class OrderDetailDAL
	{
        #region 向数据库中添加一条记录 +int Insert(OrderDetail model)
        /// <summary>
        /// 向数据库中添加一条记录
        /// </summary>
        /// <param name="model">要添加的实体</param>
        /// <returns>插入数据的ID</returns>
        public int Insert(OrderDetail model)
        {
            #region SQL语句
            const string sql = @"
INSERT INTO [dbo].[OrderDetail] (
	[orderId]
	,[productId]
	,[productName]
	,[productCount]
	,[productPrice]
	,[commentId]
)
VALUES (
	@orderId
	,@productId
	,@productName
	,@productCount
	,@productPrice
	,@commentId
);select @@IDENTITY";
            #endregion
            var res = SqlHelper.ExecuteScalar(sql,
					new SqlParameter("@orderId", model.orderId),					
					new SqlParameter("@productId", model.productId),					
					new SqlParameter("@productName", model.productName),					
					new SqlParameter("@productCount", model.productCount),					
					new SqlParameter("@productPrice", model.productPrice),					
					new SqlParameter("@commentId", model.commentId)					
                );
            return res == null ? 0 : Convert.ToInt32(res);
        }
        #endregion

        #region 删除一条记录 +int Delete(int orderdetailid)
        public int Delete(int orderdetailid)
        {
            const string sql = "DELETE FROM [dbo].[OrderDetail] WHERE [orderDetailId] = @orderDetailId";
            return SqlHelper.ExecuteNonQuery(sql, new SqlParameter("@orderDetailId", orderdetailid));
        }
        #endregion

        #region 根据主键ID更新一条记录 +int Update(OrderDetail model)
        /// <summary>
        /// 根据主键ID更新一条记录
        /// </summary>
        /// <param name="model">更新后的实体</param>
        /// <returns>执行结果受影响行数</returns>
        public int Update(OrderDetail model)
        {
            #region SQL语句
            const string sql = @"
UPDATE [dbo].[OrderDetail]
SET 
	[orderId] = @orderId
	,[productId] = @productId
	,[productName] = @productName
	,[productCount] = @productCount
	,[productPrice] = @productPrice
	,[commentId] = @commentId
WHERE [orderDetailId] = @orderDetailId";
            #endregion
            return SqlHelper.ExecuteNonQuery(sql,
					new SqlParameter("@orderDetailId", model.orderDetailId),					
					new SqlParameter("@orderId", model.orderId),					
					new SqlParameter("@productId", model.productId),					
					new SqlParameter("@productName", model.productName),					
					new SqlParameter("@productCount", model.productCount),					
					new SqlParameter("@productPrice", model.productPrice),					
					new SqlParameter("@commentId", model.commentId)					
                );
        }
        #endregion

        #region 分页查询一个集合 +IEnumerable<OrderDetail> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
        /// <summary>
        /// 分页查询一个集合
        /// </summary>
        /// <param name="index">页码</param>
        /// <param name="size">页大小</param>
        /// <param name="wheres">条件匿名类</param>
        /// <param name="orderField">排序字段</param>
        /// <param name="isDesc">是否降序排序</param>
        /// <returns>实体集合</returns>
        public IEnumerable<OrderDetail> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
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
            var sql = SqlHelper.GenerateQuerySql("OrderDetail", new[] { "orderDetailId", "orderId", "productId", "productName", "productCount", "productPrice", "commentId" }, index, size, whereBuilder.ToString(), orderField, isDesc);
            using (var reader = SqlHelper.ExecuteReader(sql, parameters.ToArray()))
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        yield return SqlHelper.MapEntity<OrderDetail>(reader);
                    }
                }
            }
        }
        #endregion

        #region 查询单个模型实体 +OrderDetail QuerySingle(object wheres)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="wheres">条件匿名类</param>
        /// <returns>实体</returns>
        public OrderDetail QuerySingle(object wheres)
        {
            var list = QueryList(1, 1, wheres, null);
            return list != null && list.Any() ? list.FirstOrDefault() : null;
        }
        #endregion

        #region 查询单个模型实体 +OrderDetail QuerySingle(int orderdetailid)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="orderdetailid">key</param>
        /// <returns>实体</returns>
        public OrderDetail QuerySingle(int orderdetailid)
        {
            const string sql = "SELECT TOP 1 [orderDetailId], [orderId], [productId], [productName], [productCount], [productPrice], [commentId] FROM [dbo].[OrderDetail] WHERE [orderDetailId] = @orderDetailId";
            using (var reader = SqlHelper.ExecuteReader(sql, new SqlParameter("@orderDetailId", orderdetailid)))
            {
                if (reader.HasRows)
                {
                    reader.Read();
                    return SqlHelper.MapEntity<OrderDetail>(reader);
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
            var sql = SqlHelper.GenerateQuerySql("OrderDetail", new[] { "COUNT(1)" }, whereBuilder.ToString(), string.Empty);
            var res = SqlHelper.ExecuteScalar(sql, parameters.ToArray());
            return res == null ? 0 : Convert.ToInt32(res);
        }
        #endregion
	}
}