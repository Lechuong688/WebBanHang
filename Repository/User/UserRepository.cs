using Microsoft.AspNetCore.Identity;
using WebBanHang.Controllers;
using WebBanHang.Models;

namespace WebBanHang.Repository.User
{
    public class UserRepository : IUserRepository
    {
        private readonly DataContext _dataContext;
        private readonly ILogger<UserRepository> _logger;
        private readonly UserManager<AppUserModel> _userManager;
        private readonly RoleManager<AppRoleModel> _roleManager;

        public UserRepository(ILogger<UserRepository> logger, DataContext context, UserManager<AppUserModel> userManager, RoleManager<AppRoleModel> roleManager)
        {
            _logger = logger;
            _dataContext = context;
            _userManager = userManager;
            _roleManager = roleManager;
        }

        public async Task<IdentityResult> CreateUserAsync(UserModel user)
        {
            try
            {
                // Tạo mới người dùng từ UserModel
                AppUserModel newUser = new AppUserModel
                {
                    UserName = user.UserName,
                    Email = user.Email,
                    Name = user.Name,
                    IsDelete = false, // Giả sử là mới tạo, chưa xóa
                    CreatedDate = DateTime.Now,
                    UpdatedDate = DateTime.Now
                };

                // Tạo người dùng
                var result = await _userManager.CreateAsync(newUser, user.Password);

                if (result.Succeeded)
                {
                    // Gán vai trò cho người dùng
                    var role = await _roleManager.FindByIdAsync(user.RoleId.ToString());
                    if (role != null)
                    {
                        await _userManager.AddToRoleAsync(newUser, role.Name);
                    }
                }

                return result;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Lỗi khi tạo người dùng.");
                return IdentityResult.Failed(new IdentityError { Description = "Đã có lỗi xảy ra khi tạo người dùng." });
            }
        }

        public List<UserModel> GetList(int pageIndex, int pageSize, string keySearch)
        {
            return _dataContext.User.ToList();
        }
    }
}
