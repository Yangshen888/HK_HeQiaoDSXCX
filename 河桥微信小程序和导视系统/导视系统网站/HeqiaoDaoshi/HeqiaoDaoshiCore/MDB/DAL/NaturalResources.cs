using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// 数据访问类:NaturalResources
	/// </summary>
	public partial class NaturalResources
	{
		public NaturalResources()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSql.GetMaxId("ID", "NaturalResources"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid NaturalResourcesUUID,int ID)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from NaturalResources");
			strSql.Append(" where NaturalResourcesUUID=@NaturalResourcesUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@NaturalResourcesUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = NaturalResourcesUUID;
			parameters[1].Value = ID;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.NaturalResources model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into NaturalResources(");
			strSql.Append("NaturalResourcesUUID,Title,IsRelease,ReleaseTime,Cover,Content,AddTime,AddPeople,IsDeleted,Photo)");
			strSql.Append(" values (");
			strSql.Append("@NaturalResourcesUUID,@Title,@IsRelease,@ReleaseTime,@Cover,@Content,@AddTime,@AddPeople,@IsDeleted,@Photo)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@NaturalResourcesUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Title", SqlDbType.NVarChar,255),
					new SqlParameter("@IsRelease", SqlDbType.Bit,1),
					new SqlParameter("@ReleaseTime", SqlDbType.DateTime),
					new SqlParameter("@Cover", SqlDbType.NVarChar,-1),
					new SqlParameter("@Content", SqlDbType.NVarChar,-1),
					new SqlParameter("@AddTime", SqlDbType.DateTime),
					new SqlParameter("@AddPeople", SqlDbType.VarChar,100),
					new SqlParameter("@IsDeleted", SqlDbType.Int,4),
					new SqlParameter("@Photo", SqlDbType.NVarChar,-1)};
			parameters[0].Value = Guid.NewGuid();
			parameters[1].Value = model.Title;
			parameters[2].Value = model.IsRelease;
			parameters[3].Value = model.ReleaseTime;
			parameters[4].Value = model.Cover;
			parameters[5].Value = model.Content;
			parameters[6].Value = model.AddTime;
			parameters[7].Value = model.AddPeople;
			parameters[8].Value = model.IsDeleted;
			parameters[9].Value = model.Photo;

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
		public bool Update(HeqiaoDaoshiCore.Model.NaturalResources model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update NaturalResources set ");
			strSql.Append("Title=@Title,");
			strSql.Append("IsRelease=@IsRelease,");
			strSql.Append("ReleaseTime=@ReleaseTime,");
			strSql.Append("Cover=@Cover,");
			strSql.Append("Content=@Content,");
			strSql.Append("AddTime=@AddTime,");
			strSql.Append("AddPeople=@AddPeople,");
			strSql.Append("IsDeleted=@IsDeleted,");
			strSql.Append("Photo=@Photo");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@Title", SqlDbType.NVarChar,255),
					new SqlParameter("@IsRelease", SqlDbType.Bit,1),
					new SqlParameter("@ReleaseTime", SqlDbType.DateTime),
					new SqlParameter("@Cover", SqlDbType.NVarChar,-1),
					new SqlParameter("@Content", SqlDbType.NVarChar,-1),
					new SqlParameter("@AddTime", SqlDbType.DateTime),
					new SqlParameter("@AddPeople", SqlDbType.VarChar,100),
					new SqlParameter("@IsDeleted", SqlDbType.Int,4),
					new SqlParameter("@Photo", SqlDbType.NVarChar,-1),
					new SqlParameter("@NaturalResourcesUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)};
			parameters[0].Value = model.Title;
			parameters[1].Value = model.IsRelease;
			parameters[2].Value = model.ReleaseTime;
			parameters[3].Value = model.Cover;
			parameters[4].Value = model.Content;
			parameters[5].Value = model.AddTime;
			parameters[6].Value = model.AddPeople;
			parameters[7].Value = model.IsDeleted;
			parameters[8].Value = model.Photo;
			parameters[9].Value = model.NaturalResourcesUUID;
			parameters[10].Value = model.ID;

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
			strSql.Append("delete from NaturalResources ");
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
		public bool Delete(Guid NaturalResourcesUUID,int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from NaturalResources ");
			strSql.Append(" where NaturalResourcesUUID=@NaturalResourcesUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@NaturalResourcesUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = NaturalResourcesUUID;
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
			strSql.Append("delete from NaturalResources ");
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
		public HeqiaoDaoshiCore.Model.NaturalResources GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 NaturalResourcesUUID,Title,IsRelease,ReleaseTime,Cover,Content,AddTime,AddPeople,ID,IsDeleted,Photo from NaturalResources ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.NaturalResources model=new HeqiaoDaoshiCore.Model.NaturalResources();
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
		public HeqiaoDaoshiCore.Model.NaturalResources DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.NaturalResources model=new HeqiaoDaoshiCore.Model.NaturalResources();
			if (row != null)
			{
				if(row["NaturalResourcesUUID"]!=null && row["NaturalResourcesUUID"].ToString()!="")
				{
					model.NaturalResourcesUUID= new Guid(row["NaturalResourcesUUID"].ToString());
				}
				if(row["Title"]!=null)
				{
					model.Title=row["Title"].ToString();
				}
				if(row["IsRelease"]!=null && row["IsRelease"].ToString()!="")
				{
					if((row["IsRelease"].ToString()=="1")||(row["IsRelease"].ToString().ToLower()=="true"))
					{
						model.IsRelease=true;
					}
					else
					{
						model.IsRelease=false;
					}
				}
				if(row["ReleaseTime"]!=null && row["ReleaseTime"].ToString()!="")
				{
					model.ReleaseTime=DateTime.Parse(row["ReleaseTime"].ToString());
				}
				if(row["Cover"]!=null)
				{
					model.Cover=row["Cover"].ToString();
				}
				if(row["Content"]!=null)
				{
					model.Content=row["Content"].ToString();
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
				if(row["IsDeleted"]!=null && row["IsDeleted"].ToString()!="")
				{
					model.IsDeleted=int.Parse(row["IsDeleted"].ToString());
				}
				if(row["Photo"]!=null)
				{
					model.Photo=row["Photo"].ToString();
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
			strSql.Append("select NaturalResourcesUUID,Title,IsRelease,ReleaseTime,Cover,Content,AddTime,AddPeople,ID,IsDeleted,Photo ");
			strSql.Append(" FROM NaturalResources ");
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
			strSql.Append(" NaturalResourcesUUID,Title,IsRelease,ReleaseTime,Cover,Content,AddTime,AddPeople,ID,IsDeleted,Photo ");
			strSql.Append(" FROM NaturalResources ");
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
			strSql.Append("select count(1) FROM NaturalResources ");
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
			strSql.Append(")AS Row, T.*  from NaturalResources T ");
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
			parameters[0].Value = "NaturalResources";
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

