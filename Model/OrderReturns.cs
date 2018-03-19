using System; 
namespace Shop.Model
{
	public class OrderReturns
	{
   		     
      	/// <summary>
		/// returnId
        /// </summary>
        public int returnId { get; set; }
		/// <summary>
		/// orderId
        /// </summary>
        public int orderId { get; set; }
		/// <summary>
		/// payPrice
        /// </summary>
        public decimal payPrice { get; set; }
		/// <summary>
		/// returnPrice
        /// </summary>
        public decimal returnPrice { get; set; }
		/// <summary>
		/// returnStatus
        /// </summary>
        public int returnStatus { get; set; }
		/// <summary>
		/// returnTime
        /// </summary>
        public DateTime returnTime { get; set; }
		   
	}
}

