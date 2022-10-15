﻿CREATE DATABASE QLDA;
GO 
USE QLDA;
GO

CREATE TABLE PHONGBAN
(
	MAPB VARCHAR(5),
	TENPB NVARCHAR(50) NOT NULL,
	TRUONGPHONG VARCHAR(5) NOT NULL,
	NG_NHANCHUC DATE NOT NULL,
	CONSTRAINT PK_PHONGBAN PRIMARY KEY (MAPB)
);

CREATE TABLE NHANVIEN
(
	MANV VARCHAR(5),
	HONV NVARCHAR(20) NOT NULL,
	TENLOT NVARCHAR(20) NOT NULL,
	TENNV NVARCHAR(10) NOT NULL,
	NGAYSINH DATE NOT NULL,
	DIACHI NVARCHAR(100) NOT NULL,
	PHAI VARCHAR(5) NOT NULL,
	LUONG DECIMAL(10,2) NOT NULL,
	MAPB VARCHAR(5) NOT NULL,
	CONSTRAINT PK_NHANVIEN PRIMARY KEY (MANV),
	FOREIGN KEY (MAPB) REFERENCES PHONGBAN(MAPB)
);

CREATE TABLE THANNHAN
(
	MANV VARCHAR(5),
	TENTN NVARCHAR(30) NOT NULL,
	PHAI BIT NOT NULL,
	NGAYSINH DATE NOT NULL,
	QUANHE NVARCHAR(20) NOT NULL,
	CONSTRAINT PK_THANNHAN PRIMARY KEY (MANV, TENTN),
	FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
);

CREATE TABLE DEAN
(
	MADA VARCHAR(5),
	TENDA NVARCHAR(50) NOT NULL,
	DDIEM_DA NVARCHAR(100) NOT NULL,
	MAPB VARCHAR(5) NOT NULL,
	CONSTRAINT PK_DEAN PRIMARY KEY (MADA),
	FOREIGN KEY (MAPB) REFERENCES PHONGBAN(MAPB)
);

CREATE TABLE DDIEMPB
(
	MAPB VARCHAR(5),
	DIADIEM NVARCHAR(100) NOT NULL,
	CONSTRAINT PK_DDIEMPB PRIMARY KEY (MAPB, DIADIEM),
	FOREIGN KEY (MAPB) REFERENCES PHONGBAN(MAPB)
);

CREATE TABLE PHANCONG 
(
	MANV VARCHAR(5),
	MADA VARCHAR(5),
	THOIGIAN DECIMAL(5,1) NOT NULL,
	CONSTRAINT PK_PHANCONG PRIMARY KEY (MANV, MADA),
	FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV),
	FOREIGN KEY (MADA) REFERENCES DEAN(MADA)
);

INSERT INTO PHONGBAN(MAPB, TENPB, TRUONGPHONG, NG_NHANCHUC)
VALUES ('P1', N'QUANLY', 'NV5', '2016-06-19')
INSERT INTO PHONGBAN(MAPB, TENPB, TRUONGPHONG, NG_NHANCHUC)
VALUES ('P2', N'DIEUHANH', 'NV8', '2018-01-01')
INSERT INTO PHONGBAN(MAPB, TENPB, TRUONGPHONG, NG_NHANCHUC)
VALUES ('P3', N'NGHIENCUU', 'NV2', '2017-05-22');

INSERT INTO NHANVIEN(MANV, HONV, TENLOT, TENNV, NGAYSINH, DIACHI, PHAI, LUONG, MAPB)
VALUES ('NV1', N'DINH', N'BA', N'TIEN', '1985-01-09', N'731 Tran Hung Dao, q1, TPHCM', 'NAM', 30000, 'P3')
INSERT INTO NHANVIEN(MANV, HONV, TENLOT, TENNV, NGAYSINH, DIACHI, PHAI, LUONG, MAPB)
VALUES ('NV2', N'VO', N'THANH', N'TUNG', '19751208', N'638 Tran Hung Dao', 'NAM', 40000, 'P3')
INSERT INTO NHANVIEN(MANV, HONV, TENLOT, TENNV, NGAYSINH, DIACHI, PHAI, LUONG, MAPB)
VALUES ('NV3', N'TRAN', N'THANH', N'TAM', '19820731', N'853 Mai Thi Luu, q1, TPHCM', 'NAM', 25000, 'P2')
INSERT INTO NHANVIEN(MANV, HONV, TENLOT, TENNV, NGAYSINH, DIACHI, PHAI, LUONG, MAPB)
VALUES ('NV4', N'VO', N'MANH', N'HUNG', '19720915', N'975 Ba Ria, Vung Tau', 'NAM', 38000, 'P2')
INSERT INTO NHANVIEN(MANV, HONV, TENLOT, TENNV, NGAYSINH, DIACHI, PHAI, LUONG, MAPB)
VALUES ('NV5', N'LE', N'NGOC', N'QUYEN', '19871010', N'450 Trung Vuong, Ha Noi', 'NU', 55000, 'P1')
INSERT INTO NHANVIEN(MANV, HONV, TENLOT, TENNV, NGAYSINH, DIACHI, PHAI, LUONG, MAPB)
VALUES ('NV6', N'TRAN', N'MINH', N'KHANG', '19820624', N'Tran Binh Trong, TPHCM', 'NAM', 58000, 'P1')
INSERT INTO NHANVIEN(MANV, HONV, TENLOT, TENNV, NGAYSINH, DIACHI, PHAI, LUONG, MAPB)
VALUES ('NV7', N'LE', N'THI', N'NHAN', '19810620', N'291 Ho Van Huc, QPN, TPHCM', 'NU', 43000, 'P3')
INSERT INTO NHANVIEN(MANV, HONV, TENLOT, TENNV, NGAYSINH, DIACHI, PHAI, LUONG, MAPB)
VALUES ('NV8', N'TRAN', N'HONG', N'QUANG', '19790329', N'980 Le Hong Phong, Q10, TPHCM', 'NAM', 25000, 'P2')
INSERT INTO NHANVIEN(MANV, HONV, TENLOT, TENNV, NGAYSINH, DIACHI, PHAI, LUONG, MAPB)
VALUES ('NV9', N'BUI', N'THUY', N'VU', '19780719', N'332 Nguyen Thai Hoc, Q1, TPHCM', 'NU', 25000, 'P1');

INSERT INTO DEAN(MADA, TENDA, DDIEM_DA, MAPB)
VALUES ('DA1', N'San pham X', N'VUNG TAU', 'P3')
INSERT INTO DEAN(MADA, TENDA, DDIEM_DA, MAPB)
VALUES ('DA2', N'San pham Y', N'NHA TRANG', 'P3')
INSERT INTO DEAN(MADA, TENDA, DDIEM_DA, MAPB)
VALUES ('DA3', N'San pham Z', N'TPHCM', 'P3')
INSERT INTO DEAN(MADA, TENDA, DDIEM_DA, MAPB)
VALUES ('DA4', N'Tin hoc hoa', N'HA NOI', 'P2')
INSERT INTO DEAN(MADA, TENDA, DDIEM_DA, MAPB)
VALUES ('DA5', N'Cap quang', N'TPHCM', 'P1')
INSERT INTO DEAN(MADA, TENDA, DDIEM_DA, MAPB)
VALUES ('DA6', N'Dao tao', N'HA NOI', 'P2');

INSERT INTO DDIEMPB(MAPB, DIADIEM)
VALUES ('P1', N'TPHCM'),
		('P2', N'HA NOI'),
		('P3', N'NHA TRANG'),
		('P3', N'TPHCM'),
		('P3', N'VUNG TAU');

INSERT INTO PHANCONG(MANV, MADA, THOIGIAN)
VALUES ('NV1', 'DA1', 32.5),
		('NV1', 'DA2', 7.5),
		('NV1', 'DA3', 10),
		('NV2', 'DA3', 40),
		('NV2', 'DA4', 20),
		('NV2', 'DA5', 20),
		('NV3', 'DA1', 20),
		('NV3', 'DA2', 20),
		('NV4', 'DA3', 10),
		('NV5', 'DA4', 10),
		('NV5', 'DA5', 10),
		('NV7', 'DA6', 30),
		('NV8', 'DA4', 10),
		('NV8', 'DA6', 20),
		('NV9', 'DA4', 15);

INSERT INTO THANNHAN(MANV, TENTN, PHAI, NGAYSINH, QUANHE)
VALUES ('NV1', N'DINH BA KIEN', 1, '1995-07-15', N'CON TRAI'),
		('NV1', N'NGUYEN THANH THAO', 0, '1988-04-08', N'VỢ'),
		('NV2', N'VO THANH SON', 1, '1950-09-23', N'CHA'),
		('NV3', N'LE THI HUONG', 0, '1984-01-09', N'VỢ'),
		('NV3', N'TRAN LE NGOC HOA', 0, '1917-09-12', N'CON GÁI'),
		('NV6', N'TRAN MINH AN', 1, '1980-08-05', N'ANH TRAI'),
		('NV7', N'LE THI NGAN', 0, '1980-06-07', N'EM GAI'),
		('NV9', N'TRAN QUOC VUONG', 1, '1975-05-05', N'CHỒNG');
