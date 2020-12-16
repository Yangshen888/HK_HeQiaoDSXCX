using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace Haikan.LabSystemCore.DAL
{
	/// <summary>
	/// 数据访问类:Teacher
	/// </summary>
	public partial class Teacher
	{
		public Teacher()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSql.GetMaxId("id", "Teacher"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int id)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Teacher");
			strSql.Append(" where id=@id");
			SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)
			};
			parameters[0].Value = id;

			return DbHelperSql.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(Haikan.LabSystemCore.Model.Teacher model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Teacher(");
			strSql.Append("teacherName,sex,photo,jobPosition,jobTitles,discipline,office,mobile,email,teacherdetail,username,userpassword,isaudite,teachernum,roleid,lasttime,linestate,college,teachercard,classes,PushID,TeachType,tezhengma)");
			strSql.Append(" values (");
			strSql.Append("@teacherName,@sex,@photo,@jobPosition,@jobTitles,@discipline,@office,@mobile,@email,@teacherdetail,@username,@userpassword,@isaudite,@teachernum,@roleid,@lasttime,@linestate,@college,@teachercard,@classes,@PushID,@TeachType,@tezhengma)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@teacherName", SqlDbType.NVarChar,50),
					new SqlParameter("@sex", SqlDbType.NVarChar,50),
					new SqlParameter("@photo", SqlDbType.NVarChar,250),
					new SqlParameter("@jobPosition", SqlDbType.Int,4),
					new SqlParameter("@jobTitles", SqlDbType.VarChar,50),
					new SqlParameter("@discipline", SqlDbType.VarChar,50),
					new SqlParameter("@office", SqlDbType.VarChar,100),
					new SqlParameter("@mobile", SqlDbType.VarChar,13),
					new SqlParameter("@email", SqlDbType.VarChar,50),
					new SqlParameter("@teacherdetail", SqlDbType.Text),
					new SqlParameter("@username", SqlDbType.NVarChar,50),
					new SqlParameter("@userpassword", SqlDbType.NVarChar,50),
					new SqlParameter("@isaudite", SqlDbType.NVarChar,50),
					new SqlParameter("@teachernum", SqlDbType.NVarChar,50),
					new SqlParameter("@roleid", SqlDbType.Int,4),
					new SqlParameter("@lasttime", SqlDbType.DateTime),
					new SqlParameter("@linestate", SqlDbType.NVarChar,10),
					new SqlParameter("@college", SqlDbType.VarChar,100),
					new SqlParameter("@teachercard", SqlDbType.NVarChar,50),
					new SqlParameter("@classes", SqlDbType.NVarChar,50),
					new SqlParameter("@PushID", SqlDbType.NVarChar,50),
					new SqlParameter("@TeachType", SqlDbType.VarChar,255),
					new SqlParameter("@tezhengma", SqlDbType.VarChar,255)};
			parameters[0].Value = model.teacherName;
			parameters[1].Value = model.sex;
			parameters[2].Value = model.photo;
			parameters[3].Value = model.jobPosition;
			parameters[4].Value = model.jobTitles;
			parameters[5].Value = model.discipline;
			parameters[6].Value = model.office;
			parameters[7].Value = model.mobile;
			parameters[8].Value = model.email;
			parameters[9].Value = model.teacherdetail;
			parameters[10].Value = model.username;
			parameters[11].Value = model.userpassword;
			parameters[12].Value = model.isaudite;
			parameters[13].Value = model.teachernum;
			parameters[14].Value = model.roleid;
			parameters[15].Value = model.lasttime;
			parameters[16].Value = model.linestate;
			parameters[17].Value = model.college;
			parameters[18].Value = model.teachercard;
			parameters[19].Value = model.classes;
			parameters[20].Value = model.PushID;
			parameters[21].Value = model.TeachType;
			parameters[22].Value = model.tezhengma;

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
		public bool Update(Haikan.LabSystemCore.Model.Teacher model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Teacher set ");
			strSql.Append("teacherName=@teacherName,");
			strSql.Append("sex=@sex,");
			strSql.Append("photo=@photo,");
			strSql.Append("jobPosition=@jobPosition,");
			strSql.Append("jobTitles=@jobTitles,");
			strSql.Append("discipline=@discipline,");
			strSql.Append("office=@office,");
			strSql.Append("mobile=@mobile,");
			strSql.Append("email=@email,");
			strSql.Append("teacherdetail=@teacherdetail,");
			strSql.Append("username=@username,");
			strSql.Append("userpassword=@userpassword,");
			strSql.Append("isaudite=@isaudite,");
			strSql.Append("teachernum=@teachernum,");
			strSql.Append("roleid=@roleid,");
			strSql.Append("lasttime=@lasttime,");
			strSql.Append("linestate=@linestate,");
			strSql.Append("college=@college,");
			strSql.Append("teachercard=@teachercard,");
			strSql.Append("classes=@classes,");
			strSql.Append("PushID=@PushID,");
			strSql.Append("TeachType=@TeachType,");
			strSql.Append("tezhengma=@tezhengma");
			strSql.Append(" where id=@id");
			SqlParameter[] parameters = {
					new SqlParameter("@teacherName", SqlDbType.NVarChar,50),
					new SqlParameter("@sex", SqlDbType.NVarChar,50),
					new SqlParameter("@photo", SqlDbType.NVarChar,250),
					new SqlParameter("@jobPosition", SqlDbType.Int,4),
					new SqlParameter("@jobTitles", SqlDbType.VarChar,50),
					new SqlParameter("@discipline", SqlDbType.VarChar,50),
					new SqlParameter("@office", SqlDbType.VarChar,100),
					new SqlParameter("@mobile", SqlDbType.VarChar,13),
					new SqlParameter("@email", SqlDbType.VarChar,50),
					new SqlParameter("@teacherdetail", SqlDbType.Text),
					new SqlParameter("@username", SqlDbType.NVarChar,50),
					new SqlParameter("@userpassword", SqlDbType.NVarChar,50),
					new SqlParameter("@isaudite", SqlDbType.NVarChar,50),
					new SqlParameter("@teachernum", SqlDbType.NVarChar,50),
					new SqlParameter("@roleid", SqlDbType.Int,4),
					new SqlParameter("@lasttime", SqlDbType.DateTime),
					new SqlParameter("@linestate", SqlDbType.NVarChar,10),
					new SqlParameter("@college", SqlDbType.VarChar,100),
					new SqlParameter("@teachercard", SqlDbType.NVarChar,50),
					new SqlParameter("@classes", SqlDbType.NVarChar,50),
					new SqlParameter("@PushID", SqlDbType.NVarChar,50),
					new SqlParameter("@TeachType", SqlDbType.VarChar,255),
					new SqlParameter("@tezhengma", SqlDbType.VarChar,255),
					new SqlParameter("@id", SqlDbType.Int,4)};
			parameters[0].Value = model.teacherName;
			parameters[1].Value = model.sex;
			parameters[2].Value = model.photo;
			parameters[3].Value = model.jobPosition;
			parameters[4].Value = model.jobTitles;
			parameters[5].Value = model.discipline;
			parameters[6].Value = model.office;
			parameters[7].Value = model.mobile;
			parameters[8].Value = model.email;
			parameters[9].Value = model.teacherdetail;
			parameters[10].Value = model.username;
			parameters[11].Value = model.userpassword;
			parameters[12].Value = model.isaudite;
			parameters[13].Value = model.teachernum;
			parameters[14].Value = model.roleid;
			parameters[15].Value = model.lasttime;
			parameters[16].Value = model.linestate;
			parameters[17].Value = model.college;
			parameters[18].Value = model.teachercard;
			parameters[19].Value = model.classes;
			parameters[20].Value = model.PushID;
			parameters[21].Value = model.TeachType;
			parameters[22].Value = model.tezhengma;
			parameters[23].Value = model.id;

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
		public bool Delete(int id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Teacher ");
			strSql.Append(" where id=@id");
			SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)
			};
			parameters[0].Value = id;

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
		public bool DeleteList(string idlist )
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Teacher ");
			strSql.Append(" where id in ("+idlist + ")  ");
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
		public Haikan.LabSystemCore.Model.Teacher GetModel(int id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 id,teacherName,sex,photo,jobPosition,jobTitles,discipline,office,mobile,email,teacherdetail,username,userpassword,isaudite,teachernum,roleid,lasttime,linestate,college,teachercard,classes,PushID,TeachType,tezhengma from Teacher ");
			strSql.Append(" where id=@id");
			SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)
			};
			parameters[0].Value = id;

			Haikan.LabSystemCore.Model.Teacher model=new Haikan.LabSystemCore.Model.Teacher();
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
		public Haikan.LabSystemCore.Model.Teacher DataRowToModel(DataRow row)
		{
			Haikan.LabSystemCore.Model.Teacher model=new Haikan.LabSystemCore.Model.Teacher();
			if (row != null)
			{
				if(row["id"]!=null && row["id"].ToString()!="")
				{
					model.id=int.Parse(row["id"].ToString());
				}
				if(row["teacherName"]!=null)
				{
					model.teacherName=row["teacherName"].ToString();
				}
				if(row["sex"]!=null)
				{
					model.sex=row["sex"].ToString();
				}
				if(row["photo"]!=null)
				{
					model.photo=row["photo"].ToString();
				}
				if(row["jobPosition"]!=null && row["jobPosition"].ToString()!="")
				{
					model.jobPosition=int.Parse(row["jobPosition"].ToString());
				}
				if(row["jobTitles"]!=null)
				{
					model.jobTitles=row["jobTitles"].ToString();
				}
				if(row["discipline"]!=null)
				{
					model.discipline=row["discipline"].ToString();
				}
				if(row["office"]!=null)
				{
					model.office=row["office"].ToString();
				}
				if(row["mobile"]!=null)
				{
					model.mobile=row["mobile"].ToString();
				}
				if(row["email"]!=null)
				{
					model.email=row["email"].ToString();
				}
				if(row["teacherdetail"]!=null)
				{
					model.teacherdetail=row["teacherdetail"].ToString();
				}
				if(row["username"]!=null)
				{
					model.username=row["username"].ToString();
				}
				if(row["userpassword"]!=null)
				{
					model.userpassword=row["userpassword"].ToString();
				}
				if(row["isaudite"]!=null)
				{
					model.isaudite=row["isaudite"].ToString();
				}
				if(row["teachernum"]!=null)
				{
					model.teachernum=row["teachernum"].ToString();
				}
				if(row["roleid"]!=null && row["roleid"].ToString()!="")
				{
					model.roleid=int.Parse(row["roleid"].ToString());
				}
				if(row["lasttime"]!=null && row["lasttime"].ToString()!="")
				{
					model.lasttime=DateTime.Parse(row["lasttime"].ToString());
				}
				if(row["linestate"]!=null)
				{
					model.linestate=row["linestate"].ToString();
				}
				if(row["college"]!=null)
				{
					model.college=row["college"].ToString();
				}
				if(row["teachercard"]!=null)
				{
					model.teachercard=row["teachercard"].ToString();
				}
				if(row["classes"]!=null)
				{
					model.classes=row["classes"].ToString();
				}
				if(row["PushID"]!=null)
				{
					model.PushID=row["PushID"].ToString();
				}
				if(row["TeachType"]!=null)
				{
					model.TeachType=row["TeachType"].ToString();
				}
				if(row["tezhengma"]!=null)
				{
					model.tezhengma=row["tezhengma"].ToString();
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
			strSql.Append("select id,teacherName,sex,photo,jobPosition,jobTitles,discipline,office,mobile,email,teacherdetail,username,userpassword,isaudite,teachernum,roleid,lasttime,linestate,college,teachercard,classes,PushID,TeachType,tezhengma ");
			strSql.Append(" FROM Teacher ");
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
			strSql.Append(" id,teacherName,sex,photo,jobPosition,jobTitles,discipline,office,mobile,email,teacherdetail,username,userpassword,isaudite,teachernum,roleid,lasttime,linestate,college,teachercard,classes,PushID,TeachType,tezhengma ");
			strSql.Append(" FROM Teacher ");
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
			strSql.Append("select count(1) FROM Teacher ");
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
				strSql.Append("order by T.id desc");
			}
			strSql.Append(")AS Row, T.*  from Teacher T ");
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
			parameters[0].Value = "Teacher";
			parameters[1].Value = "id";
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

