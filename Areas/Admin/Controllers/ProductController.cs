using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using WebBanHang.Areas.Admin.Product;
using WebBanHang.Controllers;
using WebBanHang.Models;
using WebBanHang.Repository;
using WebBanHang.Areas.Admin.Models;

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
            var productViewModels = (from p in products
                                     join m in _dataContext.MasterData on p.TypeId equals m.Id
                                     select new ProductViewModel
                                     {
                                         Id = p.Id,
                                         ProductName = p.Name,
                                         Price = p.Price,
                                         Note = p.Note,
                                         TypeName = m.Name // Lấy tên loại từ bảng MasterData
                                     }).ToList();

            return View(productViewModels);
        }
        
        //public IActionResult ProductList()
        //{
        //    var products = (from p in _dataContext.Product
        //                    join m in _dataContext.MasterData on p.TypeId equals m.Id
        //                    where p.IsDeleted == false
        //                    select new ProductViewModel
        //                    {
        //                        Id = p.Id,
        //                        TypeName = m.Name, // Lấy tên loại
        //                        ProductName = p.Name,
        //                        Price = p.Price,
        //                        Note = p.Note
        //                    }).ToList();

        //    return View(products);
        //}
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
