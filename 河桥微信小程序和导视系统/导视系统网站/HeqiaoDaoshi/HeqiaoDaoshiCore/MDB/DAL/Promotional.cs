using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// 数据访问类:Promotional
	/// </summary>
	public partial class Promotional
	{
		public Promotional()
		{}
		#region  BasicMethod

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid PromotionalUuid)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Promotional");
			strSql.Append(" where PromotionalUuid=@PromotionalUuid ");
			SqlParameter[] parameters = {
					new SqlParameter("@PromotionalUuid", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = PromotionalUuid;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.Promotional model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Promotional(");
			strSql.Append("PromotionalUuid,Isdeleted,Staues,Title,PromotionalContent,Video,AddPeople,AddTime)");
			strSql.Append(" values (");
			strSql.Append("@PromotionalUuid,@Isdeleted,@Staues,@Title,@PromotionalContent,@Video,@AddPeople,@AddTime)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@PromotionalUuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Isdeleted", SqlDbType.Int,4),
					new SqlParameter("@Staues", SqlDbType.NVarChar,255),
					new SqlParameter("@Title", SqlDbType.NVarChar,255),
					new SqlParameter("@PromotionalContent", SqlDbType.NVarChar,-1),
					new SqlParameter("@Video", SqlDbType.NVarChar,-1),
					new SqlParameter("@AddPeople", SqlDbType.NVarChar,255),
					new SqlParameter("@AddTime", SqlDbType.NVarChar,255)};
			parameters[0].Value = Guid.NewGuid();
			parameters[1].Value = model.Isdeleted;
			parameters[2].Value = model.Staues;
			parameters[3].Value = model.Title;
			parameters[4].Value = model.PromotionalContent;
			parameters[5].Value = model.Video;
			parameters[6].Value = model.AddPeople;
			parameters[7].Value = model.AddTime;

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
		public bool Update(HeqiaoDaoshiCore.Model.Promotional model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Promotional set ");
			strSql.Append("Isdeleted=@Isdeleted,");
			strSql.Append("Staues=@Staues,");
			strSql.Append("Title=@Title,");
			strSql.Append("PromotionalContent=@PromotionalContent,");
			strSql.Append("Video=@Video,");
			strSql.Append("AddPeople=@AddPeople,");
			strSql.Append("AddTime=@AddTime");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@Isdeleted", SqlDbType.Int,4),
					new SqlParameter("@Staues", SqlDbType.NVarChar,255),
					new SqlParameter("@Title", SqlDbType.NVarChar,255),
					new SqlParameter("@PromotionalContent", SqlDbType.NVarChar,-1),
					new SqlParameter("@Video", SqlDbType.NVarChar,-1),
					new SqlParameter("@AddPeople", SqlDbType.NVarChar,255),
					new SqlParameter("@AddTime", SqlDbType.NVarChar,255),
					new SqlParameter("@PromotionalUuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)};
			parameters[0].Value = model.Isdeleted;
			parameters[1].Value = model.Staues;
			parameters[2].Value = model.Title;
			parameters[3].Value = model.PromotionalContent;
			parameters[4].Value = model.Video;
			parameters[5].Value = model.AddPeople;
			parameters[6].Value = model.AddTime;
			parameters[7].Value = model.PromotionalUuid;
			parameters[8].Value = model.ID;

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
			strSql.Append("delete from Promotional ");
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
		public bool Delete(Guid PromotionalUuid)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Promotional ");
			strSql.Append(" where PromotionalUuid=@PromotionalUuid ");
			SqlParameter[] parameters = {
					new SqlParameter("@PromotionalUuid", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = PromotionalUuid;

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
			strSql.Append("delete from Promotional ");
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
		public HeqiaoDaoshiCore.Model.Promotional GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 PromotionalUuid,ID,Isdeleted,Staues,Title,PromotionalContent,Video,AddPeople,AddTime from Promotional ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.Promotional model=new HeqiaoDaoshiCore.Model.Promotional();
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
		public HeqiaoDaoshiCore.Model.Promotional DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.Promotional model=new HeqiaoDaoshiCore.Model.Promotional();
			if (row != null)
			{
				if(row["PromotionalUuid"]!=null && row["PromotionalUuid"].ToString()!="")
				{
					model.PromotionalUuid= new Guid(row["PromotionalUuid"].ToString());
				}
				if(row["ID"]!=null && row["ID"].ToString()!="")
				{
					model.ID=int.Parse(row["ID"].ToString());
				}
				if(row["Isdeleted"]!=null && row["Isdeleted"].ToString()!="")
				{
					model.Isdeleted=int.Parse(row["Isdeleted"].ToString());
				}
				if(row["Staues"]!=null)
				{
					model.Staues=row["Staues"].ToString();
				}
				if(row["Title"]!=null)
				{
					model.Title=row["Title"].ToString();
				}
				if(row["PromotionalContent"]!=null)
				{
					model.PromotionalContent=row["PromotionalContent"].ToString();
				}
				if(row["Video"]!=null)
				{
					model.Video=row["Video"].ToString();
				}
				if(row["AddPeople"]!=null)
				{
					model.AddPeople=row["AddPeople"].ToString();
				}
				if(row["AddTime"]!=null)
				{
					model.AddTime=row["AddTime"].ToString();
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
			strSql.Append("select PromotionalUuid,ID,Isdeleted,Staues,Title,PromotionalContent,Video,AddPeople,AddTime ");
			strSql.Append(" FROM Promotional ");
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
			strSql.Append(" PromotionalUuid,ID,Isdeleted,Staues,Title,PromotionalContent,Video,AddPeople,AddTime ");
			strSql.Append(" FROM Promotional ");
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
			strSql.Append("select count(1) FROM Promotional ");
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
			strSql.Append(")AS Row, T.*  from Promotional T ");
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
			parameters[0].Value = "Promotional";
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

