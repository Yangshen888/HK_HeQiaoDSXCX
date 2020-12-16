using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// ���ݷ�����:Videomark
	/// </summary>
	public partial class Videomark
	{
		public Videomark()
		{}
		#region  BasicMethod

		/// <summary>
		/// �õ����ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSql.GetMaxId("ID", "Videomark"); 
		}

		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		public bool Exists(Guid VideomarkUUID,int ID)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Videomark");
			strSql.Append(" where VideomarkUUID=@VideomarkUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@VideomarkUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = VideomarkUUID;
			parameters[1].Value = ID;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// ����һ������
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.Videomark model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Videomark(");
			strSql.Append("CreateTime,VideomarkUUID,VideoName,VideoPath,Position,IsDelete)");
			strSql.Append(" values (");
			strSql.Append("@CreateTime,@VideomarkUUID,@VideoName,@VideoPath,@Position,@IsDelete)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@CreateTime", SqlDbType.DateTime),
					new SqlParameter("@VideomarkUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@VideoName", SqlDbType.NVarChar,50),
					new SqlParameter("@VideoPath", SqlDbType.NVarChar,100),
					new SqlParameter("@Position", SqlDbType.NVarChar,50),
					new SqlParameter("@IsDelete", SqlDbType.Int,4)};
			parameters[0].Value = model.CreateTime;
			parameters[1].Value = Guid.NewGuid();
			parameters[2].Value = model.VideoName;
			parameters[3].Value = model.VideoPath;
			parameters[4].Value = model.Position;
			parameters[5].Value = model.IsDelete;

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
		public bool Update(HeqiaoDaoshiCore.Model.Videomark model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Videomark set ");
			strSql.Append("CreateTime=@CreateTime,");
			strSql.Append("VideoName=@VideoName,");
			strSql.Append("VideoPath=@VideoPath,");
			strSql.Append("Position=@Position,");
			strSql.Append("IsDelete=@IsDelete");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@CreateTime", SqlDbType.DateTime),
					new SqlParameter("@VideoName", SqlDbType.NVarChar,50),
					new SqlParameter("@VideoPath", SqlDbType.NVarChar,100),
					new SqlParameter("@Position", SqlDbType.NVarChar,50),
					new SqlParameter("@IsDelete", SqlDbType.Int,4),
					new SqlParameter("@ID", SqlDbType.Int,4),
					new SqlParameter("@VideomarkUUID", SqlDbType.UniqueIdentifier,16)};
			parameters[0].Value = model.CreateTime;
			parameters[1].Value = model.VideoName;
			parameters[2].Value = model.VideoPath;
			parameters[3].Value = model.Position;
			parameters[4].Value = model.IsDelete;
			parameters[5].Value = model.ID;
			parameters[6].Value = model.VideomarkUUID;

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
			strSql.Append("delete from Videomark ");
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
		public bool Delete(Guid VideomarkUUID,int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Videomark ");
			strSql.Append(" where VideomarkUUID=@VideomarkUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@VideomarkUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = VideomarkUUID;
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
		/// ����ɾ������
		/// </summary>
		public bool DeleteList(string IDlist )
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Videomark ");
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
		public HeqiaoDaoshiCore.Model.Videomark GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 ID,CreateTime,VideomarkUUID,VideoName,VideoPath,Position,IsDelete from Videomark ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.Videomark model=new HeqiaoDaoshiCore.Model.Videomark();
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
		public HeqiaoDaoshiCore.Model.Videomark DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.Videomark model=new HeqiaoDaoshiCore.Model.Videomark();
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
				if(row["VideomarkUUID"]!=null && row["VideomarkUUID"].ToString()!="")
				{
					model.VideomarkUUID= new Guid(row["VideomarkUUID"].ToString());
				}
				if(row["VideoName"]!=null)
				{
					model.VideoName=row["VideoName"].ToString();
				}
				if(row["VideoPath"]!=null)
				{
					model.VideoPath=row["VideoPath"].ToString();
				}
				if(row["Position"]!=null)
				{
					model.Position=row["Position"].ToString();
				}
				if(row["IsDelete"]!=null && row["IsDelete"].ToString()!="")
				{
					model.IsDelete=int.Parse(row["IsDelete"].ToString());
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
			strSql.Append("select ID,CreateTime,VideomarkUUID,VideoName,VideoPath,Position,IsDelete ");
			strSql.Append(" FROM Videomark ");
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
			strSql.Append(" ID,CreateTime,VideomarkUUID,VideoName,VideoPath,Position,IsDelete ");
			strSql.Append(" FROM Videomark ");
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
			strSql.Append("select count(1) FROM Videomark ");
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
			strSql.Append(")AS Row, T.*  from Videomark T ");
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
			parameters[0].Value = "Videomark";
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

