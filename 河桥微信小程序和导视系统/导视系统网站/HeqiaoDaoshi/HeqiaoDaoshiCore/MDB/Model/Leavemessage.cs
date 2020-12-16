using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// ���Խ���
	/// </summary>
	[Serializable]
	public partial class Leavemessage
	{
		public Leavemessage()
		{}
		#region Model
		private Guid _leavemessageuuid;
		private int _id;
		private Guid _useruuid;
		private string _content;
		private string _createtime;
		private string _isdelete;
		/// <summary>
		/// 
		/// </summary>
		public Guid LeavemessageUUID
		{
			set{ _leavemessageuuid=value;}
			get{return _leavemessageuuid;}
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
		/// �û�id
		/// </summary>
		public Guid UserUUID
		{
			set{ _useruuid=value;}
			get{return _useruuid;}
		}
		/// <summary>
		/// ��������
		/// </summary>
		public string Content
		{
			set{ _content=value;}
			get{return _content;}
		}
		/// <summary>
		/// ����ʱ��
		/// </summary>
		public string Createtime
		{
			set{ _createtime=value;}
			get{return _createtime;}
		}
		/// <summary>
		/// �Ƿ�ɾ��(0:δɾ��,1:ɾ��)
		/// </summary>
		public string Isdelete
		{
			set{ _isdelete=value;}
			get{return _isdelete;}
		}
		#endregion Model

	}
}

