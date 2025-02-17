using Microsoft.AspNetCore.Identity;
using WebBanHang.Controllers;
using WebBanHang.Models;

namespace WebBanHang.Repository.User
{
    public class UserRepository : IUserRepository
    {
        private readonly DataContext _dataContext;
        private UserManager<AppUserModel> _userManager;
        private SignInManager<AppUserModel> _signInManage;

        public UserRepository(ILogger<UserRepository> logger, DataContext context, UserManager<AppUserModel> userManager, SignInManager<AppUserModel> signInManage)
        {
            _dataContext = context;
            _userManager = userManager;
            _signInManage = signInManage;
        }

        public async Task<IdentityResult> CreateUserAsync(UserModel user)
        {
            try
            {
                var newUser = new AppUserModel
                {
                    UserName = user.UserName, //Tên người dùng
                    Email = user.Email, //Email
                    RoleId = 5, // Gán RoleId mặc định
                    IsDelete = false, // Giả sử là mới tạo, chưa xóa
                    CreatedDate = DateTime.Now,
                    UpdatedDate = DateTime.Now
                };

                // Hash mật khẩu
                var passwordHasher = new PasswordHasher<AppUserModel>();
                newUser.PasswordHash = passwordHasher.HashPassword(newUser, user.Password);

                // Thêm user vào database
                var result = await _userManager.CreateAsync(newUser);

                return result;
            }
            catch (Exception ex)
            {
                return IdentityResult.Failed(new IdentityError { Description = ex.Message });
            }
        }

        //public async Task<IdentityResult> LognIn(UserModel user)
        //{

        //}

        public List<UserModel> GetList(int pageIndex, int pageSize, string keySearch)
        {
            return _dataContext.User.ToList();
        }
    }
}
