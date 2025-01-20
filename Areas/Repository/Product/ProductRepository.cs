using Microsoft.AspNetCore.Mvc;
using WebBanHang.Controllers;
using WebBanHang.Models;
using WebBanHang.Repository;
using WebBanHang.Areas.Admin.Product;

namespace WebBanHang.Areas.Admin.Product
{
    public class ProductRepository: IProductRepository
    {
        private readonly DataContext _dataContext;
        private readonly ILogger<ProductRepository> _logger;
        public ProductRepository(ILogger<ProductRepository> logger, DataContext context)
        {
            _logger = logger;
            _dataContext = context;
        }
        public List<ProductModel> GetList(int pageIndex, int pageSize, string keySearch)
        {
            return _dataContext.Product.ToList();
        }
    }
}
