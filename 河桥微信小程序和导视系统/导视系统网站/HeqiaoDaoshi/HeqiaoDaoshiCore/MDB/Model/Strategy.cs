using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 攻略发布表
	/// </summary>
	[Serializable]
	public partial class Strategy
	{
		public Strategy()
		{}
		#region Model
		private Guid _strategyuuid;
		private int _id;
		private int? _isdelete;
		private string _staues;
		private Guid _systemuseruuid;
		private string _title;
		private string _strategycontent;
		private string _photourl;
		private string _addpeople;
		private string _addtime;
		private int? _auditstaues;
		private int? _throughstaues;
		private int? _tipstype;
		private int? _count;
		private string _ytype;
		private string _playtype;
		/// <summary>
		/// 
		/// </summary>
		public Guid StrategyUuid
		{
			set{ _strategyuuid=value;}
			get{return _strategyuuid;}
		}
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
		public int? Isdelete
		{
			set{ _isdelete=value;}
			get{return _isdelete;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Staues
		{
			set{ _staues=value;}
			get{return _staues;}
		}
		/// <summary>
		/// 用户UUID
		/// </summary>
		public Guid SystemUserUUID
		{
			set{ _systemuseruuid=value;}
			get{return _systemuseruuid;}
		}
		/// <summary>
		/// 攻略标题
		/// </summary>
		public string Title
		{
			set{ _title=value;}
			get{return _title;}
		}
		/// <summary>
		/// 攻略内容
		/// </summary>
		public string StrategyContent
		{
			set{ _strategycontent=value;}
			get{return _strategycontent;}
		}
		/// <summary>
		/// 图片路径
		/// </summary>
		public string PhotoUrl
		{
			set{ _photourl=value;}
			get{return _photourl;}
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
		public string AddTime
		{
			set{ _addtime=value;}
			get{return _addtime;}
		}
		/// <summary>
		/// 审核状态 0,未审核  1.已审核
		/// </summary>
		public int? AuditStaues
		{
			set{ _auditstaues=value;}
			get{return _auditstaues;}
		}
		/// <summary>
		/// 通过状态 0,通过  1.不通过 2.暂未审核
		/// </summary>
		public int? ThroughStaues
		{
			set{ _throughstaues=value;}
			get{return _throughstaues;}
		}
		/// <summary>
		/// 1.攻略 2.自驾路线
		/// </summary>
		public int? TipsType
		{
			set{ _tipstype=value;}
			get{return _tipstype;}
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
		/// 游玩类型 1.古镇游   2.周边游
		/// </summary>
		public string ytype
		{
			set{ _ytype=value;}
			get{return _ytype;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string PlayType
		{
			set{ _playtype=value;}
			get{return _playtype;}
		}
		#endregion Model

	}
}

