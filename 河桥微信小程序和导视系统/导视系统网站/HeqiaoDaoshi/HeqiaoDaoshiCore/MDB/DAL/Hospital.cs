using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// ���ݷ�����:Hospital
	/// </summary>
	public partial class Hospital
	{
		public Hospital()
		{}
		#region  BasicMethod

		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		public bool Exists(Guid HospitalUuid)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Hospital");
			strSql.Append(" where HospitalUuid=@HospitalUuid ");
			SqlParameter[] parameters = {
					new SqlParameter("@HospitalUuid", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = HospitalUuid;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// ����һ������
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.Hospital model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Hospital(");
			strSql.Append("HospitalUuid,IsDeleted,HospitalName,HospitalAddress,Lon,Lat,Staues,Telephone,Remark,RemarkOne,RemarkTwo,AddTime,AddPeople,Picture)");
			strSql.Append(" values (");
			strSql.Append("@HospitalUuid,@IsDeleted,@HospitalName,@HospitalAddress,@Lon,@Lat,@Staues,@Telephone,@Remark,@RemarkOne,@RemarkTwo,@AddTime,@AddPeople,@Picture)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@HospitalUuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@IsDeleted", SqlDbType.Int,4),
					new SqlParameter("@HospitalName", SqlDbType.NVarChar,-1),
					new SqlParameter("@HospitalAddress", SqlDbType.NVarChar,-1),
					new SqlParameter("@Lon", SqlDbType.NVarChar,255),
					new SqlParameter("@Lat", SqlDbType.NVarChar,255),
					new SqlParameter("@Staues", SqlDbType.NVarChar,255),
					new SqlParameter("@Telephone", SqlDbType.NVarChar,255),
					new SqlParameter("@Remark", SqlDbType.NVarChar,-1),
					new SqlParameter("@RemarkOne", SqlDbType.NVarChar,-1),
					new SqlParameter("@RemarkTwo", SqlDbType.NVarChar,-1),
					new SqlParameter("@AddTime", SqlDbType.NVarChar,255),
					new SqlParameter("@AddPeople", SqlDbType.NVarChar,255),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1)};
			parameters[0].Value = Guid.NewGuid();
			parameters[1].Value = model.IsDeleted;
			parameters[2].Value = model.HospitalName;
			parameters[3].Value = model.HospitalAddress;
			parameters[4].Value = model.Lon;
			parameters[5].Value = model.Lat;
			parameters[6].Value = model.Staues;
			parameters[7].Value = model.Telephone;
			parameters[8].Value = model.Remark;
			parameters[9].Value = model.RemarkOne;
			parameters[10].Value = model.RemarkTwo;
			parameters[11].Value = model.AddTime;
			parameters[12].Value = model.AddPeople;
			parameters[13].Value = model.Picture;

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
		public bool Update(HeqiaoDaoshiCore.Model.Hospital model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Hospital set ");
			strSql.Append("IsDeleted=@IsDeleted,");
			strSql.Append("HospitalName=@HospitalName,");
			strSql.Append("HospitalAddress=@HospitalAddress,");
			strSql.Append("Lon=@Lon,");
			strSql.Append("Lat=@Lat,");
			strSql.Append("Staues=@Staues,");
			strSql.Append("Telephone=@Telephone,");
			strSql.Append("Remark=@Remark,");
			strSql.Append("RemarkOne=@RemarkOne,");
			strSql.Append("RemarkTwo=@RemarkTwo,");
			strSql.Append("AddTime=@AddTime,");
			strSql.Append("AddPeople=@AddPeople,");
			strSql.Append("Picture=@Picture");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@IsDeleted", SqlDbType.Int,4),
					new SqlParameter("@HospitalName", SqlDbType.NVarChar,-1),
					new SqlParameter("@HospitalAddress", SqlDbType.NVarChar,-1),
					new SqlParameter("@Lon", SqlDbType.NVarChar,255),
					new SqlParameter("@Lat", SqlDbType.NVarChar,255),
					new SqlParameter("@Staues", SqlDbType.NVarChar,255),
					new SqlParameter("@Telephone", SqlDbType.NVarChar,255),
					new SqlParameter("@Remark", SqlDbType.NVarChar,-1),
					new SqlParameter("@RemarkOne", SqlDbType.NVarChar,-1),
					new SqlParameter("@RemarkTwo", SqlDbType.NVarChar,-1),
					new SqlParameter("@AddTime", SqlDbType.NVarChar,255),
					new SqlParameter("@AddPeople", SqlDbType.NVarChar,255),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1),
					new SqlParameter("@HospitalUuid", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)};
			parameters[0].Value = model.IsDeleted;
			parameters[1].Value = model.HospitalName;
			parameters[2].Value = model.HospitalAddress;
			parameters[3].Value = model.Lon;
			parameters[4].Value = model.Lat;
			parameters[5].Value = model.Staues;
			parameters[6].Value = model.Telephone;
			parameters[7].Value = model.Remark;
			parameters[8].Value = model.RemarkOne;
			parameters[9].Value = model.RemarkTwo;
			parameters[10].Value = model.AddTime;
			parameters[11].Value = model.AddPeople;
			parameters[12].Value = model.Picture;
			parameters[13].Value = model.HospitalUuid;
			parameters[14].Value = model.ID;

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
			strSql.Append("delete from Hospital ");
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
		public bool Delete(Guid HospitalUuid)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Hospital ");
			strSql.Append(" where HospitalUuid=@HospitalUuid ");
			SqlParameter[] parameters = {
					new SqlParameter("@HospitalUuid", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = HospitalUuid;

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
			strSql.Append("delete from Hospital ");
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
		public HeqiaoDaoshiCore.Model.Hospital GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 HospitalUuid,ID,IsDeleted,HospitalName,HospitalAddress,Lon,Lat,Staues,Telephone,Remark,RemarkOne,RemarkTwo,AddTime,AddPeople,Picture from Hospital ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.Hospital model=new HeqiaoDaoshiCore.Model.Hospital();
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
		public HeqiaoDaoshiCore.Model.Hospital DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.Hospital model=new HeqiaoDaoshiCore.Model.Hospital();
			if (row != null)
			{
				if(row["HospitalUuid"]!=null && row["HospitalUuid"].ToString()!="")
				{
					model.HospitalUuid= new Guid(row["HospitalUuid"].ToString());
				}
				if(row["ID"]!=null && row["ID"].ToString()!="")
				{
					model.ID=int.Parse(row["ID"].ToString());
				}
				if(row["IsDeleted"]!=null && row["IsDeleted"].ToString()!="")
				{
					model.IsDeleted=int.Parse(row["IsDeleted"].ToString());
				}
				if(row["HospitalName"]!=null)
				{
					model.HospitalName=row["HospitalName"].ToString();
				}
				if(row["HospitalAddress"]!=null)
				{
					model.HospitalAddress=row["HospitalAddress"].ToString();
				}
				if(row["Lon"]!=null)
				{
					model.Lon=row["Lon"].ToString();
				}
				if(row["Lat"]!=null)
				{
					model.Lat=row["Lat"].ToString();
				}
				if(row["Staues"]!=null)
				{
					model.Staues=row["Staues"].ToString();
				}
				if(row["Telephone"]!=null)
				{
					model.Telephone=row["Telephone"].ToString();
				}
				if(row["Remark"]!=null)
				{
					model.Remark=row["Remark"].ToString();
				}
				if(row["RemarkOne"]!=null)
				{
					model.RemarkOne=row["RemarkOne"].ToString();
				}
				if(row["RemarkTwo"]!=null)
				{
					model.RemarkTwo=row["RemarkTwo"].ToString();
				}
				if(row["AddTime"]!=null)
				{
					model.AddTime=row["AddTime"].ToString();
				}
				if(row["AddPeople"]!=null)
				{
					model.AddPeople=row["AddPeople"].ToString();
				}
				if(row["Picture"]!=null)
				{
					model.Picture=row["Picture"].ToString();
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
			strSql.Append("select HospitalUuid,ID,IsDeleted,HospitalName,HospitalAddress,Lon,Lat,Staues,Telephone,Remark,RemarkOne,RemarkTwo,AddTime,AddPeople,Picture ");
			strSql.Append(" FROM Hospital ");
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
			strSql.Append(" HospitalUuid,ID,IsDeleted,HospitalName,HospitalAddress,Lon,Lat,Staues,Telephone,Remark,RemarkOne,RemarkTwo,AddTime,AddPeople,Picture ");
			strSql.Append(" FROM Hospital ");
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
			strSql.Append("select count(1) FROM Hospital ");
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
			strSql.Append(")AS Row, T.*  from Hospital T ");
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
			parameters[0].Value = "Hospital";
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

