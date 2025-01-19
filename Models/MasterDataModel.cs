using System.ComponentModel.DataAnnotations;

namespace WebBanHang.Models
{
    public class MasterDataModel
    {
        [Key]
        public int Id { get; set; }
        [Required, MinLength(2, ErrorMessage = "Yêu cầu nhập GroupId")]
        public int GroupId { get; set; }
        [Required, MinLength(2, ErrorMessage = "Yêu cầu nhập Code")]
        public string Code { get; set; }
        [Required, MinLength(2, ErrorMessage ="Yêu cầu nhập tên danh mục")]
        public string Name { get; set; }
        public string Note { get; set; }
        public bool IsDeleted { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
    }
}
