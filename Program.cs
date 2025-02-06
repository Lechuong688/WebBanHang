using Microsoft.EntityFrameworkCore;
using WebBanHang.Repository;
using WebBanHang.Repository.Product;
using Microsoft.AspNetCore.Identity;
using WebBanHang.Models;
using WebBanHang.Repository.User;

var builder = WebApplication.CreateBuilder(args);

// Cấu hình Connection Db
builder.Services.AddDbContext<DataContext>(options =>
{
    options.UseSqlServer(builder.Configuration["ConnectionStrings:ConnectdDb"]);
});


// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddScoped<IProductRepository, ProductRepository>();
builder.Services.AddScoped<WebBanHang.Areas.Admin.Product.IProductRepository, WebBanHang.Areas.Admin.Product.ProductRepository>();
builder.Services.AddScoped<IUserRepository, UserRepository>();

// Cấu hình Identity
builder.Services.AddIdentity<AppUserModel, AppRoleModel>(options =>
{
    // Cấu hình các tùy chọn password, lockout, v.v.
    options.Password.RequireDigit = true;
    options.Password.RequireLowercase = true;
    options.Password.RequireUppercase = true;
    options.Password.RequiredLength = 6;
    options.Password.RequiredUniqueChars = 1;
    options.User.RequireUniqueEmail = true;
})
.AddEntityFrameworkStores<DataContext>()
.AddDefaultTokenProviders();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

// Cấu hình Middleware
app.UseAuthentication(); // Sử dụng Authentication
app.UseAuthorization();  // Sử dụng Authorization

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.MapControllerRoute(
    name: "Areas",
    pattern: "{area:exists}/{controller=Product}/{action=Index}/{id?}");

app.Run();
