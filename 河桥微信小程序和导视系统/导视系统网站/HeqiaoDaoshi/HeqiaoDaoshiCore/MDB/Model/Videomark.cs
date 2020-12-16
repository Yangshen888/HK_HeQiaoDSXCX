using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 语音导览
	/// </summary>
	[Serializable]
	public partial class Videomark
	{
		public Videomark()
		{}
		#region Model
		private int _id;
		private DateTime? _createtime= DateTime.Now;
		private Guid _videomarkuuid;
		private string _videoname;
		private string _videopath;
		private string _position;
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
		public Guid VideomarkUUID
		{
			set{ _videomarkuuid=value;}
			get{return _videomarkuuid;}
		}
		/// <summary>
		/// 名称
		/// </summary>
		public string VideoName
		{
			set{ _videoname=value;}
			get{return _videoname;}
		}
		/// <summary>
		/// 路径
		/// </summary>
		public string VideoPath
		{
			set{ _videopath=value;}
			get{return _videopath;}
		}
		/// <summary>
		/// 经纬度
		/// </summary>
		public string Position
		{
			set{ _position=value;}
			get{return _position;}
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

