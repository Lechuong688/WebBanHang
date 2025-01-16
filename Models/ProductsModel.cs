using System.ComponentModel.DataAnnotations;

namespace WebBanHang.Models
{
    public class ProductsModel
    {
        [Key]
        [Required(ErrorMessage = "ProductID không được để trống")]
        public int ProductID { get; set; }
        [Required(ErrorMessage = "ProductName không được để trống")]
        public string ProductName { get; set; }
        public int SupplierID { get; set; }
        public int CategoryID { get; set; }
        public string QuantityPerUnit {  get; set; }
        public decimal UnitPrice { get; set; }
        public short UnitsInStock { get; set; }
        public short UnitsOnOrder { get; set; }
        public short ReorderLevel { get; set; }
        [Required(ErrorMessage = "Discontinued không được để trống")]
        public bool Discontinued { get; set; }

    }
}
