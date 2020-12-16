using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 标识管理
	/// </summary>
	[Serializable]
	public partial class Mark
	{
		public Mark()
		{}
		#region Model
		private int _id;
		private DateTime? _createtime= DateTime.Now;
		private Guid _markuuid;
		private string _markname;
		private string _markpicture;
		private int? _isdelete;
		/// <summary>
		/// 
		/// </summary>
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? CreateTime
		{
			set{ _createtime=value;}
			get{return _createtime;}
		}
		/// <summary>
		/// 
		/// </summary>
		public Guid MarkUUID
		{
			set{ _markuuid=value;}
			get{return _markuuid;}
		}
		/// <summary>
		/// 标识名称
		/// </summary>
		public string MarkName
		{
			set{ _markname=value;}
			get{return _markname;}
		}
		/// <summary>
		/// 标识图片
		/// </summary>
		public string MarkPicture
		{
			set{ _markpicture=value;}
			get{return _markpicture;}
		}
		/// <summary>
		/// 0.未删 1.已删
		/// </summary>
		public int? IsDelete
		{
			set{ _isdelete=value;}
			get{return _isdelete;}
		}
		#endregion Model

	}
}

