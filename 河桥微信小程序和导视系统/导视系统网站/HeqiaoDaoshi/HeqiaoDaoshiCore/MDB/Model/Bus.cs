using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 公交路线
	/// </summary>
	[Serializable]
	public partial class Bus
	{
		public Bus()
		{}
		#region Model
		private int _id;
		private DateTime? _createtime= DateTime.Now;
		private Guid _busuuid;
		private string _name;
		private string _passsite;
		private string _introduction;
		private string _address;
		private string _picture;
		private int? _state;
		private int? _isdelete;
		private string _begaintime;
		private string _endtime;
		private string _begainsite;
		private string _endsite;
		private string _type;
		/// <summary>
		/// 
		/// </summary>
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 发布时间
		/// </summary>
		public DateTime? CreateTime
		{
			set{ _createtime=value;}
			get{return _createtime;}
		}
		/// <summary>
		/// 
		/// </summary>
		public Guid BusUuid
		{
			set{ _busuuid=value;}
			get{return _busuuid;}
		}
		/// <summary>
		/// 公交线路名称
		/// </summary>
		public string Name
		{
			set{ _name=value;}
			get{return _name;}
		}
		/// <summary>
		/// 站点名称
		/// </summary>
		public string PassSite
		{
			set{ _passsite=value;}
			get{return _passsite;}
		}
		/// <summary>
		/// 线路介绍
		/// </summary>
		public string Introduction
		{
			set{ _introduction=value;}
			get{return _introduction;}
		}
		/// <summary>
		/// 所处位置
		/// </summary>
		public string Address
		{
			set{ _address=value;}
			get{return _address;}
		}
		/// <summary>
		/// 图片
		/// </summary>
		public string Picture
		{
			set{ _picture=value;}
			get{return _picture;}
		}
		/// <summary>
		/// 0.保存中 1.已发布
		/// </summary>
		public int? State
		{
			set{ _state=value;}
			get{return _state;}
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
		/// 起始时间
		/// </summary>
		public string BegainTime
		{
			set{ _begaintime=value;}
			get{return _begaintime;}
		}
		/// <summary>
		/// 末班时间
		/// </summary>
		public string EndTime
		{
			set{ _endtime=value;}
			get{return _endtime;}
		}
		/// <summary>
		/// 起始站
		/// </summary>
		public string BegainSite
		{
			set{ _begainsite=value;}
			get{return _begainsite;}
		}
		/// <summary>
		/// 终点站
		/// </summary>
		public string EndSite
		{
			set{ _endsite=value;}
			get{return _endsite;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string type
		{
			set{ _type=value;}
			get{return _type;}
		}
		#endregion Model

	}
}

