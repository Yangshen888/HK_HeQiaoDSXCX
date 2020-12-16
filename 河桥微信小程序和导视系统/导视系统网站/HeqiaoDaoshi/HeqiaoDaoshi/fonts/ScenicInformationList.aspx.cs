using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeqiaoDaoshi.fonts
{
    public partial class ScenicInformationList : System.Web.UI.Page
    {
        //资讯
        HeqiaoDaoshiCore.BLL.Information informationbll = new HeqiaoDaoshiCore.BLL.Information();
        HeqiaoDaoshiCore.Model.Information informationmodel = new HeqiaoDaoshiCore.Model.Information();
        //文件上传路径
        public static readonly string FilesUrl = WebConfigurationManager.AppSettings["FilesUrl"];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind();
            }
        }

        /// <summary>
        /// 获取文件地址
        /// </summary>
        /// <param name="filesname"></param>
        /// <returns></returns>
        public string geturl(string filesname)
        {
            string strs = "fonts/images/蒙版组%2026.png";
            if (filesname != "")
            {
                string[] strlist = filesname.Split(',');
                if (strlist.Length > 0)
                {
                    strs = FilesUrl + "UploadFiles/Guide/CulturalI/" + strlist[0];
                }
            }
            return strs;
        }
        /// <summary>
        /// 获取文件地址
        /// </summary>
        /// <param name="filesname"></param>
        /// <returns></returns>
        public string geturl1(string filesname)
        {
            string strs = "fonts/images/蒙版组%2026.png";
            if (filesname != "")
            {
                string[] strlist = filesname.Split(',');
                if (strlist.Length > 1)
                {
                    strs = FilesUrl + "UploadFiles/Guide/CulturalI/" + strlist[1];
                }
            }
            return strs;
        }
        /// <summary>
        /// 获取文件地址
        /// </summary>
        /// <param name="filesname"></param>
        /// <returns></returns>
        public string geturl2(string filesname)
        {
            string strs = "fonts/images/蒙版组%2026.png";
            if (filesname != "")
            {
                string[] strlist = filesname.Split(',');
                if (strlist.Length > 2)
                {
                    strs = FilesUrl + "UploadFiles/Guide/CulturalI/" + strlist[2];
                }
            }
            return strs;
        }

        /// <summary>
        /// 数据绑定
        /// </summary>
        public void Bind()
        {
            string strwhere = "1=1 and State=1 and IsDeleted=0";
            Repeater1.DataSource =informationbll.GetList(strwhere);
            Repeater1.DataBind();            
        }
    }
}