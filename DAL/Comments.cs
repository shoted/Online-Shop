﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using Shop.Model;
using Shop.CommonHelper;

namespace Shop.DAL
{
	public partial class CommentsDAL
	{
        #region 向数据库中添加一条记录 +int Insert(Comments model)
        /// <summary>
        /// 向数据库中添加一条记录
        /// </summary>
        /// <param name="model">要添加的实体</param>
        /// <returns>插入数据的ID</returns>
        public int Insert(Comments model)
        {
            #region SQL语句
            const string sql = @"
INSERT INTO [dbo].[Comments] (
	[commentContent]
	,[addTime]
	,[productId]
	,[status]
)
VALUES (
	@commentContent
	,@addTime
	,@productId
	,@status
);select @@IDENTITY";
            #endregion
            var res = SqlHelper.ExecuteScalar(sql,
					new SqlParameter("@commentContent", model.commentContent),					
					new SqlParameter("@addTime", model.addTime),					
					new SqlParameter("@productId", model.productId),					
					new SqlParameter("@status", model.status)					
                );
            return res == null ? 0 : Convert.ToInt32(res);
        }
        #endregion

        #region 删除一条记录 +int Delete(int commentid)
        public int Delete(int commentid)
        {
            const string sql = "DELETE FROM [dbo].[Comments] WHERE [commentId] = @commentId";
            return SqlHelper.ExecuteNonQuery(sql, new SqlParameter("@commentId", commentid));
        }
        #endregion

        #region 根据主键ID更新一条记录 +int Update(Comments model)
        /// <summary>
        /// 根据主键ID更新一条记录
        /// </summary>
        /// <param name="model">更新后的实体</param>
        /// <returns>执行结果受影响行数</returns>
        public int Update(Comments model)
        {
            #region SQL语句
            const string sql = @"
UPDATE [dbo].[Comments]
SET 
    [commentContent] = @commentContent
	,[addTime] = @addTime
	,[productId] = @productId
	,[status] = @status
WHERE [commentId] = @commentId";
            #endregion
            return SqlHelper.ExecuteNonQuery(sql,
					new SqlParameter("@commentId", model.commentId),					
					new SqlParameter("@commentContent", model.commentContent),					
					new SqlParameter("@addTime", model.addTime),					
					new SqlParameter("@productId", model.productId),					
					new SqlParameter("@status", model.status)					
                );
        }
        #endregion

        #region 分页查询一个集合 +IEnumerable<Comments> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
        /// <summary>
        /// 分页查询一个集合
        /// </summary>
        /// <param name="index">页码</param>
        /// <param name="size">页大小</param>
        /// <param name="wheres">条件匿名类</param>
        /// <param name="orderField">排序字段</param>
        /// <param name="isDesc">是否降序排序</param>
        /// <returns>实体集合</returns>
        public IEnumerable<Comments> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
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
            var sql = SqlHelper.GenerateQuerySql("Comments", new[] { "commentId", "commentContent", "addTime", "productId", "status" }, index, size, whereBuilder.ToString(), orderField, isDesc);
            using (var reader = SqlHelper.ExecuteReader(sql, parameters.ToArray()))
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        yield return SqlHelper.MapEntity<Comments>(reader);
                    }
                }
            }
        }
        #endregion

        #region 查询单个模型实体 +Comments QuerySingle(object wheres)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="wheres">条件匿名类</param>
        /// <returns>实体</returns>
        public Comments QuerySingle(object wheres)
        {
            var list = QueryList(1, 1, wheres, null);
            return list != null && list.Any() ? list.FirstOrDefault() : null;
        }
        #endregion

        #region 查询单个模型实体 +Comments QuerySingle(int commentid)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="commentid">key</param>
        /// <returns>实体</returns>
        public Comments QuerySingle(int commentid)
        {
            const string sql = "SELECT TOP 1 [commentId], [commentContent], [addTime], [productId], [status] FROM [dbo].[Comments] WHERE [commentId] = @commentId";
            using (var reader = SqlHelper.ExecuteReader(sql, new SqlParameter("@commentId", commentid)))
            {
                if (reader.HasRows)
                {
                    reader.Read();
                    return SqlHelper.MapEntity<Comments>(reader);
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
            var sql = SqlHelper.GenerateQuerySql("Comments", new[] { "COUNT(1)" }, whereBuilder.ToString(), string.Empty);
            var res = SqlHelper.ExecuteScalar(sql, parameters.ToArray());
            return res == null ? 0 : Convert.ToInt32(res);
        }
        #endregion
	}
}