namespace HaiKanTravelManagementSystem.Api.Configurations
{
    /// <summary>
    /// 程序配置选项
    /// </summary>
    public class AppSettings
    {
        /// <summary>
        /// 是否是体验版
        /// </summary>
        public bool IsTrialVersion { get; set; }
    }

    /// <summary>
    /// 数据库配置项
    /// </summary>
    public class ConnectionStrings
    {
        /// <summary>
        /// 数据库默认连接字符串
        /// </summary>
        public string DefaultConnection { get; set; }
    }
}
