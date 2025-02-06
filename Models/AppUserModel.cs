using Microsoft.AspNetCore.Identity;

namespace WebBanHang.Models
{
    public class AppUserModel : IdentityUser<int>
    {
        public string Name { get; set; }
        public int RoleId { get; set; }
        public string Note { get; set; }
        public bool IsDelete { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
    }
}
