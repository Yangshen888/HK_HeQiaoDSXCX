using System.IO;
using HaiKanTravelManagementSystem.Api.Configurations;
using Microsoft.Extensions.Configuration;

namespace HaiKanTravelManagementSystem.Api.Extensions
{
    /// <summary>
    /// 配置文件管理器
    /// </summary>
    public static class ConfigurationManager
    {
        /// <summary>
        /// 
        /// </summary>
        public static IConfiguration Configuration { get; }
        static ConfigurationManager()
        {
            Configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json")
                .Build();
        }

        /// <summary>
        /// 读取配置文件[AppSettings]节点数据
        /// </summary>
        public static AppSettings AppSettings
        {
            get
            {
                var appSettings =new AppSettings();
                Configuration.GetSection("AppSettings").Bind(appSettings);
                return appSettings;
            }
        }


        /// <summary>
        /// 读取配置文件[ConnectionStrings]
        /// </summary>
        public static ConnectionStrings ConnectionStrings
        {
            get
            {
                var connectionStrings = new ConnectionStrings();
                Configuration.GetSection("ConnectionStrings").Bind(connectionStrings);
                return connectionStrings;
            }
        }
    }
}
