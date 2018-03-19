using System; 
namespace Shop.Model
{
	public class Carts
	{
   		     
      	/// <summary>
		/// 购物车ID
        /// </summary>
        public int cartId { get; set; }
		/// <summary>
		/// 用户ID
        /// </summary>
        public int userId { get; set; }
		/// <summary>
		/// 产品ID
        /// </summary>
        public int productId { get; set; }
		/// <summary>
		/// 产品数量
        /// </summary>
        public int productCount { get; set; }
		/// <summary>
		/// 添加时间
        /// </summary>
        public DateTime addTime { get; set; }
		   
	}
}

