using WebBanHang.Controllers;
using WebBanHang.Models;

namespace WebBanHang.Areas.Admin.Product
{
    public interface IProductRepository
    {
        List<ProductModel> GetList(int pageIndex, int pageSize, string keySearch);
    }
}
