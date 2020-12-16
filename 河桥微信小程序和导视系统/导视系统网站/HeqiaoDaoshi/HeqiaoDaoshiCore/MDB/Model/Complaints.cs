using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// Ͷ�߹���
	/// </summary>
	[Serializable]
	public partial class Complaints
	{
		public Complaints()
		{}
		#region Model
		private int _id;
		private DateTime? _createtime= DateTime.Now;
		private Guid _complaintsuuid;
		private string _comcontent;
		private string _picture;
		private Guid _addpeople;
		private int? _state;
		private string _replycontent;
		private DateTime? _replytime;
		private string _replypeople;
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
		public Guid ComplaintsUUID
		{
			set{ _complaintsuuid=value;}
			get{return _complaintsuuid;}
		}
		/// <summary>
		/// ����
		/// </summary>
		public string Comcontent
		{
			set{ _comcontent=value;}
			get{return _comcontent;}
		}
		/// <summary>
		/// ͼƬ
		/// </summary>
		public string Picture
		{
			set{ _picture=value;}
			get{return _picture;}
		}
		/// <summary>
		/// �����
		/// </summary>
		public Guid AddPeople
		{
			set{ _addpeople=value;}
			get{return _addpeople;}
		}
		/// <summary>
		/// 0.δ�ظ� 1.�ѻظ�
		/// </summary>
		public int? State
		{
			set{ _state=value;}
			get{return _state;}
		}
		/// <summary>
		/// �ظ�����
		/// </summary>
		public string ReplyContent
		{
			set{ _replycontent=value;}
			get{return _replycontent;}
		}
		/// <summary>
		/// �ظ�ʱ��
		/// </summary>
		public DateTime? ReplyTime
		{
			set{ _replytime=value;}
			get{return _replytime;}
		}
		/// <summary>
		/// �ظ���
		/// </summary>
		public string ReplyPeople
		{
			set{ _replypeople=value;}
			get{return _replypeople;}
		}
		#endregion Model

	}
}

