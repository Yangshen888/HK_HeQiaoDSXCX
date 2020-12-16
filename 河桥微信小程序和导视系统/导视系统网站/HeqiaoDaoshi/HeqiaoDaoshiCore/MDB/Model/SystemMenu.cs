using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// ²Ëµ¥±í
	/// </summary>
	[Serializable]
	public partial class SystemMenu
	{
		public SystemMenu()
		{}
		#region Model
		private Guid _systemmenuuuid;
		private string _name;
		private string _url;
		private string _alias;
		private string _icon;
		private Guid _parentguid;
		private string _parentname;
		private int? _level;
		private string _description;
		private int? _sort;
		private int? _status;
		private int? _isdeleted;
		private int? _isdefaultrouter;
		private string _createdon;
		private Guid _createdbyuserguid;
		private string _createdbyusername;
		private string _modifiedon;
		private Guid _modifiedbyuserguid;
		private string _modifiedbyusername;
		private string _component;
		private int? _hideinmenu;
		private int? _notcache;
		private string _beforeclosefun;
		private int _id;
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
		public string Url
		{
			set{ _url=value;}
			get{return _url;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Alias
		{
			set{ _alias=value;}
			get{return _alias;}
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
		public Guid ParentGuid
		{
			set{ _parentguid=value;}
			get{return _parentguid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string ParentName
		{
			set{ _parentname=value;}
			get{return _parentname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? Level
		{
			set{ _level=value;}
			get{return _level;}
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
		public int? Sort
		{
			set{ _sort=value;}
			get{return _sort;}
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
		public int? IsDefaultRouter
		{
			set{ _isdefaultrouter=value;}
			get{return _isdefaultrouter;}
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
		public string Component
		{
			set{ _component=value;}
			get{return _component;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? HideInMenu
		{
			set{ _hideinmenu=value;}
			get{return _hideinmenu;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? NotCache
		{
			set{ _notcache=value;}
			get{return _notcache;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string BeforeCloseFun
		{
			set{ _beforeclosefun=value;}
			get{return _beforeclosefun;}
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

