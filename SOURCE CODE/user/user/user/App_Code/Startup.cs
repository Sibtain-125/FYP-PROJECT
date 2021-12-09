using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(user.Startup))]
namespace user
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
