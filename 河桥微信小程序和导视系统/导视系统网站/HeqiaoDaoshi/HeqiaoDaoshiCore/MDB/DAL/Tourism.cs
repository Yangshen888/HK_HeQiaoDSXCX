using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// 数据访问类:Tourism
	/// </summary>
	public partial class Tourism
	{
		public Tourism()
		{}
		#region  BasicMethod

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid TourismUuid)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Tourism");
			strSql.Append(" where TourismUuid=@TourismUuid ");
			SqlParameter[] parameters = {
					new SqlParameter("@TourismUuid", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = TourismUuid;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.Tourism model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Tourism(");
			strSql.Append("TourismUuid,CreateTime,Name,SpotContent,Address,Picture,Video,Audio,IsDelete,OrderBy,State,AddTime,AddPeople)");
			strSql.Append(" values (");
			strSql.Append("@TourismUuid,@CreateTime,@Name,@SpotContent,@Address,@Picture,@Video,@Audio,@IsDelete,@OrderBy,@State,@AddTime,@AddPeople)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@TourismUuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@CreateTime", SqlDbType.DateTime),
					new SqlParameter("@Name", SqlDbType.NVarChar,50),
					new SqlParameter("@SpotContent", SqlDbType.NVarChar,-1),
					new SqlParameter("@Address", SqlDbType.NVarChar,-1),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1),
					new SqlParameter("@Video", SqlDbType.NVarChar,-1),
					new SqlParameter("@Audio", SqlDbType.NVarChar,-1),
					new SqlParameter("@IsDelete", SqlDbType.Int,4),
					new SqlParameter("@OrderBy", SqlDbType.Int,4),
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@AddTime", SqlDbType.NVarChar,50),
					new SqlParameter("@AddPeople", SqlDbType.NVarChar,255)};
			parameters[0].Value = Guid.NewGuid();
			parameters[1].Value = model.CreateTime;
			parameters[2].Value = model.Name;
			parameters[3].Value = model.SpotContent;
			parameters[4].Value = model.Address;
			parameters[5].Value = model.Picture;
			parameters[6].Value = model.Video;
			parameters[7].Value = model.Audio;
			parameters[8].Value = model.IsDelete;
			parameters[9].Value = model.OrderBy;
			parameters[10].Value = model.State;
			parameters[11].Value = model.AddTime;
			parameters[12].Value = model.AddPeople;

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
		public bool Update(HeqiaoDaoshiCore.Model.Tourism model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Tourism set ");
			strSql.Append("CreateTime=@CreateTime,");
			strSql.Append("Name=@Name,");
			strSql.Append("SpotContent=@SpotContent,");
			strSql.Append("Address=@Address,");
			strSql.Append("Picture=@Picture,");
			strSql.Append("Video=@Video,");
			strSql.Append("Audio=@Audio,");
			strSql.Append("IsDelete=@IsDelete,");
			strSql.Append("OrderBy=@OrderBy,");
			strSql.Append("State=@State,");
			strSql.Append("AddTime=@AddTime,");
			strSql.Append("AddPeople=@AddPeople");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@CreateTime", SqlDbType.DateTime),
					new SqlParameter("@Name", SqlDbType.NVarChar,50),
					new SqlParameter("@SpotContent", SqlDbType.NVarChar,-1),
					new SqlParameter("@Address", SqlDbType.NVarChar,-1),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1),
					new SqlParameter("@Video", SqlDbType.NVarChar,-1),
					new SqlParameter("@Audio", SqlDbType.NVarChar,-1),
					new SqlParameter("@IsDelete", SqlDbType.Int,4),
					new SqlParameter("@OrderBy", SqlDbType.Int,4),
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@AddTime", SqlDbType.NVarChar,50),
					new SqlParameter("@AddPeople", SqlDbType.NVarChar,255),
					new SqlParameter("@TourismUuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)};
			parameters[0].Value = model.CreateTime;
			parameters[1].Value = model.Name;
			parameters[2].Value = model.SpotContent;
			parameters[3].Value = model.Address;
			parameters[4].Value = model.Picture;
			parameters[5].Value = model.Video;
			parameters[6].Value = model.Audio;
			parameters[7].Value = model.IsDelete;
			parameters[8].Value = model.OrderBy;
			parameters[9].Value = model.State;
			parameters[10].Value = model.AddTime;
			parameters[11].Value = model.AddPeople;
			parameters[12].Value = model.TourismUuid;
			parameters[13].Value = model.ID;

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
			strSql.Append("delete from Tourism ");
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
		public bool Delete(Guid TourismUuid)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Tourism ");
			strSql.Append(" where TourismUuid=@TourismUuid ");
			SqlParameter[] parameters = {
					new SqlParameter("@TourismUuid", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = TourismUuid;

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
			strSql.Append("delete from Tourism ");
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
		public HeqiaoDaoshiCore.Model.Tourism GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 TourismUuid,ID,CreateTime,Name,SpotContent,Address,Picture,Video,Audio,IsDelete,OrderBy,State,AddTime,AddPeople from Tourism ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.Tourism model=new HeqiaoDaoshiCore.Model.Tourism();
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
		public HeqiaoDaoshiCore.Model.Tourism DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.Tourism model=new HeqiaoDaoshiCore.Model.Tourism();
			if (row != null)
			{
				if(row["TourismUuid"]!=null && row["TourismUuid"].ToString()!="")
				{
					model.TourismUuid= new Guid(row["TourismUuid"].ToString());
				}
				if(row["ID"]!=null && row["ID"].ToString()!="")
				{
					model.ID=int.Parse(row["ID"].ToString());
				}
				if(row["CreateTime"]!=null && row["CreateTime"].ToString()!="")
				{
					model.CreateTime=DateTime.Parse(row["CreateTime"].ToString());
				}
				if(row["Name"]!=null)
				{
					model.Name=row["Name"].ToString();
				}
				if(row["SpotContent"]!=null)
				{
					model.SpotContent=row["SpotContent"].ToString();
				}
				if(row["Address"]!=null)
				{
					model.Address=row["Address"].ToString();
				}
				if(row["Picture"]!=null)
				{
					model.Picture=row["Picture"].ToString();
				}
				if(row["Video"]!=null)
				{
					model.Video=row["Video"].ToString();
				}
				if(row["Audio"]!=null)
				{
					model.Audio=row["Audio"].ToString();
				}
				if(row["IsDelete"]!=null && row["IsDelete"].ToString()!="")
				{
					model.IsDelete=int.Parse(row["IsDelete"].ToString());
				}
				if(row["OrderBy"]!=null && row["OrderBy"].ToString()!="")
				{
					model.OrderBy=int.Parse(row["OrderBy"].ToString());
				}
				if(row["State"]!=null && row["State"].ToString()!="")
				{
					model.State=int.Parse(row["State"].ToString());
				}
				if(row["AddTime"]!=null)
				{
					model.AddTime=row["AddTime"].ToString();
				}
				if(row["AddPeople"]!=null)
				{
					model.AddPeople=row["AddPeople"].ToString();
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
			strSql.Append("select TourismUuid,ID,CreateTime,Name,SpotContent,Address,Picture,Video,Audio,IsDelete,OrderBy,State,AddTime,AddPeople ");
			strSql.Append(" FROM Tourism ");
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
			strSql.Append(" TourismUuid,ID,CreateTime,Name,SpotContent,Address,Picture,Video,Audio,IsDelete,OrderBy,State,AddTime,AddPeople ");
			strSql.Append(" FROM Tourism ");
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
			strSql.Append("select count(1) FROM Tourism ");
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
			strSql.Append(")AS Row, T.*  from Tourism T ");
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
			parameters[0].Value = "Tourism";
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

