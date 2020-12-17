using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeqiaoDaoshi.fonts
{
    public partial class ItemHengZiList : System.Web.UI.Page
    {
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
            if (Request.QueryString["types"] != null && Request.QueryString["types"].ToString() != "")
            {
                if (Request.QueryString["types"].ToString() == "1")//人文介绍
                {
                    BindList(1);
                }
                else if (Request.QueryString["types"].ToString() == "2")//自然资源
                {
                    BindList(2);
                }
                else if (Request.QueryString["types"].ToString() == "3")//宣传图片
                {
                    BindList(3);
                }
                else if (Request.QueryString["types"].ToString() == "4")//宣传视频
                {
                    BindList(4);
                }
                else if (Request.QueryString["types"].ToString() == "5")//特产
                {
                    BindList(5);
                }
                else if (Request.QueryString["types"].ToString() == "6")//特色名宿
                {
                    BindList(6);
                }
                else if (Request.QueryString["types"].ToString() == "7")//特色采摘
                {
                    BindList(7);
                }
                else if (Request.QueryString["types"].ToString() == "8")//推荐线路
                {
                    BindList(8);
                }
            }
        }

        /// <summary>
        /// 列表绑定
        /// </summary>
        public void BindList(int types)
        {
            string strwhere = "SELECT * FROM(" +
                              "SELECT Title as Title,ID as Ids,'1' as Types,Cover as Picname,ReleaseTime as AddTime FROM CulturalIntroduc where IsRelease=1 and IsDeleted=0 UNION ALL " +
                              "SELECT Title as Title,ID as Ids,'2' as Types,Cover as Picname,ReleaseTime as AddTime FROM NaturalResources where IsRelease=1 and IsDeleted=0 UNION ALL " +
                              "SELECT Title as Title,ID as Ids,'3' as Types,Cover as Picname,ReleaseTime as AddTime FROM PublicityPicture where IsRelease=1 and IsDeleted=0 UNION ALL " +
                              "SELECT Title as Title,ID as Ids,'4' as Types,Cover as Picname,ReleaseTime as AddTime FROM PromotionalVideo where ReleaseState=1 and IsDeleted=0 UNION ALL " +
                              "SELECT FoodName as Title,ID as Ids,'5' as Types,Cover as Picname,CreateTime as AddTime FROM Food where State=1 and IsDelete=0 UNION ALL " +
                              "SELECT Name as Title,ID as Ids,'6' as Types,Cover as Picname,CreateTime as AddTime FROM Hotel where State=1 and IsDelete=0  UNION ALL " +
                              "SELECT Name as Title,ID as Ids,'7' as Types,Cover as Picname,CreateTime as AddTime FROM SpecialPick where State=1 and IsDelete=0 UNION ALL " +
                              "SELECT Title as Title,ID as Ids,'8' as Types,PhotoUrl as Picname,AddTime as AddTime FROM Strategy where TipsType=2 and ThroughStaues=0 and Isdelete=0" +
                              ")b where b.Types=" + types + " order BY b.AddTime DESC";
            Repeater1.DataSource = Haikan.DBHelper.DbHelperSql.Query(strwhere);
            Repeater1.DataBind();
            if (Repeater1.Items.Count > 4)
            {
                styles = "style='height: 660px;width:" + (425 * Repeater1.Items.Count + 25) + "px;'";
            }
        }
        /// <summary>
        /// 判断是视频还是图片
        /// </summary>
        /// <param name="types"></param>
        /// <returns></returns>
        public string getstyle(string types)
        {
            string strs = "style='position: relative; top: 190px; left: 175px;display:none;'";
            if(types=="4")
            {
                strs = "style='position: relative; top: 190px; left: 175px;display:inline-black;'";
            }
            return strs;
        }
        /// <summary>
        /// 获取文件地址
        /// </summary>
        /// <param name="filesname"></param>
        /// <returns></returns>
        public string geturl(string filesname, string types)
        {
            string strs = "";
            if (filesname != "")
            {
                if (types == "1")
                {
                    strs = FilesUrl + "UploadFiles/Guide/CulturalI/" + filesname;
                }
                else if (types == "2")
                {
                    strs = FilesUrl + "UploadFiles/Guide/NaturalR/" + filesname;
                }
                else if (types == "3")
                {
                    strs = FilesUrl + "UploadFiles/Guide/PublicityP/" + filesname;
                }
                else if (types == "4")
                {
                    strs = FilesUrl + "UploadFiles/Scene/Picture/" + filesname;
                }
                else if (types == "5")
                {
                    strs = FilesUrl + "UploadFiles/Food/" + filesname;
                }
                else if (types == "6")
                {
                    strs = FilesUrl + "UploadFiles/Hotel/" + filesname;
                }
                else if (types == "7")
                {
                    strs = FilesUrl + "UploadFiles/SpecialPick/" + filesname;
                }
                else if (types == "8")
                {
                    strs = FilesUrl + "UploadFiles/Traveltips/Strategy/" + filesname.Split(',')[0];
                }
            }
            return strs;
        }
        public string gettypes(string type)
        {
            //播放按钮存在
            string strs = "style='position: absolute; top: 50%; right:49%; z-index:1;'";
            if(type!="4")
            {
                strs = "style='position: absolute; top: 50%; right:49%; z-index:1;display:none;'";
            }
            return strs;
        }
    }
}