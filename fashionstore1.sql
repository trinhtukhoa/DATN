-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 26, 2024 lúc 08:41 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `fashionstore1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `count`, `product_id`, `user_id`) VALUES
(50, 2, 32, 'tukhoa133');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `category_name`) VALUES
(1, 'Áo'),
(3, 'Giày'),
(4, 'Mũ'),
(5, 'Kính');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `address`, `booking_date`, `country`, `email`, `fullname`, `note`, `payment_method`, `phone`, `status`, `total`, `user_id`) VALUES
(36, '418 Nguyễn Thái Sơn', '2024-11-25', 'Việt Nam', 'trinhtukhoa11@gmail.com', 'Trịnh Tú Khoa', 'Giao sớm giúp tôi', 'Payment on delivery', '0982873736', 'Pending', 240000, 'tukhoa133');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_item`
--

CREATE TABLE `order_item` (
  `id` int(11) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_item`
--

INSERT INTO `order_item` (`id`, `count`, `order_id`, `product_id`) VALUES
(42, 2, 36, 32);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `created_at` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `is_selling` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `sold` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `created_at`, `description`, `is_active`, `is_selling`, `price`, `product_name`, `quantity`, `sold`, `category_id`) VALUES
(7, '2022-08-04', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 750000, 'GIACN226 Giày Nam', 100, 80, 3),
(9, '2022-10-10', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 520000, 'Giày nam GIACN308', 100, 10, 3),
(10, '2022-03-09', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 249000, 'Mũ thời trang nam MLTTK301', 100, 100, 4),
(11, '2022-10-10', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 250000, 'Mũ Panama thời trang nam 18EM250', 200, 310, 4),
(12, '2022-08-04', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 180000, 'Mũ thời trang nam 16HM180', 100, 10, 4),
(13, '2022-07-04', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 999000, 'Kính mắt cao cấp UNISEX ELLY – EKU148', 98, 32, 5),
(14, '2022-05-30', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 899000, 'Kính mắt cao cấp ELLY – EKU141', 38, 52, 5),
(15, '2022-01-29', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 690000, 'Kính mắt cao cấp ELLY HOMME – EKM133', 80, 70, 5),
(16, '2022-11-21', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 250000, 'Áo hoodie thêu Code sl - xanh lá cây tươi sáng', 100, 20, 1),
(17, '2022-01-21', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 220000, 'Áo sơ mi tay ngắn Riviera - họa tiết hoa nâu đỏ', 100, 70, 1),
(18, '2022-10-02', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 190000, 'Áo thun cổ tròn họa tiết - màu trắng', 100, 20, 1),
(22, '2022-07-29', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 370000, 'Giày nam GIACN312', 100, 20, 3),
(23, '2022-10-30', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 120000, 'Giày nam GIACN235', 100, 20, 3),
(24, '2022-09-12', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 510000, 'GIÀY THỂ THAO SNEAKER G1011', 100, 100, 3),
(25, '2022-12-14', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 990000, 'Mũ thời trang nam MTRTK306', 89, 101, 4),
(26, '2022-11-16', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 100000, 'Mũ thời trang nam 16HM180', 98, 22, 4),
(27, '2022-10-23', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 190000, 'Mũ thời trang nam MLTTK301', 99, 71, 4),
(28, '2022-09-27', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 230000, 'Kính mát Gentle Monster Loful 01 56 -19 Đen', 100, 10, 5),
(29, '2022-04-06', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 760000, 'MarcJacobs MARC192FS-IPR-9O', 100, 20, 5),
(30, '2022-03-30', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 520000, 'Kính râm chống ánh sáng xanh', 100, 90, 5),
(31, '2022-03-30', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 520000, 'Áo khoác Blazer ABZTK303', 100, 90, 1),
(32, '2022-12-09', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 120000, 'Áo sơ mi nam STDTK341', 95, 85, 1),
(33, '2022-11-03', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 340000, 'Áo thun nam APHTK358', 100, 130, 1),
(37, '2022-10-29', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 820000, 'Giày nam GIACN209', 100, 70, 3),
(38, '2022-07-24', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 670000, 'GIÀY NAM GIACN101', 100, 50, 3),
(39, '2022-05-23', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 710000, 'GIÀY GIACN 115', 100, 90, 3),
(40, '2022-03-25', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 200000, 'Mũ thời trang nam MLTTK304', 100, 90, 4),
(41, '2022-01-19', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 560000, 'Mũ thời trang nam MLTTK303', 100, 78, 4),
(42, '2022-01-15', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 120000, 'Mũ thời trang nam 16HM180', 100, 120, 4),
(43, '2022-04-15', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 350000, 'OWNDAYS - Kính mát SUN8005J-2S', 100, 10, 5),
(44, '2022-08-16', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 120000, 'Kính MUJOSH', 100, 50, 5),
(45, '2022-03-11', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 240000, 'Kính MAX&Co', 100, 500, 5),
(46, '2024-11-15', 'Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.', 1, 1, 200000, 'Áo thun nam EKU142', -22, 24, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_image`
--

CREATE TABLE `product_image` (
  `id` int(11) NOT NULL,
  `url_image` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_image`
--

INSERT INTO `product_image` (`id`, `url_image`, `product_id`) VALUES
(19, 'https://m.media-amazon.com/images/I/61HyLLS0EwL._AC_SY695_.jpg', 7),
(20, 'https://m.media-amazon.com/images/I/61HyLLS0EwL._AC_SY695_.jpg', 7),
(21, 'https://m.media-amazon.com/images/I/61HyLLS0EwL._AC_SY695_.jpg', 7),
(25, 'https://ochoshoes.com/wp-content/uploads/2024/07/14-1.png', 9),
(26, 'https://ochoshoes.com/wp-content/uploads/2024/07/14-1.png', 9),
(27, 'https://ochoshoes.com/wp-content/uploads/2024/07/14-1.png', 9),
(28, 'https://360.com.vn/wp-content/uploads/2023/05/MLTTK404-4-Copy.jpg', 10),
(29, 'https://360.com.vn/wp-content/uploads/2023/05/MLTTK404-4-Copy.jpg', 10),
(30, 'https://360.com.vn/wp-content/uploads/2023/05/MLTTK404-4-Copy.jpg', 10),
(31, 'https://360.com.vn/wp-content/uploads/2022/08/18Em250.jpg', 11),
(32, 'https://360.com.vn/wp-content/uploads/2022/08/18Em250.jpg', 11),
(33, 'https://360.com.vn/wp-content/uploads/2022/08/18Em250.jpg', 11),
(34, 'https://mediaelly.sgp1.digitaloceanspaces.com/uploads/2022/06/17085839/kinh-mat-unisex-cao-cap-elly-eku148-1-3.jpg', 12),
(35, 'https://mediaelly.sgp1.digitaloceanspaces.com/uploads/2022/06/17085839/kinh-mat-unisex-cao-cap-elly-eku148-1-3.jpg', 12),
(36, 'https://mediaelly.sgp1.digitaloceanspaces.com/uploads/2022/06/17085839/kinh-mat-unisex-cao-cap-elly-eku148-1-3.jpg', 12),
(37, 'https://mediaelly.sgp1.digitaloceanspaces.com/uploads/2022/07/12224306/kinh-mat-nu-thoi-trang-cao-cap-EKU141-3.jpg', 13),
(38, 'https://mediaelly.sgp1.digitaloceanspaces.com/uploads/2022/07/12224306/kinh-mat-nu-thoi-trang-cao-cap-EKU141-3.jpg', 13),
(39, 'https://mediaelly.sgp1.digitaloceanspaces.com/uploads/2022/07/12224306/kinh-mat-nu-thoi-trang-cao-cap-EKU141-3.jpg', 13),
(40, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lsckg1742q3de6.webp', 14),
(41, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lsckg1742q3de6.webp', 14),
(42, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lsckg1742q3de6.webp', 14),
(43, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lsckg1742q3de6.webp', 15),
(44, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lsckg1742q3de6.webp', 15),
(45, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lsckg1742q3de6.webp', 15),
(46, 'https://360.com.vn/wp-content/uploads/2023/11/AHHTK403-APTTK403-QGNTK407-12-Custom.jpg', 16),
(47, 'https://360.com.vn/wp-content/uploads/2023/11/AHHTK403-APTTK403-QGNTK407-12-Custom.jpg', 16),
(48, 'https://360.com.vn/wp-content/uploads/2023/11/AHHTK403-APTTK403-QGNTK407-12-Custom.jpg', 16),
(49, 'https://360.com.vn/wp-content/uploads/2024/07/SHNTK512-8.jpg', 17),
(50, 'https://360.com.vn/wp-content/uploads/2024/07/SHNTK512-8.jpg', 17),
(51, 'https://360.com.vn/wp-content/uploads/2024/07/SHNTK512-8.jpg', 17),
(52, 'https://360.com.vn/wp-content/uploads/2024/11/ATDOL527-18.jpg', 18),
(53, 'https://360.com.vn/wp-content/uploads/2024/11/ATDOL527-18.jpg', 18),
(54, 'https://360.com.vn/wp-content/uploads/2024/11/ATDOL527-18.jpg', 18),
(55, 'https://360.com.vn/wp-content/uploads/2024/11/ATDOL527-18.jpg', 18),
(65, 'https://360.com.vn/wp-content/uploads/2022/10/GIACN312-2.jpg', 22),
(66, 'https://360.com.vn/wp-content/uploads/2022/10/GIACN312-2.jpg', 22),
(67, 'https://360.com.vn/wp-content/uploads/2022/10/GIACN312-2.jpg', 22),
(68, 'https://m.media-amazon.com/images/I/71Lk6pRd6fL._AC_SY695_.jpg', 23),
(69, 'https://m.media-amazon.com/images/I/71Lk6pRd6fL._AC_SY695_.jpg', 23),
(70, 'https://m.media-amazon.com/images/I/71Lk6pRd6fL._AC_SY695_.jpg', 23),
(71, 'https://blackshop.vn/wp-content/uploads/2024/05/1-18.jpg.webp', 24),
(72, 'https://blackshop.vn/wp-content/uploads/2024/05/1-18.jpg.webp', 24),
(73, 'https://360.com.vn/wp-content/uploads/2023/05/MTRTK406-2-Copy.jpg', 25),
(74, 'https://360.com.vn/wp-content/uploads/2023/05/MTRTK406-2-Copy.jpg', 25),
(75, 'https://360.com.vn/wp-content/uploads/2023/05/MTRTK406-2-Copy.jpg', 25),
(76, 'https://360.com.vn/wp-content/uploads/2023/05/MTRTK406-2-Copy.jpg', 25),
(77, 'https://360.com.vn/wp-content/uploads/2022/08/16HM180-73.jpg', 26),
(78, 'https://360.com.vn/wp-content/uploads/2022/08/16HM180-73.jpg', 26),
(79, 'https://360.com.vn/wp-content/uploads/2022/08/16HM180-73.jpg', 26),
(80, 'https://360.com.vn/wp-content/uploads/2023/05/MLTTK404-4-Copy.jpg', 27),
(81, 'https://360.com.vn/wp-content/uploads/2023/05/MLTTK404-4-Copy.jpg', 27),
(82, 'https://360.com.vn/wp-content/uploads/2023/05/MLTTK404-4-Copy.jpg', 27),
(83, 'https://www-prd-sg.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/l/o/loful_01_1_1.jpg', 28),
(84, 'https://www-prd-sg.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/l/o/loful_01_1_1.jpg', 28),
(85, 'https://www-prd-sg.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/l/o/loful_01_1_1.jpg', 28),
(86, 'https://sunwear.vn/cdn/shop/products/MARC192FS-IPR9O-B_1200x.jpg?v=1606277691', 29),
(87, 'https://sunwear.vn/cdn/shop/products/MARC192FS-IPR9O-B_1200x.jpg?v=1606277691', 29),
(88, 'https://sunwear.vn/cdn/shop/products/MARC192FS-IPR9O-B_1200x.jpg?v=1606277691', 29),
(89, 'https://m.media-amazon.com/images/I/617ggopHtYL._AC_SX679_.jpg', 30),
(90, 'https://m.media-amazon.com/images/I/617ggopHtYL._AC_SX679_.jpg', 30),
(91, 'https://m.media-amazon.com/images/I/617ggopHtYL._AC_SX679_.jpg', 30),
(92, 'https://360.com.vn/wp-content/uploads/2023/12/ABZTK401-ALETK401-QATTK408-2-Custom.jpg', 31),
(93, 'https://360.com.vn/wp-content/uploads/2023/12/ABZTK401-ALETK401-QATTK408-2-Custom.jpg', 31),
(94, 'https://360.com.vn/wp-content/uploads/2023/12/ABZTK401-ALETK401-QATTK408-2-Custom.jpg', 31),
(95, 'https://360.com.vn/wp-content/uploads/2024/07/STDTK521-8.jpg', 32),
(96, 'https://360.com.vn/wp-content/uploads/2024/07/STDTK521-8.jpg', 32),
(97, 'https://360.com.vn/wp-content/uploads/2024/07/STDTK521-8.jpg', 32),
(98, 'https://360.com.vn/wp-content/uploads/2024/07/STDTK521-8.jpg', 32),
(99, 'https://360.com.vn/wp-content/uploads/2024/11/APHTK533-QSKTK514-1.jpg', 33),
(100, 'https://360.com.vn/wp-content/uploads/2024/11/APHTK533-QSKTK514-1.jpg', 33),
(101, 'https://360.com.vn/wp-content/uploads/2024/11/APHTK533-QSKTK514-1.jpg', 33),
(111, 'https://m.media-amazon.com/images/I/81sUSiFfTIL._AC_SY695_.jpg', 37),
(112, 'https://m.media-amazon.com/images/I/81sUSiFfTIL._AC_SY695_.jpg', 37),
(113, 'https://m.media-amazon.com/images/I/81sUSiFfTIL._AC_SY695_.jpg', 37),
(114, 'https://down-vn.img.susercontent.com/file/f685710f4f2a97853be04705c7fe1a62@resize_w900_nl.webp', 38),
(115, 'https://down-vn.img.susercontent.com/file/f685710f4f2a97853be04705c7fe1a62@resize_w900_nl.webp', 38),
(116, 'https://down-vn.img.susercontent.com/file/f685710f4f2a97853be04705c7fe1a62@resize_w900_nl.webp', 38),
(117, 'https://product.hstatic.net/1000312752/product/11820174b384a79efbcd0343a2ee4d4d066ff6cc2beaba276e2749b38624078f777ed3_fbb17156146b4b5cb6ba2f1da94e9a11.jpg', 39),
(118, 'https://product.hstatic.net/1000312752/product/11820174b384a79efbcd0343a2ee4d4d066ff6cc2beaba276e2749b38624078f777ed3_fbb17156146b4b5cb6ba2f1da94e9a11.jpg', 39),
(119, 'https://product.hstatic.net/1000312752/product/11820174b384a79efbcd0343a2ee4d4d066ff6cc2beaba276e2749b38624078f777ed3_fbb17156146b4b5cb6ba2f1da94e9a11.jpg', 39),
(120, 'https://360.com.vn/wp-content/uploads/2023/05/MLTTK401-3-Copy.jpg', 40),
(121, 'https://360.com.vn/wp-content/uploads/2023/05/MLTTK401-3-Copy.jpg', 40),
(122, 'https://360.com.vn/wp-content/uploads/2023/05/MLTTK401-3-Copy.jpg', 40),
(123, 'https://360.com.vn/wp-content/uploads/2023/05/MLTTK402-3-Copy.jpg', 41),
(124, 'https://360.com.vn/wp-content/uploads/2023/05/MLTTK402-3-Copy.jpg', 41),
(125, 'https://360.com.vn/wp-content/uploads/2023/05/MLTTK402-3-Copy.jpg', 41),
(126, 'https://360.com.vn/wp-content/uploads/2022/08/16HM180-58.jpg', 42),
(127, 'https://360.com.vn/wp-content/uploads/2022/08/16HM180-58.jpg', 42),
(128, 'https://www.owndays.com/storage/products/f1dd7fbb-49ad-4fea-aa69-f8fccc1e8e66.webp', 43),
(129, 'https://www.owndays.com/storage/products/f1dd7fbb-49ad-4fea-aa69-f8fccc1e8e66.webp', 43),
(130, 'https://www.owndays.com/storage/products/f1dd7fbb-49ad-4fea-aa69-f8fccc1e8e66.webp', 43),
(131, 'https://down-vn.img.susercontent.com/file/vn-11134258-7ras8-m2hz143oailw9f', 44),
(132, 'https://down-vn.img.susercontent.com/file/vn-11134258-7ras8-m2hz143oailw9f', 44),
(133, 'https://down-vn.img.susercontent.com/file/vn-11134258-7ras8-m2hz143oailw9f', 44),
(134, 'https://b2c-media.maxandco.com/sys-master/m0/MC/2025/1/8801015302/003/s3master/8801015302003-a-mo0114_normal.webp#product', 45),
(135, 'https://b2c-media.maxandco.com/sys-master/m0/MC/2025/1/8801015302/003/s3master/8801015302003-a-mo0114_normal.webp#product', 45),
(136, 'https://b2c-media.maxandco.com/sys-master/m0/MC/2025/1/8801015302/003/s3master/8801015302003-a-mo0114_normal.webp#product', 45),
(137, 'http://res.cloudinary.com/drlroexjl/image/upload/v1731648296/uoazn4garcldw2elyuyc.avif', 46);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `login_type` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `avatar`, `email`, `login_type`, `password`, `phone_number`, `role`, `user_name`) VALUES
('admin', NULL, 'admin@example.com', NULL, 'MTIz', NULL, 'admin', 'Nguyễn Tấn Phát'),
('anhduy133', NULL, 'anhduy13@gmail.com', NULL, 'MTIz', NULL, 'user', 'Nguyễn Duy Anh'),
('duyanh112', NULL, 'duyanh11@gmail.com', NULL, 'MTIz', NULL, 'admin', 'Do Van A'),
('minhbinh1223', 'https://haycafe.vn/wp-content/uploads/2022/02/Avatar-trang-den.png', 'minhbinh122@gmail.com', 'default', 'MTIz', NULL, 'user', 'Nguyễn Minh Bình'),
('minhthang14', NULL, 'chauminhthang14@gmail.com', NULL, 'MTIz', NULL, 'user', 'Châu Minh Thắng'),
('nhivan12', NULL, 'nhivan12@gmail.com', NULL, 'MTIz', NULL, 'user', 'Bùi An Nhi'),
('tanphat12', NULL, 'tanphatsode1509@gmail.com', NULL, 'MTIz', NULL, 'user', 'Nguyễn Tấn Phát'),
('tantien12', NULL, 'tantien12@gmail.com', NULL, 'MTIz', NULL, 'user', 'Bùi Tấn Tiễn'),
('trangvang44', NULL, 'tranvang12@gmail.com', NULL, 'MTIz', NULL, 'user', 'Nguyễn Trần Vàng'),
('trantoan1223', 'https://haycafe.vn/wp-content/uploads/2022/02/Avatar-trang-den.png', 'trantoan11@gmail.com', 'default', 'MTIz', NULL, 'user', 'Hồ Đình Toàn'),
('tukhoa133', 'https://haycafe.vn/wp-content/uploads/2022/02/Avatar-trang-den.png', 'trinhtukhoa11@gmail.com', 'default', 'MTIz', NULL, 'user', 'Trịnh Tú Khoa');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_category_id` (`category_id`);

--
-- Chỉ mục cho bảng `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
