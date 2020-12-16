using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// 数据访问类:Publicity
	/// </summary>
	public partial class Publicity
	{
		public Publicity()
		{}
		#region  BasicMethod

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid PublicityUUID)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Publicity");
			strSql.Append(" where PublicityUUID=@PublicityUUID ");
			SqlParameter[] parameters = {
					new SqlParameter("@PublicityUUID", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = PublicityUUID;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.Publicity model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Publicity(");
			strSql.Append("CreateTime,PublicityUUID,Title,PublicityTypeUUID,Introduce,Cover,Picture,Video,IsDeleted,State)");
			strSql.Append(" values (");
			strSql.Append("@CreateTime,@PublicityUUID,@Title,@PublicityTypeUUID,@Introduce,@Cover,@Picture,@Video,@IsDeleted,@State)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@CreateTime", SqlDbType.DateTime2,8),
					new SqlParameter("@PublicityUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Title", SqlDbType.VarChar,255),
					new SqlParameter("@PublicityTypeUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Introduce", SqlDbType.VarChar,-1),
					new SqlParameter("@Cover", SqlDbType.VarChar,255),
					new SqlParameter("@Picture", SqlDbType.VarChar,-1),
					new SqlParameter("@Video", SqlDbType.VarChar,-1),
					new SqlParameter("@IsDeleted", SqlDbType.Int,4),
					new SqlParameter("@State", SqlDbType.Int,4)};
			parameters[0].Value = model.CreateTime;
			parameters[1].Value = Guid.NewGuid();
			parameters[2].Value = model.Title;
			parameters[3].Value = Guid.NewGuid();
			parameters[4].Value = model.Introduce;
			parameters[5].Value = model.Cover;
			parameters[6].Value = model.Picture;
			parameters[7].Value = model.Video;
			parameters[8].Value = model.IsDeleted;
			parameters[9].Value = model.State;

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
		public bool Update(HeqiaoDaoshiCore.Model.Publicity model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Publicity set ");
			strSql.Append("CreateTime=@CreateTime,");
			strSql.Append("Title=@Title,");
			strSql.Append("PublicityTypeUUID=@PublicityTypeUUID,");
			strSql.Append("Introduce=@Introduce,");
			strSql.Append("Cover=@Cover,");
			strSql.Append("Picture=@Picture,");
			strSql.Append("Video=@Video,");
			strSql.Append("IsDeleted=@IsDeleted,");
			strSql.Append("State=@State");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@CreateTime", SqlDbType.DateTime2,8),
					new SqlParameter("@Title", SqlDbType.VarChar,255),
					new SqlParameter("@PublicityTypeUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Introduce", SqlDbType.VarChar,-1),
					new SqlParameter("@Cover", SqlDbType.VarChar,255),
					new SqlParameter("@Picture", SqlDbType.VarChar,-1),
					new SqlParameter("@Video", SqlDbType.VarChar,-1),
					new SqlParameter("@IsDeleted", SqlDbType.Int,4),
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@ID", SqlDbType.Int,4),
					new SqlParameter("@PublicityUUID", SqlDbType.UniqueIdentifier,16)};
			parameters[0].Value = model.CreateTime;
			parameters[1].Value = model.Title;
			parameters[2].Value = model.PublicityTypeUUID;
			parameters[3].Value = model.Introduce;
			parameters[4].Value = model.Cover;
			parameters[5].Value = model.Picture;
			parameters[6].Value = model.Video;
			parameters[7].Value = model.IsDeleted;
			parameters[8].Value = model.State;
			parameters[9].Value = model.ID;
			parameters[10].Value = model.PublicityUUID;

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
			strSql.Append("delete from Publicity ");
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
		public bool Delete(Guid PublicityUUID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Publicity ");
			strSql.Append(" where PublicityUUID=@PublicityUUID ");
			SqlParameter[] parameters = {
					new SqlParameter("@PublicityUUID", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = PublicityUUID;

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
			strSql.Append("delete from Publicity ");
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
		public HeqiaoDaoshiCore.Model.Publicity GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 ID,CreateTime,PublicityUUID,Title,PublicityTypeUUID,Introduce,Cover,Picture,Video,IsDeleted,State from Publicity ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.Publicity model=new HeqiaoDaoshiCore.Model.Publicity();
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
		public HeqiaoDaoshiCore.Model.Publicity DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.Publicity model=new HeqiaoDaoshiCore.Model.Publicity();
			if (row != null)
			{
				if(row["ID"]!=null && row["ID"].ToString()!="")
				{
					model.ID=int.Parse(row["ID"].ToString());
				}
				if(row["CreateTime"]!=null && row["CreateTime"].ToString()!="")
				{
					model.CreateTime=DateTime.Parse(row["CreateTime"].ToString());
				}
				if(row["PublicityUUID"]!=null && row["PublicityUUID"].ToString()!="")
				{
					model.PublicityUUID= new Guid(row["PublicityUUID"].ToString());
				}
				if(row["Title"]!=null)
				{
					model.Title=row["Title"].ToString();
				}
				if(row["PublicityTypeUUID"]!=null && row["PublicityTypeUUID"].ToString()!="")
				{
					model.PublicityTypeUUID= new Guid(row["PublicityTypeUUID"].ToString());
				}
				if(row["Introduce"]!=null)
				{
					model.Introduce=row["Introduce"].ToString();
				}
				if(row["Cover"]!=null)
				{
					model.Cover=row["Cover"].ToString();
				}
				if(row["Picture"]!=null)
				{
					model.Picture=row["Picture"].ToString();
				}
				if(row["Video"]!=null)
				{
					model.Video=row["Video"].ToString();
				}
				if(row["IsDeleted"]!=null && row["IsDeleted"].ToString()!="")
				{
					model.IsDeleted=int.Parse(row["IsDeleted"].ToString());
				}
				if(row["State"]!=null && row["State"].ToString()!="")
				{
					model.State=int.Parse(row["State"].ToString());
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
			strSql.Append("select ID,CreateTime,PublicityUUID,Title,PublicityTypeUUID,Introduce,Cover,Picture,Video,IsDeleted,State ");
			strSql.Append(" FROM Publicity ");
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
			strSql.Append(" ID,CreateTime,PublicityUUID,Title,PublicityTypeUUID,Introduce,Cover,Picture,Video,IsDeleted,State ");
			strSql.Append(" FROM Publicity ");
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
			strSql.Append("select count(1) FROM Publicity ");
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
			strSql.Append(")AS Row, T.*  from Publicity T ");
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
			parameters[0].Value = "Publicity";
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

