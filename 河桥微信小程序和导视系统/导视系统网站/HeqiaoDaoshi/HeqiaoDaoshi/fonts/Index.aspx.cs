using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeqiaoDaoshi.fonts
{
    
    public partial class Index : System.Web.UI.Page
    {
        public List<SCSP> cSPs = new List<SCSP>();
        //咨询
        HeqiaoDaoshiCore.BLL.Consult consultbll = new HeqiaoDaoshiCore.BLL.Consult();
        HeqiaoDaoshiCore.Model.Consult consultmodel = new HeqiaoDaoshiCore.Model.Consult();
        //首页宣传视频
        HeqiaoDaoshiCore.BLL.Promotional promotionalbll = new HeqiaoDaoshiCore.BLL.Promotional();
        HeqiaoDaoshiCore.Model.Promotional promotionalmodel = new HeqiaoDaoshiCore.Model.Promotional();

        HeqiaoDaoshiCore.BLL.ScenicSpot scenicSpotbill = new HeqiaoDaoshiCore.BLL.ScenicSpot();

        //文件上传路径
        public static readonly string FilesUrl = WebConfigurationManager.AppSettings["FilesUrl"];
        public string spurl = "";

        //internal List<SCSP> CSPs { get => cSPs; set => cSPs = value; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //首页视频宣传地址
                DataSet dss = promotionalbll.GetList("1=1 and Isdeleted=0 and Staues=1");
                if (dss.Tables[0].Rows.Count > 0)
                {
                    spurl = FilesUrl + "UploadFiles/Scene/video/"+ dss.Tables[0].Rows[0]["Video"].ToString();
                }
                //服务咨询
                Bindzx();

                cSPs = scenicSpotbill.GetModelList("IsDelete = 0 and State = 1").Select(x => new SCSP
                {
                    ID=x.ID,
                    ScenicSpotUUID=x.ScenicSpotUUID,
                    //x.Lon,
                    //x.Lat,
                    //Name = x.Name == null ? "" : x.Name != null ? x.Name : "",
                    Picture = Image1url(x.Picture),
                }).ToList();


            }
        }

        /// <summary>
        /// 数据绑定
        /// </summary>
        public void Bindzx()
        {
            //string strwhere = "1=1 and ReleaseState=1 and IsDeleted=0";
            //Repeater1.DataSource = consultbll.GetList(5, strwhere, "AddTime desc");
            //Repeater1.DataBind();
        }

        public static string Image1url(string imgname)
        {
            if (!string.IsNullOrEmpty(imgname))
            {
                return "https://hqjsc.hzgx.info/UploadFiles/Scene/Picture/" + imgname.Split(',')[0];
            }
            else
            {
                return "";
            }
        }
    }

    public class SCSP
    {
        public int ID { get; set; }
        public string Picture { get; set; }
        public Guid ScenicSpotUUID { get; set; }
    }
}