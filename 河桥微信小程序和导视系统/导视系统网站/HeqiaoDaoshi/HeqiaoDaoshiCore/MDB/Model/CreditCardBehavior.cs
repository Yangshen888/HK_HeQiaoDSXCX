using System;
namespace Haikan.LabSystemCore.Model
{
	/// <summary>
	/// ˢ����Ϊ��
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
		/// ����ID,����
		/// </summary>
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// ����ID
		/// </summary>
		public string CardNo
		{
			set{ _cardno=value;}
			get{return _cardno;}
		}
		/// <summary>
		/// �豸���ID
		/// </summary>
		public string DeviceID
		{
			set{ _deviceid=value;}
			get{return _deviceid;}
		}
		/// <summary>
		/// ���ʱ��
		/// </summary>
		public string AddTime
		{
			set{ _addtime=value;}
			get{return _addtime;}
		}
		/// <summary>
		/// ��ĿID
		/// </summary>
		public int? ProjectID
		{
			set{ _projectid=value;}
			get{return _projectid;}
		}
		#endregion Model

	}
}

