namespace WebBanHang.Areas.Admin.Models
{
    public class ProductViewModel
    {
        //Model kết nối giữa hai bảng MasterData và bảng Product
        public int Id { get; set; }
        public string? TypeName { get; set; } // Tên loại từ MasterData
        public string? ProductName { get; set; }
        public decimal Price { get; set; }
        public string? Note { get; set; }
    }
}
