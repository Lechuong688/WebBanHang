using WebBanHang.Controllers;
using WebBanHang.Models;

namespace WebBanHang.Repository.Product
{
    public class ProductRepository
    {
        private readonly DataContext _dataContext;
        private readonly ILogger<HomeController> _logger;
        public List<ProductsModel> GetList(int pageIndex, int pageSize, string keySearch)
        {
            return _dataContext.Products.ToList();
        }
    }
}
