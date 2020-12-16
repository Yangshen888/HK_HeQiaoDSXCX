using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// 数据访问类:Strategy
	/// </summary>
	public partial class Strategy
	{
		public Strategy()
		{}
		#region  BasicMethod

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid StrategyUuid)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Strategy");
			strSql.Append(" where StrategyUuid=@StrategyUuid ");
			SqlParameter[] parameters = {
					new SqlParameter("@StrategyUuid", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = StrategyUuid;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.Strategy model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Strategy(");
			strSql.Append("StrategyUuid,Isdelete,Staues,SystemUserUUID,Title,StrategyContent,PhotoUrl,AddPeople,AddTime,AuditStaues,ThroughStaues,TipsType,Count,ytype,PlayType)");
			strSql.Append(" values (");
			strSql.Append("@StrategyUuid,@Isdelete,@Staues,@SystemUserUUID,@Title,@StrategyContent,@PhotoUrl,@AddPeople,@AddTime,@AuditStaues,@ThroughStaues,@TipsType,@Count,@ytype,@PlayType)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@StrategyUuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Isdelete", SqlDbType.Int,4),
					new SqlParameter("@Staues", SqlDbType.NVarChar,255),
					new SqlParameter("@SystemUserUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Title", SqlDbType.NVarChar,255),
					new SqlParameter("@StrategyContent", SqlDbType.NVarChar,-1),
					new SqlParameter("@PhotoUrl", SqlDbType.NVarChar,-1),
					new SqlParameter("@AddPeople", SqlDbType.NVarChar,255),
					new SqlParameter("@AddTime", SqlDbType.NVarChar,255),
					new SqlParameter("@AuditStaues", SqlDbType.Int,4),
					new SqlParameter("@ThroughStaues", SqlDbType.Int,4),
					new SqlParameter("@TipsType", SqlDbType.Int,4),
					new SqlParameter("@Count", SqlDbType.Int,4),
					new SqlParameter("@ytype", SqlDbType.NVarChar,255),
					new SqlParameter("@PlayType", SqlDbType.NVarChar,255)};
			parameters[0].Value = Guid.NewGuid();
			parameters[1].Value = model.Isdelete;
			parameters[2].Value = model.Staues;
			parameters[3].Value = Guid.NewGuid();
			parameters[4].Value = model.Title;
			parameters[5].Value = model.StrategyContent;
			parameters[6].Value = model.PhotoUrl;
			parameters[7].Value = model.AddPeople;
			parameters[8].Value = model.AddTime;
			parameters[9].Value = model.AuditStaues;
			parameters[10].Value = model.ThroughStaues;
			parameters[11].Value = model.TipsType;
			parameters[12].Value = model.Count;
			parameters[13].Value = model.ytype;
			parameters[14].Value = model.PlayType;

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
		public bool Update(HeqiaoDaoshiCore.Model.Strategy model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Strategy set ");
			strSql.Append("Isdelete=@Isdelete,");
			strSql.Append("Staues=@Staues,");
			strSql.Append("SystemUserUUID=@SystemUserUUID,");
			strSql.Append("Title=@Title,");
			strSql.Append("StrategyContent=@StrategyContent,");
			strSql.Append("PhotoUrl=@PhotoUrl,");
			strSql.Append("AddPeople=@AddPeople,");
			strSql.Append("AddTime=@AddTime,");
			strSql.Append("AuditStaues=@AuditStaues,");
			strSql.Append("ThroughStaues=@ThroughStaues,");
			strSql.Append("TipsType=@TipsType,");
			strSql.Append("Count=@Count,");
			strSql.Append("ytype=@ytype,");
			strSql.Append("PlayType=@PlayType");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@Isdelete", SqlDbType.Int,4),
					new SqlParameter("@Staues", SqlDbType.NVarChar,255),
					new SqlParameter("@SystemUserUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Title", SqlDbType.NVarChar,255),
					new SqlParameter("@StrategyContent", SqlDbType.NVarChar,-1),
					new SqlParameter("@PhotoUrl", SqlDbType.NVarChar,-1),
					new SqlParameter("@AddPeople", SqlDbType.NVarChar,255),
					new SqlParameter("@AddTime", SqlDbType.NVarChar,255),
					new SqlParameter("@AuditStaues", SqlDbType.Int,4),
					new SqlParameter("@ThroughStaues", SqlDbType.Int,4),
					new SqlParameter("@TipsType", SqlDbType.Int,4),
					new SqlParameter("@Count", SqlDbType.Int,4),
					new SqlParameter("@ytype", SqlDbType.NVarChar,255),
					new SqlParameter("@PlayType", SqlDbType.NVarChar,255),
					new SqlParameter("@StrategyUuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)};
			parameters[0].Value = model.Isdelete;
			parameters[1].Value = model.Staues;
			parameters[2].Value = model.SystemUserUUID;
			parameters[3].Value = model.Title;
			parameters[4].Value = model.StrategyContent;
			parameters[5].Value = model.PhotoUrl;
			parameters[6].Value = model.AddPeople;
			parameters[7].Value = model.AddTime;
			parameters[8].Value = model.AuditStaues;
			parameters[9].Value = model.ThroughStaues;
			parameters[10].Value = model.TipsType;
			parameters[11].Value = model.Count;
			parameters[12].Value = model.ytype;
			parameters[13].Value = model.PlayType;
			parameters[14].Value = model.StrategyUuid;
			parameters[15].Value = model.ID;

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
			strSql.Append("delete from Strategy ");
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
		public bool Delete(Guid StrategyUuid)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Strategy ");
			strSql.Append(" where StrategyUuid=@StrategyUuid ");
			SqlParameter[] parameters = {
					new SqlParameter("@StrategyUuid", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = StrategyUuid;

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
			strSql.Append("delete from Strategy ");
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
		public HeqiaoDaoshiCore.Model.Strategy GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 StrategyUuid,ID,Isdelete,Staues,SystemUserUUID,Title,StrategyContent,PhotoUrl,AddPeople,AddTime,AuditStaues,ThroughStaues,TipsType,Count,ytype,PlayType from Strategy ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.Strategy model=new HeqiaoDaoshiCore.Model.Strategy();
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
		public HeqiaoDaoshiCore.Model.Strategy DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.Strategy model=new HeqiaoDaoshiCore.Model.Strategy();
			if (row != null)
			{
				if(row["StrategyUuid"]!=null && row["StrategyUuid"].ToString()!="")
				{
					model.StrategyUuid= new Guid(row["StrategyUuid"].ToString());
				}
				if(row["ID"]!=null && row["ID"].ToString()!="")
				{
					model.ID=int.Parse(row["ID"].ToString());
				}
				if(row["Isdelete"]!=null && row["Isdelete"].ToString()!="")
				{
					model.Isdelete=int.Parse(row["Isdelete"].ToString());
				}
				if(row["Staues"]!=null)
				{
					model.Staues=row["Staues"].ToString();
				}
				if(row["SystemUserUUID"]!=null && row["SystemUserUUID"].ToString()!="")
				{
					model.SystemUserUUID= new Guid(row["SystemUserUUID"].ToString());
				}
				if(row["Title"]!=null)
				{
					model.Title=row["Title"].ToString();
				}
				if(row["StrategyContent"]!=null)
				{
					model.StrategyContent=row["StrategyContent"].ToString();
				}
				if(row["PhotoUrl"]!=null)
				{
					model.PhotoUrl=row["PhotoUrl"].ToString();
				}
				if(row["AddPeople"]!=null)
				{
					model.AddPeople=row["AddPeople"].ToString();
				}
				if(row["AddTime"]!=null)
				{
					model.AddTime=row["AddTime"].ToString();
				}
				if(row["AuditStaues"]!=null && row["AuditStaues"].ToString()!="")
				{
					model.AuditStaues=int.Parse(row["AuditStaues"].ToString());
				}
				if(row["ThroughStaues"]!=null && row["ThroughStaues"].ToString()!="")
				{
					model.ThroughStaues=int.Parse(row["ThroughStaues"].ToString());
				}
				if(row["TipsType"]!=null && row["TipsType"].ToString()!="")
				{
					model.TipsType=int.Parse(row["TipsType"].ToString());
				}
				if(row["Count"]!=null && row["Count"].ToString()!="")
				{
					model.Count=int.Parse(row["Count"].ToString());
				}
				if(row["ytype"]!=null)
				{
					model.ytype=row["ytype"].ToString();
				}
				if(row["PlayType"]!=null)
				{
					model.PlayType=row["PlayType"].ToString();
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
			strSql.Append("select StrategyUuid,ID,Isdelete,Staues,SystemUserUUID,Title,StrategyContent,PhotoUrl,AddPeople,AddTime,AuditStaues,ThroughStaues,TipsType,Count,ytype,PlayType ");
			strSql.Append(" FROM Strategy ");
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
			strSql.Append(" StrategyUuid,ID,Isdelete,Staues,SystemUserUUID,Title,StrategyContent,PhotoUrl,AddPeople,AddTime,AuditStaues,ThroughStaues,TipsType,Count,ytype,PlayType ");
			strSql.Append(" FROM Strategy ");
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
			strSql.Append("select count(1) FROM Strategy ");
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
			strSql.Append(")AS Row, T.*  from Strategy T ");
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
			parameters[0].Value = "Strategy";
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

