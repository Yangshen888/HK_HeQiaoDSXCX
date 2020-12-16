using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeqiaoDaoshi.fonts
{
    public partial class ItemAtlasOne : System.Web.UI.Page
    {
        //宣传图片
        HeqiaoDaoshiCore.BLL.PublicityPicture publicityPicturebll = new HeqiaoDaoshiCore.BLL.PublicityPicture();
        HeqiaoDaoshiCore.Model.PublicityPicture publicityPicturemodel = new HeqiaoDaoshiCore.Model.PublicityPicture();
        //文件上传路径
        public static readonly string FilesUrl = WebConfigurationManager.AppSettings["FilesUrl"];
        public  string strlist = "<div style='height: 660px;'>";
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
                        if (strlistss.Length > 24)
                        {
                            int shang = strlistss.Length / 3;
                            double yushu = strlistss.Length % 3;
                            if (yushu > 0)
                            {
                                shang = shang + 1;
                            }
                            int width = 213 * shang + 25;
                            strlist = "<div style='height: 660px;'>";
                        }
                        for (int i = 0; i < strlistss.Length; i++)
                        {
                            strlist += "<div style='float:left;width:185px;margin: 0 10px;margin-top:25px;cursor:pointer;' onclick='goitemback(" + i + ")'>" +
                                       "<img src='" + FilesUrl + "UploadFiles/Guide/PublicityP/" + strlistss[i].ToString() + "'  width='186' height='165' style='border-radius: 15px;'/>" +
                                       "</div> ";
                        }
                    }
                }
            }
            strlist += "</div>";
        }
    }
}