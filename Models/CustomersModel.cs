using System.ComponentModel.DataAnnotations;

namespace WebBanHang.Models
{
    public class CustomersModel
    {
        [Key]
        public string CustomerID { get; set; }
        [Required, MinLength(2, ErrorMessage = "Yêu cầu nhập tên công ty")]
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
    }
}
