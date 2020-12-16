using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// 数据访问类:Information
	/// </summary>
	public partial class Information
	{
		public Information()
		{}
		#region  BasicMethod

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid InformationUUID)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Information");
			strSql.Append(" where InformationUUID=@InformationUUID ");
			SqlParameter[] parameters = {
					new SqlParameter("@InformationUUID", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = InformationUUID;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.Information model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Information(");
			strSql.Append("CreateTime,InformationUUID,Title,InformationTypeUUID,Introduce,Address,StartTime,Picture,State,IsDeleted,Photo)");
			strSql.Append(" values (");
			strSql.Append("@CreateTime,@InformationUUID,@Title,@InformationTypeUUID,@Introduce,@Address,@StartTime,@Picture,@State,@IsDeleted,@Photo)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@CreateTime", SqlDbType.DateTime2,8),
					new SqlParameter("@InformationUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Title", SqlDbType.VarChar,255),
					new SqlParameter("@InformationTypeUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Introduce", SqlDbType.VarChar,-1),
					new SqlParameter("@Address", SqlDbType.VarChar,255),
					new SqlParameter("@StartTime", SqlDbType.DateTime),
					new SqlParameter("@Picture", SqlDbType.VarChar,-1),
					new SqlParameter("@State", SqlDbType.Bit,1),
					new SqlParameter("@IsDeleted", SqlDbType.Int,4),
					new SqlParameter("@Photo", SqlDbType.VarChar,-1)};
			parameters[0].Value = model.CreateTime;
			parameters[1].Value = Guid.NewGuid();
			parameters[2].Value = model.Title;
			parameters[3].Value = Guid.NewGuid();
			parameters[4].Value = model.Introduce;
			parameters[5].Value = model.Address;
			parameters[6].Value = model.StartTime;
			parameters[7].Value = model.Picture;
			parameters[8].Value = model.State;
			parameters[9].Value = model.IsDeleted;
			parameters[10].Value = model.Photo;

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
		public bool Update(HeqiaoDaoshiCore.Model.Information model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Information set ");
			strSql.Append("CreateTime=@CreateTime,");
			strSql.Append("Title=@Title,");
			strSql.Append("InformationTypeUUID=@InformationTypeUUID,");
			strSql.Append("Introduce=@Introduce,");
			strSql.Append("Address=@Address,");
			strSql.Append("StartTime=@StartTime,");
			strSql.Append("Picture=@Picture,");
			strSql.Append("State=@State,");
			strSql.Append("IsDeleted=@IsDeleted,");
			strSql.Append("Photo=@Photo");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@CreateTime", SqlDbType.DateTime2,8),
					new SqlParameter("@Title", SqlDbType.VarChar,255),
					new SqlParameter("@InformationTypeUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Introduce", SqlDbType.VarChar,-1),
					new SqlParameter("@Address", SqlDbType.VarChar,255),
					new SqlParameter("@StartTime", SqlDbType.DateTime),
					new SqlParameter("@Picture", SqlDbType.VarChar,-1),
					new SqlParameter("@State", SqlDbType.Bit,1),
					new SqlParameter("@IsDeleted", SqlDbType.Int,4),
					new SqlParameter("@Photo", SqlDbType.VarChar,-1),
					new SqlParameter("@ID", SqlDbType.Int,4),
					new SqlParameter("@InformationUUID", SqlDbType.UniqueIdentifier,16)};
			parameters[0].Value = model.CreateTime;
			parameters[1].Value = model.Title;
			parameters[2].Value = model.InformationTypeUUID;
			parameters[3].Value = model.Introduce;
			parameters[4].Value = model.Address;
			parameters[5].Value = model.StartTime;
			parameters[6].Value = model.Picture;
			parameters[7].Value = model.State;
			parameters[8].Value = model.IsDeleted;
			parameters[9].Value = model.Photo;
			parameters[10].Value = model.ID;
			parameters[11].Value = model.InformationUUID;

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
			strSql.Append("delete from Information ");
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
		public bool Delete(Guid InformationUUID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Information ");
			strSql.Append(" where InformationUUID=@InformationUUID ");
			SqlParameter[] parameters = {
					new SqlParameter("@InformationUUID", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = InformationUUID;

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
			strSql.Append("delete from Information ");
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
		public HeqiaoDaoshiCore.Model.Information GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 ID,CreateTime,InformationUUID,Title,InformationTypeUUID,Introduce,Address,StartTime,Picture,State,IsDeleted,Photo from Information ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.Information model=new HeqiaoDaoshiCore.Model.Information();
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
		public HeqiaoDaoshiCore.Model.Information DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.Information model=new HeqiaoDaoshiCore.Model.Information();
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
				if(row["InformationUUID"]!=null && row["InformationUUID"].ToString()!="")
				{
					model.InformationUUID= new Guid(row["InformationUUID"].ToString());
				}
				if(row["Title"]!=null)
				{
					model.Title=row["Title"].ToString();
				}
				if(row["InformationTypeUUID"]!=null && row["InformationTypeUUID"].ToString()!="")
				{
					model.InformationTypeUUID= new Guid(row["InformationTypeUUID"].ToString());
				}
				if(row["Introduce"]!=null)
				{
					model.Introduce=row["Introduce"].ToString();
				}
				if(row["Address"]!=null)
				{
					model.Address=row["Address"].ToString();
				}
				if(row["StartTime"]!=null && row["StartTime"].ToString()!="")
				{
					model.StartTime=DateTime.Parse(row["StartTime"].ToString());
				}
				if(row["Picture"]!=null)
				{
					model.Picture=row["Picture"].ToString();
				}
				if(row["State"]!=null && row["State"].ToString()!="")
				{
					if((row["State"].ToString()=="1")||(row["State"].ToString().ToLower()=="true"))
					{
						model.State=true;
					}
					else
					{
						model.State=false;
					}
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
			strSql.Append("select ID,CreateTime,InformationUUID,Title,InformationTypeUUID,Introduce,Address,StartTime,Picture,State,IsDeleted,Photo ");
			strSql.Append(" FROM Information ");
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
			strSql.Append(" ID,CreateTime,InformationUUID,Title,InformationTypeUUID,Introduce,Address,StartTime,Picture,State,IsDeleted,Photo ");
			strSql.Append(" FROM Information ");
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
			strSql.Append("select count(1) FROM Information ");
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
			strSql.Append(")AS Row, T.*  from Information T ");
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
			parameters[0].Value = "Information";
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

