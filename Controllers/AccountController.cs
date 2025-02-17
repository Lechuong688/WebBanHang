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

        public AccountController(ILogger<AccountController> logger, IUserRepository userRepository)
        {
            _logger = logger;
            _userRepository = userRepository;
        }

        public IActionResult Login(string returnUrl)
        {
            return View(new LogInViewModel { ReturnUrl = returnUrl });
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
                TempData["success"] = "Tạo user thành công.";
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
    }
}
