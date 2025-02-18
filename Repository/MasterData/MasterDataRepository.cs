using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebBanHang.Controllers;
using WebBanHang.Models;

namespace WebBanHang.Repository.MasterData
{
    public class MasterDataRepository : IMasterDataRepository
    {
        private readonly DataContext _dataContext;
        public MasterDataRepository(DataContext dataContext)
        {
            _dataContext = dataContext;
        }
        //public async Task<ProductModel> GetProductByIdAsync(int id)
        //{
        //    return await _dataContext.Product
        //                             .FirstOrDefaultAsync(p => p.Id == id);
        //}
        public async Task<MasterDataModel> MasterDataSlugAsync(string code)
        {
            return await _dataContext.MasterData.FirstOrDefaultAsync(m => m.Code == code);
        }

        public async Task<List<ProductModel>> GetProductsByTypeIdAsync(int typeId)
        {
            return await _dataContext.Product
                                     .Where(p => p.TypeId == typeId)
                                     .OrderByDescending(p => p.Id)
                                     .ToListAsync();
        }

    }
}
