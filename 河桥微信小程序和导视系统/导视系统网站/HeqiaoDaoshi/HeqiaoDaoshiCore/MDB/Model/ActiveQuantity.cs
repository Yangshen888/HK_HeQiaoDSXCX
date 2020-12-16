using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 活跃数据
	/// </summary>
	[Serializable]
	public partial class ActiveQuantity
	{
		public ActiveQuantity()
		{}
		#region Model
		private int _id;
		private DateTime? _createtime= DateTime.Now;
		private Guid _activequantityuuid;
		private string _addtime;
		private int? _num;
		private int? _type;
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
		public Guid ActiveQuantityUUID
		{
			set{ _activequantityuuid=value;}
			get{return _activequantityuuid;}
		}
		/// <summary>
		/// 时间 年-月-日
		/// </summary>
		public string AddTime
		{
			set{ _addtime=value;}
			get{return _addtime;}
		}
		/// <summary>
		/// 人数
		/// </summary>
		public int? Num
		{
			set{ _num=value;}
			get{return _num;}
		}
		/// <summary>
		/// 类型 1.新增用户 2.登录用户
		/// </summary>
		public int? Type
		{
			set{ _type=value;}
			get{return _type;}
		}
		#endregion Model

	}
}

