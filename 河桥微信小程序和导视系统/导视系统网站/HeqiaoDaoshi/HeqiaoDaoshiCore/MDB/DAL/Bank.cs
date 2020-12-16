using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// 数据访问类:Bank
	/// </summary>
	public partial class Bank
	{
		public Bank()
		{}
		#region  BasicMethod

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid BankUuid)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Bank");
			strSql.Append(" where BankUuid=@BankUuid ");
			SqlParameter[] parameters = {
					new SqlParameter("@BankUuid", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = BankUuid;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.Bank model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Bank(");
			strSql.Append("BankUuid,IsDeleted,BankName,BankAddress,Lon,Lat,Staues,Telephone,Remark,RemarkOne,RemarkTwo,Picture,AddTime,AddPeople)");
			strSql.Append(" values (");
			strSql.Append("@BankUuid,@IsDeleted,@BankName,@BankAddress,@Lon,@Lat,@Staues,@Telephone,@Remark,@RemarkOne,@RemarkTwo,@Picture,@AddTime,@AddPeople)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@BankUuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@IsDeleted", SqlDbType.Int,4),
					new SqlParameter("@BankName", SqlDbType.NVarChar,-1),
					new SqlParameter("@BankAddress", SqlDbType.NVarChar,-1),
					new SqlParameter("@Lon", SqlDbType.NVarChar,255),
					new SqlParameter("@Lat", SqlDbType.NVarChar,255),
					new SqlParameter("@Staues", SqlDbType.NVarChar,255),
					new SqlParameter("@Telephone", SqlDbType.NVarChar,255),
					new SqlParameter("@Remark", SqlDbType.NVarChar,-1),
					new SqlParameter("@RemarkOne", SqlDbType.NVarChar,-1),
					new SqlParameter("@RemarkTwo", SqlDbType.NVarChar,-1),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1),
					new SqlParameter("@AddTime", SqlDbType.NVarChar,255),
					new SqlParameter("@AddPeople", SqlDbType.NVarChar,255)};
			parameters[0].Value = Guid.NewGuid();
			parameters[1].Value = model.IsDeleted;
			parameters[2].Value = model.BankName;
			parameters[3].Value = model.BankAddress;
			parameters[4].Value = model.Lon;
			parameters[5].Value = model.Lat;
			parameters[6].Value = model.Staues;
			parameters[7].Value = model.Telephone;
			parameters[8].Value = model.Remark;
			parameters[9].Value = model.RemarkOne;
			parameters[10].Value = model.RemarkTwo;
			parameters[11].Value = model.Picture;
			parameters[12].Value = model.AddTime;
			parameters[13].Value = model.AddPeople;

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
		public bool Update(HeqiaoDaoshiCore.Model.Bank model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Bank set ");
			strSql.Append("IsDeleted=@IsDeleted,");
			strSql.Append("BankName=@BankName,");
			strSql.Append("BankAddress=@BankAddress,");
			strSql.Append("Lon=@Lon,");
			strSql.Append("Lat=@Lat,");
			strSql.Append("Staues=@Staues,");
			strSql.Append("Telephone=@Telephone,");
			strSql.Append("Remark=@Remark,");
			strSql.Append("RemarkOne=@RemarkOne,");
			strSql.Append("RemarkTwo=@RemarkTwo,");
			strSql.Append("Picture=@Picture,");
			strSql.Append("AddTime=@AddTime,");
			strSql.Append("AddPeople=@AddPeople");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@IsDeleted", SqlDbType.Int,4),
					new SqlParameter("@BankName", SqlDbType.NVarChar,-1),
					new SqlParameter("@BankAddress", SqlDbType.NVarChar,-1),
					new SqlParameter("@Lon", SqlDbType.NVarChar,255),
					new SqlParameter("@Lat", SqlDbType.NVarChar,255),
					new SqlParameter("@Staues", SqlDbType.NVarChar,255),
					new SqlParameter("@Telephone", SqlDbType.NVarChar,255),
					new SqlParameter("@Remark", SqlDbType.NVarChar,-1),
					new SqlParameter("@RemarkOne", SqlDbType.NVarChar,-1),
					new SqlParameter("@RemarkTwo", SqlDbType.NVarChar,-1),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1),
					new SqlParameter("@AddTime", SqlDbType.NVarChar,255),
					new SqlParameter("@AddPeople", SqlDbType.NVarChar,255),
					new SqlParameter("@BankUuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)};
			parameters[0].Value = model.IsDeleted;
			parameters[1].Value = model.BankName;
			parameters[2].Value = model.BankAddress;
			parameters[3].Value = model.Lon;
			parameters[4].Value = model.Lat;
			parameters[5].Value = model.Staues;
			parameters[6].Value = model.Telephone;
			parameters[7].Value = model.Remark;
			parameters[8].Value = model.RemarkOne;
			parameters[9].Value = model.RemarkTwo;
			parameters[10].Value = model.Picture;
			parameters[11].Value = model.AddTime;
			parameters[12].Value = model.AddPeople;
			parameters[13].Value = model.BankUuid;
			parameters[14].Value = model.ID;

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
			strSql.Append("delete from Bank ");
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
		public bool Delete(Guid BankUuid)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Bank ");
			strSql.Append(" where BankUuid=@BankUuid ");
			SqlParameter[] parameters = {
					new SqlParameter("@BankUuid", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = BankUuid;

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
			strSql.Append("delete from Bank ");
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
		public HeqiaoDaoshiCore.Model.Bank GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 BankUuid,ID,IsDeleted,BankName,BankAddress,Lon,Lat,Staues,Telephone,Remark,RemarkOne,RemarkTwo,Picture,AddTime,AddPeople from Bank ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.Bank model=new HeqiaoDaoshiCore.Model.Bank();
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
		public HeqiaoDaoshiCore.Model.Bank DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.Bank model=new HeqiaoDaoshiCore.Model.Bank();
			if (row != null)
			{
				if(row["BankUuid"]!=null && row["BankUuid"].ToString()!="")
				{
					model.BankUuid= new Guid(row["BankUuid"].ToString());
				}
				if(row["ID"]!=null && row["ID"].ToString()!="")
				{
					model.ID=int.Parse(row["ID"].ToString());
				}
				if(row["IsDeleted"]!=null && row["IsDeleted"].ToString()!="")
				{
					model.IsDeleted=int.Parse(row["IsDeleted"].ToString());
				}
				if(row["BankName"]!=null)
				{
					model.BankName=row["BankName"].ToString();
				}
				if(row["BankAddress"]!=null)
				{
					model.BankAddress=row["BankAddress"].ToString();
				}
				if(row["Lon"]!=null)
				{
					model.Lon=row["Lon"].ToString();
				}
				if(row["Lat"]!=null)
				{
					model.Lat=row["Lat"].ToString();
				}
				if(row["Staues"]!=null)
				{
					model.Staues=row["Staues"].ToString();
				}
				if(row["Telephone"]!=null)
				{
					model.Telephone=row["Telephone"].ToString();
				}
				if(row["Remark"]!=null)
				{
					model.Remark=row["Remark"].ToString();
				}
				if(row["RemarkOne"]!=null)
				{
					model.RemarkOne=row["RemarkOne"].ToString();
				}
				if(row["RemarkTwo"]!=null)
				{
					model.RemarkTwo=row["RemarkTwo"].ToString();
				}
				if(row["Picture"]!=null)
				{
					model.Picture=row["Picture"].ToString();
				}
				if(row["AddTime"]!=null)
				{
					model.AddTime=row["AddTime"].ToString();
				}
				if(row["AddPeople"]!=null)
				{
					model.AddPeople=row["AddPeople"].ToString();
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
			strSql.Append("select BankUuid,ID,IsDeleted,BankName,BankAddress,Lon,Lat,Staues,Telephone,Remark,RemarkOne,RemarkTwo,Picture,AddTime,AddPeople ");
			strSql.Append(" FROM Bank ");
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
			strSql.Append(" BankUuid,ID,IsDeleted,BankName,BankAddress,Lon,Lat,Staues,Telephone,Remark,RemarkOne,RemarkTwo,Picture,AddTime,AddPeople ");
			strSql.Append(" FROM Bank ");
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
			strSql.Append("select count(1) FROM Bank ");
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
			strSql.Append(")AS Row, T.*  from Bank T ");
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
			parameters[0].Value = "Bank";
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

