using Microsoft.AspNetCore.Mvc;
using WebBanHang.Repository.Product;

namespace WebBanHang.Controllers
{
    public class ProductController : Controller
    {
        private readonly IProductRepository _productRepository;
        public ProductController(IProductRepository productRepository)
        {
            _productRepository = productRepository;
        }
        public ActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> Details(int id)
        {
            if (id == 0) return RedirectToAction("Index");

            var product = await _productRepository.GetProductByIdAsync(id);
            if (product == null) return RedirectToAction("Index");

            return View(product);
        }
    }
}
