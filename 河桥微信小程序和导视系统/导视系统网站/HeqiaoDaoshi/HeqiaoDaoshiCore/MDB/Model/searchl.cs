using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// ȫ��������
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
		/// �ؼ���
		/// </summary>
		public string text
		{
			set{ _text=value;}
			get{return _text;}
		}
		/// <summary>
		/// ��ת��ַ
		/// </summary>
		public string url
		{
			set{ _url=value;}
			get{return _url;}
		}
		#endregion Model

	}
}

