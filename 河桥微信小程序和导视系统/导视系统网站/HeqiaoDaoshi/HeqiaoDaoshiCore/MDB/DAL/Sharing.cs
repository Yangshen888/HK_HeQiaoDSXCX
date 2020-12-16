using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// ���ݷ�����:Sharing
	/// </summary>
	public partial class Sharing
	{
		public Sharing()
		{}
		#region  BasicMethod

		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		public bool Exists(Guid SharingUuid)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Sharing");
			strSql.Append(" where SharingUuid=@SharingUuid ");
			SqlParameter[] parameters = {
					new SqlParameter("@SharingUuid", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = SharingUuid;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// ����һ������
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.Sharing model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Sharing(");
			strSql.Append("CreateTime,SharingUuid,Name,Title,Introduction,Address,Picture,State,IsDelete,Cover,Lon,Lat,type)");
			strSql.Append(" values (");
			strSql.Append("@CreateTime,@SharingUuid,@Name,@Title,@Introduction,@Address,@Picture,@State,@IsDelete,@Cover,@Lon,@Lat,@type)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@CreateTime", SqlDbType.DateTime),
					new SqlParameter("@SharingUuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Name", SqlDbType.NVarChar,255),
					new SqlParameter("@Title", SqlDbType.NVarChar,-1),
					new SqlParameter("@Introduction", SqlDbType.NVarChar,-1),
					new SqlParameter("@Address", SqlDbType.NVarChar,-1),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1),
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@IsDelete", SqlDbType.Int,4),
					new SqlParameter("@Cover", SqlDbType.VarChar,255),
					new SqlParameter("@Lon", SqlDbType.NVarChar,255),
					new SqlParameter("@Lat", SqlDbType.NVarChar,255),
					new SqlParameter("@type", SqlDbType.VarChar,255)};
			parameters[0].Value = model.CreateTime;
			parameters[1].Value = Guid.NewGuid();
			parameters[2].Value = model.Name;
			parameters[3].Value = model.Title;
			parameters[4].Value = model.Introduction;
			parameters[5].Value = model.Address;
			parameters[6].Value = model.Picture;
			parameters[7].Value = model.State;
			parameters[8].Value = model.IsDelete;
			parameters[9].Value = model.Cover;
			parameters[10].Value = model.Lon;
			parameters[11].Value = model.Lat;
			parameters[12].Value = model.type;

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
		/// ����һ������
		/// </summary>
		public bool Update(HeqiaoDaoshiCore.Model.Sharing model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Sharing set ");
			strSql.Append("CreateTime=@CreateTime,");
			strSql.Append("Name=@Name,");
			strSql.Append("Title=@Title,");
			strSql.Append("Introduction=@Introduction,");
			strSql.Append("Address=@Address,");
			strSql.Append("Picture=@Picture,");
			strSql.Append("State=@State,");
			strSql.Append("IsDelete=@IsDelete,");
			strSql.Append("Cover=@Cover,");
			strSql.Append("Lon=@Lon,");
			strSql.Append("Lat=@Lat,");
			strSql.Append("type=@type");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@CreateTime", SqlDbType.DateTime),
					new SqlParameter("@Name", SqlDbType.NVarChar,255),
					new SqlParameter("@Title", SqlDbType.NVarChar,-1),
					new SqlParameter("@Introduction", SqlDbType.NVarChar,-1),
					new SqlParameter("@Address", SqlDbType.NVarChar,-1),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1),
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@IsDelete", SqlDbType.Int,4),
					new SqlParameter("@Cover", SqlDbType.VarChar,255),
					new SqlParameter("@Lon", SqlDbType.NVarChar,255),
					new SqlParameter("@Lat", SqlDbType.NVarChar,255),
					new SqlParameter("@type", SqlDbType.VarChar,255),
					new SqlParameter("@ID", SqlDbType.Int,4),
					new SqlParameter("@SharingUuid", SqlDbType.UniqueIdentifier,16)};
			parameters[0].Value = model.CreateTime;
			parameters[1].Value = model.Name;
			parameters[2].Value = model.Title;
			parameters[3].Value = model.Introduction;
			parameters[4].Value = model.Address;
			parameters[5].Value = model.Picture;
			parameters[6].Value = model.State;
			parameters[7].Value = model.IsDelete;
			parameters[8].Value = model.Cover;
			parameters[9].Value = model.Lon;
			parameters[10].Value = model.Lat;
			parameters[11].Value = model.type;
			parameters[12].Value = model.ID;
			parameters[13].Value = model.SharingUuid;

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
		/// ɾ��һ������
		/// </summary>
		public bool Delete(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Sharing ");
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
		/// ɾ��һ������
		/// </summary>
		public bool Delete(Guid SharingUuid)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Sharing ");
			strSql.Append(" where SharingUuid=@SharingUuid ");
			SqlParameter[] parameters = {
					new SqlParameter("@SharingUuid", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = SharingUuid;

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
		/// ����ɾ������
		/// </summary>
		public bool DeleteList(string IDlist )
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Sharing ");
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
		/// �õ�һ������ʵ��
		/// </summary>
		public HeqiaoDaoshiCore.Model.Sharing GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 ID,CreateTime,SharingUuid,Name,Title,Introduction,Address,Picture,State,IsDelete,Cover,Lon,Lat,type from Sharing ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.Sharing model=new HeqiaoDaoshiCore.Model.Sharing();
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
		/// �õ�һ������ʵ��
		/// </summary>
		public HeqiaoDaoshiCore.Model.Sharing DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.Sharing model=new HeqiaoDaoshiCore.Model.Sharing();
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
				if(row["SharingUuid"]!=null && row["SharingUuid"].ToString()!="")
				{
					model.SharingUuid= new Guid(row["SharingUuid"].ToString());
				}
				if(row["Name"]!=null)
				{
					model.Name=row["Name"].ToString();
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
				if(row["type"]!=null)
				{
					model.type=row["type"].ToString();
				}
			}
			return model;
		}

		/// <summary>
		/// ��������б�
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select ID,CreateTime,SharingUuid,Name,Title,Introduction,Address,Picture,State,IsDelete,Cover,Lon,Lat,type ");
			strSql.Append(" FROM Sharing ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			return DbHelperSql.Query(strSql.ToString());
		}

		/// <summary>
		/// ���ǰ��������
		/// </summary>
		public DataSet GetList(int Top,string strWhere,string filedOrder)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select ");
			if(Top>0)
			{
				strSql.Append(" top "+Top.ToString());
			}
			strSql.Append(" ID,CreateTime,SharingUuid,Name,Title,Introduction,Address,Picture,State,IsDelete,Cover,Lon,Lat,type ");
			strSql.Append(" FROM Sharing ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			strSql.Append(" order by " + filedOrder);
			return DbHelperSql.Query(strSql.ToString());
		}

		/// <summary>
		/// ��ȡ��¼����
		/// </summary>
		public int GetRecordCount(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) FROM Sharing ");
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
		/// ��ҳ��ȡ�����б�
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
			strSql.Append(")AS Row, T.*  from Sharing T ");
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
		/// ��ҳ��ȡ�����б�
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
			parameters[0].Value = "Sharing";
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

