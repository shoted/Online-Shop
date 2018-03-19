using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Code;
using Shop.BLL;
using Shop.CommonHelper;
using Shop.Model;

namespace Web
{
    public partial class List : PageBase
    {
        Shop.BLL.ProductsBLL productsBLL = new ProductsBLL();
        Shop.BLL.CategoriesBLL categoriesBLL = new CategoriesBLL();
        public IEnumerable<Shop.Model.Products> Products { get; set; }

        public Shop.Model.Categories Category { get; set; }
        public int PageIndex { get; set; }
        public int TotalCount { get; set; }
        public int TotalPages { get; set; }
        public SortType sortType { get; set; }
        public string ParentName { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            PageIndex = Request["page"].ToInt32(1);
            int cat = Request["cat"].ToInt32(75); // 转换失败则获取默认值
            sortType = (SortType)Request["sort"].ToInt32(4);

            // 默认按照ID降序排序
            var orderField = "add_Time";
            var isDesc = true;

            switch (sortType)
            {
                case SortType.PriceAsc:
                    isDesc = false;
                    orderField = "productPrice";
                    break;
                case SortType.PriceDesc:
                    orderField = "productPrice";
                    break;
                case SortType.OnsaleDesc:
                    orderField = "add_Time";
                    break;
            }

            if (cat == 0)
            {
                // 没有分类ID 
                NotFound();
            }

            // 根据分类ID查询分类实体信息
            Category = categoriesBLL.QuerySingle(cat);
            if (Category == null)
            {
                // 没有分类ID  没有找到 
                NotFound();
            }
            ParentName = Category.catParentID == 0 ? Category.catName : categoriesBLL.QuerySingle(Category.catParentID).catName;
            object where = null;
            if (Category.catParentID == 0)
            {
                where = new { CategoryId = Category.catId, productStatus = 1 };
            }
            else
            {
                where = new { CategoryId = cat, productStatus = 1 };
            }
            //　开始查询该分类下面的商品信息
            var size = 20; // 页大小

            TotalCount = productsBLL.QueryCount(where);

            TotalPages = (int)Math.Ceiling(TotalCount / (double)size);

            Products = productsBLL.QueryList(PageIndex, size, where, orderField, isDesc);

            if (Products == null)
            {
                NotFound();
            }
        }
    }
}