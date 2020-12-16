using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// �����豸��Ϣ����
	/// </summary>
	[Serializable]
	public partial class Pointer
	{
		public Pointer()
		{}
		#region Model
		private Guid _pointeruuid;
		private int _id;
		private int? _isdelete;
		private string _pointernum;
		private string _pointername;
		private string _lon;
		private string _lat;
		private string _address;
		/// <summary>
		/// 
		/// </summary>
		public Guid PointerUuid
		{
			set{ _pointeruuid=value;}
			get{return _pointeruuid;}
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
		/// 0.δɾ 1.��ɾ
		/// </summary>
		public int? IsDelete
		{
			set{ _isdelete=value;}
			get{return _isdelete;}
		}
		/// <summary>
		/// �豸���
		/// </summary>
		public string PointerNum
		{
			set{ _pointernum=value;}
			get{return _pointernum;}
		}
		/// <summary>
		/// �豸����
		/// </summary>
		public string PointerName
		{
			set{ _pointername=value;}
			get{return _pointername;}
		}
		/// <summary>
		/// ����
		/// </summary>
		public string Lon
		{
			set{ _lon=value;}
			get{return _lon;}
		}
		/// <summary>
		/// γ��
		/// </summary>
		public string Lat
		{
			set{ _lat=value;}
			get{return _lat;}
		}
		/// <summary>
		/// ������ַ
		/// </summary>
		public string Address
		{
			set{ _address=value;}
			get{return _address;}
		}
		#endregion Model

	}
}

