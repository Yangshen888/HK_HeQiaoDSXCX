using Haikan.DataTools;
using System;
using System.Data;
using System.Collections.Generic;
using HeqiaoDaoshiCore.Model;
namespace HeqiaoDaoshiCore.BLL
{
	/// <summary>
	/// 图标
	/// </summary>
	public partial class SystemIcon
	{
		private readonly HeqiaoDaoshiCore.DAL.SystemIcon dal=new HeqiaoDaoshiCore.DAL.SystemIcon();
		public SystemIcon()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
			return dal.GetMaxId();
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid SystemIconUUID,int ID)
		{
			return dal.Exists(SystemIconUUID,ID);
		}

		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int  Add(HeqiaoDaoshiCore.Model.SystemIcon model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(HeqiaoDaoshiCore.Model.SystemIcon model)
		{
			return dal.Update(model);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete(int ID)
		{
			
			return dal.Delete(ID);
		}
		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete(Guid SystemIconUUID,int ID)
		{
			
			return dal.Delete(SystemIconUUID,ID);
		}
		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool DeleteList(string IDlist )
		{
			return dal.DeleteList(PageValidate.SafeLongFilter(IDlist,0) );
		}

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public HeqiaoDaoshiCore.Model.SystemIcon GetModel(int ID)
		{
			
			return dal.GetModel(ID);
		}

		/// <summary>
		/// 得到一个对象实体，从缓存中
		/// </summary>
		public HeqiaoDaoshiCore.Model.SystemIcon GetModelByCache(int ID)
		{
			
			string CacheKey = "SystemIconModel-" + ID;
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
			return (HeqiaoDaoshiCore.Model.SystemIcon)objModel;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			return dal.GetList(strWhere);
		}
		/// <summary>
		/// 获得前几行数据
		/// </summary>
		public DataSet GetList(int Top,string strWhere,string filedOrder)
		{
			return dal.GetList(Top,strWhere,filedOrder);
		}
		/// <summary>
		/// 获得数据列表
		/// </summary>
		public List<HeqiaoDaoshiCore.Model.SystemIcon> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// 获得数据列表
		/// </summary>
		public List<HeqiaoDaoshiCore.Model.SystemIcon> DataTableToList(DataTable dt)
		{
			List<HeqiaoDaoshiCore.Model.SystemIcon> modelList = new List<HeqiaoDaoshiCore.Model.SystemIcon>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				HeqiaoDaoshiCore.Model.SystemIcon model;
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
		/// 获得数据列表
		/// </summary>
		public DataSet GetAllList()
		{
			return GetList("");
		}

		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public int GetRecordCount(string strWhere)
		{
			return dal.GetRecordCount(strWhere);
		}
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
		{
			return dal.GetListByPage( strWhere,  orderby,  startIndex,  endIndex);
		}
		/// <summary>
		/// 分页获取数据列表
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

