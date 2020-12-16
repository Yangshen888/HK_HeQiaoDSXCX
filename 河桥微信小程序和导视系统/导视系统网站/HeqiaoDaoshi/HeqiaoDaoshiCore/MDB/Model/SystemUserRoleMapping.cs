using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 用户角色关系
	/// </summary>
	[Serializable]
	public partial class SystemUserRoleMapping
	{
		public SystemUserRoleMapping()
		{}
		#region Model
		private Guid _systemuseruuid;
		private Guid _systemroleuuid;
		private string _addtime;
		private string _addpeople;
		private int _id;
		/// <summary>
		/// 
		/// </summary>
		public Guid SystemUserUUID
		{
			set{ _systemuseruuid=value;}
			get{return _systemuseruuid;}
		}
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

