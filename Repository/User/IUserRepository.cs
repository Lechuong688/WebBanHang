using Microsoft.AspNetCore.Identity;
using WebBanHang.Models;

namespace WebBanHang.Repository.User
{
    public interface IUserRepository
    {
        List<UserModel> GetList(int pageIndex, int pageSize, string keySearch);
        Task<IdentityResult> CreateUserAsync(UserModel user);
    }
}
