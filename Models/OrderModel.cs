using System.ComponentModel.DataAnnotations;

namespace WebBanHang.Models
{
    public class OrderModel
    {
        [Key]
        public int Id { get; set; }
        public string Note {  get; set; }
        public bool IsDeleted { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
    }
}
