using System.ComponentModel.DataAnnotations;

namespace WebBanHang.Models
{
    public class OrderDetailModel
    {
        [Key]
        public int Id { get; set; }
        [Required(ErrorMessage = "ProductID không được để trống")]
        public int ProductId { get; set; }
        [Required(ErrorMessage = "OrderId không được để trống")]
        public int OrdelId { get; set; }
        public string Note { get; set; }
        public bool IsDeleted { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
    }
}
