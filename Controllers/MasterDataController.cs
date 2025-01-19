using Microsoft.AspNetCore.Mvc;

namespace WebBanHang.Controllers
{
    public class MasterDataController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
