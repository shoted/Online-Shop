using Shop.BLL;
using Shop.CommonHelper;
using Shop.Model;
using System;
using System.Collections;
using System.Collections.Generic;
using Web.Code;

namespace Web
{
    public partial class Detail : PageBase
    {
        protected Products product;
        ProductsBLL productsBLL = new ProductsBLL();

        protected Categories categories;
        protected string parentName;
        CategoriesBLL categoriesBLL = new CategoriesBLL();

        CommentsBLL commentsBLL = new CommentsBLL();
        protected IEnumerable<Comments> comments ;

        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Request["item"].ToInt32(0);
            product = productsBLL.QuerySingle(id);
            if (product == null)
            {
                NotFound();
            }
            //查询分类
            categories = categoriesBLL.QuerySingle(product.categoryId);
            if (categories==null)
            {
                NotFound();
            }
            //查询分类的父类
            var parent = categoriesBLL.QuerySingle(categories.catParentID);
            if (parent==null)
            {
                parentName = categories.catName;
            }
            else
            {
                parentName = parent.catName;
            }
            //查询评论
            comments = commentsBLL.QueryList(1, 3, null, "CommentId",true);
        }

        protected string GetUserName(int id)
        {
            UsersBLL usersBLL = new UsersBLL();
            var users = usersBLL.QuerySingle(id);
            if (users!=null)
            {
                return users.userName;
            }
            return "匿名用户";
        }
    }
}