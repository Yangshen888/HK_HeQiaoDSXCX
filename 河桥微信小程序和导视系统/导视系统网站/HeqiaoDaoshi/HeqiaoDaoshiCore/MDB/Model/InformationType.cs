using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 资讯类型
	/// </summary>
	[Serializable]
	public partial class InformationType
	{
		public InformationType()
		{}
		#region Model
		private int _id;
		private DateTime? _createtime= DateTime.Now;
		private Guid _informationtypeuuid;
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
		public Guid InformationTypeUUID
		{
			set{ _informationtypeuuid=value;}
			get{return _informationtypeuuid;}
		}
		/// <summary>
		/// 
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

