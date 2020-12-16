using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeqiaoDaoshi.fonts
{
    public partial class ScenicIntroductionList : System.Web.UI.Page
    {
        //景点介绍
        HeqiaoDaoshiCore.BLL.ScenicSpot scenicSpotbll = new HeqiaoDaoshiCore.BLL.ScenicSpot();
        HeqiaoDaoshiCore.Model.ScenicSpot scenicSpotmodel = new HeqiaoDaoshiCore.Model.ScenicSpot();
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
        /// 人文介绍
        /// </summary>
        public void Bind()
        {
            string strwhere = "1=1 and State=1 and IsDelete=0";
            Repeater1.DataSource = scenicSpotbll.GetList(strwhere);
            var count = scenicSpotbll.GetList(strwhere).Tables[0].Rows.Count;
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
                strs = FilesUrl + "UploadFiles/Scene/Picture/" + filesname.Split(',')[0];
            }
            return strs;
        }
    }
}