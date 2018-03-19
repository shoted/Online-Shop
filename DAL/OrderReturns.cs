﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using Shop.Model;
using Shop.CommonHelper;

namespace Shop.DAL
{
	public partial class OrderReturnsDAL
	{
        #region 向数据库中添加一条记录 +int Insert(OrderReturns model)
        /// <summary>
        /// 向数据库中添加一条记录
        /// </summary>
        /// <param name="model">要添加的实体</param>
        /// <returns>插入数据的ID</returns>
        public int Insert(OrderReturns model)
        {
            #region SQL语句
            const string sql = @"
INSERT INTO [dbo].[OrderReturns] (
	[orderId]
	,[payPrice]
	,[returnPrice]
	,[returnStatus]
	,[returnTime]
)
VALUES (
	@orderId
	,@payPrice
	,@returnPrice
	,@returnStatus
	,@returnTime
);select @@IDENTITY";
            #endregion
            var res = SqlHelper.ExecuteScalar(sql,
					new SqlParameter("@orderId", model.orderId),					
					new SqlParameter("@payPrice", model.payPrice),					
					new SqlParameter("@returnPrice", model.returnPrice),					
					new SqlParameter("@returnStatus", model.returnStatus),					
					new SqlParameter("@returnTime", model.returnTime)					
                );
            return res == null ? 0 : Convert.ToInt32(res);
        }
        #endregion

        #region 删除一条记录 +int Delete(int returnid)
        public int Delete(int returnid)
        {
            const string sql = "DELETE FROM [dbo].[OrderReturns] WHERE [returnId] = @returnId";
            return SqlHelper.ExecuteNonQuery(sql, new SqlParameter("@returnId", returnid));
        }
        #endregion

        #region 根据主键ID更新一条记录 +int Update(OrderReturns model)
        /// <summary>
        /// 根据主键ID更新一条记录
        /// </summary>
        /// <param name="model">更新后的实体</param>
        /// <returns>执行结果受影响行数</returns>
        public int Update(OrderReturns model)
        {
            #region SQL语句
            const string sql = @"
UPDATE [dbo].[OrderReturns]
SET 
	[orderId] = @orderId
	,[payPrice] = @payPrice
	,[returnPrice] = @returnPrice
	,[returnStatus] = @returnStatus
	,[returnTime] = @returnTime
WHERE [returnId] = @returnId";
            #endregion
            return SqlHelper.ExecuteNonQuery(sql,
					new SqlParameter("@returnId", model.returnId),					
					new SqlParameter("@orderId", model.orderId),					
					new SqlParameter("@payPrice", model.payPrice),					
					new SqlParameter("@returnPrice", model.returnPrice),					
					new SqlParameter("@returnStatus", model.returnStatus),					
					new SqlParameter("@returnTime", model.returnTime)					
                );
        }
        #endregion

        #region 分页查询一个集合 +IEnumerable<OrderReturns> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
        /// <summary>
        /// 分页查询一个集合
        /// </summary>
        /// <param name="index">页码</param>
        /// <param name="size">页大小</param>
        /// <param name="wheres">条件匿名类</param>
        /// <param name="orderField">排序字段</param>
        /// <param name="isDesc">是否降序排序</param>
        /// <returns>实体集合</returns>
        public IEnumerable<OrderReturns> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
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
            var sql = SqlHelper.GenerateQuerySql("OrderReturns", new[] { "returnId", "orderId", "payPrice", "returnPrice", "returnStatus", "returnTime" }, index, size, whereBuilder.ToString(), orderField, isDesc);
            using (var reader = SqlHelper.ExecuteReader(sql, parameters.ToArray()))
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        yield return SqlHelper.MapEntity<OrderReturns>(reader);
                    }
                }
            }
        }
        #endregion

        #region 查询单个模型实体 +OrderReturns QuerySingle(object wheres)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="wheres">条件匿名类</param>
        /// <returns>实体</returns>
        public OrderReturns QuerySingle(object wheres)
        {
            var list = QueryList(1, 1, wheres, null);
            return list != null && list.Any() ? list.FirstOrDefault() : null;
        }
        #endregion

        #region 查询单个模型实体 +OrderReturns QuerySingle(int returnid)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="returnid">key</param>
        /// <returns>实体</returns>
        public OrderReturns QuerySingle(int returnid)
        {
            const string sql = "SELECT TOP 1 [returnId], [orderId], [payPrice], [returnPrice], [returnStatus], [returnTime] FROM [dbo].[OrderReturns] WHERE [returnId] = @returnId";
            using (var reader = SqlHelper.ExecuteReader(sql, new SqlParameter("@returnId", returnid)))
            {
                if (reader.HasRows)
                {
                    reader.Read();
                    return SqlHelper.MapEntity<OrderReturns>(reader);
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
            var sql = SqlHelper.GenerateQuerySql("OrderReturns", new[] { "COUNT(1)" }, whereBuilder.ToString(), string.Empty);
            var res = SqlHelper.ExecuteScalar(sql, parameters.ToArray());
            return res == null ? 0 : Convert.ToInt32(res);
        }
        #endregion
	}
}