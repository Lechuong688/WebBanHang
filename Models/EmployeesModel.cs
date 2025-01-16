using System.ComponentModel.DataAnnotations;

namespace WebBanHang.Models
{
    public class EmployeesModel
    {
        [Key]
        public int EmployeeID { get; set; }
        [Required, MinLength(2, ErrorMessage = "Yêu cầu nhập họ nhân viên")]
        public string LastName { get; set; }
        [Required, MinLength(2, ErrorMessage = "Yêu cầu nhập tên nhân viên")]
        public string FirstName { get; set; }
        public string Title { get; set; }
        public string TitleOfCourtesy {  get; set; }
        public DateTime BirthDate { get; set; }
        public DateTime HireDate { get; set; }
        public string Address {  get; set; }
        public string City { get; set; }
        public string Region { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }
        public string HomePhone { get; set; }
        public string Extension { get; set; }
        public byte[] Photo { get; set; }
        public string Notes { get; set; }
        public int ReportsTo {  get; set; }
        public string PhotoPath { get; set; }
    }
}
