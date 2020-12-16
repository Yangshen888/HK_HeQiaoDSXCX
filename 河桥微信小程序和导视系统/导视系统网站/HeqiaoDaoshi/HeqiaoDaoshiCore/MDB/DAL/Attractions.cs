using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// 数据访问类:Attractions
	/// </summary>
	public partial class Attractions
	{
		public Attractions()
		{}
		#region  BasicMethod

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid AttractionsUuid)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Attractions");
			strSql.Append(" where AttractionsUuid=@AttractionsUuid ");
			SqlParameter[] parameters = {
					new SqlParameter("@AttractionsUuid", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = AttractionsUuid;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.Attractions model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Attractions(");
			strSql.Append("AttractionsUuid,UserUuid,SceientUuid,Picture,State,Evaluate,AddTime,Praise)");
			strSql.Append(" values (");
			strSql.Append("@AttractionsUuid,@UserUuid,@SceientUuid,@Picture,@State,@Evaluate,@AddTime,@Praise)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@AttractionsUuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@UserUuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@SceientUuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1),
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@Evaluate", SqlDbType.NVarChar,-1),
					new SqlParameter("@AddTime", SqlDbType.NVarChar,255),
					new SqlParameter("@Praise", SqlDbType.Int,4)};
			parameters[0].Value = Guid.NewGuid();
			parameters[1].Value = Guid.NewGuid();
			parameters[2].Value = Guid.NewGuid();
			parameters[3].Value = model.Picture;
			parameters[4].Value = model.State;
			parameters[5].Value = model.Evaluate;
			parameters[6].Value = model.AddTime;
			parameters[7].Value = model.Praise;

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
		public bool Update(HeqiaoDaoshiCore.Model.Attractions model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Attractions set ");
			strSql.Append("UserUuid=@UserUuid,");
			strSql.Append("SceientUuid=@SceientUuid,");
			strSql.Append("Picture=@Picture,");
			strSql.Append("State=@State,");
			strSql.Append("Evaluate=@Evaluate,");
			strSql.Append("AddTime=@AddTime,");
			strSql.Append("Praise=@Praise");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@UserUuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@SceientUuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1),
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@Evaluate", SqlDbType.NVarChar,-1),
					new SqlParameter("@AddTime", SqlDbType.NVarChar,255),
					new SqlParameter("@Praise", SqlDbType.Int,4),
					new SqlParameter("@ID", SqlDbType.Int,4),
					new SqlParameter("@AttractionsUuid", SqlDbType.UniqueIdentifier,16)};
			parameters[0].Value = model.UserUuid;
			parameters[1].Value = model.SceientUuid;
			parameters[2].Value = model.Picture;
			parameters[3].Value = model.State;
			parameters[4].Value = model.Evaluate;
			parameters[5].Value = model.AddTime;
			parameters[6].Value = model.Praise;
			parameters[7].Value = model.ID;
			parameters[8].Value = model.AttractionsUuid;

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
			strSql.Append("delete from Attractions ");
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
		public bool Delete(Guid AttractionsUuid)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Attractions ");
			strSql.Append(" where AttractionsUuid=@AttractionsUuid ");
			SqlParameter[] parameters = {
					new SqlParameter("@AttractionsUuid", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = AttractionsUuid;

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
			strSql.Append("delete from Attractions ");
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
		public HeqiaoDaoshiCore.Model.Attractions GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 ID,AttractionsUuid,UserUuid,SceientUuid,Picture,State,Evaluate,AddTime,Praise from Attractions ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.Attractions model=new HeqiaoDaoshiCore.Model.Attractions();
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
		public HeqiaoDaoshiCore.Model.Attractions DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.Attractions model=new HeqiaoDaoshiCore.Model.Attractions();
			if (row != null)
			{
				if(row["ID"]!=null && row["ID"].ToString()!="")
				{
					model.ID=int.Parse(row["ID"].ToString());
				}
				if(row["AttractionsUuid"]!=null && row["AttractionsUuid"].ToString()!="")
				{
					model.AttractionsUuid= new Guid(row["AttractionsUuid"].ToString());
				}
				if(row["UserUuid"]!=null && row["UserUuid"].ToString()!="")
				{
					model.UserUuid= new Guid(row["UserUuid"].ToString());
				}
				if(row["SceientUuid"]!=null && row["SceientUuid"].ToString()!="")
				{
					model.SceientUuid= new Guid(row["SceientUuid"].ToString());
				}
				if(row["Picture"]!=null)
				{
					model.Picture=row["Picture"].ToString();
				}
				if(row["State"]!=null && row["State"].ToString()!="")
				{
					model.State=int.Parse(row["State"].ToString());
				}
				if(row["Evaluate"]!=null)
				{
					model.Evaluate=row["Evaluate"].ToString();
				}
				if(row["AddTime"]!=null)
				{
					model.AddTime=row["AddTime"].ToString();
				}
				if(row["Praise"]!=null && row["Praise"].ToString()!="")
				{
					model.Praise=int.Parse(row["Praise"].ToString());
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
			strSql.Append("select ID,AttractionsUuid,UserUuid,SceientUuid,Picture,State,Evaluate,AddTime,Praise ");
			strSql.Append(" FROM Attractions ");
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
			strSql.Append(" ID,AttractionsUuid,UserUuid,SceientUuid,Picture,State,Evaluate,AddTime,Praise ");
			strSql.Append(" FROM Attractions ");
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
			strSql.Append("select count(1) FROM Attractions ");
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
			strSql.Append(")AS Row, T.*  from Attractions T ");
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
			parameters[0].Value = "Attractions";
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

