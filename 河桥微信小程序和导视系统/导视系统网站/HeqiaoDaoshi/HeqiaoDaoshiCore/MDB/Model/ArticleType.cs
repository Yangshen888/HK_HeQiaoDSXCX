using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 文章类型表
	/// </summary>
	[Serializable]
	public partial class ArticleType
	{
		public ArticleType()
		{}
		#region Model
		private int _id;
		private string _name;
		private Guid _articletypeuuid;
		private int? _isdeleted;
		private DateTime? _createtime;
		/// <summary>
		/// 
		/// </summary>
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 类型名称
		/// </summary>
		public string Name
		{
			set{ _name=value;}
			get{return _name;}
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
		/// 
		/// </summary>
		public int? IsDeleted
		{
			set{ _isdeleted=value;}
			get{return _isdeleted;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? CreateTime
		{
			set{ _createtime=value;}
			get{return _createtime;}
		}
		#endregion Model

	}
}

