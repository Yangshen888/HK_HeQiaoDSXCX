using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// ��ͼ��ʶ
	/// </summary>
	[Serializable]
	public partial class Mapmark
	{
		public Mapmark()
		{}
		#region Model
		private int _id;
		private DateTime? _createtime= DateTime.Now;
		private Guid _mapmarkuuid;
		private Guid _markuuid;
		private string _position;
		private int? _isdelete;
		private string _introduce;
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
		public Guid MapmarkUUID
		{
			set{ _mapmarkuuid=value;}
			get{return _mapmarkuuid;}
		}
		/// <summary>
		/// ��ʶuuid
		/// </summary>
		public Guid MarkUUID
		{
			set{ _markuuid=value;}
			get{return _markuuid;}
		}
		/// <summary>
		/// ��γ��
		/// </summary>
		public string Position
		{
			set{ _position=value;}
			get{return _position;}
		}
		/// <summary>
		/// 0.δɾ 1.��ɾ
		/// </summary>
		public int? IsDelete
		{
			set{ _isdelete=value;}
			get{return _isdelete;}
		}
		/// <summary>
		/// ����
		/// </summary>
		public string Introduce
		{
			set{ _introduce=value;}
			get{return _introduce;}
		}
		#endregion Model

	}
}

