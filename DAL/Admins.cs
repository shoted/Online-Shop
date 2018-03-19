using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using Shop.Model;
using Shop.CommonHelper;
using System.Text;

namespace Shop.DAL
{
    public partial class AdminsDAL
    {
        #region 向数据库中添加一条记录 +int Insert(Admins model)
        /// <summary>
        /// 向数据库中添加一条记录
        /// </summary>
        /// <param name="model">要添加的实体</param>
        /// <returns>插入数据的ID</returns>
        public int Insert(Admins model)
        {
            #region SQL语句
            const string sql = @"
INSERT INTO [dbo].[Admins] (
     [LoginId]
	,[LoginPwd]
)
VALUES (
	 @LoginId
	,@LoginPwd
);select @@IDENTITY";
            #endregion
            var res = SqlHelper.ExecuteScalar(sql,

                    new SqlParameter("@LoginId", model.LoginId),
                    new SqlParameter("@LoginPwd", model.LoginPwd)
                );
            return res == null ? 0 : Convert.ToInt32(res);
        }
        #endregion

        public int Insert(object model)
        {
            var parameters = new List<SqlParameter>();
            var columnBuilder = new StringBuilder();
            var valuesBuilder = new StringBuilder();
            if (model == null)
            {
                return 0;
            }

            columnBuilder.Append("(");
            valuesBuilder.Append("values(");

            var props = model.GetType().GetProperties();
            foreach (var item in props)
            {
                var val = item.GetValue(model, null).ToString();
                columnBuilder.AppendFormat("[{0}],", item.Name);
                valuesBuilder.AppendFormat("@{0},", item.Name);
                
                parameters.Add(new SqlParameter("@" + item.Name, val));
            }
            columnBuilder.Remove(columnBuilder.Length - 1, 1);
            valuesBuilder.Remove(valuesBuilder.Length - 1, 1);
           
            columnBuilder.Append(")");
            valuesBuilder.Append(")");
            string sql = SqlHelper.GenerateInsertSql("Admins", columnBuilder.ToString() + valuesBuilder.ToString());
            var res = SqlHelper.ExecuteScalar(sql, parameters.ToArray());
            return res == null ? 0 : Convert.ToInt32(res);

        }

        #region 删除一条记录 +int Delete(int id)
        public int Delete(int id)
        {
            const string sql = "DELETE FROM [dbo].[Admins] WHERE [Id] = @Id";
            return SqlHelper.ExecuteNonQuery(sql, new SqlParameter("@Id", id));
        }
        #endregion

        #region 根据主键ID更新一条记录 +int Update(Admins model)
        /// <summary>
        /// 根据主键ID更新一条记录
        /// </summary>
        /// <param name="model">更新后的实体</param>
        /// <returns>执行结果受影响行数</returns>
        public int Update(Admins model)
        {
            #region SQL语句
            const string sql = @"
UPDATE [dbo].[Admins]
SET 
	
	 [LoginId] = @LoginId
	,[LoginPwd] = @LoginPwd
WHERE [Id] = @Id";
            #endregion
            return SqlHelper.ExecuteNonQuery(sql,
                    new SqlParameter("@Id", model.Id),
                    new SqlParameter("@LoginId", model.LoginId),
                    new SqlParameter("@LoginPwd", model.LoginPwd)
                );
        }
        #endregion

        #region 分页查询一个集合 +IEnumerable<Admins> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
        /// <summary>
        /// 分页查询一个集合
        /// </summary>
        /// <param name="index">页码</param>
        /// <param name="size">页大小</param>
        /// <param name="wheres">条件匿名类</param>
        /// <param name="orderField">排序字段</param>
        /// <param name="isDesc">是否降序排序</param>
        /// <returns>实体集合</returns>
        public IEnumerable<Admins> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
        {
            var parameters = new List<SqlParameter>();
            var whereBuilder = new StringBuilder();
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
            var sql = SqlHelper.GenerateQuerySql("Admins", new[] { "Id", "LoginId", "LoginPwd" }, index, size, whereBuilder.ToString(), orderField, isDesc);
            using (var reader = SqlHelper.ExecuteReader(sql, parameters.ToArray()))
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        yield return SqlHelper.MapEntity<Admins>(reader);
                    }
                }
            }
        }
        #endregion

        #region 查询单个模型实体 +Admins QuerySingle(object wheres)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="wheres">条件匿名类</param>
        /// <returns>实体</returns>
        public Admins QuerySingle(object wheres)
        {
            var list = QueryList(1, 1, wheres, null);
            return list != null && list.Any() ? list.FirstOrDefault() : null;
        }
        #endregion

        #region 查询单个模型实体 +Admins QuerySingle(int id)
        /// <summary>
        /// 查询单个模型实体
        /// </summary>
        /// <param name="id">key</param>
        /// <returns>实体</returns>
        public Admins QuerySingle(int id)
        {
            const string sql = "SELECT TOP 1 [Id], [LoginId], [LoginPwd] FROM [dbo].[Admins] WHERE [Id] = @Id";
            using (var reader = SqlHelper.ExecuteReader(sql, new SqlParameter("@Id", id)))
            {
                if (reader.HasRows)
                {
                    reader.Read();
                    return SqlHelper.MapEntity<Admins>(reader);
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
            var sql = SqlHelper.GenerateQuerySql("Admins", new[] { "COUNT(1)" }, whereBuilder.ToString(), string.Empty);
            var res = SqlHelper.ExecuteScalar(sql, parameters.ToArray());
            return res == null ? 0 : Convert.ToInt32(res);
        }
        #endregion
    }
}