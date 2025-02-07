﻿using WebBanHang.Controllers;
using WebBanHang.Models;

namespace WebBanHang.Repository.Product
{
    public interface IProductRepository
    {
        List<ProductModel> GetList(int pageIndex, int pageSize, string keySearch);
    }
}
