using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using WebBanHang.Areas.Admin.Product;
using WebBanHang.Controllers;
using WebBanHang.Models;
using WebBanHang.Repository;
using WebBanHang.Areas.Admin.Product;

namespace WebBanHang.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ProductController : Controller
    {
        private readonly DataContext _dataContext;
        private readonly ILogger<ProductController> _logger;
        private readonly IProductRepository _productRepository;

        public ProductController(ILogger<ProductController> logger, DataContext context, IProductRepository productRepository)
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
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
