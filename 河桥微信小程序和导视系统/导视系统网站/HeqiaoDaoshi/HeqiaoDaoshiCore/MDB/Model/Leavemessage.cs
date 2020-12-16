using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// ÁôÑÔ½¨Òé
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
		/// ÓÃ»§id
		/// </summary>
		public Guid UserUUID
		{
			set{ _useruuid=value;}
			get{return _useruuid;}
		}
		/// <summary>
		/// ÁôÑÔÄÚÈİ
		/// </summary>
		public string Content
		{
			set{ _content=value;}
			get{return _content;}
		}
		/// <summary>
		/// ÁôÑÔÊ±¼ä
		/// </summary>
		public string Createtime
		{
			set{ _createtime=value;}
			get{return _createtime;}
		}
		/// <summary>
		/// ÊÇ·ñÉ¾³ı(0:Î´É¾³ı,1:É¾³ı)
		/// </summary>
		public string Isdelete
		{
			set{ _isdelete=value;}
			get{return _isdelete;}
		}
		#endregion Model

	}
}

