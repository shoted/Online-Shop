using System; 
namespace Shop.Model
{
	public class Orders
	{
   		     
      	/// <summary>
		/// orderId
        /// </summary>
        public int orderId { get; set; }
		/// <summary>
		/// addTime
        /// </summary>
        public DateTime addTime { get; set; }
		/// <summary>
		/// userId
        /// </summary>
        public int userId { get; set; }
		/// <summary>
		/// totalPrice
        /// </summary>
        public decimal totalPrice { get; set; }
		/// <summary>
		/// payPrice
        /// </summary>
        public decimal payPrice { get; set; }
		/// <summary>
		/// postAddress
        /// </summary>
        public string postAddress { get; set; }
		/// <summary>
		/// payStatus
        /// </summary>
        public int payStatus { get; set; }
		/// <summary>
		/// orderStatus
        /// </summary>
        public int orderStatus { get; set; }
		/// <summary>
		/// orderRemark
        /// </summary>
        public string orderRemark { get; set; }
		/// <summary>
		/// payTime
        /// </summary>
        public DateTime payTime { get; set; }
		/// <summary>
		/// exchangeOrderId
        /// </summary>
        public int exchangeOrderId { get; set; }
		/// <summary>
		/// returnOrderId
        /// </summary>
        public int returnOrderId { get; set; }
		/// <summary>
		/// useStone
        /// </summary>
        public int useStone { get; set; }
		   
	}
}

