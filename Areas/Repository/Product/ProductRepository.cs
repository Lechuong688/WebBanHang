using Microsoft.AspNetCore.Mvc;
using WebBanHang.Controllers;
using WebBanHang.Models;
using WebBanHang.Repository;
using WebBanHang.Areas.Admin.Product;
using WebBanHang.Areas.Admin.Models;

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
        public List<ProductViewModel> GetList(int pageIndex, int pageSize, string keySearch)
        {
            try
            {
                // Tìm kiếm và phân trang
                var query = from p in _dataContext.Product
                            join m in _dataContext.MasterData on p.TypeId equals m.Id
                            where !p.IsDeleted && 
                                  (string.IsNullOrEmpty(keySearch) || 
                                  p.Name.Contains(keySearch) || 
                                  m.Name.Contains(keySearch))
                            select new ProductViewModel
                            {
                                Id = p.Id,
                                ProductName = p.Name,
                                Price = p.Price,
                                Note = p.Note,
                                TypeName = m.Name // Lấy tên loại từ MasterData
                            };

                return query
                    .Skip((pageIndex - 1) * pageSize)
                    .Take(pageSize)
                    .ToList();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Lỗi khi truy vấn danh sách sản phẩm.");
                return new List<ProductViewModel>();
            }
        }
    }
}
