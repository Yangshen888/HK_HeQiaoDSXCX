using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// ������Ƶ
	/// </summary>
	[Serializable]
	public partial class PromotionalVideo
	{
		public PromotionalVideo()
		{}
		#region Model
		private int _id;
		private DateTime? _createtime= DateTime.Now;
		private Guid _promotionalvideouuid;
		private string _title;
		private string _cover;
		private string _video;
		private DateTime? _releasetime;
		private int? _releasestate;
		private DateTime? _addtime;
		private string _addpeople;
		private int? _isdeleted;
		private bool _isrecommend= false;
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
		public Guid PromotionalVideoUUID
		{
			set{ _promotionalvideouuid=value;}
			get{return _promotionalvideouuid;}
		}
		/// <summary>
		/// ����
		/// </summary>
		public string Title
		{
			set{ _title=value;}
			get{return _title;}
		}
		/// <summary>
		/// ����ͼƬ
		/// </summary>
		public string Cover
		{
			set{ _cover=value;}
			get{return _cover;}
		}
		/// <summary>
		/// ��Ƶ
		/// </summary>
		public string Video
		{
			set{ _video=value;}
			get{return _video;}
		}
		/// <summary>
		/// ����ʱ��
		/// </summary>
		public DateTime? ReleaseTime
		{
			set{ _releasetime=value;}
			get{return _releasetime;}
		}
		/// <summary>
		/// 0.δ���� 1.�ѷ���
		/// </summary>
		public int? ReleaseState
		{
			set{ _releasestate=value;}
			get{return _releasestate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? AddTime
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
		/// <summary>
		/// 
		/// </summary>
		public int? IsDeleted
		{
			set{ _isdeleted=value;}
			get{return _isdeleted;}
		}
		/// <summary>
		/// �Ƿ��Ƽ�  0��  1��
		/// </summary>
		public bool IsRecommend
		{
			set{ _isrecommend=value;}
			get{return _isrecommend;}
		}
		#endregion Model

	}
}

