using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeqiaoDaoshi.fonts
{
    public partial class ItemHengZiShow : System.Web.UI.Page
    {
        //人文介绍
        HeqiaoDaoshiCore.BLL.CulturalIntroduc culturalIntroducbll = new HeqiaoDaoshiCore.BLL.CulturalIntroduc();
        HeqiaoDaoshiCore.Model.CulturalIntroduc culturalIntroducmodel = new HeqiaoDaoshiCore.Model.CulturalIntroduc();
        //自然资源
        HeqiaoDaoshiCore.BLL.NaturalResources naturalResourcesbll = new HeqiaoDaoshiCore.BLL.NaturalResources();
        HeqiaoDaoshiCore.Model.NaturalResources naturalResourcesmodel = new HeqiaoDaoshiCore.Model.NaturalResources();
        //景点介绍
        HeqiaoDaoshiCore.BLL.ScenicSpot scenicSpotbll = new HeqiaoDaoshiCore.BLL.ScenicSpot();
        HeqiaoDaoshiCore.Model.ScenicSpot scenicSpotmodel = new HeqiaoDaoshiCore.Model.ScenicSpot();
        //特产
        HeqiaoDaoshiCore.BLL.Food foodbll = new HeqiaoDaoshiCore.BLL.Food();
        HeqiaoDaoshiCore.Model.Food foodmodel = new HeqiaoDaoshiCore.Model.Food();
        //特色民宿
        HeqiaoDaoshiCore.BLL.Hotel hotelbll = new HeqiaoDaoshiCore.BLL.Hotel();
        HeqiaoDaoshiCore.Model.Hotel hotelmodel = new HeqiaoDaoshiCore.Model.Hotel();
        //特色采摘
        HeqiaoDaoshiCore.BLL.SpecialPick specialPickbll = new HeqiaoDaoshiCore.BLL.SpecialPick();
        HeqiaoDaoshiCore.Model.SpecialPick specialPickmodel = new HeqiaoDaoshiCore.Model.SpecialPick();
        //推荐线路
        HeqiaoDaoshiCore.BLL.Strategy strategybll = new HeqiaoDaoshiCore.BLL.Strategy();
        HeqiaoDaoshiCore.Model.Strategy strategymodel = new HeqiaoDaoshiCore.Model.Strategy();
        //文件上传路径
        public static readonly string FilesUrl = WebConfigurationManager.AppSettings["FilesUrl"];
        public string styles = "style='height: 660px;width:1725px;'";
        public string contentstr = "";
        public string picimageurl1 = "";
        public string picimageurl2 = "";
        public string picimageurl3 = "";
        public string audioUrl = "";
        public string headname = "";
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
                    Bindrwjs("1");
                }
                else if (Request.QueryString["types"].ToString() == "2")//自然资源
                {
                    Bindzrzy("2");
                }
                else if (Request.QueryString["types"].ToString() == "3")//宣传视频
                {
                    Bindxcsp();
                }
                else if (Request.QueryString["types"].ToString() == "4")//景点介绍
                {
                    Bindjdjs("4");
                }
                else if (Request.QueryString["types"].ToString() == "5")//特产
                {
                    Bindtc("5");
                }
                else if (Request.QueryString["types"].ToString() == "6")//特色民宿
                {
                    Bindtsms("6");
                }
                else if (Request.QueryString["types"].ToString() == "7")//特色采摘
                {
                    Bindtscz("7");
                }
                else if (Request.QueryString["types"].ToString() == "8")//推荐线路
                {
                    Bindtjxl("8");
                }
            }
        }

        /// <summary>
        /// 人文介绍
        /// </summary>
        public void Bindrwjs(string types)
        {
            if (Request.QueryString["ids"] != null && Request.QueryString["ids"].ToString() != "")
            {
                culturalIntroducmodel = culturalIntroducbll.GetModel(Convert.ToInt32(Request.QueryString["ids"]));
                if (culturalIntroducmodel != null)
                {
                    contentstr = culturalIntroducmodel.Content;
                    headname = culturalIntroducmodel.Title;
                    if (culturalIntroducmodel.Photo.ToString() != "")
                    {
                        string[] strlist = culturalIntroducmodel.Photo.ToString().Split(',');
                        if (strlist.Length > 0)
                        {
                            picimageurl1 = geturl(strlist[0].Trim(), types);
                            if (strlist.Length > 1)
                            {
                                picimageurl2 = geturl(strlist[1].Trim(), types);
                            }
                            if (strlist.Length > 2)
                            {
                                picimageurl3 = geturl(strlist[2].Trim(), types);
                            }
                        }
                    }
                }
            }
        }

        /// <summary> 
        /// 自然资源
        /// </summary>
        public void Bindzrzy(string types)
        {
            if (Request.QueryString["ids"] != null && Request.QueryString["ids"].ToString() != "")
            {
                naturalResourcesmodel = naturalResourcesbll.GetModel(Convert.ToInt32(Request.QueryString["ids"]));
                if (naturalResourcesmodel != null)
                {
                    contentstr = naturalResourcesmodel.Content;
                    headname = naturalResourcesmodel.Title;
                    if (naturalResourcesmodel.Photo.ToString() != "")
                    {
                        string[] strlist = naturalResourcesmodel.Photo.ToString().Split(',');
                        if (strlist.Length > 0)
                        {
                            picimageurl1 = geturl(strlist[0].Trim(), types);
                            if (strlist.Length > 1)
                            {
                                picimageurl2 = geturl(strlist[1].Trim(), types);
                            }
                            if (strlist.Length > 2)
                            {
                                picimageurl3 = geturl(strlist[2].Trim(), types);
                            }
                        }
                    }
                }
            }
        }

        /// <summary>
        /// 宣传视频
        /// </summary>
        public void Bindxcsp()
        {
            if (Request.QueryString["ids"] != null && Request.QueryString["ids"].ToString() != "")
            {

            }
        }

        /// <summary>
        /// 景点介绍
        /// </summary>
        public void Bindjdjs(string types)
        {
            if (Request.QueryString["ids"] != null && Request.QueryString["ids"].ToString() != "")
            {
                scenicSpotmodel = scenicSpotbll.GetModel(Convert.ToInt32(Request.QueryString["ids"]));
                if (scenicSpotmodel != null)
                {
                    contentstr = scenicSpotmodel.SpotContent;
                    headname = scenicSpotmodel.Name;
                    audioUrl = "https://hqjsc.hzgx.info/UploadFiles/Scene/Audio/" + scenicSpotmodel.Audio;
                    if (scenicSpotmodel.Picture.ToString() != "")
                    {
                        string[] strlist = scenicSpotmodel.Picture.ToString().Split(',');
                        if (strlist.Length > 0)
                        {
                            picimageurl1 = geturl(strlist[0].Trim(), types);
                            if (strlist.Length > 1)
                            {
                                picimageurl2 = geturl(strlist[1].Trim(), types);
                            }
                            if (strlist.Length > 2)
                            {
                                picimageurl3 = geturl(strlist[2].Trim(), types);
                            }
                        }
                    }

                }
            }
        }

        /// <summary>
        /// 特产
        /// </summary>
        public void Bindtc(string types)
        {
            if (Request.QueryString["ids"] != null && Request.QueryString["ids"].ToString() != "")
            {
                foodmodel = foodbll.GetModel(Convert.ToInt32(Request.QueryString["ids"]));
                if (foodmodel != null)
                {
                    contentstr = foodmodel.Introduction;
                    headname = foodmodel.FoodName;
                    if (foodmodel.Picture.ToString() != "")
                    {
                        string[] strlist = foodmodel.Picture.ToString().Split(',');
                        if (strlist.Length > 0)
                        {
                            picimageurl1 = geturl(strlist[0].Trim(), types);
                            if (strlist.Length > 1)
                            {
                                picimageurl2 = geturl(strlist[1].Trim(), types);
                            }
                            if (strlist.Length > 2)
                            {
                                picimageurl3 = geturl(strlist[2].Trim(), types);
                            }
                        }
                    }
                }
            }
        }

        /// <summary>
        /// 特色民宿
        /// </summary>
        public void Bindtsms(string types)
        {
            if (Request.QueryString["ids"] != null && Request.QueryString["ids"].ToString() != "")
            {
                hotelmodel = hotelbll.GetModel(Convert.ToInt32(Request.QueryString["ids"]));
                if (hotelmodel != null)
                {
                    contentstr = hotelmodel.Introduction;
                    headname = hotelmodel.Name;
                    if (hotelmodel.Picture.ToString() != "")
                    {
                        string[] strlist = hotelmodel.Picture.ToString().Split(',');
                        if (strlist.Length > 0)
                        {
                            picimageurl1 = geturl(strlist[0].Trim(), types);
                            if (strlist.Length > 1)
                            {
                                picimageurl2 = geturl(strlist[1].Trim(), types);
                            }
                            if (strlist.Length > 2)
                            {
                                picimageurl3 = geturl(strlist[2].Trim(), types);
                            }
                        }
                    }
                }
            }
        }

        /// <summary>
        /// 特色采摘
        /// </summary>
        public void Bindtscz(string types)
        {
            if (Request.QueryString["ids"] != null && Request.QueryString["ids"].ToString() != "")
            {
                specialPickmodel = specialPickbll.GetModel(Convert.ToInt32(Request.QueryString["ids"]));
                if (specialPickmodel != null)
                {
                    contentstr = specialPickmodel.Introduction;
                    headname = specialPickmodel.Name;
                    if (specialPickmodel.Picture.ToString() != "")
                    {
                        string[] strlist = specialPickmodel.Picture.ToString().Split(',');
                        if (strlist.Length > 0)
                        {
                            picimageurl1 = geturl(strlist[0].Trim(), types);
                            if (strlist.Length > 1)
                            {
                                picimageurl2 = geturl(strlist[1].Trim(), types);
                            }
                            if (strlist.Length > 2)
                            {
                                picimageurl3 = geturl(strlist[2].Trim(), types);
                            }
                        }
                    }
                }
            }
        }

        /// <summary>
        /// 推荐线路
        /// </summary>
        public void Bindtjxl(string types)
        {
            if (Request.QueryString["ids"] != null && Request.QueryString["ids"].ToString() != "")
            {
                strategymodel = strategybll.GetModel(Convert.ToInt32(Request.QueryString["ids"]));
                if (strategymodel != null)
                {
                    contentstr = strategymodel.StrategyContent;
                    headname = strategymodel.Title;
                    if (strategymodel.PhotoUrl.ToString() != "")
                    {
                        string[] strlist = strategymodel.PhotoUrl.ToString().Split(',');
                        if (strlist.Length > 0)
                        {
                            picimageurl1 =geturl(strlist[0].Trim(),types);
                            if (strlist.Length > 1)
                            {
                                picimageurl2 = geturl(strlist[1].Trim(),types);
                            }
                            if (strlist.Length > 2)
                            {
                                picimageurl3 = geturl(strlist[2].Trim(),types);
                            }
                        }
                    }
                }
            }
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
                    strs = FilesUrl + "UploadFiles/PromotionalVideo/Picture/" + filesname;
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
                    strs = FilesUrl + "UploadFiles/Traveltips/Strategy/" + filesname;
                }
            }
            return strs;
        }
    }
}