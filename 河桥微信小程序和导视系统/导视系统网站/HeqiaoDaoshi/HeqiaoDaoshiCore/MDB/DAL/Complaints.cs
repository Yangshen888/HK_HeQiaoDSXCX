using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace HeqiaoDaoshiCore.DAL
{
	/// <summary>
	/// ���ݷ�����:Complaints
	/// </summary>
	public partial class Complaints
	{
		public Complaints()
		{}
		#region  BasicMethod

		/// <summary>
		/// �õ����ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSql.GetMaxId("ID", "Complaints"); 
		}

		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		public bool Exists(Guid ComplaintsUUID,int ID)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Complaints");
			strSql.Append(" where ComplaintsUUID=@ComplaintsUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@ComplaintsUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = ComplaintsUUID;
			parameters[1].Value = ID;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// ����һ������
		/// </summary>
		public int Add(HeqiaoDaoshiCore.Model.Complaints model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Complaints(");
			strSql.Append("CreateTime,ComplaintsUUID,Comcontent,Picture,AddPeople,State,ReplyContent,ReplyTime,ReplyPeople)");
			strSql.Append(" values (");
			strSql.Append("@CreateTime,@ComplaintsUUID,@Comcontent,@Picture,@AddPeople,@State,@ReplyContent,@ReplyTime,@ReplyPeople)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@CreateTime", SqlDbType.DateTime),
					new SqlParameter("@ComplaintsUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Comcontent", SqlDbType.NVarChar,50),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1),
					new SqlParameter("@AddPeople", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@ReplyContent", SqlDbType.NVarChar,50),
					new SqlParameter("@ReplyTime", SqlDbType.DateTime),
					new SqlParameter("@ReplyPeople", SqlDbType.NVarChar,50)};
			parameters[0].Value = model.CreateTime;
			parameters[1].Value = Guid.NewGuid();
			parameters[2].Value = model.Comcontent;
			parameters[3].Value = model.Picture;
			parameters[4].Value = Guid.NewGuid();
			parameters[5].Value = model.State;
			parameters[6].Value = model.ReplyContent;
			parameters[7].Value = model.ReplyTime;
			parameters[8].Value = model.ReplyPeople;

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
		public bool Update(HeqiaoDaoshiCore.Model.Complaints model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Complaints set ");
			strSql.Append("CreateTime=@CreateTime,");
			strSql.Append("Comcontent=@Comcontent,");
			strSql.Append("Picture=@Picture,");
			strSql.Append("AddPeople=@AddPeople,");
			strSql.Append("State=@State,");
			strSql.Append("ReplyContent=@ReplyContent,");
			strSql.Append("ReplyTime=@ReplyTime,");
			strSql.Append("ReplyPeople=@ReplyPeople");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@CreateTime", SqlDbType.DateTime),
					new SqlParameter("@Comcontent", SqlDbType.NVarChar,50),
					new SqlParameter("@Picture", SqlDbType.NVarChar,-1),
					new SqlParameter("@AddPeople", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@ReplyContent", SqlDbType.NVarChar,50),
					new SqlParameter("@ReplyTime", SqlDbType.DateTime),
					new SqlParameter("@ReplyPeople", SqlDbType.NVarChar,50),
					new SqlParameter("@ID", SqlDbType.Int,4),
					new SqlParameter("@ComplaintsUUID", SqlDbType.UniqueIdentifier,16)};
			parameters[0].Value = model.CreateTime;
			parameters[1].Value = model.Comcontent;
			parameters[2].Value = model.Picture;
			parameters[3].Value = model.AddPeople;
			parameters[4].Value = model.State;
			parameters[5].Value = model.ReplyContent;
			parameters[6].Value = model.ReplyTime;
			parameters[7].Value = model.ReplyPeople;
			parameters[8].Value = model.ID;
			parameters[9].Value = model.ComplaintsUUID;

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
			strSql.Append("delete from Complaints ");
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
		public bool Delete(Guid ComplaintsUUID,int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Complaints ");
			strSql.Append(" where ComplaintsUUID=@ComplaintsUUID and ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@ComplaintsUUID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ID", SqlDbType.Int,4)			};
			parameters[0].Value = ComplaintsUUID;
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
			strSql.Append("delete from Complaints ");
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
		public HeqiaoDaoshiCore.Model.Complaints GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 ID,CreateTime,ComplaintsUUID,Comcontent,Picture,AddPeople,State,ReplyContent,ReplyTime,ReplyPeople from Complaints ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			HeqiaoDaoshiCore.Model.Complaints model=new HeqiaoDaoshiCore.Model.Complaints();
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
		public HeqiaoDaoshiCore.Model.Complaints DataRowToModel(DataRow row)
		{
			HeqiaoDaoshiCore.Model.Complaints model=new HeqiaoDaoshiCore.Model.Complaints();
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
				if(row["ComplaintsUUID"]!=null && row["ComplaintsUUID"].ToString()!="")
				{
					model.ComplaintsUUID= new Guid(row["ComplaintsUUID"].ToString());
				}
				if(row["Comcontent"]!=null)
				{
					model.Comcontent=row["Comcontent"].ToString();
				}
				if(row["Picture"]!=null)
				{
					model.Picture=row["Picture"].ToString();
				}
				if(row["AddPeople"]!=null && row["AddPeople"].ToString()!="")
				{
					model.AddPeople= new Guid(row["AddPeople"].ToString());
				}
				if(row["State"]!=null && row["State"].ToString()!="")
				{
					model.State=int.Parse(row["State"].ToString());
				}
				if(row["ReplyContent"]!=null)
				{
					model.ReplyContent=row["ReplyContent"].ToString();
				}
				if(row["ReplyTime"]!=null && row["ReplyTime"].ToString()!="")
				{
					model.ReplyTime=DateTime.Parse(row["ReplyTime"].ToString());
				}
				if(row["ReplyPeople"]!=null)
				{
					model.ReplyPeople=row["ReplyPeople"].ToString();
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
			strSql.Append("select ID,CreateTime,ComplaintsUUID,Comcontent,Picture,AddPeople,State,ReplyContent,ReplyTime,ReplyPeople ");
			strSql.Append(" FROM Complaints ");
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
			strSql.Append(" ID,CreateTime,ComplaintsUUID,Comcontent,Picture,AddPeople,State,ReplyContent,ReplyTime,ReplyPeople ");
			strSql.Append(" FROM Complaints ");
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
			strSql.Append("select count(1) FROM Complaints ");
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
			strSql.Append(")AS Row, T.*  from Complaints T ");
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
			parameters[0].Value = "Complaints";
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

