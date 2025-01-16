using System.ComponentModel.DataAnnotations;

namespace WebBanHang.Models
{
    public class ShippersModel
    {
        [Key]
        [Required(ErrorMessage = "ShipperID không được để trống")]
        public int ShipperID { get; set; }
        [Required(ErrorMessage = "CompanyName không được để trống")]
        public string CompanyName { get; set; }
        public string Phone { get; set; }
    }
}
