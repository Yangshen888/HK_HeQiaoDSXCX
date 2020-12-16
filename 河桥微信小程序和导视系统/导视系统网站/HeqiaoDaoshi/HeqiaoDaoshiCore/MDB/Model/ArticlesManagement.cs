using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 文章管理表
	/// </summary>
	[Serializable]
	public partial class ArticlesManagement
	{
		public ArticlesManagement()
		{}
		#region Model
		private int _id;
		private string _articletitle;
		private Guid _articletypeuuid;
		private string _releasetime;
		private int? _isdelete;
		private int? _isrelease;
		private Guid _articleuuid;
		private string _coverphoto;
		private string _articlename;
		private string _addpeople;
		private DateTime? _addtime;
		private int? _count;
		private bool _isrecommend= false;
		/// <summary>
		/// 
		/// </summary>
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 文章标题
		/// </summary>
		public string ArticleTitle
		{
			set{ _articletitle=value;}
			get{return _articletitle;}
		}
		/// <summary>
		/// 文章分类UUID
		/// </summary>
		public Guid ArticleTypeUUID
		{
			set{ _articletypeuuid=value;}
			get{return _articletypeuuid;}
		}
		/// <summary>
		/// 发布时间
		/// </summary>
		public string ReleaseTime
		{
			set{ _releasetime=value;}
			get{return _releasetime;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? IsDelete
		{
			set{ _isdelete=value;}
			get{return _isdelete;}
		}
		/// <summary>
		/// 是否发布0-未发布,1-发布
		/// </summary>
		public int? IsRelease
		{
			set{ _isrelease=value;}
			get{return _isrelease;}
		}
		/// <summary>
		/// 
		/// </summary>
		public Guid ArticleUUID
		{
			set{ _articleuuid=value;}
			get{return _articleuuid;}
		}
		/// <summary>
		/// 封面图片
		/// </summary>
		public string CoverPhoto
		{
			set{ _coverphoto=value;}
			get{return _coverphoto;}
		}
		/// <summary>
		/// 文章内容
		/// </summary>
		public string ArticleName
		{
			set{ _articlename=value;}
			get{return _articlename;}
		}
		/// <summary>
		/// 添加人
		/// </summary>
		public string AddPeople
		{
			set{ _addpeople=value;}
			get{return _addpeople;}
		}
		/// <summary>
		/// 添加时间
		/// </summary>
		public DateTime? AddTime
		{
			set{ _addtime=value;}
			get{return _addtime;}
		}
		/// <summary>
		/// 浏览次数
		/// </summary>
		public int? Count
		{
			set{ _count=value;}
			get{return _count;}
		}
		/// <summary>
		/// 是否推荐  0否  1是
		/// </summary>
		public bool IsRecommend
		{
			set{ _isrecommend=value;}
			get{return _isrecommend;}
		}
		#endregion Model

	}
}

