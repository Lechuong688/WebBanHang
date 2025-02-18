using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Threading.Tasks;
using WebBanHang.Models;
using WebBanHang.Models.ViewModel;
using WebBanHang.Repository.User;

namespace WebBanHang.Controllers
{
    public class AccountController : Controller
    {
        private readonly ILogger<AccountController> _logger;
        private readonly IUserRepository _userRepository;
        private SignInManager<AppUserModel> _signInManage;

        public AccountController(ILogger<AccountController> logger, IUserRepository userRepository , SignInManager<AppUserModel> signInManage)
        {
            _logger = logger;
            _userRepository = userRepository;
            _signInManage = signInManage;
        }

        public IActionResult Login(string returnUrl)
        {
            return View(new LogInViewModel { ReturnUrl = returnUrl });
        }

        [HttpPost]
        public async Task<IActionResult> Login(LogInViewModel loginVM)
        {
            //if (ModelState.IsValid)
            //{
                var result = await _userRepository.Login(loginVM);

                if (result.Succeeded)
                {
                    TempData["success"] = "Đăng nhập thành công!";
                    TempData.Keep("success");
                    // Đăng nhập thành công, chuyển đến trang chủ
                    return Redirect("/home");
                }
                else
                {
                    // Thêm lỗi vào ModelState khi đăng nhập thất bại
                    ModelState.AddModelError("", "Đăng nhập thất bại. Vui lòng kiểm tra lại tên đăng nhập và mật khẩu.");
                }
            //}

            // Nếu ModelState không hợp lệ hoặc có lỗi, hiển thị lại trang đăng nhập với thông báo lỗi
            return View(loginVM);
        }
        public IActionResult CreateUser()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> CreateUserAsync(UserModel model)
        {
            //if (!ModelState.IsValid)
            //{
            //    return View("CreateUser");
            //}

            var result = await _userRepository.CreateUserAsync(model);

            if (result.Succeeded)
            {
                return Redirect("/Account/Login");
            }
            else
            {
                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError("", error.Description);
                }

                _logger.LogError("Error creating user: " + string.Join(", ", result.Errors.Select(e => e.Description)));
            }

            return View("CreateUser");
        }

        public async Task<IActionResult> Logout(string returnUrl = "/")
        {
            await _signInManage.SignOutAsync();
            return Redirect(returnUrl);
        }
    }
}
