using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 全局搜索表
	/// </summary>
	[Serializable]
	public partial class searchl
	{
		public searchl()
		{}
		#region Model
		private Guid _guid;
		private string _text;
		private string _url;
		/// <summary>
		/// 
		/// </summary>
		public Guid guid
		{
			set{ _guid=value;}
			get{return _guid;}
		}
		/// <summary>
		/// 关键词
		/// </summary>
		public string text
		{
			set{ _text=value;}
			get{return _text;}
		}
		/// <summary>
		/// 跳转地址
		/// </summary>
		public string url
		{
			set{ _url=value;}
			get{return _url;}
		}
		#endregion Model

	}
}

