using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace Haikan.LabSystemCore.DAL
{
	/// <summary>
	/// 数据访问类:EntranceGuard
	/// </summary>
	public partial class EntranceGuard
	{
		public EntranceGuard()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSql.GetMaxId("id", "EntranceGuard"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int id)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from EntranceGuard");
			strSql.Append(" where id=@id");
			SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)
			};
			parameters[0].Value = id;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(Haikan.LabSystemCore.Model.EntranceGuard model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into EntranceGuard(");
			strSql.Append("GNameListID,Entcardnumber,ip,USB,stime,etime,GNameListName,StudenListID,StudentListName,EntcardType,Port)");
			strSql.Append(" values (");
			strSql.Append("@GNameListID,@Entcardnumber,@ip,@USB,@stime,@etime,@GNameListName,@StudenListID,@StudentListName,@EntcardType,@Port)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@GNameListID", SqlDbType.NVarChar,-1),
					new SqlParameter("@Entcardnumber", SqlDbType.NVarChar,-1),
					new SqlParameter("@ip", SqlDbType.NVarChar,50),
					new SqlParameter("@USB", SqlDbType.Int,4),
					new SqlParameter("@stime", SqlDbType.DateTime),
					new SqlParameter("@etime", SqlDbType.DateTime),
					new SqlParameter("@GNameListName", SqlDbType.NVarChar,-1),
					new SqlParameter("@StudenListID", SqlDbType.NVarChar,-1),
					new SqlParameter("@StudentListName", SqlDbType.NVarChar,-1),
					new SqlParameter("@EntcardType", SqlDbType.VarChar,255),
					new SqlParameter("@Port", SqlDbType.VarChar,255)};
			parameters[0].Value = model.GNameListID;
			parameters[1].Value = model.Entcardnumber;
			parameters[2].Value = model.ip;
			parameters[3].Value = model.USB;
			parameters[4].Value = model.stime;
			parameters[5].Value = model.etime;
			parameters[6].Value = model.GNameListName;
			parameters[7].Value = model.StudenListID;
			parameters[8].Value = model.StudentListName;
			parameters[9].Value = model.EntcardType;
			parameters[10].Value = model.Port;

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
		public bool Update(Haikan.LabSystemCore.Model.EntranceGuard model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update EntranceGuard set ");
			strSql.Append("GNameListID=@GNameListID,");
			strSql.Append("Entcardnumber=@Entcardnumber,");
			strSql.Append("ip=@ip,");
			strSql.Append("USB=@USB,");
			strSql.Append("stime=@stime,");
			strSql.Append("etime=@etime,");
			strSql.Append("GNameListName=@GNameListName,");
			strSql.Append("StudenListID=@StudenListID,");
			strSql.Append("StudentListName=@StudentListName,");
			strSql.Append("EntcardType=@EntcardType,");
			strSql.Append("Port=@Port");
			strSql.Append(" where id=@id");
			SqlParameter[] parameters = {
					new SqlParameter("@GNameListID", SqlDbType.NVarChar,-1),
					new SqlParameter("@Entcardnumber", SqlDbType.NVarChar,-1),
					new SqlParameter("@ip", SqlDbType.NVarChar,50),
					new SqlParameter("@USB", SqlDbType.Int,4),
					new SqlParameter("@stime", SqlDbType.DateTime),
					new SqlParameter("@etime", SqlDbType.DateTime),
					new SqlParameter("@GNameListName", SqlDbType.NVarChar,-1),
					new SqlParameter("@StudenListID", SqlDbType.NVarChar,-1),
					new SqlParameter("@StudentListName", SqlDbType.NVarChar,-1),
					new SqlParameter("@EntcardType", SqlDbType.VarChar,255),
					new SqlParameter("@Port", SqlDbType.VarChar,255),
					new SqlParameter("@id", SqlDbType.Int,4)};
			parameters[0].Value = model.GNameListID;
			parameters[1].Value = model.Entcardnumber;
			parameters[2].Value = model.ip;
			parameters[3].Value = model.USB;
			parameters[4].Value = model.stime;
			parameters[5].Value = model.etime;
			parameters[6].Value = model.GNameListName;
			parameters[7].Value = model.StudenListID;
			parameters[8].Value = model.StudentListName;
			parameters[9].Value = model.EntcardType;
			parameters[10].Value = model.Port;
			parameters[11].Value = model.id;

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
		public bool Delete(int id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from EntranceGuard ");
			strSql.Append(" where id=@id");
			SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)
			};
			parameters[0].Value = id;

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
		public bool DeleteList(string idlist )
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from EntranceGuard ");
			strSql.Append(" where id in ("+idlist + ")  ");
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
		public Haikan.LabSystemCore.Model.EntranceGuard GetModel(int id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 id,GNameListID,Entcardnumber,ip,USB,stime,etime,GNameListName,StudenListID,StudentListName,EntcardType,Port from EntranceGuard ");
			strSql.Append(" where id=@id");
			SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)
			};
			parameters[0].Value = id;

			Haikan.LabSystemCore.Model.EntranceGuard model=new Haikan.LabSystemCore.Model.EntranceGuard();
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
		public Haikan.LabSystemCore.Model.EntranceGuard DataRowToModel(DataRow row)
		{
			Haikan.LabSystemCore.Model.EntranceGuard model=new Haikan.LabSystemCore.Model.EntranceGuard();
			if (row != null)
			{
				if(row["id"]!=null && row["id"].ToString()!="")
				{
					model.id=int.Parse(row["id"].ToString());
				}
				if(row["GNameListID"]!=null)
				{
					model.GNameListID=row["GNameListID"].ToString();
				}
				if(row["Entcardnumber"]!=null)
				{
					model.Entcardnumber=row["Entcardnumber"].ToString();
				}
				if(row["ip"]!=null)
				{
					model.ip=row["ip"].ToString();
				}
				if(row["USB"]!=null && row["USB"].ToString()!="")
				{
					model.USB=int.Parse(row["USB"].ToString());
				}
				if(row["stime"]!=null && row["stime"].ToString()!="")
				{
					model.stime=DateTime.Parse(row["stime"].ToString());
				}
				if(row["etime"]!=null && row["etime"].ToString()!="")
				{
					model.etime=DateTime.Parse(row["etime"].ToString());
				}
				if(row["GNameListName"]!=null)
				{
					model.GNameListName=row["GNameListName"].ToString();
				}
				if(row["StudenListID"]!=null)
				{
					model.StudenListID=row["StudenListID"].ToString();
				}
				if(row["StudentListName"]!=null)
				{
					model.StudentListName=row["StudentListName"].ToString();
				}
				if(row["EntcardType"]!=null)
				{
					model.EntcardType=row["EntcardType"].ToString();
				}
				if(row["Port"]!=null)
				{
					model.Port=row["Port"].ToString();
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
			strSql.Append("select id,GNameListID,Entcardnumber,ip,USB,stime,etime,GNameListName,StudenListID,StudentListName,EntcardType,Port ");
			strSql.Append(" FROM EntranceGuard ");
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
			strSql.Append(" id,GNameListID,Entcardnumber,ip,USB,stime,etime,GNameListName,StudenListID,StudentListName,EntcardType,Port ");
			strSql.Append(" FROM EntranceGuard ");
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
			strSql.Append("select count(1) FROM EntranceGuard ");
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
				strSql.Append("order by T.id desc");
			}
			strSql.Append(")AS Row, T.*  from EntranceGuard T ");
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
			parameters[0].Value = "EntranceGuard";
			parameters[1].Value = "id";
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

