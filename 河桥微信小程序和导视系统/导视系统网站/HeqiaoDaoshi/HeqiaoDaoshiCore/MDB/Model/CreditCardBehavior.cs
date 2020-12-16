using System;
namespace Haikan.LabSystemCore.Model
{
	/// <summary>
	/// 刷卡行为表
	/// </summary>
	[Serializable]
	public partial class CreditCardBehavior
	{
		public CreditCardBehavior()
		{}
		#region Model
		private int _id;
		private string _cardno;
		private string _deviceid;
		private string _addtime;
		private int? _projectid;
		/// <summary>
		/// 自增ID,主键
		/// </summary>
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 卡号ID
		/// </summary>
		public string CardNo
		{
			set{ _cardno=value;}
			get{return _cardno;}
		}
		/// <summary>
		/// 设备编号ID
		/// </summary>
		public string DeviceID
		{
			set{ _deviceid=value;}
			get{return _deviceid;}
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
		/// 项目ID
		/// </summary>
		public int? ProjectID
		{
			set{ _projectid=value;}
			get{return _projectid;}
		}
		#endregion Model

	}
}

