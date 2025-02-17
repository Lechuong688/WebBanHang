using System.ComponentModel.DataAnnotations;

namespace WebBanHang.Models.ViewModel
{
    public class LogInViewModel
    {
        [Key]
        public int Id { get; set; }
        [Required(ErrorMessage = "Yêu cầu nhập username")]
        public string UserName { get; set; }
        
        [DataType(DataType.Password), Required(ErrorMessage = "Yêu cầu nhập mật khẩu")]
        public string Password { get; set; }
        public string ReturnUrl { get; set; }
    }
}
