using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// 数据访问类:Bus
	/// </summary>
	public partial class Bus
	{
		public Bus()
		{}
		#region  BasicMethod

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid BusUuid)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Bus");
			strSql.Append(" where BusUuid=@BusUuid ");
			SqlParameter[] parameters = {
					new SqlParameter("@BusUuid", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = BusUuid;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.Bus model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Bus(");
			strSql.Append("CreateTime,BusUuid,Name,PassSite,Introduction,Address,Picture,State,IsDelete,BegainTime,EndTime,BegainSite,EndSite,type)");
			strSql.Append(" values (");
			strSql.Append("@CreateTime,@BusUuid,@Name,@PassSite,@Introduction,@Address,@Picture,@State,@IsDelete,@BegainTime,@EndTime,@BegainSite,@EndSite,@type)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@CreateTime", SqlDbType.DateTime),
					new SqlParameter("@BusUuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Name", SqlDbType.NVarChar,-1),
					new SqlParameter("@PassSite", SqlDbType.NVarChar,-1),
					new SqlParameter("@Introduction", SqlDbType.NVarChar,-1),
					new SqlParameter("@Address", SqlDbType.NVarChar,-1),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1),
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@IsDelete", SqlDbType.Int,4),
					new SqlParameter("@BegainTime", SqlDbType.NVarChar,-1),
					new SqlParameter("@EndTime", SqlDbType.NVarChar,-1),
					new SqlParameter("@BegainSite", SqlDbType.NVarChar,-1),
					new SqlParameter("@EndSite", SqlDbType.NVarChar,-1),
					new SqlParameter("@type", SqlDbType.VarChar,255)};
			parameters[0].Value = model.CreateTime;
			parameters[1].Value = Guid.NewGuid();
			parameters[2].Value = model.Name;
			parameters[3].Value = model.PassSite;
			parameters[4].Value = model.Introduction;
			parameters[5].Value = model.Address;
			parameters[6].Value = model.Picture;
			parameters[7].Value = model.State;
			parameters[8].Value = model.IsDelete;
			parameters[9].Value = model.BegainTime;
			parameters[10].Value = model.EndTime;
			parameters[11].Value = model.BegainSite;
			parameters[12].Value = model.EndSite;
			parameters[13].Value = model.type;

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
		public bool Update(HeqiaoDaoshiCore.Model.Bus model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Bus set ");
			strSql.Append("CreateTime=@CreateTime,");
			strSql.Append("Name=@Name,");
			strSql.Append("PassSite=@PassSite,");
			strSql.Append("Introduction=@Introduction,");
			strSql.Append("Address=@Address,");
			strSql.Append("Picture=@Picture,");
			strSql.Append("State=@State,");
			strSql.Append("IsDelete=@IsDelete,");
			strSql.Append("BegainTime=@BegainTime,");
			strSql.Append("EndTime=@EndTime,");
			strSql.Append("BegainSite=@BegainSite,");
			strSql.Append("EndSite=@EndSite,");
			strSql.Append("type=@type");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@CreateTime", SqlDbType.DateTime),
					new SqlParameter("@Name", SqlDbType.NVarChar,-1),
					new SqlParameter("@PassSite", SqlDbType.NVarChar,-1),
					new SqlParameter("@Introduction", SqlDbType.NVarChar,-1),
					new SqlParameter("@Address", SqlDbType.NVarChar,-1),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1),
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@IsDelete", SqlDbType.Int,4),
					new SqlParameter("@BegainTime", SqlDbType.NVarChar,-1),
					new SqlParameter("@EndTime", SqlDbType.NVarChar,-1),
					new SqlParameter("@BegainSite", SqlDbType.NVarChar,-1),
					new SqlParameter("@EndSite", SqlDbType.NVarChar,-1),
					new SqlParameter("@type", SqlDbType.VarChar,255),
					new SqlParameter("@ID", SqlDbType.Int,4),
					new SqlParameter("@BusUuid", SqlDbType.UniqueIdentifier,16)};
			parameters[0].Value = model.CreateTime;
			parameters[1].Value = model.Name;
			parameters[2].Value = model.PassSite;
			parameters[3].Value = model.Introduction;
			parameters[4].Value = model.Address;
			parameters[5].Value = model.Picture;
			parameters[6].Value = model.State;
			parameters[7].Value = model.IsDelete;
			parameters[8].Value = model.BegainTime;
			parameters[9].Value = model.EndTime;
			parameters[10].Value = model.BegainSite;
			parameters[11].Value = model.EndSite;
			parameters[12].Value = model.type;
			parameters[13].Value = model.ID;
			parameters[14].Value = model.BusUuid;

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
			strSql.Append("delete from Bus ");
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
		public bool Delete(Guid BusUuid)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Bus ");
			strSql.Append(" where BusUuid=@BusUuid ");
			SqlParameter[] parameters = {
					new SqlParameter("@BusUuid", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = BusUuid;

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
			strSql.Append("delete from Bus ");
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
		public HeqiaoDaoshiCore.Model.Bus GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 ID,CreateTime,BusUuid,Name,PassSite,Introduction,Address,Picture,State,IsDelete,BegainTime,EndTime,BegainSite,EndSite,type from Bus ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.Bus model=new HeqiaoDaoshiCore.Model.Bus();
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
		public HeqiaoDaoshiCore.Model.Bus DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.Bus model=new HeqiaoDaoshiCore.Model.Bus();
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
				if(row["BusUuid"]!=null && row["BusUuid"].ToString()!="")
				{
					model.BusUuid= new Guid(row["BusUuid"].ToString());
				}
				if(row["Name"]!=null)
				{
					model.Name=row["Name"].ToString();
				}
				if(row["PassSite"]!=null)
				{
					model.PassSite=row["PassSite"].ToString();
				}
				if(row["Introduction"]!=null)
				{
					model.Introduction=row["Introduction"].ToString();
				}
				if(row["Address"]!=null)
				{
					model.Address=row["Address"].ToString();
				}
				if(row["Picture"]!=null)
				{
					model.Picture=row["Picture"].ToString();
				}
				if(row["State"]!=null && row["State"].ToString()!="")
				{
					model.State=int.Parse(row["State"].ToString());
				}
				if(row["IsDelete"]!=null && row["IsDelete"].ToString()!="")
				{
					model.IsDelete=int.Parse(row["IsDelete"].ToString());
				}
				if(row["BegainTime"]!=null)
				{
					model.BegainTime=row["BegainTime"].ToString();
				}
				if(row["EndTime"]!=null)
				{
					model.EndTime=row["EndTime"].ToString();
				}
				if(row["BegainSite"]!=null)
				{
					model.BegainSite=row["BegainSite"].ToString();
				}
				if(row["EndSite"]!=null)
				{
					model.EndSite=row["EndSite"].ToString();
				}
				if(row["type"]!=null)
				{
					model.type=row["type"].ToString();
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
			strSql.Append("select ID,CreateTime,BusUuid,Name,PassSite,Introduction,Address,Picture,State,IsDelete,BegainTime,EndTime,BegainSite,EndSite,type ");
			strSql.Append(" FROM Bus ");
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
			strSql.Append(" ID,CreateTime,BusUuid,Name,PassSite,Introduction,Address,Picture,State,IsDelete,BegainTime,EndTime,BegainSite,EndSite,type ");
			strSql.Append(" FROM Bus ");
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
			strSql.Append("select count(1) FROM Bus ");
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
			strSql.Append(")AS Row, T.*  from Bus T ");
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
			parameters[0].Value = "Bus";
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

