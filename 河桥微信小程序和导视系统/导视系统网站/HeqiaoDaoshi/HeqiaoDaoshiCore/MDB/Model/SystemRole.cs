using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 角色表
	/// </summary>
	[Serializable]
	public partial class SystemRole
	{
		public SystemRole()
		{}
		#region Model
		private Guid _systemroleuuid;
		private string _rolename;
		private string _addtime;
		private string _addpeople;
		private int? _isdeleted;
		private int _id;
		private int? _isfixation=0;
		private Guid _schooluuid;
		private int? _iscreedu=0;
		/// <summary>
		/// 
		/// </summary>
		public Guid SystemRoleUUID
		{
			set{ _systemroleuuid=value;}
			get{return _systemroleuuid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string RoleName
		{
			set{ _rolename=value;}
			get{return _rolename;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string AddTime
		{
			set{ _addtime=value;}
			get{return _addtime;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string AddPeople
		{
			set{ _addpeople=value;}
			get{return _addpeople;}
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
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 是否内置  0否,1是
		/// </summary>
		public int? IsFixation
		{
			set{ _isfixation=value;}
			get{return _isfixation;}
		}
		/// <summary>
		/// 
		/// </summary>
		public Guid SchoolUUID
		{
			set{ _schooluuid=value;}
			get{return _schooluuid;}
		}
		/// <summary>
		/// 是否由管理者创建
		/// </summary>
		public int? IsCreEdu
		{
			set{ _iscreedu=value;}
			get{return _iscreedu;}
		}
		#endregion Model

	}
}

