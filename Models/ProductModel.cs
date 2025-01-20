using System.ComponentModel.DataAnnotations;

namespace WebBanHang.Models
{
    public class ProductModel
    {
        [Key]
        public int Id { get; set; }
        [Required(ErrorMessage = "TypeId không được để trống")]
        public int TypeId { get; set; }
        [Required(ErrorMessage = "Name không được để trống")]
        public string Name { get; set; }
        public string Note { get; set; }
        public bool IsDeleted { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }


    }
}
