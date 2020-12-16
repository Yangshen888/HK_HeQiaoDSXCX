
using Haikan.DBHelper;
using HeqiaoDaoshi.Untils;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Http.ModelBinding.Binders;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeqiaoDaoshi.fonts
{
    public partial class MapDisplay : System.Web.UI.Page
    {
        public HeqiaoDaoshiCore.BLL.Mapmark mapmarkbll = new HeqiaoDaoshiCore.BLL.Mapmark();
        public HeqiaoDaoshiCore.BLL.Mark markbll = new HeqiaoDaoshiCore.BLL.Mark();
        public List<HeqiaoDaoshiCore.Model.Mark> dr = null;
        public List<MarkList> dr2 = null;
        public string imgpath = "http://localhost:54321/UploadFiles/Mark/";
        public string imgpath1 = "http\\:\\/\\/localhost:54321\\/UploadFiles\\/Mark\\/";
        public string jsonData = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //if(!IsPostBack)
            {
                Bind();
            }
        }
        private void Bind()
        {
            DataSet ds = markbll.GetList("IsDelete=0");
            dr = ExtendMethod.ToDataList<HeqiaoDaoshiCore.Model.Mark>(ds.Tables[0]);


            var sql = "SELECT m.MarkName,m.MarkPicture,mp.Position,mp.Introduce from Mapmark mp LEFT JOIN Mark m on mp.MarkUUID=m.MarkUUID where mp.IsDelete=0";
            var ds2 = DbHelperSql.Query(sql);
            dr2 = ExtendMethod.ToDataList<MarkList>(ds2.Tables[0]);
            jsonData = JsonConvert.SerializeObject(dr2);
        }
    }
}