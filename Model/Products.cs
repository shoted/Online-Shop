using System; 
namespace Shop.Model
{
	public class Products
	{
   		     
      	/// <summary>
		/// productId
        /// </summary>
        public int productId { get; set; }
		/// <summary>
		/// productName
        /// </summary>
        public string productName { get; set; }
		/// <summary>
		/// categoryId
        /// </summary>
        public int categoryId { get; set; }
		/// <summary>
		/// productPrice
        /// </summary>
        public decimal productPrice { get; set; }
		/// <summary>
		/// productDecribe
        /// </summary>
        public string productDecribe { get; set; }
		/// <summary>
		/// productDetail
        /// </summary>
        public string productDetail { get; set; }
		/// <summary>
		/// productIMG
        /// </summary>
        public string productIMG { get; set; }
		/// <summary>
		/// productInventory
        /// </summary>
        public int productInventory { get; set; }
		/// <summary>
		/// add_time
        /// </summary>
        public DateTime add_time { get; set; }
		/// <summary>
		/// productStatus
        /// </summary>
        public int productStatus { get; set; }
		/// <summary>
		/// productStone
        /// </summary>
        public int productStone { get; set; }
		   
	}
}

