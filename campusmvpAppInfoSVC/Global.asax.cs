/*
                                     |  \/  \ \    / /  __ \         
   ___ __ _ _ __ ___  _ __  _   _ ___| \  / |\ \  / /| |__) |__  ___ 
  / __/ _` | '_ ` _ \| '_ \| | | / __| |\/| | \ \/ / |  ___/ _ \/ __|
 | (_| (_| | | | | | | |_) | |_| \__ \ |  | |  \  /  | |_ |  __/\__ \
  \___\__,_|_| |_| |_| .__/ \__,_|___/_|  |_|   \/   |_(_) \___||___/
                     | |                                             
                     |_|                                             
*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Routing;

namespace campusmvpAppInfoSVC
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            GlobalConfiguration.Configure(WebApiConfig.Register);
        }
    }
}
