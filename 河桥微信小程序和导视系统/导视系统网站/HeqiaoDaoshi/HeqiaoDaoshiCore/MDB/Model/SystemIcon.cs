using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// Í¼±ê
	/// </summary>
	[Serializable]
	public partial class SystemIcon
	{
		public SystemIcon()
		{}
		#region Model
		private Guid _systemiconuuid;
		private string _code;
		private string _size;
		private string _color;
		private string _custom;
		private string _description;
		private int _status;
		private int _isdeleted;
		private DateTime _createdon;
		private Guid _createdbyuserguid;
		private string _createdbyusername;
		private DateTime? _modifiedon;
		private Guid _modifiedbyuserguid;
		private string _modifiedbyusername;
		private int _id;
		/// <summary>
		/// 
		/// </summary>
		public Guid SystemIconUUID
		{
			set{ _systemiconuuid=value;}
			get{return _systemiconuuid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Code
		{
			set{ _code=value;}
			get{return _code;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Size
		{
			set{ _size=value;}
			get{return _size;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Color
		{
			set{ _color=value;}
			get{return _color;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Custom
		{
			set{ _custom=value;}
			get{return _custom;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Description
		{
			set{ _description=value;}
			get{return _description;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int Status
		{
			set{ _status=value;}
			get{return _status;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int IsDeleted
		{
			set{ _isdeleted=value;}
			get{return _isdeleted;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime CreatedOn
		{
			set{ _createdon=value;}
			get{return _createdon;}
		}
		/// <summary>
		/// 
		/// </summary>
		public Guid CreatedByUserGuid
		{
			set{ _createdbyuserguid=value;}
			get{return _createdbyuserguid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string CreatedByUserName
		{
			set{ _createdbyusername=value;}
			get{return _createdbyusername;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? ModifiedOn
		{
			set{ _modifiedon=value;}
			get{return _modifiedon;}
		}
		/// <summary>
		/// 
		/// </summary>
		public Guid ModifiedByUserGuid
		{
			set{ _modifiedbyuserguid=value;}
			get{return _modifiedbyuserguid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string ModifiedByUserName
		{
			set{ _modifiedbyusername=value;}
			get{return _modifiedbyusername;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		#endregion Model

	}
}

