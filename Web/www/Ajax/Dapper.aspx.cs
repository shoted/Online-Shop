using Itcast.Mall.Utility;
using Shop.CommonHelper;
using System;
using System.Text.RegularExpressions;

namespace Web.www.Ajax
{
    public partial class dapper : System.Web.UI.Page
    {
        Regex r = new Regex("^\\s*([A-Za-z0-9_-]+(\\.\\w+)*@(\\w+\\.)+\\w{2,5})\\s*$");
        protected void Page_Load(object sender, EventArgs e)
        {
            CookieHelper.Remove("vcode");
            if (Request["type"] == "sign" || Request["type"] == "send")
            {
                string userName = Request["username"];
                if (!string.IsNullOrEmpty(userName) && r.IsMatch(userName))
                {
                    Response.Write("ok");
                    SendMail(userName);
                    Response.End();
                }
            }

            if (Request["type"] == "mail")
            {
                string ucode = Request["vcode"];
                string vcode = CookieHelper.Get("vcode");
                if (ucode.Equals(vcode))
                {
                    Response.Write("ok");
                    Response.End();
                }
            }

        }

        private void SendMail(string name)
        {
            string vcode = CaptchaHelper.CreateRandomCode(6);
            CookieHelper.Set("vcode", vcode, DateTime.Now.AddHours(1));
            string content = "<html><head><title>验证码</title></head><body><div style='background:#f7f7f7;overflow:hidden'><div style='background:#fff;border:1px solid #ccc;margin:2%;padding:0 30px'><div style='line-height:40px;height:40px'>&nbsp;</div>";
            content += "<p style='margin:0;padding:0;font-size:14px;line-height:30px;color:#333;font-family:arial,sans-serif;font-weight:bold'>亲爱的用户：</p><div style='line-height:20px;height:20px'>&nbsp;</div>";
            content += "<p style='margin:0;padding:0;line-height:30px;font-size:14px;color:#333;'>您好！感谢您使用，您正在进行邮箱验证，本次请求的验证码为：</p>";
            content += "<p style='margin:0;padding:0;line-height:30px;font-size:14px;color:#333;'><b style='font-size:18px;color:#f90'>" + vcode + "</b><span style='margin:0;padding:0;margin-left:10px;line-height:30px;font-size:14px;color:#979797;'></span></p>";
            content += "<div style='line-height:80px;height:80px'>&nbsp;</div><p style='margin:0;padding:0;line-height:30px;font-size:14px;color:#333;'>系统管理员</p><p style='margin:0;padding:0;line-height:30px;font-size:14px;color:#333;'> " + DateTime.Now + " </p><div style='line-height:20px;height:20px'>&nbsp;</div></div></div></body></html>";
            try
            {
                MailHelper.Send(name, "商城验证码", content);
            }
            catch (Exception)
            {
                CookieHelper.Remove("vcode");
                Response.End();
            }

        }


    }
}