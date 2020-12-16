using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// �οͷ�����ѯ
	/// </summary>
	[Serializable]
	public partial class Consult
	{
		public Consult()
		{}
		#region Model
		private int _id;
		private Guid _consultuuid;
		private string _phonename;
		private string _phone;
		private string _releasetime;
		private int? _releasestate;
		private int? _isdeleted=0;
		private string _addtime;
		private string _addpeople;
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
		public Guid ConsultUUID
		{
			set{ _consultuuid=value;}
			get{return _consultuuid;}
		}
		/// <summary>
		/// �绰����
		/// </summary>
		public string PhoneName
		{
			set{ _phonename=value;}
			get{return _phonename;}
		}
		/// <summary>
		/// �绰����
		/// </summary>
		public string Phone
		{
			set{ _phone=value;}
			get{return _phone;}
		}
		/// <summary>
		/// ����ʱ��
		/// </summary>
		public string ReleaseTime
		{
			set{ _releasetime=value;}
			get{return _releasetime;}
		}
		/// <summary>
		/// ����״̬
		/// </summary>
		public int? ReleaseState
		{
			set{ _releasestate=value;}
			get{return _releasestate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? IsDeleted
		{
			set{ _isdeleted=value;}
			get{return _isdeleted;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string AddTime
		{
			set{ _addtime=value;}
			get{return _addtime;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string AddPeople
		{
			set{ _addpeople=value;}
			get{return _addpeople;}
		}
		#endregion Model

	}
}

