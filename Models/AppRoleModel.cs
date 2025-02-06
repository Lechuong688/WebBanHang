using Microsoft.AspNetCore.Identity;

namespace WebBanHang.Models
{
    public class AppRoleModel : IdentityRole<int>
    {
        public string Note { get; set; }
    }
}
