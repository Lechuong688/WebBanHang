using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using WebBanHang.Models;
using WebBanHang.Repository;
using WebBanHang.Repository.User;

namespace WebBanHang.Controllers
{
    public class AccountController : Controller
    {
        private readonly DataContext _dataContext;
        private readonly ILogger<AccountController> _logger;
        private readonly IUserRepository _userRepository;
        private readonly RoleManager<AppRoleModel> _roleManager;

        public AccountController(ILogger<AccountController> logger, DataContext context, IUserRepository userRepository, RoleManager<AppRoleModel> roleManager)
        {
            _logger = logger;
            _dataContext = context;
            _userRepository = userRepository;
            _roleManager = roleManager;
        }
        public IActionResult Index(UserModel model)
        {
            return View(model);
        }
        public IActionResult CreateUser(UserModel model)
        {
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> CreateUserAsync(UserModel model)
        {
            if (ModelState.IsValid)
            {
                // Gọi repository để tạo người dùng
                var result = await _userRepository.CreateUserAsync(model);

                if (result.Succeeded)
                {
                    // Redirect đến trang sản phẩm khi tạo người dùng thành công
                    return Redirect("/admin/product");
                }
                else
                {
                    // Thêm lỗi vào ModelState nếu có lỗi
                    foreach (IdentityError error in result.Errors)
                    {
                        ModelState.AddModelError("", error.Description);
                    }

                    // Log lỗi chi tiết (có thể kiểm tra lỗi bằng cách debug hoặc ghi log)
                    _logger.LogError("Error creating user: " + string.Join(", ", result.Errors.Select(e => e.Description)));
                }
            }

            // Nếu không hợp lệ hoặc có lỗi, trả về trang tạo người dùng với thông báo lỗi
            return View("Index");
        }
    }
}
