using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using Shop.Model;
using Shop.CommonHelper;
using System.Data;

namespace Shop.DAL
{
	public partial class AddressDAL
	{
        #region 向数据库中添加一条记录 +int Insert(Address model)
        /// <summary>
        /// 向数据库中添加一条记录
        /// </summary>
        /// <param name="model">要添加的实体</param>
        /// <returns>插入数据的ID</returns>
        public int Insert(Address model)
        {
            #region SQL语句
            const string sql = @"
INSERT INTO [dbo].[Address] (
	[userId]
	,[postName]
	,[postPhone]
	,[postAddress]
)
VALUES (
	@userId
	,@postName
	,@postPhone
	,@postAddress
);select @@IDENTITY";
            #endregion
            var res = SqlHelper.ExecuteScalar(sql,			
					new SqlParameter("@userId", model.userId),					
					new SqlParameter("@postName", model.postName),					
					new SqlParameter("@postPhone", model.postPhone),					
					new SqlParameter("@postAddress", model.postAddress)								
                );
            return res == null ? 0 : Convert.ToInt32(res);
        }
        #endregion

        #region 删除一条记录 +int Delete(int postid)
        public int Delete(int postid)
        {
            const string sql = "DELETE FROM [dbo].[Address] WHERE [postId] = @postId";
            return SqlHelper.ExecuteNonQuery(sql, new SqlParameter("@postId", postid));
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
            #region SQL语句
            const string sql = @"
UPDATE [dbo].[Address]
SET 
	[userId] = @userId
	,[postName] = @postName
	,[postPhone] = @postPhone
	,[postAddress] = @postAddress
	,[isDefault] = @isDefault
	,[addTime] = @addTime
WHERE [postId] = @postId";
            #endregion
            return SqlHelper.ExecuteNonQuery(sql,
					new SqlParameter("@postId", model.postId),					
					new SqlParameter("@userId", model.userId),					
					new SqlParameter("@postName", model.postName),					
					new SqlParameter("@postPhone", model.postPhone),					
					new SqlParameter("@postAddress", model.postAddress),					
					new SqlParameter("@isDefault", model.isDefault),					
					new SqlParameter("@addTime", model.addTime)					
                );
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
            var sql = SqlHelper.GenerateQuerySql("Address", new[] { "postId", "userId", "postName", "postPhone", "postAddress", "isDefault", "addTime" }, index, size, whereBuilder.ToString(), orderField, isDesc);
            using (var reader = SqlHelper.ExecuteReader(sql, parameters.ToArray()))
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        yield return SqlHelper.MapEntity<Address>(reader);
                    }
                }
            }
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
            var list = QueryList(1, 1, wheres, null);
            return list != null && list.Any() ? list.FirstOrDefault() : null;
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
            const string sql = "SELECT TOP 1 [postId], [userId], [postName], [postPhone], [postAddress], [isDefault], [addTime] FROM [dbo].[Address] WHERE [postId] = @postId";
            using (var reader = SqlHelper.ExecuteReader(sql, new SqlParameter("@postId", postid)))
            {
                if (reader.HasRows)
                {
                    reader.Read();
                    return SqlHelper.MapEntity<Address>(reader);
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
            var sql = SqlHelper.GenerateQuerySql("Address", new[] { "COUNT(1)" }, whereBuilder.ToString(), string.Empty);
            var res = SqlHelper.ExecuteScalar(sql, parameters.ToArray());
            return res == null ? 0 : Convert.ToInt32(res);
        }
        #endregion

        public bool AddressDefalut(int postid ,int userid)
        {
            SqlParameter[] pms = new SqlParameter[] 
            {
                new SqlParameter("@userid",System.Data.SqlDbType.Int){Value=userid},
                new SqlParameter("@postid",System.Data.SqlDbType.Int){Value=postid}
            };
            return (int)SqlHelper.ExecuteScalar("P_AddressDefault", CommandType.StoredProcedure, pms) == 0;
        }
	}
}