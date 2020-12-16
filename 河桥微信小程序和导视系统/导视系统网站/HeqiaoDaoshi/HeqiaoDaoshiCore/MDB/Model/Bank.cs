using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 银行信息表
	/// </summary>
	[Serializable]
	public partial class Bank
	{
		public Bank()
		{}
		#region Model
		private Guid _bankuuid;
		private int _id;
		private int? _isdeleted;
		private string _bankname;
		private string _bankaddress;
		private string _lon;
		private string _lat;
		private string _staues;
		private string _telephone;
		private string _remark;
		private string _remarkone;
		private string _remarktwo;
		private string _picture;
		private string _addtime;
		private string _addpeople;
		/// <summary>
		/// 
		/// </summary>
		public Guid BankUuid
		{
			set{ _bankuuid=value;}
			get{return _bankuuid;}
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
		public int? IsDeleted
		{
			set{ _isdeleted=value;}
			get{return _isdeleted;}
		}
		/// <summary>
		/// 名称
		/// </summary>
		public string BankName
		{
			set{ _bankname=value;}
			get{return _bankname;}
		}
		/// <summary>
		/// 位置
		/// </summary>
		public string BankAddress
		{
			set{ _bankaddress=value;}
			get{return _bankaddress;}
		}
		/// <summary>
		/// 经度
		/// </summary>
		public string Lon
		{
			set{ _lon=value;}
			get{return _lon;}
		}
		/// <summary>
		/// 纬度
		/// </summary>
		public string Lat
		{
			set{ _lat=value;}
			get{return _lat;}
		}
		/// <summary>
		/// 使用情况
		/// </summary>
		public string Staues
		{
			set{ _staues=value;}
			get{return _staues;}
		}
		/// <summary>
		/// 联系电话
		/// </summary>
		public string Telephone
		{
			set{ _telephone=value;}
			get{return _telephone;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Remark
		{
			set{ _remark=value;}
			get{return _remark;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string RemarkOne
		{
			set{ _remarkone=value;}
			get{return _remarkone;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string RemarkTwo
		{
			set{ _remarktwo=value;}
			get{return _remarktwo;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Picture
		{
			set{ _picture=value;}
			get{return _picture;}
		}
		/// <summary>
		/// 注册时间
		/// </summary>
		public string AddTime
		{
			set{ _addtime=value;}
			get{return _addtime;}
		}
		/// <summary>
		/// 添加人
		/// </summary>
		public string AddPeople
		{
			set{ _addpeople=value;}
			get{return _addpeople;}
		}
		#endregion Model

	}
}

