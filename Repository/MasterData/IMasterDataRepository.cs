using WebBanHang.Models;

namespace WebBanHang.Repository.MasterData
{
        public interface IMasterDataRepository
        {
            //List<MasterDataModel> GetList(int pageIndex, int pageSize, string keySearch);
            Task<MasterDataModel> MasterDataSlugAsync(string code);
            Task<List<ProductModel>> GetProductsByTypeIdAsync(int typeId);

    }
}
