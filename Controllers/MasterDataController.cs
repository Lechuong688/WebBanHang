using Microsoft.AspNetCore.Mvc;
using WebBanHang.Repository;
using WebBanHang.Repository.MasterData;
using WebBanHang.Repository.Product;

namespace WebBanHang.Controllers
{
    public class MasterDataController : Controller
    {
        private readonly IMasterDataRepository _masterDataRepository;
        //private readonly IProductRepository _productRepository;

        public MasterDataController(IMasterDataRepository masterDataRepository, IProductRepository productRepository)
        {
            _masterDataRepository = masterDataRepository;
            //_productRepository = productRepository;
        }
        //public async Task<IActionResult> Details(int id)
        //{
        //    if (id == 0) return RedirectToAction("Index");

        //    var product = await _productRepository.GetProductByIdAsync(id);
        //    if (product == null) return RedirectToAction("Index");

        //    return View(product);
        //}

        public async Task<IActionResult> Index(string slug = "")
        {
            var masterData = await _masterDataRepository.MasterDataSlugAsync(slug);

            if (masterData == null)
            {
                return RedirectToAction("Index", "Home");
            }

            var products = await _masterDataRepository.GetProductsByTypeIdAsync(masterData.Id);

            return View(products);
        }
    }
}
