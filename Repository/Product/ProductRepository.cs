using WebBanHang.Controllers;
using WebBanHang.Models;

namespace WebBanHang.Repository.Product
{
    public class ProductRepository: IProductRepository
    {
        private readonly DataContext _dataContext;
        private readonly ILogger<HomeController> _logger;
        public ProductRepository(ILogger<HomeController> logger, DataContext context)
        {
            _logger = logger;
            _dataContext = context;
        }
        public List<ProductsModel> GetList(int pageIndex, int pageSize, string keySearch)
        {
            return _dataContext.Product.ToList();
        }
    }
}
