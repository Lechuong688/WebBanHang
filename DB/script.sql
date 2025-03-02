USE [master]
GO
/****** Object:  Database [WebBanHang]    Script Date: 06/02/2025 15:01:04 ******/
CREATE DATABASE [WebBanHang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebBanHang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\WebBanHang.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebBanHang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\WebBanHang_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WebBanHang] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebBanHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebBanHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebBanHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebBanHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebBanHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebBanHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebBanHang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebBanHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebBanHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebBanHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebBanHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebBanHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebBanHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebBanHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebBanHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebBanHang] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WebBanHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebBanHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebBanHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebBanHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebBanHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebBanHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebBanHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebBanHang] SET RECOVERY FULL 
GO
ALTER DATABASE [WebBanHang] SET  MULTI_USER 
GO
ALTER DATABASE [WebBanHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebBanHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebBanHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebBanHang] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebBanHang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebBanHang] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebBanHang', N'ON'
GO
ALTER DATABASE [WebBanHang] SET QUERY_STORE = ON
GO
ALTER DATABASE [WebBanHang] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WebBanHang]
GO
/****** Object:  Table [dbo].[MasterData]    Script Date: 06/02/2025 15:01:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NOT NULL,
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Note] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 06/02/2025 15:01:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Note] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 06/02/2025 15:01:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 06/02/2025 15:01:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Note] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[Price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 06/02/2025 15:01:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Note] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 06/02/2025 15:01:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Note] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[Email] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MasterData] ON 

INSERT [dbo].[MasterData] ([Id], [GroupId], [Code], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, 1, N'GADGETS', N'Đồ gia dụng thông minh', N'Danh mục đồ gia dụng thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.057' AS DateTime), NULL, NULL)
INSERT [dbo].[MasterData] ([Id], [GroupId], [Code], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, 2, N'KITCHEN', N'Gia dụng nhà bếp', N'Loại sản phẩm gia dụng nhà bếp', 0, 1, CAST(N'2025-01-16T23:11:38.057' AS DateTime), NULL, NULL)
INSERT [dbo].[MasterData] ([Id], [GroupId], [Code], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, 2, N'LIVINGROOM', N'Gia dụng phòng khách', N'Loại sản phẩm gia dụng phòng khách', 0, 1, CAST(N'2025-01-16T23:11:38.057' AS DateTime), NULL, NULL)
INSERT [dbo].[MasterData] ([Id], [GroupId], [Code], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, 3, N'ELECTRONICS', N'Đồ điện tử thông minh', N'Loại sản phẩm đồ điện tử thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.057' AS DateTime), NULL, NULL)
INSERT [dbo].[MasterData] ([Id], [GroupId], [Code], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, 4, N'APPLIANCES', N'Đồ gia dụng điện tử', N'Loại sản phẩm đồ gia dụng điện tử', 0, 1, CAST(N'2025-01-16T23:11:38.057' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[MasterData] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Đơn hàng 1 - Mua bếp điện từ thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([Id], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'Đơn hàng 2 - Mua ti vi thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([Id], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'Đơn hàng 3 - Mua tủ lạnh thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([Id], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, N'Đơn hàng 4 - Mua máy xay sinh tố thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([Id], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, N'Đơn hàng 5 - Mua quạt điều hòa thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([Id], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, N'Đơn hàng 6 - Mua robot hút bụi thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([Id], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, N'Đơn hàng 7 - Mua lò vi sóng thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([Id], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, N'Đơn hàng 8 - Mua máy lọc không khí thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([Id], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, N'Đơn hàng 9 - Mua bình đun siêu tốc thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([Id], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, N'Đơn hàng 10 - Mua loa thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([Id], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (11, N'Đơn hàng 11 - Mua đèn thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([Id], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (12, N'Đơn hàng 12 - Mua ổ cắm thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([Id], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (13, N'Đơn hàng 13 - Mua cảm biến chuyển động thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [ProductId], [OrderId], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, 2, 1, N'Mua 1 bếp điện từ thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [ProductId], [OrderId], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, 3, 2, N'Mua 1 ti vi thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [ProductId], [OrderId], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, 4, 3, N'Mua 1 tủ lạnh thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [ProductId], [OrderId], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, 1, 4, N'Mua 2 máy xay sinh tố thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [ProductId], [OrderId], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, 7, 5, N'Mua 1 quạt điều hòa thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [ProductId], [OrderId], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, 8, 6, N'Mua 1 robot hút bụi thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [ProductId], [OrderId], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, 5, 7, N'Mua 2 bếp điện từ thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [ProductId], [OrderId], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, 9, 8, N'Mua 1 máy lọc không khí thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [ProductId], [OrderId], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, 6, 9, N'Mua 1 bình đun siêu tốc thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [ProductId], [OrderId], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, 10, 10, N'Mua 3 loa thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [ProductId], [OrderId], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (11, 11, 11, N'Mua 1 đèn thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [ProductId], [OrderId], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (12, 12, 12, N'Mua 1 ổ cắm thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [ProductId], [OrderId], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (13, 13, 13, N'Mua 1 cảm biến chuyển động thông minh', 0, 1, CAST(N'2025-01-16T23:11:38.060' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [TypeId], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Price]) VALUES (1, 1, N'Táo thông minh', N'Đồ gia dụng thông minh loại táo điều khiển qua app', 0, 1, CAST(N'2025-01-16T23:11:38.057' AS DateTime), NULL, NULL, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([Id], [TypeId], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Price]) VALUES (2, 1, N'Máy xay sinh tố thông minh', N'Máy xay sinh tố kết nối Bluetooth và điều khiển bằng điện thoại', 0, 1, CAST(N'2025-01-16T23:11:38.057' AS DateTime), NULL, NULL, CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([Id], [TypeId], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Price]) VALUES (3, 1, N'Máy lọc không khí thông minh', N'Máy lọc không khí có cảm biến và điều khiển từ xa', 0, 1, CAST(N'2025-01-16T23:11:38.057' AS DateTime), NULL, NULL, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([Id], [TypeId], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Price]) VALUES (4, 1, N'Máy rửa bát thông minh', N'Máy rửa bát điều khiển qua app, tự động vệ sinh', 0, 1, CAST(N'2025-01-16T23:11:38.057' AS DateTime), NULL, NULL, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([Id], [TypeId], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Price]) VALUES (5, 2, N'Bếp điện từ thông minh', N'Bếp điện từ có thể điều khiển từ xa và tự động tắt', 0, 1, CAST(N'2025-01-16T23:11:38.057' AS DateTime), NULL, NULL, CAST(600.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([Id], [TypeId], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Price]) VALUES (6, 2, N'Tủ lạnh thông minh', N'Tủ lạnh có thể quản lý nhiệt độ và cung cấp thông tin qua app', 0, 1, CAST(N'2025-01-16T23:11:38.057' AS DateTime), NULL, NULL, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([Id], [TypeId], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Price]) VALUES (7, 2, N'Lò vi sóng thông minh', N'Lò vi sóng có thể điều khiển qua điện thoại và có chế độ tự động', 0, 1, CAST(N'2025-01-16T23:11:38.057' AS DateTime), NULL, NULL, CAST(400.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([Id], [TypeId], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Price]) VALUES (8, 2, N'Bình đun siêu tốc thông minh', N'Bình đun siêu tốc có thể điều chỉnh nhiệt độ', 0, 1, CAST(N'2025-01-16T23:11:38.057' AS DateTime), NULL, NULL, CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([Id], [TypeId], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Price]) VALUES (9, 3, N'Ti vi thông minh', N'Ti vi thông minh với các chức năng giải trí và kết nối đa dạng', 0, 1, CAST(N'2025-01-16T23:11:38.057' AS DateTime), NULL, NULL, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([Id], [TypeId], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Price]) VALUES (10, 3, N'Quạt điều hòa thông minh', N'Quạt điều hòa có thể điều chỉnh nhiệt độ và độ ẩm tự động', 0, 1, CAST(N'2025-01-16T23:11:38.057' AS DateTime), NULL, NULL, CAST(700.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([Id], [TypeId], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Price]) VALUES (11, 3, N'Loa thông minh', N'Loa có thể điều khiển bằng giọng nói và kết nối với các thiết bị khác', 0, 1, CAST(N'2025-01-16T23:11:38.057' AS DateTime), NULL, NULL, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([Id], [TypeId], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Price]) VALUES (12, 3, N'Robot hút bụi thông minh', N'Robot hút bụi tự động điều khiển và có thể điều khiển qua app', 0, 1, CAST(N'2025-01-16T23:11:38.057' AS DateTime), NULL, NULL, CAST(900.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([Id], [TypeId], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Price]) VALUES (13, 4, N'Đèn thông minh', N'Đèn có thể điều khiển độ sáng và màu sắc qua app', 0, 1, CAST(N'2025-01-16T23:11:38.057' AS DateTime), NULL, NULL, CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([Id], [TypeId], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Price]) VALUES (14, 4, N'Ổ cắm thông minh', N'Ổ cắm có thể điều khiển và theo dõi qua điện thoại', 0, 1, CAST(N'2025-01-16T23:11:38.057' AS DateTime), NULL, NULL, CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([Id], [TypeId], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Price]) VALUES (15, 4, N'Cảm biến chuyển động thông minh', N'Cảm biến tự động điều chỉnh đèn và các thiết bị khác khi phát hiện chuyển động', 0, 1, CAST(N'2025-01-16T23:11:38.057' AS DateTime), NULL, NULL, CAST(70.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name], [Note]) VALUES (1, N'Nhân viên bán hàng', N'Quyền dành cho nhân viên bán hàng đồ gia dụng thông minh')
INSERT [dbo].[Role] ([Id], [Name], [Note]) VALUES (2, N'Admin', N'Quyền dành cho quản trị viên hệ thống')
INSERT [dbo].[Role] ([Id], [Name], [Note]) VALUES (3, N'Kỹ thuật', N'Quyền dành cho nhân viên kỹ thuật sửa chữa')
INSERT [dbo].[Role] ([Id], [Name], [Note]) VALUES (4, N'Quản lý', N'Quyền dành cho quản lý cửa hàng')
INSERT [dbo].[Role] ([Id], [Name], [Note]) VALUES (5, N'Khách hàng', N'Quyền dành cho khách hàng mua sắm đồ gia dụng thông minh')
INSERT [dbo].[Role] ([Id], [Name], [Note]) VALUES (6, N'Tester', N'Quyền dành cho nhân viên kiểm thử các sản phẩm gia dụng thông minh')
INSERT [dbo].[Role] ([Id], [Name], [Note]) VALUES (7, N'Nhân viên thu ngân', N'Quyền dành cho nhân viên thu ngân')
INSERT [dbo].[Role] ([Id], [Name], [Note]) VALUES (8, N'Nhân viên kho', N'Quyền dành cho nhân viên kho hàng')
INSERT [dbo].[Role] ([Id], [Name], [Note]) VALUES (9, N'Nhân viên giao hàng', N'Quyền dành cho nhân viên giao hàng')
INSERT [dbo].[Role] ([Id], [Name], [Note]) VALUES (10, N'Nhân viên bảo trì', N'Quyền dành cho nhân viên bảo trì các thiết bị gia dụng')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [RoleId], [UserName], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Email], [Password]) VALUES (23, 1, N'user1', N'Nguyen Thi Mai', N'Nhân viên bán hàng gia dụng thông minh', 0, 1, CAST(N'2025-01-16T23:16:41.960' AS DateTime), NULL, NULL, N'user1@gmail.com', N'Password1@')
INSERT [dbo].[User] ([Id], [RoleId], [UserName], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Email], [Password]) VALUES (24, 2, N'admin', N'Admin System', N'Quản trị viên hệ thống', 0, 1, CAST(N'2025-01-16T23:16:41.960' AS DateTime), NULL, NULL, N'admin@gmail.com', N'Password2@')
INSERT [dbo].[User] ([Id], [RoleId], [UserName], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Email], [Password]) VALUES (25, 3, N'tech1', N'Pham Minh Quan', N'Nhân viên kỹ thuật sửa chữa', 0, 1, CAST(N'2025-01-16T23:16:41.960' AS DateTime), NULL, NULL, N'tech1@gmail.com', N'Password3@')
INSERT [dbo].[User] ([Id], [RoleId], [UserName], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Email], [Password]) VALUES (26, 4, N'manager1', N'Tran Thi Lan', N'Quản lý cửa hàng', 0, 1, CAST(N'2025-01-16T23:16:41.960' AS DateTime), NULL, NULL, N'manager1@gmail.com', N'Password4@')
INSERT [dbo].[User] ([Id], [RoleId], [UserName], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Email], [Password]) VALUES (27, 5, N'customer1', N'Le Thi Hoa', N'Khách hàng mua sắm đồ gia dụng thông minh', 0, 1, CAST(N'2025-01-16T23:16:41.960' AS DateTime), NULL, NULL, N'customer1@gmail.com', N'Password5@')
INSERT [dbo].[User] ([Id], [RoleId], [UserName], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Email], [Password]) VALUES (28, 6, N'tester1', N'Nguyen Quang Hieu', N'Nhân viên kiểm thử sản phẩm', 0, 1, CAST(N'2025-01-16T23:16:41.960' AS DateTime), NULL, NULL, N'tester1@gmail.com', N'Password6@')
INSERT [dbo].[User] ([Id], [RoleId], [UserName], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Email], [Password]) VALUES (29, 7, N'cashier1', N'Tran Minh Son', N'Nhân viên thu ngân', 0, 1, CAST(N'2025-01-16T23:16:41.960' AS DateTime), NULL, NULL, N'cashier1@gmail.com', N'Password7@')
INSERT [dbo].[User] ([Id], [RoleId], [UserName], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Email], [Password]) VALUES (30, 8, N'warehouse1', N'Pham Thi Thanh', N'Nhân viên kho hàng', 0, 1, CAST(N'2025-01-16T23:16:41.960' AS DateTime), NULL, NULL, N'warehouse1@gmail.com', N'Password8@')
INSERT [dbo].[User] ([Id], [RoleId], [UserName], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Email], [Password]) VALUES (31, 9, N'delivery1', N'Le Thanh Son', N'Nhân viên giao hàng', 0, 1, CAST(N'2025-01-16T23:16:41.960' AS DateTime), NULL, NULL, N'delivery1@gmail.com', N'Password9@')
INSERT [dbo].[User] ([Id], [RoleId], [UserName], [Name], [Note], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Email], [Password]) VALUES (32, 10, N'maintenance1', N'Nguyen Thi Minh', N'Nhân viên bảo trì thiết bị', 0, 1, CAST(N'2025-01-16T23:16:41.960' AS DateTime), NULL, NULL, N'maintenance1@gmail.com', N'Password10@')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[MasterData] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MasterData] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([TypeId])
REFERENCES [dbo].[MasterData] ([Id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
USE [master]
GO
ALTER DATABASE [WebBanHang] SET  READ_WRITE 
GO
