using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// 数据访问类:PromotionalVideo
	/// </summary>
	public partial class PromotionalVideo
	{
		public PromotionalVideo()
		{}
		#region  BasicMethod

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid PromotionalVideoUUID)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from PromotionalVideo");
			strSql.Append(" where PromotionalVideoUUID=@PromotionalVideoUUID ");
			SqlParameter[] parameters = {
					new SqlParameter("@PromotionalVideoUUID", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = PromotionalVideoUUID;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.PromotionalVideo model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into PromotionalVideo(");
			strSql.Append("CreateTime,PromotionalVideoUUID,Title,Cover,Video,ReleaseTime,ReleaseState,AddTime,AddPeople,IsDeleted,IsRecommend)");
			strSql.Append(" values (");
			strSql.Append("@CreateTime,@PromotionalVideoUUID,@Title,@Cover,@Video,@ReleaseTime,@ReleaseState,@AddTime,@AddPeople,@IsDeleted,@IsRecommend)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@CreateTime", SqlDbType.DateTime2,8),
					new SqlParameter("@PromotionalVideoUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Title", SqlDbType.VarChar,255),
					new SqlParameter("@Cover", SqlDbType.VarChar,255),
					new SqlParameter("@Video", SqlDbType.VarChar,255),
					new SqlParameter("@ReleaseTime", SqlDbType.Date,3),
					new SqlParameter("@ReleaseState", SqlDbType.Int,4),
					new SqlParameter("@AddTime", SqlDbType.DateTime2,8),
					new SqlParameter("@AddPeople", SqlDbType.VarChar,255),
					new SqlParameter("@IsDeleted", SqlDbType.Int,4),
					new SqlParameter("@IsRecommend", SqlDbType.Bit,1)};
			parameters[0].Value = model.CreateTime;
			parameters[1].Value = Guid.NewGuid();
			parameters[2].Value = model.Title;
			parameters[3].Value = model.Cover;
			parameters[4].Value = model.Video;
			parameters[5].Value = model.ReleaseTime;
			parameters[6].Value = model.ReleaseState;
			parameters[7].Value = model.AddTime;
			parameters[8].Value = model.AddPeople;
			parameters[9].Value = model.IsDeleted;
			parameters[10].Value = model.IsRecommend;

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
		public bool Update(HeqiaoDaoshiCore.Model.PromotionalVideo model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update PromotionalVideo set ");
			strSql.Append("CreateTime=@CreateTime,");
			strSql.Append("Title=@Title,");
			strSql.Append("Cover=@Cover,");
			strSql.Append("Video=@Video,");
			strSql.Append("ReleaseTime=@ReleaseTime,");
			strSql.Append("ReleaseState=@ReleaseState,");
			strSql.Append("AddTime=@AddTime,");
			strSql.Append("AddPeople=@AddPeople,");
			strSql.Append("IsDeleted=@IsDeleted,");
			strSql.Append("IsRecommend=@IsRecommend");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@CreateTime", SqlDbType.DateTime2,8),
					new SqlParameter("@Title", SqlDbType.VarChar,255),
					new SqlParameter("@Cover", SqlDbType.VarChar,255),
					new SqlParameter("@Video", SqlDbType.VarChar,255),
					new SqlParameter("@ReleaseTime", SqlDbType.Date,3),
					new SqlParameter("@ReleaseState", SqlDbType.Int,4),
					new SqlParameter("@AddTime", SqlDbType.DateTime2,8),
					new SqlParameter("@AddPeople", SqlDbType.VarChar,255),
					new SqlParameter("@IsDeleted", SqlDbType.Int,4),
					new SqlParameter("@IsRecommend", SqlDbType.Bit,1),
					new SqlParameter("@ID", SqlDbType.Int,4),
					new SqlParameter("@PromotionalVideoUUID", SqlDbType.UniqueIdentifier,16)};
			parameters[0].Value = model.CreateTime;
			parameters[1].Value = model.Title;
			parameters[2].Value = model.Cover;
			parameters[3].Value = model.Video;
			parameters[4].Value = model.ReleaseTime;
			parameters[5].Value = model.ReleaseState;
			parameters[6].Value = model.AddTime;
			parameters[7].Value = model.AddPeople;
			parameters[8].Value = model.IsDeleted;
			parameters[9].Value = model.IsRecommend;
			parameters[10].Value = model.ID;
			parameters[11].Value = model.PromotionalVideoUUID;

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
			strSql.Append("delete from PromotionalVideo ");
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
		public bool Delete(Guid PromotionalVideoUUID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from PromotionalVideo ");
			strSql.Append(" where PromotionalVideoUUID=@PromotionalVideoUUID ");
			SqlParameter[] parameters = {
					new SqlParameter("@PromotionalVideoUUID", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = PromotionalVideoUUID;

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
			strSql.Append("delete from PromotionalVideo ");
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
		public HeqiaoDaoshiCore.Model.PromotionalVideo GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 ID,CreateTime,PromotionalVideoUUID,Title,Cover,Video,ReleaseTime,ReleaseState,AddTime,AddPeople,IsDeleted,IsRecommend from PromotionalVideo ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.PromotionalVideo model=new HeqiaoDaoshiCore.Model.PromotionalVideo();
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
		public HeqiaoDaoshiCore.Model.PromotionalVideo DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.PromotionalVideo model=new HeqiaoDaoshiCore.Model.PromotionalVideo();
			if (row != null)
			{
				if(row["ID"]!=null && row["ID"].ToString()!="")
				{
					model.ID=int.Parse(row["ID"].ToString());
				}
				if(row["CreateTime"]!=null && row["CreateTime"].ToString()!="")
				{
					model.CreateTime=DateTime.Parse(row["CreateTime"].ToString());
				}
				if(row["PromotionalVideoUUID"]!=null && row["PromotionalVideoUUID"].ToString()!="")
				{
					model.PromotionalVideoUUID= new Guid(row["PromotionalVideoUUID"].ToString());
				}
				if(row["Title"]!=null)
				{
					model.Title=row["Title"].ToString();
				}
				if(row["Cover"]!=null)
				{
					model.Cover=row["Cover"].ToString();
				}
				if(row["Video"]!=null)
				{
					model.Video=row["Video"].ToString();
				}
				if(row["ReleaseTime"]!=null && row["ReleaseTime"].ToString()!="")
				{
					model.ReleaseTime=DateTime.Parse(row["ReleaseTime"].ToString());
				}
				if(row["ReleaseState"]!=null && row["ReleaseState"].ToString()!="")
				{
					model.ReleaseState=int.Parse(row["ReleaseState"].ToString());
				}
				if(row["AddTime"]!=null && row["AddTime"].ToString()!="")
				{
					model.AddTime=DateTime.Parse(row["AddTime"].ToString());
				}
				if(row["AddPeople"]!=null)
				{
					model.AddPeople=row["AddPeople"].ToString();
				}
				if(row["IsDeleted"]!=null && row["IsDeleted"].ToString()!="")
				{
					model.IsDeleted=int.Parse(row["IsDeleted"].ToString());
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
			strSql.Append("select ID,CreateTime,PromotionalVideoUUID,Title,Cover,Video,ReleaseTime,ReleaseState,AddTime,AddPeople,IsDeleted,IsRecommend ");
			strSql.Append(" FROM PromotionalVideo ");
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
			strSql.Append(" ID,CreateTime,PromotionalVideoUUID,Title,Cover,Video,ReleaseTime,ReleaseState,AddTime,AddPeople,IsDeleted,IsRecommend ");
			strSql.Append(" FROM PromotionalVideo ");
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
			strSql.Append("select count(1) FROM PromotionalVideo ");
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
			strSql.Append(")AS Row, T.*  from PromotionalVideo T ");
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
			parameters[0].Value = "PromotionalVideo";
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

