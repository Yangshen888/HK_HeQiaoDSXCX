using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 地图标识
	/// </summary>
	[Serializable]
	public partial class Mapmark
	{
		public Mapmark()
		{}
		#region Model
		private int _id;
		private DateTime? _createtime= DateTime.Now;
		private Guid _mapmarkuuid;
		private Guid _markuuid;
		private string _position;
		private int? _isdelete;
		private string _introduce;
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
		public Guid MapmarkUUID
		{
			set{ _mapmarkuuid=value;}
			get{return _mapmarkuuid;}
		}
		/// <summary>
		/// 标识uuid
		/// </summary>
		public Guid MarkUUID
		{
			set{ _markuuid=value;}
			get{return _markuuid;}
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
		/// <summary>
		/// 介绍
		/// </summary>
		public string Introduce
		{
			set{ _introduce=value;}
			get{return _introduce;}
		}
		#endregion Model

	}
}

