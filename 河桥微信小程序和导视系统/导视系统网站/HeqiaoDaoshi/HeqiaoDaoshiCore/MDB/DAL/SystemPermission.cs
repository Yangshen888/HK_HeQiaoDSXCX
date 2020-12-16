using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// 数据访问类:SystemPermission
	/// </summary>
	public partial class SystemPermission
	{
		public SystemPermission()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSql.GetMaxId("ID", "SystemPermission"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid SystemPermissionUUID,int ID)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from SystemPermission");
			strSql.Append(" where SystemPermissionUUID=@SystemPermissionUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@SystemPermissionUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = SystemPermissionUUID;
			parameters[1].Value = ID;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.SystemPermission model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into SystemPermission(");
			strSql.Append("SystemPermissionUUID,SystemMenuUUID,Name,ActionCode,Icon,Description,Status,IsDeleted,Type,CreatedByUserGuid,CreatedOn,CreatedByUserName,ModifiedOn,ModifiedByUserGuid,ModifiedByUserName,CaPower)");
			strSql.Append(" values (");
			strSql.Append("@SystemPermissionUUID,@SystemMenuUUID,@Name,@ActionCode,@Icon,@Description,@Status,@IsDeleted,@Type,@CreatedByUserGuid,@CreatedOn,@CreatedByUserName,@ModifiedOn,@ModifiedByUserGuid,@ModifiedByUserName,@CaPower)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@SystemPermissionUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@SystemMenuUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Name", SqlDbType.NVarChar,255),
					new SqlParameter("@ActionCode", SqlDbType.NVarChar,255),
					new SqlParameter("@Icon", SqlDbType.NVarChar,255),
					new SqlParameter("@Description", SqlDbType.NVarChar,255),
					new SqlParameter("@Status", SqlDbType.Int,4),
					new SqlParameter("@IsDeleted", SqlDbType.Int,4),
					new SqlParameter("@Type", SqlDbType.Int,4),
					new SqlParameter("@CreatedByUserGuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@CreatedOn", SqlDbType.NVarChar,255),
					new SqlParameter("@CreatedByUserName", SqlDbType.NVarChar,255),
					new SqlParameter("@ModifiedOn", SqlDbType.NVarChar,255),
					new SqlParameter("@ModifiedByUserGuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ModifiedByUserName", SqlDbType.NVarChar,255),
					new SqlParameter("@CaPower", SqlDbType.NVarChar,255)};
			parameters[0].Value = Guid.NewGuid();
			parameters[1].Value = Guid.NewGuid();
			parameters[2].Value = model.Name;
			parameters[3].Value = model.ActionCode;
			parameters[4].Value = model.Icon;
			parameters[5].Value = model.Description;
			parameters[6].Value = model.Status;
			parameters[7].Value = model.IsDeleted;
			parameters[8].Value = model.Type;
			parameters[9].Value = Guid.NewGuid();
			parameters[10].Value = model.CreatedOn;
			parameters[11].Value = model.CreatedByUserName;
			parameters[12].Value = model.ModifiedOn;
			parameters[13].Value = Guid.NewGuid();
			parameters[14].Value = model.ModifiedByUserName;
			parameters[15].Value = model.CaPower;

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
		public bool Update(HeqiaoDaoshiCore.Model.SystemPermission model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update SystemPermission set ");
			strSql.Append("SystemMenuUUID=@SystemMenuUUID,");
			strSql.Append("Name=@Name,");
			strSql.Append("ActionCode=@ActionCode,");
			strSql.Append("Icon=@Icon,");
			strSql.Append("Description=@Description,");
			strSql.Append("Status=@Status,");
			strSql.Append("IsDeleted=@IsDeleted,");
			strSql.Append("Type=@Type,");
			strSql.Append("CreatedByUserGuid=@CreatedByUserGuid,");
			strSql.Append("CreatedOn=@CreatedOn,");
			strSql.Append("CreatedByUserName=@CreatedByUserName,");
			strSql.Append("ModifiedOn=@ModifiedOn,");
			strSql.Append("ModifiedByUserGuid=@ModifiedByUserGuid,");
			strSql.Append("ModifiedByUserName=@ModifiedByUserName,");
			strSql.Append("CaPower=@CaPower");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@SystemMenuUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Name", SqlDbType.NVarChar,255),
					new SqlParameter("@ActionCode", SqlDbType.NVarChar,255),
					new SqlParameter("@Icon", SqlDbType.NVarChar,255),
					new SqlParameter("@Description", SqlDbType.NVarChar,255),
					new SqlParameter("@Status", SqlDbType.Int,4),
					new SqlParameter("@IsDeleted", SqlDbType.Int,4),
					new SqlParameter("@Type", SqlDbType.Int,4),
					new SqlParameter("@CreatedByUserGuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@CreatedOn", SqlDbType.NVarChar,255),
					new SqlParameter("@CreatedByUserName", SqlDbType.NVarChar,255),
					new SqlParameter("@ModifiedOn", SqlDbType.NVarChar,255),
					new SqlParameter("@ModifiedByUserGuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ModifiedByUserName", SqlDbType.NVarChar,255),
					new SqlParameter("@CaPower", SqlDbType.NVarChar,255),
					new SqlParameter("@SystemPermissionUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)};
			parameters[0].Value = model.SystemMenuUUID;
			parameters[1].Value = model.Name;
			parameters[2].Value = model.ActionCode;
			parameters[3].Value = model.Icon;
			parameters[4].Value = model.Description;
			parameters[5].Value = model.Status;
			parameters[6].Value = model.IsDeleted;
			parameters[7].Value = model.Type;
			parameters[8].Value = model.CreatedByUserGuid;
			parameters[9].Value = model.CreatedOn;
			parameters[10].Value = model.CreatedByUserName;
			parameters[11].Value = model.ModifiedOn;
			parameters[12].Value = model.ModifiedByUserGuid;
			parameters[13].Value = model.ModifiedByUserName;
			parameters[14].Value = model.CaPower;
			parameters[15].Value = model.SystemPermissionUUID;
			parameters[16].Value = model.ID;

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
			strSql.Append("delete from SystemPermission ");
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
		public bool Delete(Guid SystemPermissionUUID,int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from SystemPermission ");
			strSql.Append(" where SystemPermissionUUID=@SystemPermissionUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@SystemPermissionUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = SystemPermissionUUID;
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
			strSql.Append("delete from SystemPermission ");
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
		public HeqiaoDaoshiCore.Model.SystemPermission GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 SystemPermissionUUID,SystemMenuUUID,Name,ActionCode,Icon,Description,Status,IsDeleted,Type,CreatedByUserGuid,CreatedOn,CreatedByUserName,ModifiedOn,ModifiedByUserGuid,ModifiedByUserName,CaPower,ID from SystemPermission ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.SystemPermission model=new HeqiaoDaoshiCore.Model.SystemPermission();
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
		public HeqiaoDaoshiCore.Model.SystemPermission DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.SystemPermission model=new HeqiaoDaoshiCore.Model.SystemPermission();
			if (row != null)
			{
				if(row["SystemPermissionUUID"]!=null && row["SystemPermissionUUID"].ToString()!="")
				{
					model.SystemPermissionUUID= new Guid(row["SystemPermissionUUID"].ToString());
				}
				if(row["SystemMenuUUID"]!=null && row["SystemMenuUUID"].ToString()!="")
				{
					model.SystemMenuUUID= new Guid(row["SystemMenuUUID"].ToString());
				}
				if(row["Name"]!=null)
				{
					model.Name=row["Name"].ToString();
				}
				if(row["ActionCode"]!=null)
				{
					model.ActionCode=row["ActionCode"].ToString();
				}
				if(row["Icon"]!=null)
				{
					model.Icon=row["Icon"].ToString();
				}
				if(row["Description"]!=null)
				{
					model.Description=row["Description"].ToString();
				}
				if(row["Status"]!=null && row["Status"].ToString()!="")
				{
					model.Status=int.Parse(row["Status"].ToString());
				}
				if(row["IsDeleted"]!=null && row["IsDeleted"].ToString()!="")
				{
					model.IsDeleted=int.Parse(row["IsDeleted"].ToString());
				}
				if(row["Type"]!=null && row["Type"].ToString()!="")
				{
					model.Type=int.Parse(row["Type"].ToString());
				}
				if(row["CreatedByUserGuid"]!=null && row["CreatedByUserGuid"].ToString()!="")
				{
					model.CreatedByUserGuid= new Guid(row["CreatedByUserGuid"].ToString());
				}
				if(row["CreatedOn"]!=null)
				{
					model.CreatedOn=row["CreatedOn"].ToString();
				}
				if(row["CreatedByUserName"]!=null)
				{
					model.CreatedByUserName=row["CreatedByUserName"].ToString();
				}
				if(row["ModifiedOn"]!=null)
				{
					model.ModifiedOn=row["ModifiedOn"].ToString();
				}
				if(row["ModifiedByUserGuid"]!=null && row["ModifiedByUserGuid"].ToString()!="")
				{
					model.ModifiedByUserGuid= new Guid(row["ModifiedByUserGuid"].ToString());
				}
				if(row["ModifiedByUserName"]!=null)
				{
					model.ModifiedByUserName=row["ModifiedByUserName"].ToString();
				}
				if(row["CaPower"]!=null)
				{
					model.CaPower=row["CaPower"].ToString();
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
			strSql.Append("select SystemPermissionUUID,SystemMenuUUID,Name,ActionCode,Icon,Description,Status,IsDeleted,Type,CreatedByUserGuid,CreatedOn,CreatedByUserName,ModifiedOn,ModifiedByUserGuid,ModifiedByUserName,CaPower,ID ");
			strSql.Append(" FROM SystemPermission ");
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
			strSql.Append(" SystemPermissionUUID,SystemMenuUUID,Name,ActionCode,Icon,Description,Status,IsDeleted,Type,CreatedByUserGuid,CreatedOn,CreatedByUserName,ModifiedOn,ModifiedByUserGuid,ModifiedByUserName,CaPower,ID ");
			strSql.Append(" FROM SystemPermission ");
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
			strSql.Append("select count(1) FROM SystemPermission ");
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
			strSql.Append(")AS Row, T.*  from SystemPermission T ");
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
			parameters[0].Value = "SystemPermission";
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

