using WebBanHang.Controllers;
using WebBanHang.Models;

namespace WebBanHang.Repository.Product
{
    public interface IProductRepository
    {
        Task<ProductModel> GetProductByIdAsync(int id);
        List<ProductModel> GetList(int pageIndex, int pageSize, string keySearch);
    }
}
