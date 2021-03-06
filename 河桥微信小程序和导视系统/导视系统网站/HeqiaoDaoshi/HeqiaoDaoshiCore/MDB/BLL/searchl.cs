using Haikan.DataTools;
using System;
using System.Data;
using System.Collections.Generic;
using HeqiaoDaoshiCore.Model;
namespace HeqiaoDaoshiCore.BLL
{
	/// <summary>
	/// 全局搜索表
	/// </summary>
	public partial class searchl
	{
		private readonly HeqiaoDaoshiCore.DAL.searchl dal=new HeqiaoDaoshiCore.DAL.searchl();
		public searchl()
		{}
		#region  BasicMethod
		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid guid)
		{
			return dal.Exists(guid);
		}

		/// <summary>
		/// 增加一条数据
		/// </summary>
		public bool Add(HeqiaoDaoshiCore.Model.searchl model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(HeqiaoDaoshiCore.Model.searchl model)
		{
			return dal.Update(model);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete(Guid guid)
		{
			
			return dal.Delete(guid);
		}
		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool DeleteList(string guidlist )
		{
			return dal.DeleteList(PageValidate.SafeLongFilter(guidlist,0) );
		}

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public HeqiaoDaoshiCore.Model.searchl GetModel(Guid guid)
		{
			
			return dal.GetModel(guid);
		}

		/// <summary>
		/// 得到一个对象实体，从缓存中
		/// </summary>
		public HeqiaoDaoshiCore.Model.searchl GetModelByCache(Guid guid)
		{
			
			string CacheKey = "searchlModel-" + guid;
			object objModel = DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(guid);
					if (objModel != null)
					{
						int ModelCache = ConfigHelper.GetConfigInt("ModelCache");
						DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (HeqiaoDaoshiCore.Model.searchl)objModel;
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
		public List<HeqiaoDaoshiCore.Model.searchl> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// 获得数据列表
		/// </summary>
		public List<HeqiaoDaoshiCore.Model.searchl> DataTableToList(DataTable dt)
		{
			List<HeqiaoDaoshiCore.Model.searchl> modelList = new List<HeqiaoDaoshiCore.Model.searchl>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				HeqiaoDaoshiCore.Model.searchl model;
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

