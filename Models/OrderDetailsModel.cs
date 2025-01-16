using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebBanHang.Models
{
    public class OrderDetailsModel
    {
        [Required(ErrorMessage = "OrderID không được để trống")]
        public int OrderID { get; set; }

        [Required, MinLength(2, ErrorMessage = "Yêu cầu nhập ID sản phẩm")]
        public int ProductID { get; set; }

        //Đơn giá
        [Required(ErrorMessage = "Đơn giá không được để trống")]
        public decimal UnitPrice { get; set; }

        //Số lượng
        [Required(ErrorMessage = "Số lượng không được để trống")]
        public short Quantity { get; set; }

        //Giam giá
        [Required(ErrorMessage = "Giam giá không được để trống")]
        public float Discount { get; set; }
    }
}
