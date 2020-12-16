using Haikan.DataTools;
using System;
using System.Data;
using System.Collections.Generic;
using HeqiaoDaoshiCore.Model;
namespace HeqiaoDaoshiCore.BLL
{
	/// <summary>
	/// ���Խ���
	/// </summary>
	public partial class Leavemessage
	{
		private readonly HeqiaoDaoshiCore.DAL.Leavemessage dal=new HeqiaoDaoshiCore.DAL.Leavemessage();
		public Leavemessage()
		{}
		#region  BasicMethod
		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		public bool Exists(Guid LeavemessageUUID)
		{
			return dal.Exists(LeavemessageUUID);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public int  Add(HeqiaoDaoshiCore.Model.Leavemessage model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public bool Update(HeqiaoDaoshiCore.Model.Leavemessage model)
		{
			return dal.Update(model);
		}

		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public bool Delete(int ID)
		{
			
			return dal.Delete(ID);
		}
		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public bool Delete(Guid LeavemessageUUID)
		{
			
			return dal.Delete(LeavemessageUUID);
		}
		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public bool DeleteList(string IDlist )
		{
			return dal.DeleteList(PageValidate.SafeLongFilter(IDlist,0) );
		}

		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		public HeqiaoDaoshiCore.Model.Leavemessage GetModel(int ID)
		{
			
			return dal.GetModel(ID);
		}

		/// <summary>
		/// �õ�һ������ʵ�壬�ӻ�����
		/// </summary>
		public HeqiaoDaoshiCore.Model.Leavemessage GetModelByCache(int ID)
		{
			
			string CacheKey = "LeavemessageModel-" + ID;
			object objModel = DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(ID);
					if (objModel != null)
					{
						int ModelCache = ConfigHelper.GetConfigInt("ModelCache");
						DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (HeqiaoDaoshiCore.Model.Leavemessage)objModel;
		}

		/// <summary>
		/// ��������б�
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			return dal.GetList(strWhere);
		}
		/// <summary>
		/// ���ǰ��������
		/// </summary>
		public DataSet GetList(int Top,string strWhere,string filedOrder)
		{
			return dal.GetList(Top,strWhere,filedOrder);
		}
		/// <summary>
		/// ��������б�
		/// </summary>
		public List<HeqiaoDaoshiCore.Model.Leavemessage> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// ��������б�
		/// </summary>
		public List<HeqiaoDaoshiCore.Model.Leavemessage> DataTableToList(DataTable dt)
		{
			List<HeqiaoDaoshiCore.Model.Leavemessage> modelList = new List<HeqiaoDaoshiCore.Model.Leavemessage>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				HeqiaoDaoshiCore.Model.Leavemessage model;
				for (int n = 0; n < rowsCount; n++)
				{
					model = dal.DataRowToModel(dt.Rows[n]);
					if (model != null)
					{
						modelList.Add(model);
					}
				}
			}
			return modelList;
		}

		/// <summary>
		/// ��������б�
		/// </summary>
		public DataSet GetAllList()
		{
			return GetList("");
		}

		/// <summary>
		/// ��ҳ��ȡ�����б�
		/// </summary>
		public int GetRecordCount(string strWhere)
		{
			return dal.GetRecordCount(strWhere);
		}
		/// <summary>
		/// ��ҳ��ȡ�����б�
		/// </summary>
		public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
		{
			return dal.GetListByPage( strWhere,  orderby,  startIndex,  endIndex);
		}
		/// <summary>
		/// ��ҳ��ȡ�����б�
		/// </summary>
		//public DataSet GetList(int PageSize,int PageIndex,string strWhere)
		//{
			//return dal.GetList(PageSize,PageIndex,strWhere);
		//}

		#endregion  BasicMethod
		#region  ExtensionMethod

		#endregion  ExtensionMethod
	}
}

