using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeqiaoDaoshi.fonts
{
    public partial class TouristServicesOne : System.Web.UI.Page
    {
        //咨询
        HeqiaoDaoshiCore.BLL.Consult consultbll = new HeqiaoDaoshiCore.BLL.Consult();
        HeqiaoDaoshiCore.Model.Consult consultmodel = new HeqiaoDaoshiCore.Model.Consult();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //服务咨询
                Bindzx();
            }
        }

        /// <summary>
        /// 数据绑定
        /// </summary>
        public void Bindzx()
        {
            string strwhere = "1=1 and ReleaseState=1 and IsDeleted=0";
            Repeater1.DataSource = consultbll.GetList(5, strwhere, "AddTime desc");
            Repeater1.DataBind();
        }
    }
}