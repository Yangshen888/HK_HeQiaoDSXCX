using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 打卡记录表
	/// </summary>
	[Serializable]
	public partial class Attractions
	{
		public Attractions()
		{}
		#region Model
		private int _id;
		private Guid _attractionsuuid;
		private Guid _useruuid;
		private Guid _sceientuuid;
		private string _picture;
		private int? _state;
		private string _evaluate;
		private string _addtime;
		private int? _praise;
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
		public Guid AttractionsUuid
		{
			set{ _attractionsuuid=value;}
			get{return _attractionsuuid;}
		}
		/// <summary>
		/// 用户Uuid
		/// </summary>
		public Guid UserUuid
		{
			set{ _useruuid=value;}
			get{return _useruuid;}
		}
		/// <summary>
		/// 景点Uuid
		/// </summary>
		public Guid SceientUuid
		{
			set{ _sceientuuid=value;}
			get{return _sceientuuid;}
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
		/// 状态
		/// </summary>
		public int? State
		{
			set{ _state=value;}
			get{return _state;}
		}
		/// <summary>
		/// 评价
		/// </summary>
		public string Evaluate
		{
			set{ _evaluate=value;}
			get{return _evaluate;}
		}
		/// <summary>
		/// 评价时间
		/// </summary>
		public string AddTime
		{
			set{ _addtime=value;}
			get{return _addtime;}
		}
		/// <summary>
		/// 点赞量
		/// </summary>
		public int? Praise
		{
			set{ _praise=value;}
			get{return _praise;}
		}
		#endregion Model

	}
}

