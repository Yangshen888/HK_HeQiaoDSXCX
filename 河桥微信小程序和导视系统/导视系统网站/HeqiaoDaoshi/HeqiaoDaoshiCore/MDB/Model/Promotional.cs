using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// ������Ƶ��
	/// </summary>
	[Serializable]
	public partial class Promotional
	{
		public Promotional()
		{}
		#region Model
		private Guid _promotionaluuid;
		private int _id;
		private int? _isdeleted;
		private string _staues;
		private string _title;
		private string _promotionalcontent;
		private string _video;
		private string _addpeople;
		private string _addtime;
		/// <summary>
		/// 
		/// </summary>
		public Guid PromotionalUuid
		{
			set{ _promotionaluuid=value;}
			get{return _promotionaluuid;}
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
		public int? Isdeleted
		{
			set{ _isdeleted=value;}
			get{return _isdeleted;}
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
		/// ��Ƶ����
		/// </summary>
		public string Title
		{
			set{ _title=value;}
			get{return _title;}
		}
		/// <summary>
		/// ��Ƶ����
		/// </summary>
		public string PromotionalContent
		{
			set{ _promotionalcontent=value;}
			get{return _promotionalcontent;}
		}
		/// <summary>
		/// ��Ƶ·��
		/// </summary>
		public string Video
		{
			set{ _video=value;}
			get{return _video;}
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
		#endregion Model

	}
}

