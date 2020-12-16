using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeqiaoDaoshi.fonts
{
    public partial class TouristServicesTwo : System.Web.UI.Page
    {
        //线路
        HeqiaoDaoshiCore.BLL.Strategy strategybll = new HeqiaoDaoshiCore.BLL.Strategy();
        HeqiaoDaoshiCore.Model.Strategy strategymodel = new HeqiaoDaoshiCore.Model.Strategy();
        //文件上传路径
        public static readonly string FilesUrl = WebConfigurationManager.AppSettings["FilesUrl"];
        public string styles = "style='height: 660px;width:1725px;'";

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}