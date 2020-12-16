using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// 数据访问类:Leavemessage
	/// </summary>
	public partial class Leavemessage
	{
		public Leavemessage()
		{}
		#region  BasicMethod

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid LeavemessageUUID)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Leavemessage");
			strSql.Append(" where LeavemessageUUID=@LeavemessageUUID ");
			SqlParameter[] parameters = {
					new SqlParameter("@LeavemessageUUID", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = LeavemessageUUID;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.Leavemessage model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Leavemessage(");
			strSql.Append("LeavemessageUUID,UserUUID,Content,Createtime,Isdelete)");
			strSql.Append(" values (");
			strSql.Append("@LeavemessageUUID,@UserUUID,@Content,@Createtime,@Isdelete)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@LeavemessageUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@UserUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Content", SqlDbType.NVarChar,255),
					new SqlParameter("@Createtime", SqlDbType.NVarChar,255),
					new SqlParameter("@Isdelete", SqlDbType.VarChar,255)};
			parameters[0].Value = Guid.NewGuid();
			parameters[1].Value = Guid.NewGuid();
			parameters[2].Value = model.Content;
			parameters[3].Value = model.Createtime;
			parameters[4].Value = model.Isdelete;

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
		public bool Update(HeqiaoDaoshiCore.Model.Leavemessage model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Leavemessage set ");
			strSql.Append("UserUUID=@UserUUID,");
			strSql.Append("Content=@Content,");
			strSql.Append("Createtime=@Createtime,");
			strSql.Append("Isdelete=@Isdelete");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@UserUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Content", SqlDbType.NVarChar,255),
					new SqlParameter("@Createtime", SqlDbType.NVarChar,255),
					new SqlParameter("@Isdelete", SqlDbType.VarChar,255),
					new SqlParameter("@LeavemessageUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)};
			parameters[0].Value = model.UserUUID;
			parameters[1].Value = model.Content;
			parameters[2].Value = model.Createtime;
			parameters[3].Value = model.Isdelete;
			parameters[4].Value = model.LeavemessageUUID;
			parameters[5].Value = model.ID;

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
			strSql.Append("delete from Leavemessage ");
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
		public bool Delete(Guid LeavemessageUUID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Leavemessage ");
			strSql.Append(" where LeavemessageUUID=@LeavemessageUUID ");
			SqlParameter[] parameters = {
					new SqlParameter("@LeavemessageUUID", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = LeavemessageUUID;

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
			strSql.Append("delete from Leavemessage ");
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
		public HeqiaoDaoshiCore.Model.Leavemessage GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 LeavemessageUUID,ID,UserUUID,Content,Createtime,Isdelete from Leavemessage ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.Leavemessage model=new HeqiaoDaoshiCore.Model.Leavemessage();
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
		public HeqiaoDaoshiCore.Model.Leavemessage DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.Leavemessage model=new HeqiaoDaoshiCore.Model.Leavemessage();
			if (row != null)
			{
				if(row["LeavemessageUUID"]!=null && row["LeavemessageUUID"].ToString()!="")
				{
					model.LeavemessageUUID= new Guid(row["LeavemessageUUID"].ToString());
				}
				if(row["ID"]!=null && row["ID"].ToString()!="")
				{
					model.ID=int.Parse(row["ID"].ToString());
				}
				if(row["UserUUID"]!=null && row["UserUUID"].ToString()!="")
				{
					model.UserUUID= new Guid(row["UserUUID"].ToString());
				}
				if(row["Content"]!=null)
				{
					model.Content=row["Content"].ToString();
				}
				if(row["Createtime"]!=null)
				{
					model.Createtime=row["Createtime"].ToString();
				}
				if(row["Isdelete"]!=null)
				{
					model.Isdelete=row["Isdelete"].ToString();
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
			strSql.Append("select LeavemessageUUID,ID,UserUUID,Content,Createtime,Isdelete ");
			strSql.Append(" FROM Leavemessage ");
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
			strSql.Append(" LeavemessageUUID,ID,UserUUID,Content,Createtime,Isdelete ");
			strSql.Append(" FROM Leavemessage ");
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
			strSql.Append("select count(1) FROM Leavemessage ");
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
			strSql.Append(")AS Row, T.*  from Leavemessage T ");
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
			parameters[0].Value = "Leavemessage";
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

