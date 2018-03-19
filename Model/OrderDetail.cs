using System; 
namespace Shop.Model
{
	public class OrderDetail
	{
   		     
      	/// <summary>
		/// orderDetailId
        /// </summary>
        public int orderDetailId { get; set; }
		/// <summary>
		/// orderId
        /// </summary>
        public int orderId { get; set; }
		/// <summary>
		/// productId
        /// </summary>
        public int productId { get; set; }
		/// <summary>
		/// productName
        /// </summary>
        public string productName { get; set; }
		/// <summary>
		/// productCount
        /// </summary>
        public int productCount { get; set; }
		/// <summary>
		/// productPrice
        /// </summary>
        public decimal productPrice { get; set; }
		/// <summary>
		/// commentId
        /// </summary>
        public int commentId { get; set; }
		   
	}
}

