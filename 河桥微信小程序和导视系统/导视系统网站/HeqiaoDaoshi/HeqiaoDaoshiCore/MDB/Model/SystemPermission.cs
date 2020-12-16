using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// È¨ÏÞ±í
	/// </summary>
	[Serializable]
	public partial class SystemPermission
	{
		public SystemPermission()
		{}
		#region Model
		private Guid _systempermissionuuid;
		private Guid _systemmenuuuid;
		private string _name;
		private string _actioncode;
		private string _icon;
		private string _description;
		private int? _status;
		private int? _isdeleted;
		private int? _type;
		private Guid _createdbyuserguid;
		private string _createdon;
		private string _createdbyusername;
		private string _modifiedon;
		private Guid _modifiedbyuserguid;
		private string _modifiedbyusername;
		private string _capower;
		private int _id;
		/// <summary>
		/// 
		/// </summary>
		public Guid SystemPermissionUUID
		{
			set{ _systempermissionuuid=value;}
			get{return _systempermissionuuid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public Guid SystemMenuUUID
		{
			set{ _systemmenuuuid=value;}
			get{return _systemmenuuuid;}
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
		public string ActionCode
		{
			set{ _actioncode=value;}
			get{return _actioncode;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Icon
		{
			set{ _icon=value;}
			get{return _icon;}
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
		public int? Status
		{
			set{ _status=value;}
			get{return _status;}
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
		/// 
		/// </summary>
		public int? Type
		{
			set{ _type=value;}
			get{return _type;}
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
		public string CreatedOn
		{
			set{ _createdon=value;}
			get{return _createdon;}
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
		public string ModifiedOn
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
		public string CaPower
		{
			set{ _capower=value;}
			get{return _capower;}
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

