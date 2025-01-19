using System.ComponentModel.DataAnnotations;

namespace WebBanHang.Models
{
    public class RoleModel
    {
        [Key]
        public int Id { get; set; }
        [Required, MinLength(2, ErrorMessage = "Yêu cầu nhập tên")]
        public string Name { get; set; }
        public string Note { get; set; }
    }
}
