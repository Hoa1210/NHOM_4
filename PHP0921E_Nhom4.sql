-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th4 11, 2022 lúc 08:57 AM
-- Phiên bản máy phục vụ: 5.7.37-0ubuntu0.18.04.1
-- Phiên bản PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `PHP0921E_Nhom4`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ct_don_hang`
--

CREATE TABLE `ct_don_hang` (
  `ma_dh` int(11) NOT NULL,
  `ma_sp` varchar(11) NOT NULL,
  `so_luong` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `ct_don_hang`
--

INSERT INTO `ct_don_hang` (`ma_dh`, `ma_sp`, `so_luong`) VALUES
(21, 'SP003', 4),
(21, 'SP005', 5),
(21, 'SP007', 5),
(22, 'SP007', 1),
(22, 'SP009', 3),
(23, 'SP003', 3);

--
-- Bẫy `ct_don_hang`
--
DELIMITER $$
CREATE TRIGGER `insert_don_hang` BEFORE INSERT ON `ct_don_hang` FOR EACH ROW begin 
 UPDATE san_pham
 SET so_luong = so_luong - NEW.so_luong
 where ma_sp = NEW.ma_sp;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `don_hang`
--

CREATE TABLE `don_hang` (
  `ma_dh` int(11) NOT NULL,
  `ma_kh` int(11) NOT NULL,
  `tong_tien` int(10) NOT NULL,
  `phuong_thuc_thanh_toan` varchar(255) NOT NULL,
  `ngay_lap_dh` date NOT NULL,
  `trang_thai` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `don_hang`
--

INSERT INTO `don_hang` (`ma_dh`, `ma_kh`, `tong_tien`, `phuong_thuc_thanh_toan`, `ngay_lap_dh`, `trang_thai`) VALUES
(21, 3, 1645000, '1', '2022-04-11', 0),
(22, 5, 358000, '1', '2022-04-11', 0),
(23, 5, 225000, '1', '2022-04-11', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khach_hang`
--

CREATE TABLE `khach_hang` (
  `ma_kh` int(11) NOT NULL,
  `ten_khach_hang` varchar(50) DEFAULT NULL,
  `ngay_sinh` date NOT NULL,
  `dia_chi` varchar(100) NOT NULL,
  `so_dien_thoai` varchar(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `khach_hang`
--

INSERT INTO `khach_hang` (`ma_kh`, `ten_khach_hang`, `ngay_sinh`, `dia_chi`, `so_dien_thoai`, `email`) VALUES
(3, 'Lương Văn Hòa 1000', '2022-04-02', 'Quý Sơn-Lục Ngạn-Bắc Giang', '0357143496', 'hoa@gmail.com'),
(4, 'Nông Minh Hiếu Ngu', '2022-04-02', 'Quý Sơn-Lục Ngạn-Bắc Giang', '0972798037', 'hieuminh2002@gmail.com'),
(5, 'admin', '2022-04-06', 'Quý Sơn-Lục Ngạn-Bắc Giang', '0357143496', 'hoamon146@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai_sp`
--

CREATE TABLE `loai_sp` (
  `ma_loai` varchar(11) NOT NULL,
  `ten_loai_sp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `loai_sp`
--

INSERT INTO `loai_sp` (`ma_loai`, `ten_loai_sp`) VALUES
('1', 'Dog toys'),
('2', 'Dog foods'),
('LABC', 'Vip'),
('LABC123', 'Dog toys abc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoi_dung`
--

CREATE TABLE `nguoi_dung` (
  `id` int(11) NOT NULL,
  `ten_dang_nhap` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `trang_thai` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `nguoi_dung`
--

INSERT INTO `nguoi_dung` (`id`, `ten_dang_nhap`, `email`, `mat_khau`, `trang_thai`) VALUES
(3, 'luongvanhoa123', '123@gmail.com', '202cb962ac59075b964b07152d234b70', 0),
(5, 'admin', 'hoamon146@gmail.com', '202cb962ac59075b964b07152d234b70', 0),
(6, 'luongvanhoa1000', 'hoachinsu123@gmail.com', '202cb962ac59075b964b07152d234b70', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `san_pham`
--

CREATE TABLE `san_pham` (
  `ma_sp` varchar(11) NOT NULL,
  `ma_loai_sp` varchar(11) NOT NULL,
  `ten_sp` varchar(50) NOT NULL,
  `hinh_anh` varchar(255) NOT NULL,
  `so_luong` int(11) DEFAULT NULL,
  `gia_ban` int(11) DEFAULT NULL,
  `thong_tin_them` varchar(500) NOT NULL,
  `trang_thai_sp` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `san_pham`
--

INSERT INTO `san_pham` (`ma_sp`, `ma_loai_sp`, `ten_sp`, `hinh_anh`, `so_luong`, `gia_ban`, `thong_tin_them`, `trang_thai_sp`) VALUES
('SP001', '1', 'ABC', '119184367_807680199992626_3993443359832267766_n.gif', 3, 35000, ' ', 0),
('SP002', '1', 'Bowl with rubber toy', 'products5.jpg', 0, 99000, ' Our Woof X Harness, Leash & Collar is made out of high-strength nylon and able to hold up to 200 lbs.', 1),
('SP003', '1', 'Automatic dog blue leash', 'products2.jpg', 76, 75000, ' Take your best friend for a walk without having to worry about carrying the water bottle, the bowl and the poop bags and let\'s not forget their favorite snacks! We heard your issues and we came to solve them. The All-In-One Smart Leash with built-in Water Bottle, Food Bowl, and Poop Bag is here! Comfortably take your furry friend for strolls around that big beautiful park that they love so much with the peace of mind knowing everything they need is in the palm of your hands!', 1),
('SP004', '1', 'Cat toilet bowl', 'products3.jpg', 0, 49000, ' Take your best friend for a walk without having to worry about carrying the water bottle, the bowl and the poop bags and let\'s not forget their favorite snacks! We heard your issues and we came to solve them.', 1),
('SP005', '1', 'Bowl with rubber toy', 'products4.jpg', 9, 60000, 'Comfortably take your furry friend for strolls around that big beautiful park that they love so much with the peace of mind knowing everything they need is in the palm of your hands!', 1),
('SP006', '1', 'Dog toys', 'products6.jpg', 0, 15000, ' Poop Bag is here! Comfortably take your furry friend for strolls around that big beautiful park that they love so much with the peace of mind knowing everything they need is in the palm of your hands!', 1),
('SP007', '1', 'Plastic muzzle', 'products7.jpg', 87, 29000, ' ', 1),
('SP008', '2', 'Premium beef rice', 'products13.jpg', 0, 134000, ' Take your best friend for a walk without having to worry about carrying the water bottle, the bowl and the poop bags and let\'s not forget their favorite snacks! We heard your issues and we came to solve them. The All-In-One Smart Leash with built-in Water Bottle, Food Bowl, and ', 1),
('SP009', '2', 'Premium pork rice', 'products14.jpg', 47, 100000, 'Poop Bag is here! Comfortably take your furry friend for strolls around that big beautiful park that they love so much with the peace of mind knowing everything they need is in the palm of your hands!', 1),
('SP010', '1', 'Pink ceramic cat bowl', 'products10.jpg', 49, 49000, ' Take your best friend for a walk without having to worry about carrying the water bottle, the bowl and the poop bags and let\'s not forget their favorite snacks! We heard your issues and we came to solve them. The All-In-One Smart Leash with built-in Water Bottle', 1),
('SP011', '1', 'Red dog bed', 'products11.jpg', 29, 125000, ' Take your best friend for a walk without having to worry about carrying the water bottle, the bowl and the poop bags and let\'s not forget their favorite snacks! We heard your issues and we came to solve them. ', 1),
('SP012', '1', 'Pet chair', 'products9.jpg', 54, 150000, ' Take your best friend for a walk without having to worry about carrying the water bottle, the bowl and the poop bags and let\'s not forget their favorite snacks! We heard your issues and we came to solve them.', 1),
('SP013', '2', 'Mianlien', 'products15.jpg', 4, 90900, ' abc', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `ct_don_hang`
--
ALTER TABLE `ct_don_hang`
  ADD PRIMARY KEY (`ma_dh`,`ma_sp`);

--
-- Chỉ mục cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  ADD PRIMARY KEY (`ma_dh`),
  ADD KEY `ma_kh` (`ma_kh`);

--
-- Chỉ mục cho bảng `khach_hang`
--
ALTER TABLE `khach_hang`
  ADD PRIMARY KEY (`ma_kh`);

--
-- Chỉ mục cho bảng `loai_sp`
--
ALTER TABLE `loai_sp`
  ADD PRIMARY KEY (`ma_loai`);

--
-- Chỉ mục cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD PRIMARY KEY (`ma_sp`),
  ADD KEY `ma_loai_sp` (`ma_loai_sp`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  MODIFY `ma_dh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `khach_hang`
--
ALTER TABLE `khach_hang`
  MODIFY `ma_kh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD CONSTRAINT `san_pham_ibfk_1` FOREIGN KEY (`ma_loai_sp`) REFERENCES `loai_sp` (`ma_loai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;