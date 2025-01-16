using Microsoft.AspNetCore.Mvc;

namespace WebBanHang.Controllers
{
    public class ProductController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Details()
        {
            return View();
        }
    }
}
