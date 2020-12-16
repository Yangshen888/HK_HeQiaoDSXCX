using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeqiaoDaoshi.fonts
{
    public partial class ItemShuList : System.Web.UI.Page
    {
        //宣传图片
        HeqiaoDaoshiCore.BLL.PublicityPicture publicityPicturebll = new HeqiaoDaoshiCore.BLL.PublicityPicture();
        HeqiaoDaoshiCore.Model.PublicityPicture publicityPicturemodel = new HeqiaoDaoshiCore.Model.PublicityPicture();
        //文件上传路径
        public static readonly string FilesUrl = WebConfigurationManager.AppSettings["FilesUrl"];
        public string styles = "style='height: 660px;width:1725px;'";
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
            string strwhere = "1=1 and IsRelease=1 and IsDeleted=0";
            Repeater1.DataSource = publicityPicturebll.GetList(strwhere);
            Repeater1.DataBind();
            if (Repeater1.Items.Count > 4)
            {
                styles = "style='height: 660px;width:" + (425 * Repeater1.Items.Count + 25) + "px;'";
            }
        }

        /// <summary>
        /// 获取文件地址
        /// </summary>
        /// <param name="filesname"></param>
        /// <returns></returns>
        public string geturl(string filesname)
        {
            string strs = "";
            if (filesname != "")
            {
                strs = FilesUrl + "UploadFiles/Guide/CulturalI/" + filesname;
            }
            return strs;
        }
    }
}