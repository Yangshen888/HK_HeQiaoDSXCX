using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 宣传类别
	/// </summary>
	[Serializable]
	public partial class PublicityType
	{
		public PublicityType()
		{}
		#region Model
		private int _id;
		private DateTime? _createtime= DateTime.Now;
		private Guid _publicitytypeuuid;
		private string _name;
		private int? _isdeleted;
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
		public Guid PublicityTypeUUID
		{
			set{ _publicitytypeuuid=value;}
			get{return _publicitytypeuuid;}
		}
		/// <summary>
		/// 类型名称
		/// </summary>
		public string Name
		{
			set{ _name=value;}
			get{return _name;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? IsDeleted
		{
			set{ _isdeleted=value;}
			get{return _isdeleted;}
		}
		#endregion Model

	}
}

