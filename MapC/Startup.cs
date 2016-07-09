using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MapC.Startup))]
namespace MapC
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
