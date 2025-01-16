using WebBanHang.Controllers;
using WebBanHang.Models;

namespace WebBanHang.Repository.Product
{
    public interface IProductRepository
    {
        List<ProductsModel> GetList(int pageIndex, int pageSize, string keySearch);
    }
}
