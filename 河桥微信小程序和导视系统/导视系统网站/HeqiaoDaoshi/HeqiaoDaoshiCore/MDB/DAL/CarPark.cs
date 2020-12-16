using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// 数据访问类:CarPark
	/// </summary>
	public partial class CarPark
	{
		public CarPark()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSql.GetMaxId("ID", "CarPark"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid CarParkUUID,int ID)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from CarPark");
			strSql.Append(" where CarParkUUID=@CarParkUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@CarParkUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = CarParkUUID;
			parameters[1].Value = ID;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.CarPark model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into CarPark(");
			strSql.Append("CreateTime,CarParkUUID,Name,Specification,Address,Price,Picture,State,IsDelete,TruckSpace,SurplusTS,Lon,Lat,OneP,TwoP,ThreeP,FourP,OutFP,ChargesNotes,AddTime,AddPeople)");
			strSql.Append(" values (");
			strSql.Append("@CreateTime,@CarParkUUID,@Name,@Specification,@Address,@Price,@Picture,@State,@IsDelete,@TruckSpace,@SurplusTS,@Lon,@Lat,@OneP,@TwoP,@ThreeP,@FourP,@OutFP,@ChargesNotes,@AddTime,@AddPeople)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@CreateTime", SqlDbType.DateTime),
					new SqlParameter("@CarParkUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Name", SqlDbType.NVarChar,50),
					new SqlParameter("@Specification", SqlDbType.NVarChar,-1),
					new SqlParameter("@Address", SqlDbType.NVarChar,-1),
					new SqlParameter("@Price", SqlDbType.NVarChar,-1),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1),
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@IsDelete", SqlDbType.Int,4),
					new SqlParameter("@TruckSpace", SqlDbType.Int,4),
					new SqlParameter("@SurplusTS", SqlDbType.Int,4),
					new SqlParameter("@Lon", SqlDbType.Decimal,9),
					new SqlParameter("@Lat", SqlDbType.Decimal,9),
					new SqlParameter("@OneP", SqlDbType.Decimal,5),
					new SqlParameter("@TwoP", SqlDbType.Decimal,5),
					new SqlParameter("@ThreeP", SqlDbType.Decimal,5),
					new SqlParameter("@FourP", SqlDbType.Decimal,5),
					new SqlParameter("@OutFP", SqlDbType.Decimal,5),
					new SqlParameter("@ChargesNotes", SqlDbType.NVarChar,500),
					new SqlParameter("@AddTime", SqlDbType.DateTime),
					new SqlParameter("@AddPeople", SqlDbType.VarChar,100)};
			parameters[0].Value = model.CreateTime;
			parameters[1].Value = Guid.NewGuid();
			parameters[2].Value = model.Name;
			parameters[3].Value = model.Specification;
			parameters[4].Value = model.Address;
			parameters[5].Value = model.Price;
			parameters[6].Value = model.Picture;
			parameters[7].Value = model.State;
			parameters[8].Value = model.IsDelete;
			parameters[9].Value = model.TruckSpace;
			parameters[10].Value = model.SurplusTS;
			parameters[11].Value = model.Lon;
			parameters[12].Value = model.Lat;
			parameters[13].Value = model.OneP;
			parameters[14].Value = model.TwoP;
			parameters[15].Value = model.ThreeP;
			parameters[16].Value = model.FourP;
			parameters[17].Value = model.OutFP;
			parameters[18].Value = model.ChargesNotes;
			parameters[19].Value = model.AddTime;
			parameters[20].Value = model.AddPeople;

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
		public bool Update(HeqiaoDaoshiCore.Model.CarPark model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update CarPark set ");
			strSql.Append("CreateTime=@CreateTime,");
			strSql.Append("Name=@Name,");
			strSql.Append("Specification=@Specification,");
			strSql.Append("Address=@Address,");
			strSql.Append("Price=@Price,");
			strSql.Append("Picture=@Picture,");
			strSql.Append("State=@State,");
			strSql.Append("IsDelete=@IsDelete,");
			strSql.Append("TruckSpace=@TruckSpace,");
			strSql.Append("SurplusTS=@SurplusTS,");
			strSql.Append("Lon=@Lon,");
			strSql.Append("Lat=@Lat,");
			strSql.Append("OneP=@OneP,");
			strSql.Append("TwoP=@TwoP,");
			strSql.Append("ThreeP=@ThreeP,");
			strSql.Append("FourP=@FourP,");
			strSql.Append("OutFP=@OutFP,");
			strSql.Append("ChargesNotes=@ChargesNotes,");
			strSql.Append("AddTime=@AddTime,");
			strSql.Append("AddPeople=@AddPeople");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@CreateTime", SqlDbType.DateTime),
					new SqlParameter("@Name", SqlDbType.NVarChar,50),
					new SqlParameter("@Specification", SqlDbType.NVarChar,-1),
					new SqlParameter("@Address", SqlDbType.NVarChar,-1),
					new SqlParameter("@Price", SqlDbType.NVarChar,-1),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1),
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@IsDelete", SqlDbType.Int,4),
					new SqlParameter("@TruckSpace", SqlDbType.Int,4),
					new SqlParameter("@SurplusTS", SqlDbType.Int,4),
					new SqlParameter("@Lon", SqlDbType.Decimal,9),
					new SqlParameter("@Lat", SqlDbType.Decimal,9),
					new SqlParameter("@OneP", SqlDbType.Decimal,5),
					new SqlParameter("@TwoP", SqlDbType.Decimal,5),
					new SqlParameter("@ThreeP", SqlDbType.Decimal,5),
					new SqlParameter("@FourP", SqlDbType.Decimal,5),
					new SqlParameter("@OutFP", SqlDbType.Decimal,5),
					new SqlParameter("@ChargesNotes", SqlDbType.NVarChar,500),
					new SqlParameter("@AddTime", SqlDbType.DateTime),
					new SqlParameter("@AddPeople", SqlDbType.VarChar,100),
					new SqlParameter("@ID", SqlDbType.Int,4),
					new SqlParameter("@CarParkUUID", SqlDbType.UniqueIdentifier,16)};
			parameters[0].Value = model.CreateTime;
			parameters[1].Value = model.Name;
			parameters[2].Value = model.Specification;
			parameters[3].Value = model.Address;
			parameters[4].Value = model.Price;
			parameters[5].Value = model.Picture;
			parameters[6].Value = model.State;
			parameters[7].Value = model.IsDelete;
			parameters[8].Value = model.TruckSpace;
			parameters[9].Value = model.SurplusTS;
			parameters[10].Value = model.Lon;
			parameters[11].Value = model.Lat;
			parameters[12].Value = model.OneP;
			parameters[13].Value = model.TwoP;
			parameters[14].Value = model.ThreeP;
			parameters[15].Value = model.FourP;
			parameters[16].Value = model.OutFP;
			parameters[17].Value = model.ChargesNotes;
			parameters[18].Value = model.AddTime;
			parameters[19].Value = model.AddPeople;
			parameters[20].Value = model.ID;
			parameters[21].Value = model.CarParkUUID;

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
			strSql.Append("delete from CarPark ");
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
		public bool Delete(Guid CarParkUUID,int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from CarPark ");
			strSql.Append(" where CarParkUUID=@CarParkUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@CarParkUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = CarParkUUID;
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
			strSql.Append("delete from CarPark ");
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
		public HeqiaoDaoshiCore.Model.CarPark GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 ID,CreateTime,CarParkUUID,Name,Specification,Address,Price,Picture,State,IsDelete,TruckSpace,SurplusTS,Lon,Lat,OneP,TwoP,ThreeP,FourP,OutFP,ChargesNotes,AddTime,AddPeople from CarPark ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.CarPark model=new HeqiaoDaoshiCore.Model.CarPark();
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
		public HeqiaoDaoshiCore.Model.CarPark DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.CarPark model=new HeqiaoDaoshiCore.Model.CarPark();
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
				if(row["CarParkUUID"]!=null && row["CarParkUUID"].ToString()!="")
				{
					model.CarParkUUID= new Guid(row["CarParkUUID"].ToString());
				}
				if(row["Name"]!=null)
				{
					model.Name=row["Name"].ToString();
				}
				if(row["Specification"]!=null)
				{
					model.Specification=row["Specification"].ToString();
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
				if(row["TruckSpace"]!=null && row["TruckSpace"].ToString()!="")
				{
					model.TruckSpace=int.Parse(row["TruckSpace"].ToString());
				}
				if(row["SurplusTS"]!=null && row["SurplusTS"].ToString()!="")
				{
					model.SurplusTS=int.Parse(row["SurplusTS"].ToString());
				}
				if(row["Lon"]!=null && row["Lon"].ToString()!="")
				{
					model.Lon=decimal.Parse(row["Lon"].ToString());
				}
				if(row["Lat"]!=null && row["Lat"].ToString()!="")
				{
					model.Lat=decimal.Parse(row["Lat"].ToString());
				}
				if(row["OneP"]!=null && row["OneP"].ToString()!="")
				{
					model.OneP=decimal.Parse(row["OneP"].ToString());
				}
				if(row["TwoP"]!=null && row["TwoP"].ToString()!="")
				{
					model.TwoP=decimal.Parse(row["TwoP"].ToString());
				}
				if(row["ThreeP"]!=null && row["ThreeP"].ToString()!="")
				{
					model.ThreeP=decimal.Parse(row["ThreeP"].ToString());
				}
				if(row["FourP"]!=null && row["FourP"].ToString()!="")
				{
					model.FourP=decimal.Parse(row["FourP"].ToString());
				}
				if(row["OutFP"]!=null && row["OutFP"].ToString()!="")
				{
					model.OutFP=decimal.Parse(row["OutFP"].ToString());
				}
				if(row["ChargesNotes"]!=null)
				{
					model.ChargesNotes=row["ChargesNotes"].ToString();
				}
				if(row["AddTime"]!=null && row["AddTime"].ToString()!="")
				{
					model.AddTime=DateTime.Parse(row["AddTime"].ToString());
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
			strSql.Append("select ID,CreateTime,CarParkUUID,Name,Specification,Address,Price,Picture,State,IsDelete,TruckSpace,SurplusTS,Lon,Lat,OneP,TwoP,ThreeP,FourP,OutFP,ChargesNotes,AddTime,AddPeople ");
			strSql.Append(" FROM CarPark ");
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
			strSql.Append(" ID,CreateTime,CarParkUUID,Name,Specification,Address,Price,Picture,State,IsDelete,TruckSpace,SurplusTS,Lon,Lat,OneP,TwoP,ThreeP,FourP,OutFP,ChargesNotes,AddTime,AddPeople ");
			strSql.Append(" FROM CarPark ");
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
			strSql.Append("select count(1) FROM CarPark ");
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
			strSql.Append(")AS Row, T.*  from CarPark T ");
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
			parameters[0].Value = "CarPark";
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

