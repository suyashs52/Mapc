using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MapC.Controllers
{
    public class MarketMapFController : Controller
    {
        // GET: MarketMapF
        public ActionResult Index()
        {
            return View("./Views/MarketMapF/MarketMapCreate.aspx");
        }
    }
}