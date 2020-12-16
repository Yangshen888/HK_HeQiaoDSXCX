using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 宝藏记录表
	/// </summary>
	[Serializable]
	public partial class Treasurerecord
	{
		public Treasurerecord()
		{}
		#region Model
		private Guid _treasurerecorduuid;
		private int _id;
		private Guid _useruuid;
		private string _content;
		private string _createtime;
		/// <summary>
		/// 
		/// </summary>
		public Guid TreasurerecordUUID
		{
			set{ _treasurerecorduuid=value;}
			get{return _treasurerecorduuid;}
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
		/// 用户id
		/// </summary>
		public Guid UserUUID
		{
			set{ _useruuid=value;}
			get{return _useruuid;}
		}
		/// <summary>
		/// 宝藏内容
		/// </summary>
		public string Content
		{
			set{ _content=value;}
			get{return _content;}
		}
		/// <summary>
		/// 获取时间
		/// </summary>
		public string Createtime
		{
			set{ _createtime=value;}
			get{return _createtime;}
		}
		#endregion Model

	}
}

