using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// 数据访问类:Food
	/// </summary>
	public partial class Food
	{
		public Food()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSql.GetMaxId("ID", "Food"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid FoodUUID,int ID)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Food");
			strSql.Append(" where FoodUUID=@FoodUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@FoodUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = FoodUUID;
			parameters[1].Value = ID;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.Food model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Food(");
			strSql.Append("CreateTime,FoodUUID,FoodName,Title,Introduction,Address,Price,Picture,State,IsDelete,FoodorTechan,Cover,Lon,Lat,ytype,PlayType,ShopId)");
			strSql.Append(" values (");
			strSql.Append("@CreateTime,@FoodUUID,@FoodName,@Title,@Introduction,@Address,@Price,@Picture,@State,@IsDelete,@FoodorTechan,@Cover,@Lon,@Lat,@ytype,@PlayType,@ShopId)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@CreateTime", SqlDbType.DateTime),
					new SqlParameter("@FoodUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@FoodName", SqlDbType.NVarChar,255),
					new SqlParameter("@Title", SqlDbType.NVarChar,-1),
					new SqlParameter("@Introduction", SqlDbType.NVarChar,-1),
					new SqlParameter("@Address", SqlDbType.NVarChar,-1),
					new SqlParameter("@Price", SqlDbType.NVarChar,20),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1),
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@IsDelete", SqlDbType.Int,4),
					new SqlParameter("@FoodorTechan", SqlDbType.Int,4),
					new SqlParameter("@Cover", SqlDbType.VarChar,255),
					new SqlParameter("@Lon", SqlDbType.NVarChar,255),
					new SqlParameter("@Lat", SqlDbType.NVarChar,255),
					new SqlParameter("@ytype", SqlDbType.NVarChar,255),
					new SqlParameter("@PlayType", SqlDbType.NVarChar,255),
					new SqlParameter("@ShopId", SqlDbType.Int,4)};
			parameters[0].Value = model.CreateTime;
			parameters[1].Value = Guid.NewGuid();
			parameters[2].Value = model.FoodName;
			parameters[3].Value = model.Title;
			parameters[4].Value = model.Introduction;
			parameters[5].Value = model.Address;
			parameters[6].Value = model.Price;
			parameters[7].Value = model.Picture;
			parameters[8].Value = model.State;
			parameters[9].Value = model.IsDelete;
			parameters[10].Value = model.FoodorTechan;
			parameters[11].Value = model.Cover;
			parameters[12].Value = model.Lon;
			parameters[13].Value = model.Lat;
			parameters[14].Value = model.ytype;
			parameters[15].Value = model.PlayType;
			parameters[16].Value = model.ShopId;

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
		public bool Update(HeqiaoDaoshiCore.Model.Food model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Food set ");
			strSql.Append("CreateTime=@CreateTime,");
			strSql.Append("FoodName=@FoodName,");
			strSql.Append("Title=@Title,");
			strSql.Append("Introduction=@Introduction,");
			strSql.Append("Address=@Address,");
			strSql.Append("Price=@Price,");
			strSql.Append("Picture=@Picture,");
			strSql.Append("State=@State,");
			strSql.Append("IsDelete=@IsDelete,");
			strSql.Append("FoodorTechan=@FoodorTechan,");
			strSql.Append("Cover=@Cover,");
			strSql.Append("Lon=@Lon,");
			strSql.Append("Lat=@Lat,");
			strSql.Append("ytype=@ytype,");
			strSql.Append("PlayType=@PlayType,");
			strSql.Append("ShopId=@ShopId");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@CreateTime", SqlDbType.DateTime),
					new SqlParameter("@FoodName", SqlDbType.NVarChar,255),
					new SqlParameter("@Title", SqlDbType.NVarChar,-1),
					new SqlParameter("@Introduction", SqlDbType.NVarChar,-1),
					new SqlParameter("@Address", SqlDbType.NVarChar,-1),
					new SqlParameter("@Price", SqlDbType.NVarChar,20),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1),
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@IsDelete", SqlDbType.Int,4),
					new SqlParameter("@FoodorTechan", SqlDbType.Int,4),
					new SqlParameter("@Cover", SqlDbType.VarChar,255),
					new SqlParameter("@Lon", SqlDbType.NVarChar,255),
					new SqlParameter("@Lat", SqlDbType.NVarChar,255),
					new SqlParameter("@ytype", SqlDbType.NVarChar,255),
					new SqlParameter("@PlayType", SqlDbType.NVarChar,255),
					new SqlParameter("@ShopId", SqlDbType.Int,4),
					new SqlParameter("@ID", SqlDbType.Int,4),
					new SqlParameter("@FoodUUID", SqlDbType.UniqueIdentifier,16)};
			parameters[0].Value = model.CreateTime;
			parameters[1].Value = model.FoodName;
			parameters[2].Value = model.Title;
			parameters[3].Value = model.Introduction;
			parameters[4].Value = model.Address;
			parameters[5].Value = model.Price;
			parameters[6].Value = model.Picture;
			parameters[7].Value = model.State;
			parameters[8].Value = model.IsDelete;
			parameters[9].Value = model.FoodorTechan;
			parameters[10].Value = model.Cover;
			parameters[11].Value = model.Lon;
			parameters[12].Value = model.Lat;
			parameters[13].Value = model.ytype;
			parameters[14].Value = model.PlayType;
			parameters[15].Value = model.ShopId;
			parameters[16].Value = model.ID;
			parameters[17].Value = model.FoodUUID;

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
			strSql.Append("delete from Food ");
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
		public bool Delete(Guid FoodUUID,int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Food ");
			strSql.Append(" where FoodUUID=@FoodUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@FoodUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = FoodUUID;
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
			strSql.Append("delete from Food ");
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
		public HeqiaoDaoshiCore.Model.Food GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 ID,CreateTime,FoodUUID,FoodName,Title,Introduction,Address,Price,Picture,State,IsDelete,FoodorTechan,Cover,Lon,Lat,ytype,PlayType,ShopId from Food ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.Food model=new HeqiaoDaoshiCore.Model.Food();
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
		public HeqiaoDaoshiCore.Model.Food DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.Food model=new HeqiaoDaoshiCore.Model.Food();
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
				if(row["FoodUUID"]!=null && row["FoodUUID"].ToString()!="")
				{
					model.FoodUUID= new Guid(row["FoodUUID"].ToString());
				}
				if(row["FoodName"]!=null)
				{
					model.FoodName=row["FoodName"].ToString();
				}
				if(row["Title"]!=null)
				{
					model.Title=row["Title"].ToString();
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
				if(row["FoodorTechan"]!=null && row["FoodorTechan"].ToString()!="")
				{
					model.FoodorTechan=int.Parse(row["FoodorTechan"].ToString());
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
				if(row["ShopId"]!=null && row["ShopId"].ToString()!="")
				{
					model.ShopId=int.Parse(row["ShopId"].ToString());
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
			strSql.Append("select ID,CreateTime,FoodUUID,FoodName,Title,Introduction,Address,Price,Picture,State,IsDelete,FoodorTechan,Cover,Lon,Lat,ytype,PlayType,ShopId ");
			strSql.Append(" FROM Food ");
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
			strSql.Append(" ID,CreateTime,FoodUUID,FoodName,Title,Introduction,Address,Price,Picture,State,IsDelete,FoodorTechan,Cover,Lon,Lat,ytype,PlayType,ShopId ");
			strSql.Append(" FROM Food ");
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
			strSql.Append("select count(1) FROM Food ");
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
			strSql.Append(")AS Row, T.*  from Food T ");
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
			parameters[0].Value = "Food";
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

