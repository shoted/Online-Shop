using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using Shop.Model;
using Shop.CommonHelper;

namespace Shop.DAL
{
	public partial class UsersDAL
	{
        #region 向数据库中添加一条记录 +int Insert(Users model)
        /// <summary>
        /// 向数据库中添加一条记录
        /// </summary>
        /// <param name="model">要添加的实体</param>
        /// <returns>插入数据的ID</returns>
        public int Insert(Users model)
        {
            #region SQL语句
            const string sql = @"
INSERT INTO [dbo].[Users] (
	[userName]
	,[userPassword]
	,[userStatus]
	,[userStone]
	,[add_time]
	,[last_time]
)
VALUES (
	@userName
	,@userPassword
	,@userStatus
	,@userStone
	,@add_time
	,@last_time
);select @@IDENTITY";
            #endregion
            var res = SqlHelper.ExecuteScalar(sql,
					new SqlParameter("@userName", model.userName),					
					new SqlParameter("@userPassword", model.userPassword),					
					new SqlParameter("@userStatus", model.userStatus),					
					new SqlParameter("@userStone", model.userStone),					
					new SqlParameter("@add_time", model.add_time),					
					new SqlParameter("@last_time", model.last_time)					
                );
            return res == null ? 0 : Convert.ToInt32(res);
        }
        #endregion

        #region 删除一条记录 +int Delete(int userid)
        public int Delete(int userid)
        {
            const string sql = "DELETE FROM [dbo].[Users] WHERE [userId] = @userId";
            return SqlHelper.ExecuteNonQuery(sql, new SqlParameter("@userId", userid));
        }
        #endregion

        #region 根据主键ID更新一条记录 +int Update(Users model)
        /// <summary>
        /// 根据主键ID更新一条记录
        /// </summary>
        /// <param name="model">更新后的实体</param>
        /// <returns>执行结果受影响行数</returns>
        public int Update(Users model)
        {
            #region SQL语句
            const string sql = @"
UPDATE [dbo].[Users]
SET 
	[userName] = @userName
	,[userPassword] = @userPassword
	,[userStatus] = @userStatus
	,[userStone] = @userStone
	,[add_time] = @add_time
	,[last_time] = @last_time
WHERE [userId] = @userId";
            #endregion
            return SqlHelper.ExecuteNonQuery(sql,
					new SqlParameter("@userId", model.userId),					
					new SqlParameter("@userName", model.userName),					
					new SqlParameter("@userPassword", model.userPassword),					
					new SqlParameter("@userStatus", model.userStatus),					
					new SqlParameter("@userStone", model.userStone),					
					new SqlParameter("@add_time", model.add_time),					
					new SqlParameter("@last_time", model.last_time)					
                );
        }
        #endregion

        #region 分页查询一个集合 +IEnumerable<Users> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
        /// <summary>
        /// 分页查询一个集合
        /// </summary>
        /// <param name="index">页码</param>
        /// <param name="size">页大小</param>
        /// <param name="wheres">条件匿名类</param>
        /// <param name="orderField">排序字段</param>
        /// <param name="isDesc">是否降序排序</param>
        /// <returns>实体集合</returns>
        public IEnumerable<Users> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
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
            var sql = SqlHelper.GenerateQuerySql("Users", new[] { "userId", "userName", "userPassword", "userStatus", "userStone", "add_time", "last_time" }, index, size, whereBuilder.ToString(), orderField, isDesc);
            using (var reader = SqlHelper.ExecuteReader(sql, parameters.ToArray()))
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        yield return SqlHelper.MapEntity<Users>(reader);
                    }
                }
            }
        }
        #endregion

        #region 查询单个模型实体 +Users QuerySingle(object wheres)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="wheres">条件匿名类</param>
        /// <returns>实体</returns>
        public Users QuerySingle(object wheres)
        {
            var list = QueryList(1, 1, wheres, null);
            return list != null && list.Any() ? list.FirstOrDefault() : null;
        }
        #endregion

        #region 查询单个模型实体 +Users QuerySingle(int userid)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="userid">key</param>
        /// <returns>实体</returns>
        public Users QuerySingle(int userid)
        {
            const string sql = "SELECT TOP 1 [userId], [userName], [userPassword], [userStatus], [userStone], [add_time], [last_time] FROM [dbo].[Users] WHERE [userId] = @userId";
            using (var reader = SqlHelper.ExecuteReader(sql, new SqlParameter("@userId", userid)))
            {
                if (reader.HasRows)
                {
                    reader.Read();
                    return SqlHelper.MapEntity<Users>(reader);
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
            var sql = SqlHelper.GenerateQuerySql("Users", new[] { "COUNT(1)" }, whereBuilder.ToString(), string.Empty);
            var res = SqlHelper.ExecuteScalar(sql, parameters.ToArray());
            return res == null ? 0 : Convert.ToInt32(res);
        }
        #endregion
	}
}