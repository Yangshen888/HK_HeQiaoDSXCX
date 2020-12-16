using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 打卡排名表
	/// </summary>
	[Serializable]
	public partial class AttractRanking
	{
		public AttractRanking()
		{}
		#region Model
		private int _id;
		private Guid _attractrankinguuid;
		private Guid _useruuid;
		private Guid _sceientuuid;
		private string _picture;
		private int? _state;
		private string _evaluate;
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
		public Guid AttractRankingUuid
		{
			set{ _attractrankinguuid=value;}
			get{return _attractrankinguuid;}
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
		#endregion Model

	}
}

