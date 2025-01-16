using Microsoft.AspNetCore.Mvc;

namespace WebBanHang.Controllers
{
    public class CheckoutController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
