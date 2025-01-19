using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace WebBanHang.Repository.Components
{
    public class MasterDataViewComponent : ViewComponent
    {
        private readonly DataContext _dataContext;
        public MasterDataViewComponent(DataContext context)
        {
            _dataContext = context;
        }

        public async Task<IViewComponentResult> InvokeAsync() => View(await _dataContext.MasterData.ToArrayAsync());
    }
}
