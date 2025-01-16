using Microsoft.EntityFrameworkCore;
using WebBanHang.Models;

namespace WebBanHang.Repository
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options)
        {

        }
        public DbSet<CategoriesModel> Categories { get; set; }
        public DbSet<CustomersModel> Customers { get; set; }
        public DbSet<EmployeesModel> Employees { get; set; }
        public DbSet<OrderDetailsModel> OrderDetails { get; set; }
        public DbSet<OrdersModel> OrdersModels { get; set; }
        public DbSet<ProductsModel> Products { get; set; }
        public DbSet<ShippersModel> Shippers { get; set; }
        public DbSet<SuppliersModel> Suppliers { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Xác định composite key cho bảng OrderDetails
            modelBuilder.Entity<OrderDetailsModel>()
                .HasKey(od => new { od.OrderID, od.ProductID });

            base.OnModelCreating(modelBuilder);
        }

    }
}
