using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;
using Serilog;
using Serilog.Events;

#if DEBUG
using System.Net;
#endif

namespace Vonk.IdentityServer
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Log.Logger = new LoggerConfiguration()
            .MinimumLevel.Verbose()
            .MinimumLevel.Override("Microsoft", LogEventLevel.Warning)
            .Enrich.FromLogContext()
            .WriteTo.Console()
            .CreateLogger();

            CreateHostBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
            .UseSerilog()
            .ConfigureWebHostDefaults(
                webhost => {
                    webhost.UseStartup<Startup>();
                    webhost.UseKestrel(
#if DEBUG
                        options =>
                        {
                            options.Listen(IPAddress.Loopback, 5100);
                            options.Listen(IPAddress.Loopback, 5101, listenOptions =>
                            {
                                listenOptions.UseHttps("ssl_cert.pfx", "cert-password");
                            });
                        }
#endif
                   );
                   webhost.UseIIS();
            });
             
    }
}