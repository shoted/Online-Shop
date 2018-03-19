using System; 
namespace Shop.Model
{
	public class Users
	{
   		     
      	/// <summary>
		/// userId
        /// </summary>
        public int userId { get; set; }
		/// <summary>
		/// userName
        /// </summary>
        public string userName { get; set; }
		/// <summary>
		/// userPassword
        /// </summary>
        public string userPassword { get; set; }
		/// <summary>
		/// userStatus
        /// </summary>
        public int userStatus { get; set; }
		/// <summary>
		/// userStone
        /// </summary>
        public int userStone { get; set; }
		/// <summary>
		/// add_time
        /// </summary>
        public DateTime add_time { get; set; }
		/// <summary>
		/// last_time
        /// </summary>
        public DateTime last_time { get; set; }
		   
	}
}

