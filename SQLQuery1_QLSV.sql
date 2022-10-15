CREATE DATABASE QLSV;

GO

USE QLSV;

GO

CREATE TABLE KHOA
(
	MaKhoa VARCHAR(10),
	TenKhoa NVARCHAR(50) NOT NULL,
	SL_CBGD SMALLINT NOT NULL
	CONSTRAINT PK_KHOA PRIMARY KEY (MaKhoa)
)

GO 

CREATE TABLE SINHVIEN
(
	MSSV VARCHAR(5),
	Ten NVARCHAR(50) NOT NULL,
	GioiTinh VARCHAR(5) NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL,
	DienThoai VARCHAR(20),
	MaKhoa VARCHAR(10) NOT NULL
	CONSTRAINT PK_SINHVIEN PRIMARY KEY (MSSV)
)

GO 

CREATE TABLE GIAOVIEN
(
	MaGV VARCHAR(5),
	TenGV NVARCHAR(50) NOT NULL,
	MaKhoa VARCHAR(10) NOT NULL,
	CONSTRAINT PK_GIAOVIEN PRIMARY KEY (MaGV)
)

GO

CREATE TABLE MONHOC
(
	MaMH VARCHAR(5),
	TenMH NVARCHAR(50) NOT NULL,
	SoTC SMALLINT NOT NULL,
	CONSTRAINT PK_MONHOC PRIMARY KEY (MaMH)
)

GO 

CREATE TABLE GIANGDAY
(
	MaKhoaHoc VARCHAR(5),
	MaGV VARCHAR(5) NOT NULL,
	MaMH VARCHAR(5) NOT NULL,
	HocKy SMALLINT NOT NULL,
	Nam INT NOT NULL,
	CONSTRAINT PK_GIANGDAY PRIMARY KEY (MaKhoaHoc)
)

GO 

CREATE TABLE KETQUA
(
	MSSV VARCHAR(5),
	MaKhoaHoc VARCHAR(5),
	Diem DECIMAL(3,1) NOT NULL,
	PRIMARY KEY (MSSV, MaKhoaHoc)
)

GO

ALTER TABLE dbo.GIANGDAY ADD FOREIGN KEY(MaGV) REFERENCES dbo.GIAOVIEN(MaGV)
ALTER TABLE dbo.GIANGDAY ADD FOREIGN KEY(MaMH) REFERENCES dbo.MONHOC(MaMH)
ALTER TABLE dbo.GIAOVIEN ADD FOREIGN KEY(MaKhoa) REFERENCES dbo.KHOA(MaKhoa)
ALTER TABLE dbo.SINHVIEN ADD FOREIGN KEY(MaKhoa) REFERENCES dbo.KHOA(MaKhoa)
ALTER TABLE dbo.KETQUA ADD FOREIGN KEY(MSSV) REFERENCES dbo.SINHVIEN(MSSV)
ALTER TABLE dbo.KETQUA ADD FOREIGN KEY(MaKhoaHoc) REFERENCES dbo.GIANGDAY(MaKhoaHoc)

GO

INSERT INTO KHOA(MaKhoa, TenKhoa, SL_CBGD)
VALUES ('CNTT', N'Công Nghệ Thông Tin', 15),
	   ('TOAN', N'Toán', 20),
	   ('SINH', N'Sinh Học', 7);

INSERT INTO SINHVIEN(MSSV, Ten, GioiTinh, DiaChi, DienThoai, MaKhoa)
VALUES ('SV001', N'BUI THUY AN', 'Nữ', N'223 TRAN HUNG DAO .HCM', '0843132202', 'CNTT'),
	   ('SV002', N'NGUYEN THANH TUNG', 'Nam', N'140 CONG HUYNH .HCM', '0581525678', 'CNTT'),
	   ('SV003', N'NGUYEN THANH LONG', 'Nam', N'112/4 CONG HUYNH .HCM', '0918345623', 'TOAN'),
	   ('SV004', N'HOANG THI HOA', 'Nữ', N'90 NG VAN CU .HCM', '0988320123', 'CNTT'),
	   ('SV005', N'TRAN HONG SON', 'Nam', N'54 CAO THANG .HANOI', '0928345987', 'TOAN');

INSERT INTO GIAOVIEN(MaGV, TenGV, MaKhoa)
VALUES ('GV01', N'PHAM THI THAO', 'CNTT'),
	   ('GV02', N'LAM HOANG VU', 'TOAN'),
	   ('GV03', N'TRAN VAN TIEN', 'CNTT'),
	   ('GV04', N'HOANG VUONG', 'CNTT');

INSERT INTO MONHOC(MaMH, TenMH, SoTC)
VALUES ('CSDL', N'CO SO DU LIEU', 3),
	   ('CTDL', N'CAU TRUC DU LIEU', 4),
	   ('KTLT', N'KY THUAT LAP TRINH', 5),
	   ('CWIN', N'LAP TRINH C TREN WINDOW', 4);

INSERT INTO GIANGDAY(MaKhoaHoc, MaGV, MaMH, HocKy, Nam)
VALUES ('K1', 'GV01', 'CSDL', 1, 2021),
	   ('K2', 'GV04', 'KTLT', 2, 2020),
	   ('K3', 'GV03', 'CTDL', 1, 2020),
	   ('K4', 'GV04', 'CWIN', 1, 2020),
	   ('K5', 'GV01', 'CSDL', 1, 2021);

INSERT INTO KETQUA(MSSV, MaKhoaHoc, Diem)
VALUES ('SV001', 'K1', 8.5),
	   ('SV002', 'K3', 7.0),
	   ('SV003', 'K4', 7.5),
	   ('SV001', 'K2', 9.0),
	   ('SV004', 'K3', 6.0),
	   ('SV005', 'K3', 7.0),
	   ('SV002', 'K1', 7.0),
	   ('SV003', 'K2', 8.5),
	   ('SV005', 'K5', 7.0),
	   ('SV004', 'K4', 2.0);

--Câu 1
SELECT Ten, DiaChi, DienThoai
FROM SINHVIEN

--Câu 2
SELECT MaMH, SoTC
FROM MONHOC

--Câu 3
SELECT MSSV, Diem
FROM KETQUA
WHERE (MSSV ='SV003')

--Câu 4
SELECT MaMH, TenMH, SoTC
FROM MONHOC
WHERE MaMH LIKE 'C_D%'

--Câu 5
SELECT TenGV
FROM GIAOVIEN
WHERE TenGV LIKE '%__A%'

--Câu 6
SELECT TenMH
FROM MONHOC
WHERE TenMH LIKE '%DU%'

--Câu 7
SELECT TenGV
FROM GIAOVIEN
WHERE TenGV LIKE '[PL]%'

--Câu 8
SELECT Ten, DiaChi
FROM SINHVIEN
WHERE DiaChi LIKE '%Cong Huynh%'

--Câu 9 Cho biết danh sách các môn học được dạy trong năm 2002.
SELECT mh.TenMH
FROM MONHOC mh JOIN GIANGDAY gd ON gd.MaMH = mh.MaMH
WHERE gd.Nam = 2020

--Câu 10. Cho biết mã, tên, địa chỉ của các sinh viên theo từng Khoa sắp theo thứ tự A-Z của tên sinh viên.
SELECT MSSV, Ten, DiaChi
FROM SINHVIEN
ORDER BY Ten ASC

--Câu 11: Cho biết điểm của các sinh viên theo từng môn học
SELECT KQ.MSSV, GD.MaMH, KQ.Diem
FROM KETQUA KQ JOIN SINHVIEN SV ON KQ.MSSV = SV.MSSV
				JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ.MaKhoaHoc

--12. Cho biết các sinh viên học môn ‘CSDL’ có điểm từ 8 đến 10.
SELECT KQ.MSSV, KQ.Diem
FROM GIANGDAY GD JOIN KETQUA KQ ON KQ.MaKhoaHoc = GD.MaKhoaHoc
WHERE GD.MaMH='CSDL' AND KQ.Diem BETWEEN 8 AND 9

--13. Cho biết bảng điểm của sinh viên có tên là ‘TUNG’.
SELECT SV.TEN, KQ.Diem, MH.MaMH
FROM KETQUA KQ JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ.MaKhoaHoc
				JOIN SINHVIEN SV ON SV.MSSV = KQ.MSSV
				JOIN MONHOC MH ON MH.MaMH = GD.MaMH
WHERE SV.Ten LIKE '%TUNG'

---14. Cho biết tên khoa, tên môn học mà những sinh viên trong khoa đã học.
SELECT DISTINCT k.TenKhoa,mh.TenMH
FROM KHOA k  JOIN dbo.GIAOVIEN gv ON gv.MaKhoa = k.MaKhoa
				JOIN dbo.GIANGDAY gd ON gd.MaGV = gv.MaGV
				JOIN dbo.MONHOC mh ON mh.MaMH = gd.MaMH

-- CÂU 19: Cho biết mã, tên các sinh viên có kết quả 1 môn học nào đó trên 8 điểm (Kết quả các môn khác có thể <= 8).
SELECT SV.MSSV, TEN
FROM SINHVIEN SV JOIN KETQUA KQ ON SV.MSSV = KQ.MSSV
WHERE KQ.Diem > ANY (SELECT KQ.Diem	
					FROM KETQUA KQ JOIN SINHVIEN SV ON KQ.MSSV = SV.MSSV	
					WHERE KQ.Diem = 8)

--Câu 45
 SELECT mh.MaMH, Ten, Ten, Diem 
FROM MONHOC mh INNER JOIN GIANGDAY gd on mh.MaMH = gd.MaMH INNER JOIN KETQUA kq on gd.MaKhoaHoc = kq.MaKhoaHoc INNER JOIN SINHVIEN sv on kq.MSSV = sv.MSSV
 WHERE Diem >= (select max(Diem) from KETQUA INNER JOIN GIANGDAY on KETQUA.MaKhoaHoc = GIANGDAY.MaKhoaHoc where MaMH = mh.MaMH)