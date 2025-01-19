using System.ComponentModel.DataAnnotations;

namespace WebBanHang.Models
{
    public class UserModel
    {
        [Key]
        public int Id { get; set; }
        [Required, MinLength(2, ErrorMessage = "Yêu cầu nhập RoleId")]
        public int RoleId { get; set; }
        [Required, MinLength(2, ErrorMessage = "Yêu cầu nhập tên người dùng")]
        public string UserName { get; set; }
        [Required, MinLength(2, ErrorMessage = "Yêu cầu nhập tên")]
        public string Name { get; set; }
        public string Note { get; set; }
        public bool IsDelete { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }

    }
}
