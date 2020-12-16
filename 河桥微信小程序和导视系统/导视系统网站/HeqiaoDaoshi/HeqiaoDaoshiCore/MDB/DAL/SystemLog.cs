using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// 数据访问类:SystemLog
	/// </summary>
	public partial class SystemLog
	{
		public SystemLog()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSql.GetMaxId("ID", "SystemLog"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid SystemLogUUID,int ID)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from SystemLog");
			strSql.Append(" where SystemLogUUID=@SystemLogUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@SystemLogUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = SystemLogUUID;
			parameters[1].Value = ID;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.SystemLog model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into SystemLog(");
			strSql.Append("SystemLogUUID,UserID,UserIDType,UserName,OperationTime,OperationContent,IPAddress,Type,IsDelete,AddTime,AddPeople)");
			strSql.Append(" values (");
			strSql.Append("@SystemLogUUID,@UserID,@UserIDType,@UserName,@OperationTime,@OperationContent,@IPAddress,@Type,@IsDelete,@AddTime,@AddPeople)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@SystemLogUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@UserID", SqlDbType.VarChar,255),
					new SqlParameter("@UserIDType", SqlDbType.Int,4),
					new SqlParameter("@UserName", SqlDbType.VarChar,50),
					new SqlParameter("@OperationTime", SqlDbType.DateTime),
					new SqlParameter("@OperationContent", SqlDbType.Text),
					new SqlParameter("@IPAddress", SqlDbType.VarChar,50),
					new SqlParameter("@Type", SqlDbType.VarChar,50),
					new SqlParameter("@IsDelete", SqlDbType.Int,4),
					new SqlParameter("@AddTime", SqlDbType.DateTime),
					new SqlParameter("@AddPeople", SqlDbType.VarChar,255)};
			parameters[0].Value = Guid.NewGuid();
			parameters[1].Value = model.UserID;
			parameters[2].Value = model.UserIDType;
			parameters[3].Value = model.UserName;
			parameters[4].Value = model.OperationTime;
			parameters[5].Value = model.OperationContent;
			parameters[6].Value = model.IPAddress;
			parameters[7].Value = model.Type;
			parameters[8].Value = model.IsDelete;
			parameters[9].Value = model.AddTime;
			parameters[10].Value = model.AddPeople;

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
		public bool Update(HeqiaoDaoshiCore.Model.SystemLog model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update SystemLog set ");
			strSql.Append("UserID=@UserID,");
			strSql.Append("UserIDType=@UserIDType,");
			strSql.Append("UserName=@UserName,");
			strSql.Append("OperationTime=@OperationTime,");
			strSql.Append("OperationContent=@OperationContent,");
			strSql.Append("IPAddress=@IPAddress,");
			strSql.Append("Type=@Type,");
			strSql.Append("IsDelete=@IsDelete,");
			strSql.Append("AddTime=@AddTime,");
			strSql.Append("AddPeople=@AddPeople");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@UserID", SqlDbType.VarChar,255),
					new SqlParameter("@UserIDType", SqlDbType.Int,4),
					new SqlParameter("@UserName", SqlDbType.VarChar,50),
					new SqlParameter("@OperationTime", SqlDbType.DateTime),
					new SqlParameter("@OperationContent", SqlDbType.Text),
					new SqlParameter("@IPAddress", SqlDbType.VarChar,50),
					new SqlParameter("@Type", SqlDbType.VarChar,50),
					new SqlParameter("@IsDelete", SqlDbType.Int,4),
					new SqlParameter("@AddTime", SqlDbType.DateTime),
					new SqlParameter("@AddPeople", SqlDbType.VarChar,255),
					new SqlParameter("@SystemLogUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)};
			parameters[0].Value = model.UserID;
			parameters[1].Value = model.UserIDType;
			parameters[2].Value = model.UserName;
			parameters[3].Value = model.OperationTime;
			parameters[4].Value = model.OperationContent;
			parameters[5].Value = model.IPAddress;
			parameters[6].Value = model.Type;
			parameters[7].Value = model.IsDelete;
			parameters[8].Value = model.AddTime;
			parameters[9].Value = model.AddPeople;
			parameters[10].Value = model.SystemLogUUID;
			parameters[11].Value = model.ID;

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
			strSql.Append("delete from SystemLog ");
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
		public bool Delete(Guid SystemLogUUID,int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from SystemLog ");
			strSql.Append(" where SystemLogUUID=@SystemLogUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@SystemLogUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = SystemLogUUID;
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
			strSql.Append("delete from SystemLog ");
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
		public HeqiaoDaoshiCore.Model.SystemLog GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 SystemLogUUID,UserID,UserIDType,UserName,OperationTime,OperationContent,IPAddress,Type,IsDelete,AddTime,AddPeople,ID from SystemLog ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.SystemLog model=new HeqiaoDaoshiCore.Model.SystemLog();
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
		public HeqiaoDaoshiCore.Model.SystemLog DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.SystemLog model=new HeqiaoDaoshiCore.Model.SystemLog();
			if (row != null)
			{
				if(row["SystemLogUUID"]!=null && row["SystemLogUUID"].ToString()!="")
				{
					model.SystemLogUUID= new Guid(row["SystemLogUUID"].ToString());
				}
				if(row["UserID"]!=null)
				{
					model.UserID=row["UserID"].ToString();
				}
				if(row["UserIDType"]!=null && row["UserIDType"].ToString()!="")
				{
					model.UserIDType=int.Parse(row["UserIDType"].ToString());
				}
				if(row["UserName"]!=null)
				{
					model.UserName=row["UserName"].ToString();
				}
				if(row["OperationTime"]!=null && row["OperationTime"].ToString()!="")
				{
					model.OperationTime=DateTime.Parse(row["OperationTime"].ToString());
				}
				if(row["OperationContent"]!=null)
				{
					model.OperationContent=row["OperationContent"].ToString();
				}
				if(row["IPAddress"]!=null)
				{
					model.IPAddress=row["IPAddress"].ToString();
				}
				if(row["Type"]!=null)
				{
					model.Type=row["Type"].ToString();
				}
				if(row["IsDelete"]!=null && row["IsDelete"].ToString()!="")
				{
					model.IsDelete=int.Parse(row["IsDelete"].ToString());
				}
				if(row["AddTime"]!=null && row["AddTime"].ToString()!="")
				{
					model.AddTime=DateTime.Parse(row["AddTime"].ToString());
				}
				if(row["AddPeople"]!=null)
				{
					model.AddPeople=row["AddPeople"].ToString();
				}
				if(row["ID"]!=null && row["ID"].ToString()!="")
				{
					model.ID=int.Parse(row["ID"].ToString());
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
			strSql.Append("select SystemLogUUID,UserID,UserIDType,UserName,OperationTime,OperationContent,IPAddress,Type,IsDelete,AddTime,AddPeople,ID ");
			strSql.Append(" FROM SystemLog ");
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
			strSql.Append(" SystemLogUUID,UserID,UserIDType,UserName,OperationTime,OperationContent,IPAddress,Type,IsDelete,AddTime,AddPeople,ID ");
			strSql.Append(" FROM SystemLog ");
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
			strSql.Append("select count(1) FROM SystemLog ");
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
			strSql.Append(")AS Row, T.*  from SystemLog T ");
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
			parameters[0].Value = "SystemLog";
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

