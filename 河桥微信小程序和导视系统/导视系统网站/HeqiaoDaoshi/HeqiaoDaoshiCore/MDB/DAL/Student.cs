using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Haikan.DBHelper;
namespace Haikan.LabSystemCore.DAL
{
	/// <summary>
	/// 数据访问类:Student
	/// </summary>
	public partial class Student
	{
		public Student()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSql.GetMaxId("id", "Student"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int id)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Student");
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
		public int Add(Haikan.LabSystemCore.Model.Student model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Student(");
			strSql.Append("stuid,classid,stuname,sex,phone,belong,inschool,birthday,username,userpassword,type,isaudite,roleid,photo,lasttime,linestate,Email,teachers,studentcard,core,classes,SecondTeacher,StudentType,date,tezhengma)");
			strSql.Append(" values (");
			strSql.Append("@stuid,@classid,@stuname,@sex,@phone,@belong,@inschool,@birthday,@username,@userpassword,@type,@isaudite,@roleid,@photo,@lasttime,@linestate,@Email,@teachers,@studentcard,@core,@classes,@SecondTeacher,@StudentType,@date,@tezhengma)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@stuid", SqlDbType.VarChar,50),
					new SqlParameter("@classid", SqlDbType.Int,4),
					new SqlParameter("@stuname", SqlDbType.NVarChar,50),
					new SqlParameter("@sex", SqlDbType.NVarChar,50),
					new SqlParameter("@phone", SqlDbType.VarChar,50),
					new SqlParameter("@belong", SqlDbType.NVarChar,50),
					new SqlParameter("@inschool", SqlDbType.DateTime),
					new SqlParameter("@birthday", SqlDbType.DateTime),
					new SqlParameter("@username", SqlDbType.NVarChar,50),
					new SqlParameter("@userpassword", SqlDbType.NVarChar,50),
					new SqlParameter("@type", SqlDbType.NVarChar,50),
					new SqlParameter("@isaudite", SqlDbType.NChar,10),
					new SqlParameter("@roleid", SqlDbType.Int,4),
					new SqlParameter("@photo", SqlDbType.NVarChar,50),
					new SqlParameter("@lasttime", SqlDbType.Date,3),
					new SqlParameter("@linestate", SqlDbType.NVarChar,20),
					new SqlParameter("@Email", SqlDbType.VarChar,20),
					new SqlParameter("@teachers", SqlDbType.VarChar,20),
					new SqlParameter("@studentcard", SqlDbType.NVarChar,50),
					new SqlParameter("@core", SqlDbType.NVarChar,50),
					new SqlParameter("@classes", SqlDbType.NVarChar,50),
					new SqlParameter("@SecondTeacher", SqlDbType.VarChar,255),
					new SqlParameter("@StudentType", SqlDbType.VarChar,255),
					new SqlParameter("@date", SqlDbType.DateTime2,8),
					new SqlParameter("@tezhengma", SqlDbType.VarChar,255)};
			parameters[0].Value = model.stuid;
			parameters[1].Value = model.classid;
			parameters[2].Value = model.stuname;
			parameters[3].Value = model.sex;
			parameters[4].Value = model.phone;
			parameters[5].Value = model.belong;
			parameters[6].Value = model.inschool;
			parameters[7].Value = model.birthday;
			parameters[8].Value = model.username;
			parameters[9].Value = model.userpassword;
			parameters[10].Value = model.type;
			parameters[11].Value = model.isaudite;
			parameters[12].Value = model.roleid;
			parameters[13].Value = model.photo;
			parameters[14].Value = model.lasttime;
			parameters[15].Value = model.linestate;
			parameters[16].Value = model.Email;
			parameters[17].Value = model.teachers;
			parameters[18].Value = model.studentcard;
			parameters[19].Value = model.core;
			parameters[20].Value = model.classes;
			parameters[21].Value = model.SecondTeacher;
			parameters[22].Value = model.StudentType;
			parameters[23].Value = model.date;
			parameters[24].Value = model.tezhengma;

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
		public bool Update(Haikan.LabSystemCore.Model.Student model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Student set ");
			strSql.Append("stuid=@stuid,");
			strSql.Append("classid=@classid,");
			strSql.Append("stuname=@stuname,");
			strSql.Append("sex=@sex,");
			strSql.Append("phone=@phone,");
			strSql.Append("belong=@belong,");
			strSql.Append("inschool=@inschool,");
			strSql.Append("birthday=@birthday,");
			strSql.Append("username=@username,");
			strSql.Append("userpassword=@userpassword,");
			strSql.Append("type=@type,");
			strSql.Append("isaudite=@isaudite,");
			strSql.Append("roleid=@roleid,");
			strSql.Append("photo=@photo,");
			strSql.Append("lasttime=@lasttime,");
			strSql.Append("linestate=@linestate,");
			strSql.Append("Email=@Email,");
			strSql.Append("teachers=@teachers,");
			strSql.Append("studentcard=@studentcard,");
			strSql.Append("core=@core,");
			strSql.Append("classes=@classes,");
			strSql.Append("SecondTeacher=@SecondTeacher,");
			strSql.Append("StudentType=@StudentType,");
			strSql.Append("date=@date,");
			strSql.Append("tezhengma=@tezhengma");
			strSql.Append(" where id=@id");
			SqlParameter[] parameters = {
					new SqlParameter("@stuid", SqlDbType.VarChar,50),
					new SqlParameter("@classid", SqlDbType.Int,4),
					new SqlParameter("@stuname", SqlDbType.NVarChar,50),
					new SqlParameter("@sex", SqlDbType.NVarChar,50),
					new SqlParameter("@phone", SqlDbType.VarChar,50),
					new SqlParameter("@belong", SqlDbType.NVarChar,50),
					new SqlParameter("@inschool", SqlDbType.DateTime),
					new SqlParameter("@birthday", SqlDbType.DateTime),
					new SqlParameter("@username", SqlDbType.NVarChar,50),
					new SqlParameter("@userpassword", SqlDbType.NVarChar,50),
					new SqlParameter("@type", SqlDbType.NVarChar,50),
					new SqlParameter("@isaudite", SqlDbType.NChar,10),
					new SqlParameter("@roleid", SqlDbType.Int,4),
					new SqlParameter("@photo", SqlDbType.NVarChar,50),
					new SqlParameter("@lasttime", SqlDbType.Date,3),
					new SqlParameter("@linestate", SqlDbType.NVarChar,20),
					new SqlParameter("@Email", SqlDbType.VarChar,20),
					new SqlParameter("@teachers", SqlDbType.VarChar,20),
					new SqlParameter("@studentcard", SqlDbType.NVarChar,50),
					new SqlParameter("@core", SqlDbType.NVarChar,50),
					new SqlParameter("@classes", SqlDbType.NVarChar,50),
					new SqlParameter("@SecondTeacher", SqlDbType.VarChar,255),
					new SqlParameter("@StudentType", SqlDbType.VarChar,255),
					new SqlParameter("@date", SqlDbType.DateTime2,8),
					new SqlParameter("@tezhengma", SqlDbType.VarChar,255),
					new SqlParameter("@id", SqlDbType.Int,4)};
			parameters[0].Value = model.stuid;
			parameters[1].Value = model.classid;
			parameters[2].Value = model.stuname;
			parameters[3].Value = model.sex;
			parameters[4].Value = model.phone;
			parameters[5].Value = model.belong;
			parameters[6].Value = model.inschool;
			parameters[7].Value = model.birthday;
			parameters[8].Value = model.username;
			parameters[9].Value = model.userpassword;
			parameters[10].Value = model.type;
			parameters[11].Value = model.isaudite;
			parameters[12].Value = model.roleid;
			parameters[13].Value = model.photo;
			parameters[14].Value = model.lasttime;
			parameters[15].Value = model.linestate;
			parameters[16].Value = model.Email;
			parameters[17].Value = model.teachers;
			parameters[18].Value = model.studentcard;
			parameters[19].Value = model.core;
			parameters[20].Value = model.classes;
			parameters[21].Value = model.SecondTeacher;
			parameters[22].Value = model.StudentType;
			parameters[23].Value = model.date;
			parameters[24].Value = model.tezhengma;
			parameters[25].Value = model.id;

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
			strSql.Append("delete from Student ");
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
			strSql.Append("delete from Student ");
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
		public Haikan.LabSystemCore.Model.Student GetModel(int id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 id,stuid,classid,stuname,sex,phone,belong,inschool,birthday,username,userpassword,type,isaudite,roleid,photo,lasttime,linestate,Email,teachers,studentcard,core,classes,SecondTeacher,StudentType,date,tezhengma from Student ");
			strSql.Append(" where id=@id");
			SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)
			};
			parameters[0].Value = id;

			Haikan.LabSystemCore.Model.Student model=new Haikan.LabSystemCore.Model.Student();
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
		public Haikan.LabSystemCore.Model.Student DataRowToModel(DataRow row)
		{
			Haikan.LabSystemCore.Model.Student model=new Haikan.LabSystemCore.Model.Student();
			if (row != null)
			{
				if(row["id"]!=null && row["id"].ToString()!="")
				{
					model.id=int.Parse(row["id"].ToString());
				}
				if(row["stuid"]!=null)
				{
					model.stuid=row["stuid"].ToString();
				}
				if(row["classid"]!=null && row["classid"].ToString()!="")
				{
					model.classid=int.Parse(row["classid"].ToString());
				}
				if(row["stuname"]!=null)
				{
					model.stuname=row["stuname"].ToString();
				}
				if(row["sex"]!=null)
				{
					model.sex=row["sex"].ToString();
				}
				if(row["phone"]!=null)
				{
					model.phone=row["phone"].ToString();
				}
				if(row["belong"]!=null)
				{
					model.belong=row["belong"].ToString();
				}
				if(row["inschool"]!=null && row["inschool"].ToString()!="")
				{
					model.inschool=DateTime.Parse(row["inschool"].ToString());
				}
				if(row["birthday"]!=null && row["birthday"].ToString()!="")
				{
					model.birthday=DateTime.Parse(row["birthday"].ToString());
				}
				if(row["username"]!=null)
				{
					model.username=row["username"].ToString();
				}
				if(row["userpassword"]!=null)
				{
					model.userpassword=row["userpassword"].ToString();
				}
				if(row["type"]!=null)
				{
					model.type=row["type"].ToString();
				}
				if(row["isaudite"]!=null)
				{
					model.isaudite=row["isaudite"].ToString();
				}
				if(row["roleid"]!=null && row["roleid"].ToString()!="")
				{
					model.roleid=int.Parse(row["roleid"].ToString());
				}
				if(row["photo"]!=null)
				{
					model.photo=row["photo"].ToString();
				}
				if(row["lasttime"]!=null && row["lasttime"].ToString()!="")
				{
					model.lasttime=DateTime.Parse(row["lasttime"].ToString());
				}
				if(row["linestate"]!=null)
				{
					model.linestate=row["linestate"].ToString();
				}
				if(row["Email"]!=null)
				{
					model.Email=row["Email"].ToString();
				}
				if(row["teachers"]!=null)
				{
					model.teachers=row["teachers"].ToString();
				}
				if(row["studentcard"]!=null)
				{
					model.studentcard=row["studentcard"].ToString();
				}
				if(row["core"]!=null)
				{
					model.core=row["core"].ToString();
				}
				if(row["classes"]!=null)
				{
					model.classes=row["classes"].ToString();
				}
				if(row["SecondTeacher"]!=null)
				{
					model.SecondTeacher=row["SecondTeacher"].ToString();
				}
				if(row["StudentType"]!=null)
				{
					model.StudentType=row["StudentType"].ToString();
				}
				if(row["date"]!=null && row["date"].ToString()!="")
				{
					model.date=DateTime.Parse(row["date"].ToString());
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
			strSql.Append("select id,stuid,classid,stuname,sex,phone,belong,inschool,birthday,username,userpassword,type,isaudite,roleid,photo,lasttime,linestate,Email,teachers,studentcard,core,classes,SecondTeacher,StudentType,date,tezhengma ");
			strSql.Append(" FROM Student ");
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
			strSql.Append(" id,stuid,classid,stuname,sex,phone,belong,inschool,birthday,username,userpassword,type,isaudite,roleid,photo,lasttime,linestate,Email,teachers,studentcard,core,classes,SecondTeacher,StudentType,date,tezhengma ");
			strSql.Append(" FROM Student ");
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
			strSql.Append("select count(1) FROM Student ");
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
			strSql.Append(")AS Row, T.*  from Student T ");
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
			parameters[0].Value = "Student";
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

