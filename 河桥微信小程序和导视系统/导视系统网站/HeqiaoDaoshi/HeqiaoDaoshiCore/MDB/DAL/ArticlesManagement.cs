using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// 数据访问类:ArticlesManagement
	/// </summary>
	public partial class ArticlesManagement
	{
		public ArticlesManagement()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSql.GetMaxId("ID", "ArticlesManagement"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid ArticleUUID,int ID)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from ArticlesManagement");
			strSql.Append(" where ArticleUUID=@ArticleUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@ArticleUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = ArticleUUID;
			parameters[1].Value = ID;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.ArticlesManagement model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into ArticlesManagement(");
			strSql.Append("ArticleTitle,ArticleTypeUUID,ReleaseTime,IsDelete,IsRelease,ArticleUUID,CoverPhoto,ArticleName,AddPeople,AddTime,Count,IsRecommend)");
			strSql.Append(" values (");
			strSql.Append("@ArticleTitle,@ArticleTypeUUID,@ReleaseTime,@IsDelete,@IsRelease,@ArticleUUID,@CoverPhoto,@ArticleName,@AddPeople,@AddTime,@Count,@IsRecommend)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@ArticleTitle", SqlDbType.VarChar,255),
					new SqlParameter("@ArticleTypeUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ReleaseTime", SqlDbType.VarChar,255),
					new SqlParameter("@IsDelete", SqlDbType.Int,4),
					new SqlParameter("@IsRelease", SqlDbType.Int,4),
					new SqlParameter("@ArticleUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@CoverPhoto", SqlDbType.VarChar,-1),
					new SqlParameter("@ArticleName", SqlDbType.VarChar,-1),
					new SqlParameter("@AddPeople", SqlDbType.VarChar,255),
					new SqlParameter("@AddTime", SqlDbType.DateTime),
					new SqlParameter("@Count", SqlDbType.Int,4),
					new SqlParameter("@IsRecommend", SqlDbType.Bit,1)};
			parameters[0].Value = model.ArticleTitle;
			parameters[1].Value = Guid.NewGuid();
			parameters[2].Value = model.ReleaseTime;
			parameters[3].Value = model.IsDelete;
			parameters[4].Value = model.IsRelease;
			parameters[5].Value = Guid.NewGuid();
			parameters[6].Value = model.CoverPhoto;
			parameters[7].Value = model.ArticleName;
			parameters[8].Value = model.AddPeople;
			parameters[9].Value = model.AddTime;
			parameters[10].Value = model.Count;
			parameters[11].Value = model.IsRecommend;

			object obj = DbHelperSql.GetSingle(strSql.ToString(),parameters);
			if (obj == null)
			{
				return 0;
			}
			else
			{
				return Convert.ToInt32(obj);
			}
		}
		/// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(HeqiaoDaoshiCore.Model.ArticlesManagement model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update ArticlesManagement set ");
			strSql.Append("ArticleTitle=@ArticleTitle,");
			strSql.Append("ArticleTypeUUID=@ArticleTypeUUID,");
			strSql.Append("ReleaseTime=@ReleaseTime,");
			strSql.Append("IsDelete=@IsDelete,");
			strSql.Append("IsRelease=@IsRelease,");
			strSql.Append("CoverPhoto=@CoverPhoto,");
			strSql.Append("ArticleName=@ArticleName,");
			strSql.Append("AddPeople=@AddPeople,");
			strSql.Append("AddTime=@AddTime,");
			strSql.Append("Count=@Count,");
			strSql.Append("IsRecommend=@IsRecommend");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ArticleTitle", SqlDbType.VarChar,255),
					new SqlParameter("@ArticleTypeUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ReleaseTime", SqlDbType.VarChar,255),
					new SqlParameter("@IsDelete", SqlDbType.Int,4),
					new SqlParameter("@IsRelease", SqlDbType.Int,4),
					new SqlParameter("@CoverPhoto", SqlDbType.VarChar,-1),
					new SqlParameter("@ArticleName", SqlDbType.VarChar,-1),
					new SqlParameter("@AddPeople", SqlDbType.VarChar,255),
					new SqlParameter("@AddTime", SqlDbType.DateTime),
					new SqlParameter("@Count", SqlDbType.Int,4),
					new SqlParameter("@IsRecommend", SqlDbType.Bit,1),
					new SqlParameter("@ID", SqlDbType.Int,4),
					new SqlParameter("@ArticleUUID", SqlDbType.UniqueIdentifier,16)};
			parameters[0].Value = model.ArticleTitle;
			parameters[1].Value = model.ArticleTypeUUID;
			parameters[2].Value = model.ReleaseTime;
			parameters[3].Value = model.IsDelete;
			parameters[4].Value = model.IsRelease;
			parameters[5].Value = model.CoverPhoto;
			parameters[6].Value = model.ArticleName;
			parameters[7].Value = model.AddPeople;
			parameters[8].Value = model.AddTime;
			parameters[9].Value = model.Count;
			parameters[10].Value = model.IsRecommend;
			parameters[11].Value = model.ID;
			parameters[12].Value = model.ArticleUUID;

			int rows=DbHelperSql.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from ArticlesManagement ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			int rows=DbHelperSql.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete(Guid ArticleUUID,int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from ArticlesManagement ");
			strSql.Append(" where ArticleUUID=@ArticleUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@ArticleUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = ArticleUUID;
			parameters[1].Value = ID;

			int rows=DbHelperSql.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		/// <summary>
		/// 批量删除数据
		/// </summary>
		public bool DeleteList(string IDlist )
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from ArticlesManagement ");
			strSql.Append(" where ID in ("+IDlist + ")  ");
			int rows=DbHelperSql.ExecuteSql(strSql.ToString());
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}


		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public HeqiaoDaoshiCore.Model.ArticlesManagement GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 ID,ArticleTitle,ArticleTypeUUID,ReleaseTime,IsDelete,IsRelease,ArticleUUID,CoverPhoto,ArticleName,AddPeople,AddTime,Count,IsRecommend from ArticlesManagement ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.ArticlesManagement model=new HeqiaoDaoshiCore.Model.ArticlesManagement();
			DataSet ds=DbHelperSql.Query(strSql.ToString(),parameters);
			if(ds.Tables[0].Rows.Count>0)
			{
				return DataRowToModel(ds.Tables[0].Rows[0]);
			}
			else
			{
				return null;
			}
		}


		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public HeqiaoDaoshiCore.Model.ArticlesManagement DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.ArticlesManagement model=new HeqiaoDaoshiCore.Model.ArticlesManagement();
			if (row != null)
			{
				if(row["ID"]!=null && row["ID"].ToString()!="")
				{
					model.ID=int.Parse(row["ID"].ToString());
				}
				if(row["ArticleTitle"]!=null)
				{
					model.ArticleTitle=row["ArticleTitle"].ToString();
				}
				if(row["ArticleTypeUUID"]!=null && row["ArticleTypeUUID"].ToString()!="")
				{
					model.ArticleTypeUUID= new Guid(row["ArticleTypeUUID"].ToString());
				}
				if(row["ReleaseTime"]!=null)
				{
					model.ReleaseTime=row["ReleaseTime"].ToString();
				}
				if(row["IsDelete"]!=null && row["IsDelete"].ToString()!="")
				{
					model.IsDelete=int.Parse(row["IsDelete"].ToString());
				}
				if(row["IsRelease"]!=null && row["IsRelease"].ToString()!="")
				{
					model.IsRelease=int.Parse(row["IsRelease"].ToString());
				}
				if(row["ArticleUUID"]!=null && row["ArticleUUID"].ToString()!="")
				{
					model.ArticleUUID= new Guid(row["ArticleUUID"].ToString());
				}
				if(row["CoverPhoto"]!=null)
				{
					model.CoverPhoto=row["CoverPhoto"].ToString();
				}
				if(row["ArticleName"]!=null)
				{
					model.ArticleName=row["ArticleName"].ToString();
				}
				if(row["AddPeople"]!=null)
				{
					model.AddPeople=row["AddPeople"].ToString();
				}
				if(row["AddTime"]!=null && row["AddTime"].ToString()!="")
				{
					model.AddTime=DateTime.Parse(row["AddTime"].ToString());
				}
				if(row["Count"]!=null && row["Count"].ToString()!="")
				{
					model.Count=int.Parse(row["Count"].ToString());
				}
				if(row["IsRecommend"]!=null && row["IsRecommend"].ToString()!="")
				{
					if((row["IsRecommend"].ToString()=="1")||(row["IsRecommend"].ToString().ToLower()=="true"))
					{
						model.IsRecommend=true;
					}
					else
					{
						model.IsRecommend=false;
					}
				}
			}
			return model;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select ID,ArticleTitle,ArticleTypeUUID,ReleaseTime,IsDelete,IsRelease,ArticleUUID,CoverPhoto,ArticleName,AddPeople,AddTime,Count,IsRecommend ");
			strSql.Append(" FROM ArticlesManagement ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			return DbHelperSql.Query(strSql.ToString());
		}

		/// <summary>
		/// 获得前几行数据
		/// </summary>
		public DataSet GetList(int Top,string strWhere,string filedOrder)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select ");
			if(Top>0)
			{
				strSql.Append(" top "+Top.ToString());
			}
			strSql.Append(" ID,ArticleTitle,ArticleTypeUUID,ReleaseTime,IsDelete,IsRelease,ArticleUUID,CoverPhoto,ArticleName,AddPeople,AddTime,Count,IsRecommend ");
			strSql.Append(" FROM ArticlesManagement ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			strSql.Append(" order by " + filedOrder);
			return DbHelperSql.Query(strSql.ToString());
		}

		/// <summary>
		/// 获取记录总数
		/// </summary>
		public int GetRecordCount(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) FROM ArticlesManagement ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			object obj = DbHelperSql.GetSingle(strSql.ToString());
			if (obj == null)
			{
				return 0;
			}
			else
			{
				return Convert.ToInt32(obj);
			}
		}
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("SELECT * FROM ( ");
			strSql.Append(" SELECT ROW_NUMBER() OVER (");
			if (!string.IsNullOrEmpty(orderby.Trim()))
			{
				strSql.Append("order by T." + orderby );
			}
			else
			{
				strSql.Append("order by T.ID desc");
			}
			strSql.Append(")AS Row, T.*  from ArticlesManagement T ");
			if (!string.IsNullOrEmpty(strWhere.Trim()))
			{
				strSql.Append(" WHERE " + strWhere);
			}
			strSql.Append(" ) TT");
			strSql.AppendFormat(" WHERE TT.Row between {0} and {1}", startIndex, endIndex);
			return DbHelperSql.Query(strSql.ToString());
		}

		/*
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetList(int PageSize,int PageIndex,string strWhere)
		{
			SqlParameter[] parameters = {
					new SqlParameter("@tblName", SqlDbType.VarChar, 255),
					new SqlParameter("@fldName", SqlDbType.VarChar, 255),
					new SqlParameter("@PageSize", SqlDbType.Int),
					new SqlParameter("@PageIndex", SqlDbType.Int),
					new SqlParameter("@IsReCount", SqlDbType.Bit),
					new SqlParameter("@OrderType", SqlDbType.Bit),
					new SqlParameter("@strWhere", SqlDbType.VarChar,1000),
					};
			parameters[0].Value = "ArticlesManagement";
			parameters[1].Value = "ID";
			parameters[2].Value = PageSize;
			parameters[3].Value = PageIndex;
			parameters[4].Value = 0;
			parameters[5].Value = 0;
			parameters[6].Value = strWhere;	
			return DbHelperSql.RunProcedure("UP_GetRecordByPage",parameters,"ds");
		}*/

		#endregion  BasicMethod
		#region  ExtensionMethod

		#endregion  ExtensionMethod
	}
}

