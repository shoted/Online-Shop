using Shop.Model;
using System;
using System.IO;
using System.Web;
using System.Web.UI;

namespace Web.code
{
    public class AdminPage : Page
    {
        protected Admins admin;
        protected override void OnInit(EventArgs e)
        {
            admin = Session["admin"] as Admins;
            if (admin == null)
            {
                Login();
            }
            base.OnInit(e);
        }

        protected void Login()
        {
            //Response.Redirect("/www/Login.aspx");
            admin = new Admins();
            admin.Id = 1;
        }

        protected void NotFound()
        {

        }

        protected string LayerClose()
        {
            return "window.parent.location.reload(); var index = parent.layer.getFrameIndex(window.name); parent.layer.close(index); ";
        }

        protected void GoBack()
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "s", "<Script>window.history.back();</script>");
            return;
        }

        protected string IMGSave(string str)
        {
            HttpPostedFile file = Request.Files[str];

            if (file == null)
            {
                return "";
            }

            //1.1.校验上传的文件
            string fileExt = Path.GetExtension(file.FileName);
            if (!(fileExt == ".jpg" || fileExt == ".jpeg" || fileExt == ".bmp" || fileExt == ".gif" || fileExt == ".png"))
            {
                //不是图片
                return "";
            }
            //1.2计算文件的MD5值,用MD5值作为文件名
            string fileNameTmp = file.InputStream.GetMd5();
            //2.获得图片的相对路径
            string path = "/contents/" + fileNameTmp + fileExt;
            //3.获得网站的绝对路径  存储文件
            file.SaveAs(Request.MapPath(path));
            return path;
        }
    }
}