using System.ComponentModel.DataAnnotations;

namespace WebBanHang.Models
{
    public class SuppliersModel
    {
        [Key]
        [Required(ErrorMessage = "SupplierID không được để trống")]
        public int SupplierID { get; set; }
        [Required(ErrorMessage = "CompanyName không được để trống")]
        public string CompanyName { get; set; }
        public string ContactName { get; set; }
        public string ContactTitle { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Region { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }
        public string Phone { get; set; }
        public string Fax { get; set; }
        public string Homepage { get; set; }
    }
}
