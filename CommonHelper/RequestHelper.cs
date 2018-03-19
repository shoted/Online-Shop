namespace System.Web
{
    public static class RequestHelper
    {
        /// <summary> 
        /// 获取IP地址 
        /// </summary> 
        public static string IPAddress
        {
            get
            {
                string userIP;
                // HttpRequest Request = HttpContext.Current.Request; 
                HttpRequest Request = HttpContext.Current.Request; // ForumContext.Current.Context.Request; 
                                                                   // 如果使用代理，获取真实IP 
                if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != "")
                    userIP = Request.ServerVariables["REMOTE_ADDR"];
                else
                    userIP = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                if (userIP == null || userIP == "")
                    userIP = Request.UserHostAddress;
                return userIP;
            }
        }

        /// <summary>
        /// 静态类静态方法 THIS 关键字(将当前类的命名空间和扩展对象类型的命名空间保持一致)
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public static bool IsPostBack(this HttpRequest request)
        {
            return request.HttpMethod.Equals("post", StringComparison.InvariantCultureIgnoreCase);
        }

       

        public static string SubAddress(string address)
        {
            return "";
        }

        public static string ChangePayStatus(int status)
        {
            return status == 0 ? "未付款" : "已付款";
        }

        public static string ChangePayTime(DateTime time)
        {
            return time == DateTime.MinValue ? "未付款" : time.ToString();
        }

        public static string ChangeStone(int stone)
        {
            return stone == 0 ? "无" : stone.ToString();
        }

        public static string ChangeOrderSta(int sta)
        {
            switch (sta)
            {
                case 0: return "待付款";
                case 1: return "待发货";
                case 2: return "待收货";
                case 3: return "待评价";
                default:
                    return "";
            }
        }
    }
}
