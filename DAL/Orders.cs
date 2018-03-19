using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using Shop.Model;
using Shop.CommonHelper;
using System.Data;

namespace Shop.DAL
{
    public partial class OrdersDAL
    {
        #region 向数据库中添加一条记录 +int Insert(Orders model)
        /// <summary>
        /// 向数据库中添加一条记录
        /// </summary>
        /// <param name="model">要添加的实体</param>
        /// <returns>插入数据的ID</returns>
        public int Insert(Orders model)
        {
            #region SQL语句
            const string sql = @"
INSERT INTO [dbo].[Orders] (
	[addTime]
	,[userId]
	,[totalPrice]
	,[payPrice]
	,[postAddress]
	,[payStatus]
	,[orderStatus]
	,[orderRemark]
	,[payTime]
	,[exchangeOrderId]
	,[returnOrderId]
	,[useStone]
)
VALUES (
	@addTime
	,@userId
	,@totalPrice
	,@payPrice
	,@postAddress
	,@payStatus
	,@orderStatus
	,@orderRemark
	,@payTime
	,@exchangeOrderId
	,@returnOrderId
	,@useStone
);select @@IDENTITY";
            #endregion
            var res = SqlHelper.ExecuteScalar(sql,
                    new SqlParameter("@addTime", model.addTime),
                    new SqlParameter("@userId", model.userId),
                    new SqlParameter("@totalPrice", model.totalPrice),
                    new SqlParameter("@payPrice", model.payPrice),
                    new SqlParameter("@postAddress", model.postAddress),
                    new SqlParameter("@payStatus", model.payStatus),
                    new SqlParameter("@orderStatus", model.orderStatus),
                    new SqlParameter("@orderRemark", model.orderRemark),
                    new SqlParameter("@payTime", model.payTime),
                    new SqlParameter("@exchangeOrderId", model.exchangeOrderId),
                    new SqlParameter("@returnOrderId", model.returnOrderId),
                    new SqlParameter("@useStone", model.useStone)
                );
            return res == null ? 0 : Convert.ToInt32(res);
        }



        #endregion

        #region 删除一条记录 +int Delete(int orderid)
        public int Delete(int orderid)
        {
            const string sql = "DELETE FROM [dbo].[Orders] WHERE [orderId] = @orderId";
            return SqlHelper.ExecuteNonQuery(sql, new SqlParameter("@orderId", orderid));
        }
        #endregion

        #region 根据主键ID更新一条记录 +int Update(Orders model)
        /// <summary>
        /// 根据主键ID更新一条记录
        /// </summary>
        /// <param name="model">更新后的实体</param>
        /// <returns>执行结果受影响行数</returns>
        public int Update(Orders model)
        {
            #region SQL语句
            const string sql = @"
UPDATE [dbo].[Orders]
SET 
	[addTime] = @addTime
	,[userId] = @userId
	,[totalPrice] = @totalPrice
	,[payPrice] = @payPrice
	,[postAddress] = @postAddress
	,[payStatus] = @payStatus
	,[orderStatus] = @orderStatus
	,[orderRemark] = @orderRemark
	,[payTime] = @payTime
	,[exchangeOrderId] = @exchangeOrderId
	,[returnOrderId] = @returnOrderId
	,[useStone] = @useStone
WHERE [orderId] = @orderId";
            #endregion
            return SqlHelper.ExecuteNonQuery(sql,
                    new SqlParameter("@orderId", model.orderId),
                    new SqlParameter("@addTime", model.addTime),
                    new SqlParameter("@userId", model.userId),
                    new SqlParameter("@totalPrice", model.totalPrice),
                    new SqlParameter("@payPrice", model.payPrice),
                    new SqlParameter("@postAddress", model.postAddress),
                    new SqlParameter("@payStatus", model.payStatus),
                    new SqlParameter("@orderStatus", model.orderStatus),
                    new SqlParameter("@orderRemark", model.orderRemark),
                    new SqlParameter("@payTime", model.payTime),
                    new SqlParameter("@exchangeOrderId", model.exchangeOrderId),
                    new SqlParameter("@returnOrderId", model.returnOrderId),
                    new SqlParameter("@useStone", model.useStone)
                );
        }
        #endregion

        #region 分页查询一个集合 +IEnumerable<Orders> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
        /// <summary>
        /// 分页查询一个集合
        /// </summary>
        /// <param name="index">页码</param>
        /// <param name="size">页大小</param>
        /// <param name="wheres">条件匿名类</param>
        /// <param name="orderField">排序字段</param>
        /// <param name="isDesc">是否降序排序</param>
        /// <returns>实体集合</returns>
        public IEnumerable<Orders> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
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
            var sql = SqlHelper.GenerateQuerySql("Orders", new[] { "orderId", "addTime", "userId", "totalPrice", "payPrice", "postAddress", "payStatus", "orderStatus", "orderRemark", "payTime", "exchangeOrderId", "returnOrderId", "useStone" }, index, size, whereBuilder.ToString(), orderField, isDesc);
            using (var reader = SqlHelper.ExecuteReader(sql, parameters.ToArray()))
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        yield return SqlHelper.MapEntity<Orders>(reader);
                    }
                }
            }
        }
        #endregion

        #region 查询单个模型实体 +Orders QuerySingle(object wheres)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="wheres">条件匿名类</param>
        /// <returns>实体</returns>
        public Orders QuerySingle(object wheres)
        {
            var list = QueryList(1, 1, wheres, null);
            return list != null && list.Any() ? list.FirstOrDefault() : null;
        }
        #endregion

        #region 查询单个模型实体 +Orders QuerySingle(int orderid)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="orderid">key</param>
        /// <returns>实体</returns>
        public Orders QuerySingle(int orderid)
        {
            const string sql = "SELECT TOP 1 [orderId], [addTime], [userId], [totalPrice], [payPrice], [postAddress], [payStatus], [orderStatus], [orderRemark], [payTime], [exchangeOrderId], [returnOrderId], [useStone] FROM [dbo].[Orders] WHERE [orderId] = @orderId";
            using (var reader = SqlHelper.ExecuteReader(sql, new SqlParameter("@orderId", orderid)))
            {
                if (reader.HasRows)
                {
                    reader.Read();
                    return SqlHelper.MapEntity<Orders>(reader);
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
            var sql = SqlHelper.GenerateQuerySql("Orders", new[] { "COUNT(1)" }, whereBuilder.ToString(), string.Empty);
            var res = SqlHelper.ExecuteScalar(sql, parameters.ToArray());
            return res == null ? 0 : Convert.ToInt32(res);
        }
        #endregion

        public bool CreateOrder(int userid, string name, string mobile, string address, string remark, int useStone, out decimal money, out string orderId)
        {
            int error = 1;
            SqlParameter[] pms = new SqlParameter[]
            {
                new SqlParameter("@userId",System.Data.SqlDbType.Int){Value=userid},
                new SqlParameter("@userName",System.Data.SqlDbType.NVarChar,100){Value=name},
                new SqlParameter("@userMobile",System.Data.SqlDbType.VarChar,20){Value=mobile},
                new SqlParameter("@userAddress",System.Data.SqlDbType.NVarChar,2048){Value=address},
                new SqlParameter("@remark",System.Data.SqlDbType.NVarChar,50){Value=remark},
                new SqlParameter("@usestone",SqlDbType.Int){Value=useStone}
            };
            money = 0;
            orderId = "";
            SqlDataReader reader = SqlHelper.ExecuteReader("P_CreateOrder", CommandType.StoredProcedure, pms);
            if (reader.HasRows)
            {
                reader.Read();
                money = reader.GetDecimal(0) > 0 ? reader.GetDecimal(0) : 0;
                orderId = reader.GetString(1);
                error = reader.GetInt32(2);
            }
            return error == 0;
        }

        public bool CreateorderDetail(int userid, string name, string mobile, string address, string remark, int productId, int productCount, int usestone, out decimal money, out string orderId)
        {
            int error = 1;
            SqlParameter[] pms = new SqlParameter[]
            {
                new SqlParameter("@userId",System.Data.SqlDbType.Int){Value=userid},
                new SqlParameter("@userName",System.Data.SqlDbType.NVarChar,100){Value=name},
                new SqlParameter("@userMobile",System.Data.SqlDbType.VarChar,20){Value=mobile},
                new SqlParameter("@userAddress",System.Data.SqlDbType.NVarChar,2048){Value=address},
                new SqlParameter("@remark",System.Data.SqlDbType.NVarChar,50){Value=remark},
                new SqlParameter("@productId",SqlDbType.Int){Value=productId},
                new SqlParameter("@productCount",SqlDbType.Int){Value=productCount},
                new SqlParameter("@usestone",SqlDbType.Int){Value=usestone}
            };
            money = 0;
            orderId = "";
            SqlDataReader reader = SqlHelper.ExecuteReader("P_CreateOrderFromDetail", CommandType.StoredProcedure, pms);
            if (reader.HasRows)
            {
                reader.Read();
                money = reader.GetDecimal(0) > 0 ? reader.GetDecimal(0) : 0;
                orderId = reader.GetString(1);
                error = reader.GetInt32(2);
            }
            return error == 0;
        }

        public bool DeleteOrder(int userid, int orderid)
        {
            SqlParameter[] pms = new SqlParameter[]
            {
                new SqlParameter("@userid",SqlDbType.Int){Value=userid},
                new SqlParameter("@orderid",SqlDbType.Int){Value=orderid}
            };
            return (int)SqlHelper.ExecuteScalar("P_DeleteOrder", CommandType.StoredProcedure, pms) == 0;
        }
    }
}
