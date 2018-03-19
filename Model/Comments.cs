using System; 
namespace Shop.Model
{
	public class Comments
	{
   		     
      	/// <summary>
		/// commentId
        /// </summary>
        public int commentId { get; set; }
		/// <summary>
		/// commentContent
        /// </summary>
        public string commentContent { get; set; }
		/// <summary>
		/// addTime
        /// </summary>
        public DateTime addTime { get; set; }
		/// <summary>
		/// productId
        /// </summary>
        public int productId { get; set; }
		/// <summary>
		/// status
        /// </summary>
        public int status { get; set; }
		   
	}
}

