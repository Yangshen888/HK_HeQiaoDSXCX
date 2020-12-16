using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// 数据访问类:SystemIcon
	/// </summary>
	public partial class SystemIcon
	{
		public SystemIcon()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSql.GetMaxId("ID", "SystemIcon"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid SystemIconUUID,int ID)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from SystemIcon");
			strSql.Append(" where SystemIconUUID=@SystemIconUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@SystemIconUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = SystemIconUUID;
			parameters[1].Value = ID;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.SystemIcon model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into SystemIcon(");
			strSql.Append("SystemIconUUID,Code,Size,Color,Custom,Description,Status,IsDeleted,CreatedOn,CreatedByUserGuid,CreatedByUserName,ModifiedOn,ModifiedByUserGuid,ModifiedByUserName)");
			strSql.Append(" values (");
			strSql.Append("@SystemIconUUID,@Code,@Size,@Color,@Custom,@Description,@Status,@IsDeleted,@CreatedOn,@CreatedByUserGuid,@CreatedByUserName,@ModifiedOn,@ModifiedByUserGuid,@ModifiedByUserName)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@SystemIconUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Code", SqlDbType.NVarChar,50),
					new SqlParameter("@Size", SqlDbType.NVarChar,20),
					new SqlParameter("@Color", SqlDbType.NVarChar,50),
					new SqlParameter("@Custom", SqlDbType.NVarChar,60),
					new SqlParameter("@Description", SqlDbType.NVarChar,-1),
					new SqlParameter("@Status", SqlDbType.Int,4),
					new SqlParameter("@IsDeleted", SqlDbType.Int,4),
					new SqlParameter("@CreatedOn", SqlDbType.DateTime2,8),
					new SqlParameter("@CreatedByUserGuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@CreatedByUserName", SqlDbType.NVarChar,-1),
					new SqlParameter("@ModifiedOn", SqlDbType.DateTime2,8),
					new SqlParameter("@ModifiedByUserGuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ModifiedByUserName", SqlDbType.NVarChar,-1)};
			parameters[0].Value = Guid.NewGuid();
			parameters[1].Value = model.Code;
			parameters[2].Value = model.Size;
			parameters[3].Value = model.Color;
			parameters[4].Value = model.Custom;
			parameters[5].Value = model.Description;
			parameters[6].Value = model.Status;
			parameters[7].Value = model.IsDeleted;
			parameters[8].Value = model.CreatedOn;
			parameters[9].Value = Guid.NewGuid();
			parameters[10].Value = model.CreatedByUserName;
			parameters[11].Value = model.ModifiedOn;
			parameters[12].Value = Guid.NewGuid();
			parameters[13].Value = model.ModifiedByUserName;

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
		public bool Update(HeqiaoDaoshiCore.Model.SystemIcon model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update SystemIcon set ");
			strSql.Append("Code=@Code,");
			strSql.Append("Size=@Size,");
			strSql.Append("Color=@Color,");
			strSql.Append("Custom=@Custom,");
			strSql.Append("Description=@Description,");
			strSql.Append("Status=@Status,");
			strSql.Append("IsDeleted=@IsDeleted,");
			strSql.Append("CreatedOn=@CreatedOn,");
			strSql.Append("CreatedByUserGuid=@CreatedByUserGuid,");
			strSql.Append("CreatedByUserName=@CreatedByUserName,");
			strSql.Append("ModifiedOn=@ModifiedOn,");
			strSql.Append("ModifiedByUserGuid=@ModifiedByUserGuid,");
			strSql.Append("ModifiedByUserName=@ModifiedByUserName");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@Code", SqlDbType.NVarChar,50),
					new SqlParameter("@Size", SqlDbType.NVarChar,20),
					new SqlParameter("@Color", SqlDbType.NVarChar,50),
					new SqlParameter("@Custom", SqlDbType.NVarChar,60),
					new SqlParameter("@Description", SqlDbType.NVarChar,-1),
					new SqlParameter("@Status", SqlDbType.Int,4),
					new SqlParameter("@IsDeleted", SqlDbType.Int,4),
					new SqlParameter("@CreatedOn", SqlDbType.DateTime2,8),
					new SqlParameter("@CreatedByUserGuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@CreatedByUserName", SqlDbType.NVarChar,-1),
					new SqlParameter("@ModifiedOn", SqlDbType.DateTime2,8),
					new SqlParameter("@ModifiedByUserGuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ModifiedByUserName", SqlDbType.NVarChar,-1),
					new SqlParameter("@SystemIconUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)};
			parameters[0].Value = model.Code;
			parameters[1].Value = model.Size;
			parameters[2].Value = model.Color;
			parameters[3].Value = model.Custom;
			parameters[4].Value = model.Description;
			parameters[5].Value = model.Status;
			parameters[6].Value = model.IsDeleted;
			parameters[7].Value = model.CreatedOn;
			parameters[8].Value = model.CreatedByUserGuid;
			parameters[9].Value = model.CreatedByUserName;
			parameters[10].Value = model.ModifiedOn;
			parameters[11].Value = model.ModifiedByUserGuid;
			parameters[12].Value = model.ModifiedByUserName;
			parameters[13].Value = model.SystemIconUUID;
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
			strSql.Append("delete from SystemIcon ");
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
		public bool Delete(Guid SystemIconUUID,int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from SystemIcon ");
			strSql.Append(" where SystemIconUUID=@SystemIconUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@SystemIconUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = SystemIconUUID;
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
			strSql.Append("delete from SystemIcon ");
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
		public HeqiaoDaoshiCore.Model.SystemIcon GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 SystemIconUUID,Code,Size,Color,Custom,Description,Status,IsDeleted,CreatedOn,CreatedByUserGuid,CreatedByUserName,ModifiedOn,ModifiedByUserGuid,ModifiedByUserName,ID from SystemIcon ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.SystemIcon model=new HeqiaoDaoshiCore.Model.SystemIcon();
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
		public HeqiaoDaoshiCore.Model.SystemIcon DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.SystemIcon model=new HeqiaoDaoshiCore.Model.SystemIcon();
			if (row != null)
			{
				if(row["SystemIconUUID"]!=null && row["SystemIconUUID"].ToString()!="")
				{
					model.SystemIconUUID= new Guid(row["SystemIconUUID"].ToString());
				}
				if(row["Code"]!=null)
				{
					model.Code=row["Code"].ToString();
				}
				if(row["Size"]!=null)
				{
					model.Size=row["Size"].ToString();
				}
				if(row["Color"]!=null)
				{
					model.Color=row["Color"].ToString();
				}
				if(row["Custom"]!=null)
				{
					model.Custom=row["Custom"].ToString();
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
				if(row["CreatedOn"]!=null && row["CreatedOn"].ToString()!="")
				{
					model.CreatedOn=DateTime.Parse(row["CreatedOn"].ToString());
				}
				if(row["CreatedByUserGuid"]!=null && row["CreatedByUserGuid"].ToString()!="")
				{
					model.CreatedByUserGuid= new Guid(row["CreatedByUserGuid"].ToString());
				}
				if(row["CreatedByUserName"]!=null)
				{
					model.CreatedByUserName=row["CreatedByUserName"].ToString();
				}
				if(row["ModifiedOn"]!=null && row["ModifiedOn"].ToString()!="")
				{
					model.ModifiedOn=DateTime.Parse(row["ModifiedOn"].ToString());
				}
				if(row["ModifiedByUserGuid"]!=null && row["ModifiedByUserGuid"].ToString()!="")
				{
					model.ModifiedByUserGuid= new Guid(row["ModifiedByUserGuid"].ToString());
				}
				if(row["ModifiedByUserName"]!=null)
				{
					model.ModifiedByUserName=row["ModifiedByUserName"].ToString();
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
			strSql.Append("select SystemIconUUID,Code,Size,Color,Custom,Description,Status,IsDeleted,CreatedOn,CreatedByUserGuid,CreatedByUserName,ModifiedOn,ModifiedByUserGuid,ModifiedByUserName,ID ");
			strSql.Append(" FROM SystemIcon ");
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
			strSql.Append(" SystemIconUUID,Code,Size,Color,Custom,Description,Status,IsDeleted,CreatedOn,CreatedByUserGuid,CreatedByUserName,ModifiedOn,ModifiedByUserGuid,ModifiedByUserName,ID ");
			strSql.Append(" FROM SystemIcon ");
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
			strSql.Append("select count(1) FROM SystemIcon ");
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
			strSql.Append(")AS Row, T.*  from SystemIcon T ");
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
			parameters[0].Value = "SystemIcon";
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

