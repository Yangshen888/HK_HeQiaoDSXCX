using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// 数据访问类:SystemMenu
	/// </summary>
	public partial class SystemMenu
	{
		public SystemMenu()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSql.GetMaxId("ID", "SystemMenu"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid SystemMenuUUID,int ID)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from SystemMenu");
			strSql.Append(" where SystemMenuUUID=@SystemMenuUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@SystemMenuUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = SystemMenuUUID;
			parameters[1].Value = ID;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.SystemMenu model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into SystemMenu(");
			strSql.Append("SystemMenuUUID,Name,Url,Alias,Icon,ParentGuid,ParentName,Level,Description,Sort,Status,IsDeleted,IsDefaultRouter,CreatedOn,CreatedByUserGuid,CreatedByUserName,ModifiedOn,ModifiedByUserGuid,ModifiedByUserName,Component,HideInMenu,NotCache,BeforeCloseFun)");
			strSql.Append(" values (");
			strSql.Append("@SystemMenuUUID,@Name,@Url,@Alias,@Icon,@ParentGuid,@ParentName,@Level,@Description,@Sort,@Status,@IsDeleted,@IsDefaultRouter,@CreatedOn,@CreatedByUserGuid,@CreatedByUserName,@ModifiedOn,@ModifiedByUserGuid,@ModifiedByUserName,@Component,@HideInMenu,@NotCache,@BeforeCloseFun)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@SystemMenuUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Name", SqlDbType.NVarChar,255),
					new SqlParameter("@Url", SqlDbType.NVarChar,255),
					new SqlParameter("@Alias", SqlDbType.NVarChar,255),
					new SqlParameter("@Icon", SqlDbType.NVarChar,255),
					new SqlParameter("@ParentGuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ParentName", SqlDbType.NVarChar,255),
					new SqlParameter("@Level", SqlDbType.Int,4),
					new SqlParameter("@Description", SqlDbType.NVarChar,255),
					new SqlParameter("@Sort", SqlDbType.Int,4),
					new SqlParameter("@Status", SqlDbType.Int,4),
					new SqlParameter("@IsDeleted", SqlDbType.Int,4),
					new SqlParameter("@IsDefaultRouter", SqlDbType.Int,4),
					new SqlParameter("@CreatedOn", SqlDbType.NVarChar,255),
					new SqlParameter("@CreatedByUserGuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@CreatedByUserName", SqlDbType.NVarChar,255),
					new SqlParameter("@ModifiedOn", SqlDbType.NVarChar,255),
					new SqlParameter("@ModifiedByUserGuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ModifiedByUserName", SqlDbType.NVarChar,255),
					new SqlParameter("@Component", SqlDbType.NVarChar,255),
					new SqlParameter("@HideInMenu", SqlDbType.Int,4),
					new SqlParameter("@NotCache", SqlDbType.Int,4),
					new SqlParameter("@BeforeCloseFun", SqlDbType.NVarChar,255)};
			parameters[0].Value = Guid.NewGuid();
			parameters[1].Value = model.Name;
			parameters[2].Value = model.Url;
			parameters[3].Value = model.Alias;
			parameters[4].Value = model.Icon;
			parameters[5].Value = Guid.NewGuid();
			parameters[6].Value = model.ParentName;
			parameters[7].Value = model.Level;
			parameters[8].Value = model.Description;
			parameters[9].Value = model.Sort;
			parameters[10].Value = model.Status;
			parameters[11].Value = model.IsDeleted;
			parameters[12].Value = model.IsDefaultRouter;
			parameters[13].Value = model.CreatedOn;
			parameters[14].Value = Guid.NewGuid();
			parameters[15].Value = model.CreatedByUserName;
			parameters[16].Value = model.ModifiedOn;
			parameters[17].Value = Guid.NewGuid();
			parameters[18].Value = model.ModifiedByUserName;
			parameters[19].Value = model.Component;
			parameters[20].Value = model.HideInMenu;
			parameters[21].Value = model.NotCache;
			parameters[22].Value = model.BeforeCloseFun;

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
		public bool Update(HeqiaoDaoshiCore.Model.SystemMenu model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update SystemMenu set ");
			strSql.Append("Name=@Name,");
			strSql.Append("Url=@Url,");
			strSql.Append("Alias=@Alias,");
			strSql.Append("Icon=@Icon,");
			strSql.Append("ParentGuid=@ParentGuid,");
			strSql.Append("ParentName=@ParentName,");
			strSql.Append("Level=@Level,");
			strSql.Append("Description=@Description,");
			strSql.Append("Sort=@Sort,");
			strSql.Append("Status=@Status,");
			strSql.Append("IsDeleted=@IsDeleted,");
			strSql.Append("IsDefaultRouter=@IsDefaultRouter,");
			strSql.Append("CreatedOn=@CreatedOn,");
			strSql.Append("CreatedByUserGuid=@CreatedByUserGuid,");
			strSql.Append("CreatedByUserName=@CreatedByUserName,");
			strSql.Append("ModifiedOn=@ModifiedOn,");
			strSql.Append("ModifiedByUserGuid=@ModifiedByUserGuid,");
			strSql.Append("ModifiedByUserName=@ModifiedByUserName,");
			strSql.Append("Component=@Component,");
			strSql.Append("HideInMenu=@HideInMenu,");
			strSql.Append("NotCache=@NotCache,");
			strSql.Append("BeforeCloseFun=@BeforeCloseFun");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@Name", SqlDbType.NVarChar,255),
					new SqlParameter("@Url", SqlDbType.NVarChar,255),
					new SqlParameter("@Alias", SqlDbType.NVarChar,255),
					new SqlParameter("@Icon", SqlDbType.NVarChar,255),
					new SqlParameter("@ParentGuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ParentName", SqlDbType.NVarChar,255),
					new SqlParameter("@Level", SqlDbType.Int,4),
					new SqlParameter("@Description", SqlDbType.NVarChar,255),
					new SqlParameter("@Sort", SqlDbType.Int,4),
					new SqlParameter("@Status", SqlDbType.Int,4),
					new SqlParameter("@IsDeleted", SqlDbType.Int,4),
					new SqlParameter("@IsDefaultRouter", SqlDbType.Int,4),
					new SqlParameter("@CreatedOn", SqlDbType.NVarChar,255),
					new SqlParameter("@CreatedByUserGuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@CreatedByUserName", SqlDbType.NVarChar,255),
					new SqlParameter("@ModifiedOn", SqlDbType.NVarChar,255),
					new SqlParameter("@ModifiedByUserGuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ModifiedByUserName", SqlDbType.NVarChar,255),
					new SqlParameter("@Component", SqlDbType.NVarChar,255),
					new SqlParameter("@HideInMenu", SqlDbType.Int,4),
					new SqlParameter("@NotCache", SqlDbType.Int,4),
					new SqlParameter("@BeforeCloseFun", SqlDbType.NVarChar,255),
					new SqlParameter("@SystemMenuUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)};
			parameters[0].Value = model.Name;
			parameters[1].Value = model.Url;
			parameters[2].Value = model.Alias;
			parameters[3].Value = model.Icon;
			parameters[4].Value = model.ParentGuid;
			parameters[5].Value = model.ParentName;
			parameters[6].Value = model.Level;
			parameters[7].Value = model.Description;
			parameters[8].Value = model.Sort;
			parameters[9].Value = model.Status;
			parameters[10].Value = model.IsDeleted;
			parameters[11].Value = model.IsDefaultRouter;
			parameters[12].Value = model.CreatedOn;
			parameters[13].Value = model.CreatedByUserGuid;
			parameters[14].Value = model.CreatedByUserName;
			parameters[15].Value = model.ModifiedOn;
			parameters[16].Value = model.ModifiedByUserGuid;
			parameters[17].Value = model.ModifiedByUserName;
			parameters[18].Value = model.Component;
			parameters[19].Value = model.HideInMenu;
			parameters[20].Value = model.NotCache;
			parameters[21].Value = model.BeforeCloseFun;
			parameters[22].Value = model.SystemMenuUUID;
			parameters[23].Value = model.ID;

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
			strSql.Append("delete from SystemMenu ");
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
		public bool Delete(Guid SystemMenuUUID,int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from SystemMenu ");
			strSql.Append(" where SystemMenuUUID=@SystemMenuUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@SystemMenuUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = SystemMenuUUID;
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
			strSql.Append("delete from SystemMenu ");
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
		public HeqiaoDaoshiCore.Model.SystemMenu GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 SystemMenuUUID,Name,Url,Alias,Icon,ParentGuid,ParentName,Level,Description,Sort,Status,IsDeleted,IsDefaultRouter,CreatedOn,CreatedByUserGuid,CreatedByUserName,ModifiedOn,ModifiedByUserGuid,ModifiedByUserName,Component,HideInMenu,NotCache,BeforeCloseFun,ID from SystemMenu ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.SystemMenu model=new HeqiaoDaoshiCore.Model.SystemMenu();
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
		public HeqiaoDaoshiCore.Model.SystemMenu DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.SystemMenu model=new HeqiaoDaoshiCore.Model.SystemMenu();
			if (row != null)
			{
				if(row["SystemMenuUUID"]!=null && row["SystemMenuUUID"].ToString()!="")
				{
					model.SystemMenuUUID= new Guid(row["SystemMenuUUID"].ToString());
				}
				if(row["Name"]!=null)
				{
					model.Name=row["Name"].ToString();
				}
				if(row["Url"]!=null)
				{
					model.Url=row["Url"].ToString();
				}
				if(row["Alias"]!=null)
				{
					model.Alias=row["Alias"].ToString();
				}
				if(row["Icon"]!=null)
				{
					model.Icon=row["Icon"].ToString();
				}
				if(row["ParentGuid"]!=null && row["ParentGuid"].ToString()!="")
				{
					model.ParentGuid= new Guid(row["ParentGuid"].ToString());
				}
				if(row["ParentName"]!=null)
				{
					model.ParentName=row["ParentName"].ToString();
				}
				if(row["Level"]!=null && row["Level"].ToString()!="")
				{
					model.Level=int.Parse(row["Level"].ToString());
				}
				if(row["Description"]!=null)
				{
					model.Description=row["Description"].ToString();
				}
				if(row["Sort"]!=null && row["Sort"].ToString()!="")
				{
					model.Sort=int.Parse(row["Sort"].ToString());
				}
				if(row["Status"]!=null && row["Status"].ToString()!="")
				{
					model.Status=int.Parse(row["Status"].ToString());
				}
				if(row["IsDeleted"]!=null && row["IsDeleted"].ToString()!="")
				{
					model.IsDeleted=int.Parse(row["IsDeleted"].ToString());
				}
				if(row["IsDefaultRouter"]!=null && row["IsDefaultRouter"].ToString()!="")
				{
					model.IsDefaultRouter=int.Parse(row["IsDefaultRouter"].ToString());
				}
				if(row["CreatedOn"]!=null)
				{
					model.CreatedOn=row["CreatedOn"].ToString();
				}
				if(row["CreatedByUserGuid"]!=null && row["CreatedByUserGuid"].ToString()!="")
				{
					model.CreatedByUserGuid= new Guid(row["CreatedByUserGuid"].ToString());
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
				if(row["Component"]!=null)
				{
					model.Component=row["Component"].ToString();
				}
				if(row["HideInMenu"]!=null && row["HideInMenu"].ToString()!="")
				{
					model.HideInMenu=int.Parse(row["HideInMenu"].ToString());
				}
				if(row["NotCache"]!=null && row["NotCache"].ToString()!="")
				{
					model.NotCache=int.Parse(row["NotCache"].ToString());
				}
				if(row["BeforeCloseFun"]!=null)
				{
					model.BeforeCloseFun=row["BeforeCloseFun"].ToString();
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
			strSql.Append("select SystemMenuUUID,Name,Url,Alias,Icon,ParentGuid,ParentName,Level,Description,Sort,Status,IsDeleted,IsDefaultRouter,CreatedOn,CreatedByUserGuid,CreatedByUserName,ModifiedOn,ModifiedByUserGuid,ModifiedByUserName,Component,HideInMenu,NotCache,BeforeCloseFun,ID ");
			strSql.Append(" FROM SystemMenu ");
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
			strSql.Append(" SystemMenuUUID,Name,Url,Alias,Icon,ParentGuid,ParentName,Level,Description,Sort,Status,IsDeleted,IsDefaultRouter,CreatedOn,CreatedByUserGuid,CreatedByUserName,ModifiedOn,ModifiedByUserGuid,ModifiedByUserName,Component,HideInMenu,NotCache,BeforeCloseFun,ID ");
			strSql.Append(" FROM SystemMenu ");
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
			strSql.Append("select count(1) FROM SystemMenu ");
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
			strSql.Append(")AS Row, T.*  from SystemMenu T ");
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
			parameters[0].Value = "SystemMenu";
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

