using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// 数据访问类:Gtoilet
	/// </summary>
	public partial class Gtoilet
	{
		public Gtoilet()
		{}
		#region  BasicMethod

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid GtoiletUuid)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Gtoilet");
			strSql.Append(" where GtoiletUuid=@GtoiletUuid ");
			SqlParameter[] parameters = {
					new SqlParameter("@GtoiletUuid", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = GtoiletUuid;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.Gtoilet model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Gtoilet(");
			strSql.Append("GtoiletUuid,IsDeleted,GtoiletName,GtoiletAddress,Lon,Lat,GtoiletStaues,KongqiZhil,WaterYujin,AddTime,AddPeople,Picture)");
			strSql.Append(" values (");
			strSql.Append("@GtoiletUuid,@IsDeleted,@GtoiletName,@GtoiletAddress,@Lon,@Lat,@GtoiletStaues,@KongqiZhil,@WaterYujin,@AddTime,@AddPeople,@Picture)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@GtoiletUuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@IsDeleted", SqlDbType.Int,4),
					new SqlParameter("@GtoiletName", SqlDbType.NVarChar,255),
					new SqlParameter("@GtoiletAddress", SqlDbType.NVarChar,255),
					new SqlParameter("@Lon", SqlDbType.NVarChar,255),
					new SqlParameter("@Lat", SqlDbType.NVarChar,255),
					new SqlParameter("@GtoiletStaues", SqlDbType.NVarChar,255),
					new SqlParameter("@KongqiZhil", SqlDbType.NVarChar,255),
					new SqlParameter("@WaterYujin", SqlDbType.NVarChar,255),
					new SqlParameter("@AddTime", SqlDbType.NVarChar,255),
					new SqlParameter("@AddPeople", SqlDbType.NVarChar,255),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1)};
			parameters[0].Value = Guid.NewGuid();
			parameters[1].Value = model.IsDeleted;
			parameters[2].Value = model.GtoiletName;
			parameters[3].Value = model.GtoiletAddress;
			parameters[4].Value = model.Lon;
			parameters[5].Value = model.Lat;
			parameters[6].Value = model.GtoiletStaues;
			parameters[7].Value = model.KongqiZhil;
			parameters[8].Value = model.WaterYujin;
			parameters[9].Value = model.AddTime;
			parameters[10].Value = model.AddPeople;
			parameters[11].Value = model.Picture;

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
		public bool Update(HeqiaoDaoshiCore.Model.Gtoilet model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Gtoilet set ");
			strSql.Append("IsDeleted=@IsDeleted,");
			strSql.Append("GtoiletName=@GtoiletName,");
			strSql.Append("GtoiletAddress=@GtoiletAddress,");
			strSql.Append("Lon=@Lon,");
			strSql.Append("Lat=@Lat,");
			strSql.Append("GtoiletStaues=@GtoiletStaues,");
			strSql.Append("KongqiZhil=@KongqiZhil,");
			strSql.Append("WaterYujin=@WaterYujin,");
			strSql.Append("AddTime=@AddTime,");
			strSql.Append("AddPeople=@AddPeople,");
			strSql.Append("Picture=@Picture");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@IsDeleted", SqlDbType.Int,4),
					new SqlParameter("@GtoiletName", SqlDbType.NVarChar,255),
					new SqlParameter("@GtoiletAddress", SqlDbType.NVarChar,255),
					new SqlParameter("@Lon", SqlDbType.NVarChar,255),
					new SqlParameter("@Lat", SqlDbType.NVarChar,255),
					new SqlParameter("@GtoiletStaues", SqlDbType.NVarChar,255),
					new SqlParameter("@KongqiZhil", SqlDbType.NVarChar,255),
					new SqlParameter("@WaterYujin", SqlDbType.NVarChar,255),
					new SqlParameter("@AddTime", SqlDbType.NVarChar,255),
					new SqlParameter("@AddPeople", SqlDbType.NVarChar,255),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1),
					new SqlParameter("@GtoiletUuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)};
			parameters[0].Value = model.IsDeleted;
			parameters[1].Value = model.GtoiletName;
			parameters[2].Value = model.GtoiletAddress;
			parameters[3].Value = model.Lon;
			parameters[4].Value = model.Lat;
			parameters[5].Value = model.GtoiletStaues;
			parameters[6].Value = model.KongqiZhil;
			parameters[7].Value = model.WaterYujin;
			parameters[8].Value = model.AddTime;
			parameters[9].Value = model.AddPeople;
			parameters[10].Value = model.Picture;
			parameters[11].Value = model.GtoiletUuid;
			parameters[12].Value = model.ID;

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
			strSql.Append("delete from Gtoilet ");
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
		public bool Delete(Guid GtoiletUuid)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Gtoilet ");
			strSql.Append(" where GtoiletUuid=@GtoiletUuid ");
			SqlParameter[] parameters = {
					new SqlParameter("@GtoiletUuid", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = GtoiletUuid;

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
			strSql.Append("delete from Gtoilet ");
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
		public HeqiaoDaoshiCore.Model.Gtoilet GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 GtoiletUuid,ID,IsDeleted,GtoiletName,GtoiletAddress,Lon,Lat,GtoiletStaues,KongqiZhil,WaterYujin,AddTime,AddPeople,Picture from Gtoilet ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.Gtoilet model=new HeqiaoDaoshiCore.Model.Gtoilet();
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
		public HeqiaoDaoshiCore.Model.Gtoilet DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.Gtoilet model=new HeqiaoDaoshiCore.Model.Gtoilet();
			if (row != null)
			{
				if(row["GtoiletUuid"]!=null && row["GtoiletUuid"].ToString()!="")
				{
					model.GtoiletUuid= new Guid(row["GtoiletUuid"].ToString());
				}
				if(row["ID"]!=null && row["ID"].ToString()!="")
				{
					model.ID=int.Parse(row["ID"].ToString());
				}
				if(row["IsDeleted"]!=null && row["IsDeleted"].ToString()!="")
				{
					model.IsDeleted=int.Parse(row["IsDeleted"].ToString());
				}
				if(row["GtoiletName"]!=null)
				{
					model.GtoiletName=row["GtoiletName"].ToString();
				}
				if(row["GtoiletAddress"]!=null)
				{
					model.GtoiletAddress=row["GtoiletAddress"].ToString();
				}
				if(row["Lon"]!=null)
				{
					model.Lon=row["Lon"].ToString();
				}
				if(row["Lat"]!=null)
				{
					model.Lat=row["Lat"].ToString();
				}
				if(row["GtoiletStaues"]!=null)
				{
					model.GtoiletStaues=row["GtoiletStaues"].ToString();
				}
				if(row["KongqiZhil"]!=null)
				{
					model.KongqiZhil=row["KongqiZhil"].ToString();
				}
				if(row["WaterYujin"]!=null)
				{
					model.WaterYujin=row["WaterYujin"].ToString();
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
			}
			return model;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select GtoiletUuid,ID,IsDeleted,GtoiletName,GtoiletAddress,Lon,Lat,GtoiletStaues,KongqiZhil,WaterYujin,AddTime,AddPeople,Picture ");
			strSql.Append(" FROM Gtoilet ");
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
			strSql.Append(" GtoiletUuid,ID,IsDeleted,GtoiletName,GtoiletAddress,Lon,Lat,GtoiletStaues,KongqiZhil,WaterYujin,AddTime,AddPeople,Picture ");
			strSql.Append(" FROM Gtoilet ");
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
			strSql.Append("select count(1) FROM Gtoilet ");
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
			strSql.Append(")AS Row, T.*  from Gtoilet T ");
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
			parameters[0].Value = "Gtoilet";
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

