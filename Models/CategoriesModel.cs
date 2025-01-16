using System.ComponentModel.DataAnnotations;

namespace WebBanHang.Models
{
    public class CategoriesModel
    {
        [Key]
        public int CategoryID { get; set; }
        [Required, MinLength(2, ErrorMessage ="Yêu cầu nhập tên danh mục")]
        public string CategoryName { get; set; }
        public string Description { get; set; }
        public byte[] Picture { get; set; }
    }
}
