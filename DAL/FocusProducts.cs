using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using Shop.Model;
using Shop.CommonHelper;

namespace Shop.DAL
{
	public partial class FocusProductsDAL
	{
        #region 向数据库中添加一条记录 +int Insert(FocusProducts model)
        /// <summary>
        /// 向数据库中添加一条记录
        /// </summary>
        /// <param name="model">要添加的实体</param>
        /// <returns>插入数据的ID</returns>
        public int Insert(FocusProducts model)
        {
            #region SQL语句
            const string sql = @"
INSERT INTO [dbo].[FocusProducts] (

	[userId]
	,[productId]
	,[addTime]
)
VALUES (

	@userId
	,@productId
	,@addTime
);select @@IDENTITY";
            #endregion
            var res = SqlHelper.ExecuteScalar(sql,
									
					new SqlParameter("@userId", model.userId),					
					new SqlParameter("@productId", model.productId),					
					new SqlParameter("@addTime", model.addTime)					
                );
            return res == null ? 0 : Convert.ToInt32(res);
        }
        #endregion

        #region 删除一条记录 +int Delete(int focusproductid)
        public int Delete(int focusproductid)
        {
            const string sql = "DELETE FROM [dbo].[FocusProducts] WHERE [focusProductId] = @focusProductId";
            return SqlHelper.ExecuteNonQuery(sql, new SqlParameter("@focusProductId", focusproductid));
        }
        #endregion

        #region 根据主键ID更新一条记录 +int Update(FocusProducts model)
        /// <summary>
        /// 根据主键ID更新一条记录
        /// </summary>
        /// <param name="model">更新后的实体</param>
        /// <returns>执行结果受影响行数</returns>
        public int Update(FocusProducts model)
        {
            #region SQL语句
            const string sql = @"
UPDATE [dbo].[FocusProducts]
SET 
	[userId] = @userId
	,[productId] = @productId
WHERE [focusProductId] = @focusProductId";
            #endregion
            return SqlHelper.ExecuteNonQuery(sql,
					new SqlParameter("@focusProductId", model.focusProductId),					
					new SqlParameter("@userId", model.userId),					
					new SqlParameter("@productId", model.productId)									
                );
        }
        #endregion

        #region 分页查询一个集合 +IEnumerable<FocusProducts> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
        /// <summary>
        /// 分页查询一个集合
        /// </summary>
        /// <param name="index">页码</param>
        /// <param name="size">页大小</param>
        /// <param name="wheres">条件匿名类</param>
        /// <param name="orderField">排序字段</param>
        /// <param name="isDesc">是否降序排序</param>
        /// <returns>实体集合</returns>
        public IEnumerable<FocusProducts> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
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
            var sql = SqlHelper.GenerateQuerySql("FocusProducts", new[] { "focusProductId", "userId", "productId", "addTime" }, index, size, whereBuilder.ToString(), orderField, isDesc);
            using (var reader = SqlHelper.ExecuteReader(sql, parameters.ToArray()))
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        yield return SqlHelper.MapEntity<FocusProducts>(reader);
                    }
                }
            }
        }
        #endregion

        #region 查询单个模型实体 +FocusProducts QuerySingle(object wheres)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="wheres">条件匿名类</param>
        /// <returns>实体</returns>
        public FocusProducts QuerySingle(object wheres)
        {
            var list = QueryList(1, 1, wheres, null);
            return list != null && list.Any() ? list.FirstOrDefault() : null;
        }
        #endregion

        #region 查询单个模型实体 +FocusProducts QuerySingle(int focusproductid)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="focusproductid">key</param>
        /// <returns>实体</returns>
        public FocusProducts QuerySingle(int focusproductid)
        {
            const string sql = "SELECT TOP 1 [focusProductId], [userId], [productId], [addTime] FROM [dbo].[FocusProducts] WHERE [focusProductId] = @focusProductId";
            using (var reader = SqlHelper.ExecuteReader(sql, new SqlParameter("@focusProductId", focusproductid)))
            {
                if (reader.HasRows)
                {
                    reader.Read();
                    return SqlHelper.MapEntity<FocusProducts>(reader);
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
            var sql = SqlHelper.GenerateQuerySql("FocusProducts", new[] { "COUNT(1)" }, whereBuilder.ToString(), string.Empty);
            var res = SqlHelper.ExecuteScalar(sql, parameters.ToArray());
            return res == null ? 0 : Convert.ToInt32(res);
        }
        #endregion
	}
}