using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeqiaoDaoshi.fonts
{
    public partial class ItemAtlasShow : System.Web.UI.Page
    {
        //宣传视频
        HeqiaoDaoshiCore.BLL.PromotionalVideo promotionalVideobll = new HeqiaoDaoshiCore.BLL.PromotionalVideo();
        HeqiaoDaoshiCore.Model.PromotionalVideo promotionalVideomodel = new HeqiaoDaoshiCore.Model.PromotionalVideo();
        //视频地址
        public string spurl = "";
        //文件上传路径
        public static readonly string FilesUrl = WebConfigurationManager.AppSettings["FilesUrl"];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind();
            }
        }

        public void Bind()
        {
            if (Request.QueryString["ids"] != null && Request.QueryString["ids"].ToString() != "")
            {
                promotionalVideomodel = promotionalVideobll.GetModel(Convert.ToInt32(Request.QueryString["ids"]));
                if (promotionalVideomodel != null)
                {
                    spurl = FilesUrl + "UploadFiles/Scene/video/" + promotionalVideomodel.Video;
                }
            }
        }
    }
}