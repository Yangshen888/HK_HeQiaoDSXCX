using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// ���ݷ�����:Treasurerecord
	/// </summary>
	public partial class Treasurerecord
	{
		public Treasurerecord()
		{}
		#region  BasicMethod

		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		public bool Exists(Guid TreasurerecordUUID)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Treasurerecord");
			strSql.Append(" where TreasurerecordUUID=@TreasurerecordUUID ");
			SqlParameter[] parameters = {
					new SqlParameter("@TreasurerecordUUID", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = TreasurerecordUUID;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// ����һ������
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.Treasurerecord model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Treasurerecord(");
			strSql.Append("TreasurerecordUUID,UserUUID,Content,Createtime)");
			strSql.Append(" values (");
			strSql.Append("@TreasurerecordUUID,@UserUUID,@Content,@Createtime)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@TreasurerecordUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@UserUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Content", SqlDbType.NVarChar,255),
					new SqlParameter("@Createtime", SqlDbType.NVarChar,255)};
			parameters[0].Value = Guid.NewGuid();
			parameters[1].Value = Guid.NewGuid();
			parameters[2].Value = model.Content;
			parameters[3].Value = model.Createtime;

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
		public bool Update(HeqiaoDaoshiCore.Model.Treasurerecord model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Treasurerecord set ");
			strSql.Append("UserUUID=@UserUUID,");
			strSql.Append("Content=@Content,");
			strSql.Append("Createtime=@Createtime");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@UserUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Content", SqlDbType.NVarChar,255),
					new SqlParameter("@Createtime", SqlDbType.NVarChar,255),
					new SqlParameter("@TreasurerecordUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)};
			parameters[0].Value = model.UserUUID;
			parameters[1].Value = model.Content;
			parameters[2].Value = model.Createtime;
			parameters[3].Value = model.TreasurerecordUUID;
			parameters[4].Value = model.ID;

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
			strSql.Append("delete from Treasurerecord ");
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
		public bool Delete(Guid TreasurerecordUUID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Treasurerecord ");
			strSql.Append(" where TreasurerecordUUID=@TreasurerecordUUID ");
			SqlParameter[] parameters = {
					new SqlParameter("@TreasurerecordUUID", SqlDbType.UniqueIdentifier,16)			};
			parameters[0].Value = TreasurerecordUUID;

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
			strSql.Append("delete from Treasurerecord ");
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
		public HeqiaoDaoshiCore.Model.Treasurerecord GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 TreasurerecordUUID,ID,UserUUID,Content,Createtime from Treasurerecord ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.Treasurerecord model=new HeqiaoDaoshiCore.Model.Treasurerecord();
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
		public HeqiaoDaoshiCore.Model.Treasurerecord DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.Treasurerecord model=new HeqiaoDaoshiCore.Model.Treasurerecord();
			if (row != null)
			{
				if(row["TreasurerecordUUID"]!=null && row["TreasurerecordUUID"].ToString()!="")
				{
					model.TreasurerecordUUID= new Guid(row["TreasurerecordUUID"].ToString());
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
			}
			return model;
		}

		/// <summary>
		/// ��������б�
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select TreasurerecordUUID,ID,UserUUID,Content,Createtime ");
			strSql.Append(" FROM Treasurerecord ");
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
			strSql.Append(" TreasurerecordUUID,ID,UserUUID,Content,Createtime ");
			strSql.Append(" FROM Treasurerecord ");
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
			strSql.Append("select count(1) FROM Treasurerecord ");
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
			strSql.Append(")AS Row, T.*  from Treasurerecord T ");
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
			parameters[0].Value = "Treasurerecord";
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

