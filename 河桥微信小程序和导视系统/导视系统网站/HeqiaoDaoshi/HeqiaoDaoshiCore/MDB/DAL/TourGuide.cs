using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// 数据访问类:TourGuide
	/// </summary>
	public partial class TourGuide
	{
		public TourGuide()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSql.GetMaxId("ID", "TourGuide"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid TourGuideUUID,int ID)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from TourGuide");
			strSql.Append(" where TourGuideUUID=@TourGuideUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@TourGuideUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = TourGuideUUID;
			parameters[1].Value = ID;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.TourGuide model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into TourGuide(");
			strSql.Append("TourGuideUUID,TourGuideName,Phone,ReleaseTime,ReleaseState,IsDeleted,AddTime,AddPeople,Picture,Content,FMPicture)");
			strSql.Append(" values (");
			strSql.Append("@TourGuideUUID,@TourGuideName,@Phone,@ReleaseTime,@ReleaseState,@IsDeleted,@AddTime,@AddPeople,@Picture,@Content,@FMPicture)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@TourGuideUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@TourGuideName", SqlDbType.NVarChar,255),
					new SqlParameter("@Phone", SqlDbType.NVarChar,100),
					new SqlParameter("@ReleaseTime", SqlDbType.NVarChar,255),
					new SqlParameter("@ReleaseState", SqlDbType.Int,4),
					new SqlParameter("@IsDeleted", SqlDbType.Int,4),
					new SqlParameter("@AddTime", SqlDbType.NVarChar,255),
					new SqlParameter("@AddPeople", SqlDbType.NVarChar,255),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1),
					new SqlParameter("@Content", SqlDbType.NVarChar,-1),
					new SqlParameter("@FMPicture", SqlDbType.NVarChar,-1)};
			parameters[0].Value = Guid.NewGuid();
			parameters[1].Value = model.TourGuideName;
			parameters[2].Value = model.Phone;
			parameters[3].Value = model.ReleaseTime;
			parameters[4].Value = model.ReleaseState;
			parameters[5].Value = model.IsDeleted;
			parameters[6].Value = model.AddTime;
			parameters[7].Value = model.AddPeople;
			parameters[8].Value = model.Picture;
			parameters[9].Value = model.Content;
			parameters[10].Value = model.FMPicture;

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
		public bool Update(HeqiaoDaoshiCore.Model.TourGuide model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update TourGuide set ");
			strSql.Append("TourGuideName=@TourGuideName,");
			strSql.Append("Phone=@Phone,");
			strSql.Append("ReleaseTime=@ReleaseTime,");
			strSql.Append("ReleaseState=@ReleaseState,");
			strSql.Append("IsDeleted=@IsDeleted,");
			strSql.Append("AddTime=@AddTime,");
			strSql.Append("AddPeople=@AddPeople,");
			strSql.Append("Picture=@Picture,");
			strSql.Append("Content=@Content,");
			strSql.Append("FMPicture=@FMPicture");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@TourGuideName", SqlDbType.NVarChar,255),
					new SqlParameter("@Phone", SqlDbType.NVarChar,100),
					new SqlParameter("@ReleaseTime", SqlDbType.NVarChar,255),
					new SqlParameter("@ReleaseState", SqlDbType.Int,4),
					new SqlParameter("@IsDeleted", SqlDbType.Int,4),
					new SqlParameter("@AddTime", SqlDbType.NVarChar,255),
					new SqlParameter("@AddPeople", SqlDbType.NVarChar,255),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1),
					new SqlParameter("@Content", SqlDbType.NVarChar,-1),
					new SqlParameter("@FMPicture", SqlDbType.NVarChar,-1),
					new SqlParameter("@ID", SqlDbType.Int,4),
					new SqlParameter("@TourGuideUUID", SqlDbType.UniqueIdentifier,16)};
			parameters[0].Value = model.TourGuideName;
			parameters[1].Value = model.Phone;
			parameters[2].Value = model.ReleaseTime;
			parameters[3].Value = model.ReleaseState;
			parameters[4].Value = model.IsDeleted;
			parameters[5].Value = model.AddTime;
			parameters[6].Value = model.AddPeople;
			parameters[7].Value = model.Picture;
			parameters[8].Value = model.Content;
			parameters[9].Value = model.FMPicture;
			parameters[10].Value = model.ID;
			parameters[11].Value = model.TourGuideUUID;

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
			strSql.Append("delete from TourGuide ");
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
		public bool Delete(Guid TourGuideUUID,int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from TourGuide ");
			strSql.Append(" where TourGuideUUID=@TourGuideUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@TourGuideUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = TourGuideUUID;
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
			strSql.Append("delete from TourGuide ");
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
		public HeqiaoDaoshiCore.Model.TourGuide GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 ID,TourGuideUUID,TourGuideName,Phone,ReleaseTime,ReleaseState,IsDeleted,AddTime,AddPeople,Picture,Content,FMPicture from TourGuide ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.TourGuide model=new HeqiaoDaoshiCore.Model.TourGuide();
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
		public HeqiaoDaoshiCore.Model.TourGuide DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.TourGuide model=new HeqiaoDaoshiCore.Model.TourGuide();
			if (row != null)
			{
				if(row["ID"]!=null && row["ID"].ToString()!="")
				{
					model.ID=int.Parse(row["ID"].ToString());
				}
				if(row["TourGuideUUID"]!=null && row["TourGuideUUID"].ToString()!="")
				{
					model.TourGuideUUID= new Guid(row["TourGuideUUID"].ToString());
				}
				if(row["TourGuideName"]!=null)
				{
					model.TourGuideName=row["TourGuideName"].ToString();
				}
				if(row["Phone"]!=null)
				{
					model.Phone=row["Phone"].ToString();
				}
				if(row["ReleaseTime"]!=null)
				{
					model.ReleaseTime=row["ReleaseTime"].ToString();
				}
				if(row["ReleaseState"]!=null && row["ReleaseState"].ToString()!="")
				{
					model.ReleaseState=int.Parse(row["ReleaseState"].ToString());
				}
				if(row["IsDeleted"]!=null && row["IsDeleted"].ToString()!="")
				{
					model.IsDeleted=int.Parse(row["IsDeleted"].ToString());
				}
				if(row["AddTime"]!=null)
				{
					model.AddTime=row["AddTime"].ToString();
				}
				if(row["AddPeople"]!=null)
				{
					model.AddPeople=row["AddPeople"].ToString();
				}
				if(row["Picture"]!=null)
				{
					model.Picture=row["Picture"].ToString();
				}
				if(row["Content"]!=null)
				{
					model.Content=row["Content"].ToString();
				}
				if(row["FMPicture"]!=null)
				{
					model.FMPicture=row["FMPicture"].ToString();
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
			strSql.Append("select ID,TourGuideUUID,TourGuideName,Phone,ReleaseTime,ReleaseState,IsDeleted,AddTime,AddPeople,Picture,Content,FMPicture ");
			strSql.Append(" FROM TourGuide ");
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
			strSql.Append(" ID,TourGuideUUID,TourGuideName,Phone,ReleaseTime,ReleaseState,IsDeleted,AddTime,AddPeople,Picture,Content,FMPicture ");
			strSql.Append(" FROM TourGuide ");
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
			strSql.Append("select count(1) FROM TourGuide ");
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
			strSql.Append(")AS Row, T.*  from TourGuide T ");
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
			parameters[0].Value = "TourGuide";
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

