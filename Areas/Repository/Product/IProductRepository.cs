using WebBanHang.Areas.Admin.Models;
using WebBanHang.Controllers;
using WebBanHang.Models;

namespace WebBanHang.Areas.Admin.Product
{
    public interface IProductRepository
    {
        List<ProductViewModel> GetList(int pageIndex, int pageSize, string keySearch);
    }
}
