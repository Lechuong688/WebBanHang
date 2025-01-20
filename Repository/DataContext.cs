using Microsoft.EntityFrameworkCore;
using WebBanHang.Models;

namespace WebBanHang.Repository
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options)
        {

        }
        public DbSet<MasterDataModel> MasterData { get; set; }
        public DbSet<RoleModel> Role { get; set; }
        public DbSet<UserModel> User { get; set; }
        public DbSet<ProductModel> Product { get; set; }
        public DbSet<OrderModel> Order { get; set; }
        public DbSet<OrderDetailModel> OrderDetail { get; set; }

    }
}
