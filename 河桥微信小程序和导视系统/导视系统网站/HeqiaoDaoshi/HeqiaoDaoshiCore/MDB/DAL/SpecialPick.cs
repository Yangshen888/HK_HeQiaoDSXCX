using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// 数据访问类:SpecialPick
	/// </summary>
	public partial class SpecialPick
	{
		public SpecialPick()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSql.GetMaxId("ID", "SpecialPick"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid SpecialPickUUID,int ID)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from SpecialPick");
			strSql.Append(" where SpecialPickUUID=@SpecialPickUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@SpecialPickUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = SpecialPickUUID;
			parameters[1].Value = ID;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.SpecialPick model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into SpecialPick(");
			strSql.Append("CreateTime,SpecialPickUUID,Name,Phone,Introduction,Address,Price,Picture,State,IsDelete,Cover,Lon,Lat,ytype,PlayType)");
			strSql.Append(" values (");
			strSql.Append("@CreateTime,@SpecialPickUUID,@Name,@Phone,@Introduction,@Address,@Price,@Picture,@State,@IsDelete,@Cover,@Lon,@Lat,@ytype,@PlayType)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@CreateTime", SqlDbType.DateTime),
					new SqlParameter("@SpecialPickUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Name", SqlDbType.NVarChar,50),
					new SqlParameter("@Phone", SqlDbType.NVarChar,-1),
					new SqlParameter("@Introduction", SqlDbType.NVarChar,-1),
					new SqlParameter("@Address", SqlDbType.NVarChar,-1),
					new SqlParameter("@Price", SqlDbType.NVarChar,-1),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1),
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@IsDelete", SqlDbType.Int,4),
					new SqlParameter("@Cover", SqlDbType.VarChar,255),
					new SqlParameter("@Lon", SqlDbType.NVarChar,255),
					new SqlParameter("@Lat", SqlDbType.NVarChar,255),
					new SqlParameter("@ytype", SqlDbType.NVarChar,255),
					new SqlParameter("@PlayType", SqlDbType.NVarChar,255)};
			parameters[0].Value = model.CreateTime;
			parameters[1].Value = Guid.NewGuid();
			parameters[2].Value = model.Name;
			parameters[3].Value = model.Phone;
			parameters[4].Value = model.Introduction;
			parameters[5].Value = model.Address;
			parameters[6].Value = model.Price;
			parameters[7].Value = model.Picture;
			parameters[8].Value = model.State;
			parameters[9].Value = model.IsDelete;
			parameters[10].Value = model.Cover;
			parameters[11].Value = model.Lon;
			parameters[12].Value = model.Lat;
			parameters[13].Value = model.ytype;
			parameters[14].Value = model.PlayType;

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
		public bool Update(HeqiaoDaoshiCore.Model.SpecialPick model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update SpecialPick set ");
			strSql.Append("CreateTime=@CreateTime,");
			strSql.Append("Name=@Name,");
			strSql.Append("Phone=@Phone,");
			strSql.Append("Introduction=@Introduction,");
			strSql.Append("Address=@Address,");
			strSql.Append("Price=@Price,");
			strSql.Append("Picture=@Picture,");
			strSql.Append("State=@State,");
			strSql.Append("IsDelete=@IsDelete,");
			strSql.Append("Cover=@Cover,");
			strSql.Append("Lon=@Lon,");
			strSql.Append("Lat=@Lat,");
			strSql.Append("ytype=@ytype,");
			strSql.Append("PlayType=@PlayType");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@CreateTime", SqlDbType.DateTime),
					new SqlParameter("@Name", SqlDbType.NVarChar,50),
					new SqlParameter("@Phone", SqlDbType.NVarChar,-1),
					new SqlParameter("@Introduction", SqlDbType.NVarChar,-1),
					new SqlParameter("@Address", SqlDbType.NVarChar,-1),
					new SqlParameter("@Price", SqlDbType.NVarChar,-1),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1),
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@IsDelete", SqlDbType.Int,4),
					new SqlParameter("@Cover", SqlDbType.VarChar,255),
					new SqlParameter("@Lon", SqlDbType.NVarChar,255),
					new SqlParameter("@Lat", SqlDbType.NVarChar,255),
					new SqlParameter("@ytype", SqlDbType.NVarChar,255),
					new SqlParameter("@PlayType", SqlDbType.NVarChar,255),
					new SqlParameter("@ID", SqlDbType.Int,4),
					new SqlParameter("@SpecialPickUUID", SqlDbType.UniqueIdentifier,16)};
			parameters[0].Value = model.CreateTime;
			parameters[1].Value = model.Name;
			parameters[2].Value = model.Phone;
			parameters[3].Value = model.Introduction;
			parameters[4].Value = model.Address;
			parameters[5].Value = model.Price;
			parameters[6].Value = model.Picture;
			parameters[7].Value = model.State;
			parameters[8].Value = model.IsDelete;
			parameters[9].Value = model.Cover;
			parameters[10].Value = model.Lon;
			parameters[11].Value = model.Lat;
			parameters[12].Value = model.ytype;
			parameters[13].Value = model.PlayType;
			parameters[14].Value = model.ID;
			parameters[15].Value = model.SpecialPickUUID;

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
			strSql.Append("delete from SpecialPick ");
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
		public bool Delete(Guid SpecialPickUUID,int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from SpecialPick ");
			strSql.Append(" where SpecialPickUUID=@SpecialPickUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@SpecialPickUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = SpecialPickUUID;
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
			strSql.Append("delete from SpecialPick ");
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
		public HeqiaoDaoshiCore.Model.SpecialPick GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 ID,CreateTime,SpecialPickUUID,Name,Phone,Introduction,Address,Price,Picture,State,IsDelete,Cover,Lon,Lat,ytype,PlayType from SpecialPick ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.SpecialPick model=new HeqiaoDaoshiCore.Model.SpecialPick();
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
		public HeqiaoDaoshiCore.Model.SpecialPick DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.SpecialPick model=new HeqiaoDaoshiCore.Model.SpecialPick();
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
				if(row["SpecialPickUUID"]!=null && row["SpecialPickUUID"].ToString()!="")
				{
					model.SpecialPickUUID= new Guid(row["SpecialPickUUID"].ToString());
				}
				if(row["Name"]!=null)
				{
					model.Name=row["Name"].ToString();
				}
				if(row["Phone"]!=null)
				{
					model.Phone=row["Phone"].ToString();
				}
				if(row["Introduction"]!=null)
				{
					model.Introduction=row["Introduction"].ToString();
				}
				if(row["Address"]!=null)
				{
					model.Address=row["Address"].ToString();
				}
				if(row["Price"]!=null)
				{
					model.Price=row["Price"].ToString();
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
				if(row["Cover"]!=null)
				{
					model.Cover=row["Cover"].ToString();
				}
				if(row["Lon"]!=null)
				{
					model.Lon=row["Lon"].ToString();
				}
				if(row["Lat"]!=null)
				{
					model.Lat=row["Lat"].ToString();
				}
				if(row["ytype"]!=null)
				{
					model.ytype=row["ytype"].ToString();
				}
				if(row["PlayType"]!=null)
				{
					model.PlayType=row["PlayType"].ToString();
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
			strSql.Append("select ID,CreateTime,SpecialPickUUID,Name,Phone,Introduction,Address,Price,Picture,State,IsDelete,Cover,Lon,Lat,ytype,PlayType ");
			strSql.Append(" FROM SpecialPick ");
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
			strSql.Append(" ID,CreateTime,SpecialPickUUID,Name,Phone,Introduction,Address,Price,Picture,State,IsDelete,Cover,Lon,Lat,ytype,PlayType ");
			strSql.Append(" FROM SpecialPick ");
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
			strSql.Append("select count(1) FROM SpecialPick ");
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
			strSql.Append(")AS Row, T.*  from SpecialPick T ");
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
			parameters[0].Value = "SpecialPick";
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

