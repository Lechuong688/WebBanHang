using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using WebBanHang.Models;
using WebBanHang.Repository;
using WebBanHang.Repository.Product;

namespace WebBanHang.Controllers
{
    public class HomeController : Controller
    {
        private readonly DataContext _dataContext;
        private readonly ILogger<HomeController> _logger;
        private readonly IProductRepository _productRepository;

        public HomeController(ILogger<HomeController> logger, DataContext context, IProductRepository productRepository)
        {
            _logger = logger;
            _dataContext = context;
            _productRepository = productRepository;
        }

        public IActionResult Index()
        {
            var products = _productRepository.GetList(1, 20, "");
            return View(products);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
