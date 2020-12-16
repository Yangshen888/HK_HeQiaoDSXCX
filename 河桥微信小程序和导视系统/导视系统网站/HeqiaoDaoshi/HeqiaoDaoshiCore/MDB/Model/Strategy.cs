using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// ���Է�����
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
		/// �û�UUID
		/// </summary>
		public Guid SystemUserUUID
		{
			set{ _systemuseruuid=value;}
			get{return _systemuseruuid;}
		}
		/// <summary>
		/// ���Ա���
		/// </summary>
		public string Title
		{
			set{ _title=value;}
			get{return _title;}
		}
		/// <summary>
		/// ��������
		/// </summary>
		public string StrategyContent
		{
			set{ _strategycontent=value;}
			get{return _strategycontent;}
		}
		/// <summary>
		/// ͼƬ·��
		/// </summary>
		public string PhotoUrl
		{
			set{ _photourl=value;}
			get{return _photourl;}
		}
		/// <summary>
		/// �����
		/// </summary>
		public string AddPeople
		{
			set{ _addpeople=value;}
			get{return _addpeople;}
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
		/// ���״̬ 0,δ���  1.�����
		/// </summary>
		public int? AuditStaues
		{
			set{ _auditstaues=value;}
			get{return _auditstaues;}
		}
		/// <summary>
		/// ͨ��״̬ 0,ͨ��  1.��ͨ�� 2.��δ���
		/// </summary>
		public int? ThroughStaues
		{
			set{ _throughstaues=value;}
			get{return _throughstaues;}
		}
		/// <summary>
		/// 1.���� 2.�Լ�·��
		/// </summary>
		public int? TipsType
		{
			set{ _tipstype=value;}
			get{return _tipstype;}
		}
		/// <summary>
		/// �������
		/// </summary>
		public int? Count
		{
			set{ _count=value;}
			get{return _count;}
		}
		/// <summary>
		/// �������� 1.������   2.�ܱ���
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

