using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using Shop.Model;
using Shop.CommonHelper;

namespace Shop.DAL
{
	public partial class CategoriesDAL
	{
        #region 向数据库中添加一条记录 +int Insert(Categories model)
        /// <summary>
        /// 向数据库中添加一条记录
        /// </summary>
        /// <param name="model">要添加的实体</param>
        /// <returns>插入数据的ID</returns>
        public int Insert(Categories model)
        {
            #region SQL语句
            const string sql = @"
INSERT INTO [dbo].[Categories] (
	[catName]
	,[catParentID]
	,[catDesc]
)
VALUES (
	@catName
	,@catParentID
	,@catDesc
);select @@IDENTITY";
            #endregion
            var res = SqlHelper.ExecuteScalar(sql,
					new SqlParameter("@catName", model.catName),					
					new SqlParameter("@catParentID", model.catParentID),					
					new SqlParameter("@catDesc", model.catDesc)					
                );
            return res == null ? 0 : Convert.ToInt32(res);
        }
        #endregion

        #region 删除一条记录 +int Delete(int catid)
        public int Delete(int catid)
        {
            const string sql = "DELETE FROM [dbo].[Categories] WHERE [catId] = @catId";
            return SqlHelper.ExecuteNonQuery(sql, new SqlParameter("@catId", catid));
        }
        #endregion

        #region 根据主键ID更新一条记录 +int Update(Categories model)
        /// <summary>
        /// 根据主键ID更新一条记录
        /// </summary>
        /// <param name="model">更新后的实体</param>
        /// <returns>执行结果受影响行数</returns>
        public int Update(Categories model)
        {
            #region SQL语句
            const string sql = @"
UPDATE [dbo].[Categories]
SET 
	[catName] = @catName
	,[catParentID] = @catParentID
	,[catDesc] = @catDesc
WHERE [catId] = @catId";
            #endregion
            return SqlHelper.ExecuteNonQuery(sql,
					new SqlParameter("@catId", model.catId),					
					new SqlParameter("@catName", model.catName),					
					new SqlParameter("@catParentID", model.catParentID),					
					new SqlParameter("@catDesc", model.catDesc)					
                );
        }
        #endregion

        #region 分页查询一个集合 +IEnumerable<Categories> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
        /// <summary>
        /// 分页查询一个集合
        /// </summary>
        /// <param name="index">页码</param>
        /// <param name="size">页大小</param>
        /// <param name="wheres">条件匿名类</param>
        /// <param name="orderField">排序字段</param>
        /// <param name="isDesc">是否降序排序</param>
        /// <returns>实体集合</returns>
        public IEnumerable<Categories> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
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
            var sql = SqlHelper.GenerateQuerySql("Categories", new[] { "catId", "catName", "catParentID", "catDesc" }, index, size, whereBuilder.ToString(), orderField, isDesc);
            using (var reader = SqlHelper.ExecuteReader(sql, parameters.ToArray()))
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        yield return SqlHelper.MapEntity<Categories>(reader);
                    }
                }
            }
        }
        #endregion

        #region 查询单个模型实体 +Categories QuerySingle(object wheres)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="wheres">条件匿名类</param>
        /// <returns>实体</returns>
        public Categories QuerySingle(object wheres)
        {
            var list = QueryList(1, 1, wheres, null);
            return list != null && list.Any() ? list.FirstOrDefault() : null;
        }
        #endregion

        #region 查询单个模型实体 +Categories QuerySingle(int catid)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="catid">key</param>
        /// <returns>实体</returns>
        public Categories QuerySingle(int catid)
        {
            const string sql = "SELECT TOP 1 [catId], [catName], [catParentID], [catDesc] FROM [dbo].[Categories] WHERE [catId] = @catId";
            using (var reader = SqlHelper.ExecuteReader(sql, new SqlParameter("@catId", catid)))
            {
                if (reader.HasRows)
                {
                    reader.Read();
                    return SqlHelper.MapEntity<Categories>(reader);
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
            var sql = SqlHelper.GenerateQuerySql("Categories", new[] { "COUNT(1)" }, whereBuilder.ToString(), string.Empty);
            var res = SqlHelper.ExecuteScalar(sql, parameters.ToArray());
            return res == null ? 0 : Convert.ToInt32(res);
        }
        #endregion
	}
}