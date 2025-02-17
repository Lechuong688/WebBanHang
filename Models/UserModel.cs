using Microsoft.AspNetCore.Identity;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace WebBanHang.Models
{
    public class UserModel
    {
        [Key]
        public int Id { get; set; }
        //[Required(ErrorMessage = "Yêu cầu nhập RoleId")]
        public int RoleId { get; set; }
        [Required(ErrorMessage = "Yêu cầu nhập tên người dùng")]
        public string? UserName { get; set; }
        [Required(ErrorMessage = "Yêu cầu nhập tên")]
        public string? Name { get; set; }
        public string? Note { get; set; }
        [Required(ErrorMessage = "Yêu cầu nhập Email"), EmailAddress]
        public string? Email { get; set; }
        [DataType(DataType.Password), Required(ErrorMessage = "Yêu cầu nhập mật khẩu")]
        public string? Password { get; set; }
        public bool IsDelete { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }

    }
}
