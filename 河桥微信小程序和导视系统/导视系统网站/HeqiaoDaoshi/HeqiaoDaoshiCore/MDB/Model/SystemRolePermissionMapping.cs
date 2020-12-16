using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 角色权限关系
	/// </summary>
	[Serializable]
	public partial class SystemRolePermissionMapping
	{
		public SystemRolePermissionMapping()
		{}
		#region Model
		private Guid _systemroleuuid;
		private Guid _systempermissionuuid;
		private string _addtime;
		private string _addpeople;
		private int _id;
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
		public Guid SystemPermissionUUID
		{
			set{ _systempermissionuuid=value;}
			get{return _systempermissionuuid;}
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
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		#endregion Model

	}
}

