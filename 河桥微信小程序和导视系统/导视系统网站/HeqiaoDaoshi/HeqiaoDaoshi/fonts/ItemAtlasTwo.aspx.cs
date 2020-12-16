using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeqiaoDaoshi.fonts
{
    public partial class ItemAtlasTwo : System.Web.UI.Page
    {
        //宣传图片
        HeqiaoDaoshiCore.BLL.PublicityPicture publicityPicturebll = new HeqiaoDaoshiCore.BLL.PublicityPicture();
        HeqiaoDaoshiCore.Model.PublicityPicture publicityPicturemodel = new HeqiaoDaoshiCore.Model.PublicityPicture();
        //文件上传路径
        public static readonly string FilesUrl = WebConfigurationManager.AppSettings["FilesUrl"];

        public string Itemlistr = "<li><div style='float: left; width: 1230px; margin-top: 85px;'><img src ='images/蒙版组30.png'/></div><span class='li-tit'>第1张，共1张</span></li>";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind();
            }
        }

        /// <summary>
        /// 数据绑定
        /// </summary>
        public void Bind()
        {
            if (Request.QueryString["ids"] != null && Request.QueryString["ids"].ToString() != "")
            {
                publicityPicturemodel = publicityPicturebll.GetModel(Convert.ToInt32(Request.QueryString["ids"]));
                if (publicityPicturemodel != null)
                {
                    string[] strlistss = publicityPicturemodel.Content.Split(',');
                    if (strlistss.Length > 0)
                    {
                        Itemlistr = "";
                        for (int i = 0; i < strlistss.Length; i++)
                        {
                            Itemlistr += "<li><div style='float: left; width: 1230px; margin-top: 85px;'>" +
                                         "<img src ='" + FilesUrl + "UploadFiles/Guide/PublicityP/" + strlistss[i].ToString() + "' width='1207' height='557'/></div>" +
                                         "<span class='li-tit'>第" + (i + 1) + "张，共" + strlistss.Length + "张</span></li>";
                        }
                    }
                }
            }
        }
    }
}