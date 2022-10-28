CREATE DATABASE QLCH;
GO
USE QLCH
GO 
----------------------------------- CREATE TABLE & PRIMARY KEY ----------------------------
CREATE TABLE SUPPLIER
(
	SUP_ID VARCHAR(5) PRIMARY KEY,
	SUP_NAME NVARCHAR(100) NOT NULL,
	SUP_ADD NVARCHAR(100) NOT NULL,
	PHONE VARCHAR(20) NOT NULL,
	EMAIL VARCHAR(100) NOT NULL,
)

CREATE TABLE MATERIAL
(
	MATER_ID VARCHAR(5) PRIMARY KEY,
	SUP_ID VARCHAR(5) NOT NULL,
	MATER_NAME NVARCHAR(100) NOT NULL,
	QUANTITY REAL NOT NULL,
	UNIT VARCHAR(10) NOT NULL,
	INDATE DATE NOT NULL,
	MATERIAL_PRICE MONEY NOT NULL
)

CREATE TABLE FOOD_RECIPES
(
	FOOD_ID VARCHAR(5),
	MATER_ID VARCHAR(5),
	QUANTITY REAL NOT NULL,
	UNIT VARCHAR(10) NOT NULL,
	PRIMARY KEY (FOOD_ID, MATER_ID)
)

CREATE TABLE FOOD
(
	FOOD_ID VARCHAR(5) PRIMARY KEY,
	FOOD_NAME NVARCHAR(30) NOT NULL,
	PRICE MONEY NOT NULL,
	UNIT VARCHAR(10) NOT NULL,
	DESCRIP NVARCHAR(200) NOT NULL,
)

CREATE TABLE CUSTOMER
(
	CUS_ID VARCHAR(15) PRIMARY KEY,
	CUS_NAME NVARCHAR(50) NOT NULL,
	CUS_ADD NVARCHAR(100) NOT NULL,
	PHONE VARCHAR(20) NOT NULL,
	DAY_OF_BIRTH DATE NOT NULL,
	EMAIL VARCHAR(100) NOT NULL,
	LOG_ID VARCHAR(5) NOT NULL,
)

CREATE TABLE STAFF
(
	STAFF_ID VARCHAR(5) PRIMARY KEY,
	STAFF_NAME NVARCHAR(50) NOT NULL,
	STAFF_ADD NVARCHAR(100) NOT NULL,
	PHONE VARCHAR(20) NOT NULL,
	DAY_OF_BIRTH DATE NOT NULL,
	EMAIL VARCHAR(100) NOT NULL,
	LOG_ID VARCHAR(5) NOT NULL,
)

CREATE TABLE ACCOUNT
(
	LOG_ID VARCHAR(5) PRIMARY KEY,
	LOG_NAME NVARCHAR(20) NOT NULL,
	PASS VARCHAR(20) NOT NULL,
	TYPEID VARCHAR(5) NOT NULL,
)

CREATE TABLE _ORDER
(
	ORD_ID VARCHAR(15) PRIMARY KEY,
	CUS_ID VARCHAR(15) NOT NULL,
	STAFF_ID VARCHAR(5) NOT NULL,
	ORD_DATE DATE NOT NULL,
	STT VARCHAR(20)
)

CREATE TABLE ORDER_DETAIL
(
	ORD_ID VARCHAR(15),
	FOOD_ID VARCHAR(5),
	AMOUNT INT NOT NULL,
	VOUCHER VARCHAR(20),
	PRIMARY KEY (ORD_ID, FOOD_ID)
)

CREATE TABLE TYPE_ACCOUNT
(
	TYPEID VARCHAR(5) PRIMARY KEY,
	TYPENAME NVARCHAR(20) NOT NULL,
)

CREATE TABLE FEEDBACK
(
	FB_ID VARCHAR(5) PRIMARY KEY,
	CUS_ID VARCHAR(15) NOT NULL,
	ORD_ID VARCHAR(15) NOT NULL,
	COMMENT NVARCHAR(200)
)

--------------------------------------- ADD FOREIGN KEY -------------------------------------

ALTER TABLE MATERIAL ADD CONSTRAINT FK_SUPPLIER_MATERIAL
FOREIGN KEY (SUP_ID) REFERENCES SUPPLIER(SUP_ID);

ALTER TABLE CUSTOMER ADD CONSTRAINT FK_ACCOUNT_CUSTOMER
FOREIGN KEY (LOG_ID) REFERENCES ACCOUNT(LOG_ID);

ALTER TABLE STAFF ADD CONSTRAINT FK_ACCOUNT_STAFF
FOREIGN KEY (LOG_ID) REFERENCES ACCOUNT(LOG_ID);

ALTER TABLE _ORDER ADD CONSTRAINT FK_CUSTOMER_ORDER
FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER(CUS_ID);

ALTER TABLE _ORDER ADD CONSTRAINT FK_STAFF_ORDER
FOREIGN KEY (STAFF_ID) REFERENCES STAFF(STAFF_ID);

ALTER TABLE ORDER_DETAIL ADD CONSTRAINT FK_ORDER_ORDER_DETAIL
FOREIGN KEY (ORD_ID) REFERENCES _ORDER(ORD_ID);

ALTER TABLE ORDER_DETAIL ADD CONSTRAINT FK_FOOD_ORDER_DETAIL
FOREIGN KEY (FOOD_ID) REFERENCES FOOD(FOOD_ID);

ALTER TABLE FEEDBACK ADD CONSTRAINT FK_CUSTOMER_FEEDBACK
FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER(CUS_ID);

ALTER TABLE FEEDBACK ADD CONSTRAINT FK__ORDER_FEEDBACK
FOREIGN KEY (ORD_ID) REFERENCES _ORDER(ORD_ID);

ALTER TABLE ACCOUNT ADD CONSTRAINT FK_TYPEACCOUNT_ACCOUNT
FOREIGN KEY (TYPEID) REFERENCES TYPE_ACCOUNT(TYPEID);

ALTER TABLE FOOD_RECIPES ADD CONSTRAINT FK_MATERIAL_FOOD_RECIPES
FOREIGN KEY (MATER_ID) REFERENCES MATERIAL(MATER_ID);

ALTER TABLE FOOD_RECIPES ADD CONSTRAINT FK_FOOD_FOOD_RECIPES
FOREIGN KEY (FOOD_ID) REFERENCES FOOD(FOOD_ID);

--------------------------------------- INSERT DATA -------------------------------------

INSERT INTO SUPPLIER(SUP_ID, SUP_NAME, SUP_ADD, PHONE, EMAIL)
VALUES ('SP001', N'Công ty TNHH Japfa Comfeed Việt Nam', N'Khu C, Tòa nhà Waseco, số 10 Đường Phổ Quang, Phương 2, Quận Tân Bình, TP Hồ Chí Minh', '0824 369 555', 'cskh.jb@japfa.com'),
	   ('SP002', N'Công ty TNHH Hải Sản Bình Minh', N'Thôn Phú Lương, Xã An Ninh Đông, Tuy An, Phú Yên', '057 3841 584', 'info@sunrise-seafood.vn'),
	   ('SP003', N'Công ty Cổ phần Nosafood', N'E4/20 Nguyễn Hữu Trí, Thị Trấn Tân Túc, Huyện Bình Chánh, TP Hồ Chí Minh', '0972 333 601', 'tmdt@nosafood.com'),
	   ('SP004', N'Công ty Cổ phần Thực phẩm Thiên Vương (ACE FOODS)', N'30 Nguyễn Khang, Yên Hòa, Cầu Giấy, Hà Nội', '098 659 8899', 'info@acefoods.vn'),
	   ('SP005', N'DL Fresh', N'36/8 Đường số 53 Hiệp Bình Chánh, thành phố Thủ Đức', '0909 117 909', 'info@raucusachdl.com')

INSERT INTO MATERIAL(MATER_ID, SUP_ID, MATER_NAME, QUANTITY, UNIT, INDATE, MATERIAL_PRICE)
VALUES ('MT001', 'SP001', N'Cánh gà', 2000, 'Cái', '2022/09/04', 2000000),
	   ('MT002', 'SP001', N'Đùi gà', 2000, 'Cái', '2022/09/04', 2000000),
	   ('MT003', 'SP001', N'Thịt bò', 100, 'Kg', '2022/09/04', 10000000),
	   ('MT004', 'SP001', N'Thịt lợn', 50, 'Kg', '2022/09/04', 4000000),
	   ('MT005', 'SP002', N'Cá ngừ', 40, 'Kg', '2022/09/05', 7500000),
	   ('MT006', 'SP003', N'Dầu Olive', 10, 'Thùng', '2022/09/03', 4200000),
	   ('MT007', 'SP003', N'Nước cốt chanh', 20, 'L', '2022/09/03', 100000),
	   ('MT008', 'SP003', N'Nước tương', 50, 'Thùng', '2022/09/03', 1500000),
	   ('MT009', 'SP003', N'Hạt nêm', 20, 'Thùng', '2022/09/03', 400000),
	   ('MT010', 'SP003', N'Dầu ăn', 100, 'Thùng', '2022/09/03', 4000000),
	   ('MT011', 'SP003', N'Sốt xá xíu', 20, 'Thùng', '2022/09/03', 300000),
	   ('MT012', 'SP003', N'Bột mì', 100, 'Thùng', '2022/09/03', 3400000),
	   ('MT013', 'SP003', N'Bột năng', 100, 'Thùng', '2022/09/03', 3600000),
	   ('MT014', 'SP003', N'Bột gạo', 100, 'Thùng', '2022/09/03', 4200000),
	   ('MT015', 'SP003', N'Bột ớt màu', 20, 'Thùng', '2022/09/02', 200000),
	   ('MT016', 'SP003', N'Bột tỏi', 20, 'Thùng', '2022/09/02', 15000),
	   ('MT017', 'SP003', N'Bột chiên giòn', 100, 'Thùng', '2022/09/02', 11000000),
	   ('MT018', 'SP003', N'Bột chiên xù', 100, 'Thùng', '2022/09/02', 12000000),
	   ('MT019', 'SP003', N'Tương ớt', 40, 'Thùng', '2022/09/02', 3600000),
	   ('MT020', 'SP003', N'Tương cà', 40, 'Thùng', '2022/09/02', 3600000),
	   ('MT021', 'SP003', N'Nước mắm', 35, 'Thùng', '2022/09/02', 2450000),
	   ('MT022', 'SP003', N'Muối', 35, 'Thùng', '2022/09/02', 900000),
	   ('MT023', 'SP003', N'Đường', 40, 'Thùng', '2022/09/01', 1200000),
	   ('MT024', 'SP003', N'Đường nâu', 10, 'Thùng', '2022/09/01', 400000),
	   ('MT025', 'SP003', N'Tiêu', 15, 'Thùng', '2022/09/01', 300000),
	   ('MT026', 'SP003', N'Men khô', 10, 'Thùng', '2022/09/01', 550000),
	   ('MT027', 'SP004', N'Bánh Hamburger', 1000, 'Cái', '2022/09/05', 2400000),
	   ('MT028', 'SP004', N'Bánh mì', 1000, 'Cái', '2022/09/05', 2500000),
	   ('MT029', 'SP004', N'Phô mai', 20, 'Kg', '2022/09/05', 750000),
	   ('MT030', 'SP004', N'Xúc xích', 24, 'Thùng', '2022/09/05', 1400000),
	   ('MT031', 'SP004', N'Sanwich', 700, 'Cái', '2022/09/05', 1400000),
	   ('MT032', 'SP004', N'Trứng gà', 10000, 'Quả', '2022/09/04', 20000000),
	   ('MT033', 'SP004', N'Mật ong', 10, 'L', '2022/09/04', 200000),
	   ('MT034', 'SP005', N'Cà chua', 50, 'Kg', '2022/09/05', 1600000),
	   ('MT035', 'SP005', N'Dưa chuột', 50, 'Kg', '2022/09/05', 1000000),
	   ('MT036', 'SP005', N'Dưa leo', 50, 'Kg', '2022/09/05', 800000),
	   ('MT037', 'SP005', N'Khoai tây', 100, 'Kg', '2022/09/05', 3600000),
	   ('MT038', 'SP005', N'Cà rốt', 45, 'Kg', '2022/09/05', 740000),
	   ('MT039', 'SP005', N'Tỏi', 15, 'Kg', '2022/09/04', 240000),
	   ('MT040', 'SP005', N'Ớt', 10, 'Kg', '2022/09/05', 120000),
	   ('MT041', 'SP005', N'Ớt chuông', 14, 'Kg', '2022/09/05', 220000),
	   ('MT042', 'SP005', N'Hành tây', 32, 'Kg', '2022/09/05', 420000),
	   ('MT043', 'SP005', N'Hành tím', 18, 'Kg', '2022/09/04', 170000),
	   ('MT044', 'SP005', N'Xà lách', 40, 'Kg', '2022/09/05', 600000),
	   ('MT045', 'SP005', N'Ngò', 30, 'Kg', '2022/09/05', 300000),
	   ('MT046', 'SP003', N'Sốt Mayonnaise', 15, 'Thùng', '2022/09/02', 320000)

INSERT INTO FOOD (FOOD_ID, FOOD_NAME, PRICE, UNIT, DESCRIP)
VALUES ('FO001', N'Cánh gà nướng', 22000, 'VN Đồng',N''),
	   ('FO002', N'Cánh gà rán', 31000, 'VN Đồng',N''),
	   ('FO003', N'Đùi gà rán', 34000, 'VN Đồng',N''),
	   ('FO004', N'Gà rán sốt cay', 36000, 'VN Đồng',N''),
	   ('FO005', N'Hamburger bò', 29000, 'VN Đồng',N''),
	   ('FO006', N'Hamburger cá ngừ', 26000, 'VN Đồng',N''),
	   ('FO007', N'Bánh mì kẹp thịt', 20000, 'VN Đồng',N''),
	   ('FO008', N'Bánh mì kẹp xúc xích', 18000, 'VN Đồng',N''),
	   ('FO009', N'Pizza phô mai', 85000, 'VN Đồng',N''),
	   ('FO010', N'Pizza xúc xích', 91000, 'VN Đồng',N''),
	   ('FO011', N'Khoai tây chiên', 15000, 'VN Đồng',N''),
	   ('FO012', N'Khoai tây nướng xúc xích', 22000, 'VN Đồng',N''),
	   ('FO013', N'Sanwich trứng gán phô mai', 25000, 'VN Đồng',N'')

INSERT INTO FOOD_RECIPES
VALUES ('FO001', 'MT001', 500, 'gam'),
	   ('FO001', 'MT007', 50, 'ml'),
	   ('FO001', 'MT008', 60, 'ml'),
	   ('FO001', 'MT009', 20, 'gam'),
	   ('FO001', 'MT011', 60, 'ml'),
	   ('FO001', 'MT033', 30, 'ml'),
	   ('FO002', 'MT001', 500, 'gam'),
	   ('FO002', 'MT009', 30, 'gam'),
	   ('FO002', 'MT012', 200, 'gam'),
	   ('FO002', 'MT013', 200, 'gam'),
	   ('FO002', 'MT015', 100, 'gam'),
	   ('FO002', 'MT016', 40, 'gam'),
	   ('FO002', 'MT019', 65, 'ml'),
	   ('FO002', 'MT022', 30, 'gam'),
	   ('FO002', 'MT032', 2, 'quả'),
	   ('FO002', 'MT033', 30, 'ml'),
	   ('FO002', 'MT034', 200, 'gam'),
	   ('FO003', 'MT002', 600, 'gam'),
	   ('FO003', 'MT010', 30, 'ml'),
	   ('FO003', 'MT017', 250, 'gam'),
	   ('FO003', 'MT022', 30, 'gam'),
	   ('FO003', 'MT023', 20, 'gam'),
	   ('FO003', 'MT032', 2, 'quả'),
	   ('FO004', 'MT002', 600, 'gam'),
	   ('FO004', 'MT007', 20, 'ml'),
	   ('FO004', 'MT008', 30, 'ml'),
	   ('FO004', 'MT010', 30, 'ml'),
	   ('FO004', 'MT014', 200, 'gam'),
	   ('FO004', 'MT019', 40, 'ml'),
	   ('FO004', 'MT021', 20, 'ml'),
	   ('FO004', 'MT022', 20, 'gam'),
	   ('FO004', 'MT024', 15, 'gam'),
	   ('FO004', 'MT025', 15, 'gam'),
	   ('FO004', 'MT039', 5, 'gam'),
	   ('FO005', 'MT003', 100, 'gam'),
	   ('FO005', 'MT018', 150, 'gam'),
	   ('FO005', 'MT019', 30, 'ml'),
	   ('FO005', 'MT020', 20, 'ml'),
	   ('FO005', 'MT021', 20, 'ml'),
	   ('FO005', 'MT022', 15, 'gam'),
	   ('FO005', 'MT023', 20, 'gam'),
	   ('FO005', 'MT027', 2, 'cái'),
	   ('FO005', 'MT029', 40, 'gam'),
	   ('FO005', 'MT032', 2, 'quả'),
	   ('FO005', 'MT034', 50, 'gam'),
	   ('FO005', 'MT042', 50, 'gam'),
	   ('FO005', 'MT044', 30, 'gam'),
	   ('FO006', 'MT005', 120, 'gam'),
	   ('FO006', 'MT007', 30, 'ml'),
	   ('FO006', 'MT022', 15, 'gam'),
	   ('FO006', 'MT025', 10, 'gam'),
	   ('FO006', 'MT034', 2, 'cái'),
	   ('FO006', 'MT043', 80, 'gam'),
	   ('FO006', 'MT044', 20, 'gam'),
	   ('FO006', 'MT045', 20, 'gam'),
	   ('FO006', 'MT046', 30, 'gam'),
	   ('FO007', 'MT004', 100, 'gam'),
	   ('FO007', 'MT008', 20, 'ml'),
	   ('FO007', 'MT010', 20, 'ml'),
	   ('FO007', 'MT021', 30, 'ml'),
	   ('FO007', 'MT024', 15, 'gam'),
	   ('FO007', 'MT028', 1, 'cái'),
	   ('FO007', 'MT039', 5, 'gam'),
	   ('FO007', 'MT040', 5, 'gam'),
	   ('FO008', 'MT008', 20, 'ml'),
	   ('FO008', 'MT028', 1, 'cái'),
	   ('FO008', 'MT030', 70, 'gam'),
	   ('FO008', 'MT034', 70, 'gam'),
	   ('FO008', 'MT036', 40, 'gam'),
	   ('FO008', 'MT044', 20, 'gam'),
	   ('FO008', 'MT045', 30, 'gam'),
	   ('FO008', 'MT046', 10, 'gam'),
	   ('FO009', 'MT006', 20, 'ml'),
	   ('FO009', 'MT008', 15, 'ml'),
	   ('FO009', 'MT012', 200, 'gam'),
	   ('FO009', 'MT020', 10, 'ml'),
	   ('FO009', 'MT022', 15, 'gam'),
	   ('FO009', 'MT023', 10, 'gam'),
	   ('FO009', 'MT026', 180, 'gam'),
	   ('FO009', 'MT029', 60, 'gam'),
	   ('FO009', 'MT030', 50, 'gam'),
	   ('FO009', 'MT042', 30, 'gam'),
	   ('FO010', 'MT006', 30, 'ml'),
	   ('FO010', 'MT012', 200, 'gam'),
	   ('FO010', 'MT022', 5, 'gam'),
	   ('FO010', 'MT023', 3, 'gam'),
	   ('FO010', 'MT026', 150, 'gam'),
	   ('FO010', 'MT029', 50, 'gam'),
	   ('FO010', 'MT030', 60, 'gam'),
	   ('FO010', 'MT034', 70, 'gam'),
	   ('FO010', 'MT041', 40, 'gam'),
	   ('FO010', 'MT042', 20, 'gam'),
	   ('FO011', 'MT010', 20, 'gam'),
	   ('FO011', 'MT017', 140, 'gam'),
	   ('FO011', 'MT022', 30, 'gam'),
	   ('FO011', 'MT037', 400, 'gam'),
	   ('FO012', 'MT008', 20, 'ml'),
	   ('FO012', 'MT030', 60, 'gam'),
	   ('FO012', 'MT037', 300, 'gam'),
	   ('FO012', 'MT038', 100, 'gam'),
	   ('FO012', 'MT039', 15, 'gam'),
	   ('FO012', 'MT041', 40, 'gam'),
	   ('FO012', 'MT042', 20, 'gam'),
	   ('FO013', 'MT022', 20, 'gam'),
	   ('FO013', 'MT029', 60, 'gam'),
	   ('FO013', 'MT030', 70, 'gam'),
	   ('FO013', 'MT031', 2, 'cái'),
	   ('FO013', 'MT032', 2, 'quả'),
	   ('FO013', 'MT044', 10, 'gam')	

INSERT INTO TYPE_ACCOUNT( TYPEID, TYPENAME)
VALUES	('TK01', 'Admin'),
		('TK02', 'Nhân viên bán hàng'),
		('TK03', 'Khách hàng'),
		('TK04', 'Nhân viên giao hàng')

INSERT INTO ACCOUNT( LOG_ID, LOG_NAME, PASS, TYPEID)
VALUES	('ID001', 'THU PHUONG', 'phuong1234', 'TK03'),
		('ID002', 'PHUC DOAN', 'phuc1234@', 'TK03'),
		('ID003', 'MAI ANH', 'anhhhh%', 'TK03'),
		('ID004', 'HOANG LONG', 'lonbede!', 'TK03'),
		('ID005', 'THANH DAT', 'dat09@', 'TK03'),
		('ID006', 'TAN LE', 'tanle#', 'TK03'),
		('ID007', 'HOANG VIET', 'vietga123', 'TK03'),
		('ID008', 'GIA HUNG', 'hungchanbo123', 'TK03'),
		('ID009', 'TUAN KIET', 'kietdfgh', 'TK03'),
		('ID010', 'TUAN NGHIA', 'nghia123%', 'TK03'),
		('ID011', 'GIA HUNG', 'hungno5treo$$', 'TK03'),
		('ID012', 'HO PHUC', 'phucbo123%', 'TK03'),
		('ID013', 'DUC THANG', 'thang123', 'TK03'),
		('ID014', 'MINH THANH', 'thanhhhh@%', 'TK03'),
		('ID015', 'HOAI THU', 'thuxinhgai%@', 'TK03'),
		--NHÂN VIÊN BÁN HÀNG
		('IDS01', 'TRAN XUAN HIEP', 'hiep123', 'TK02'),
		('IDS02', 'LE THI THANH NHAN', 'nhan123', 'TK02'),
		('IDS03', 'CAO BA VAN', 'van123', 'TK02'),
		('IDS04', 'TRAN MINH', 'minh123', 'TK02'),
		('IDS05', 'TRAN HUYEN NHI', 'nhi123', 'TK02'),
		('IDS06', 'NGUYEN THI LAN ANH', 'anh123', 'TK02'),
		--NHÂN VIÊN GIAO HÀNG
		('IDS07', 'NGUYEN KIM DANG', 'dang123', 'TK04'),
		('IDS08', 'HUYNH DUC HUY',  'huy123', 'TK04'),
		--ADMIN
		('ADMIN', 'NHOM 4',  'admin123', 'TK01')

INSERT INTO CUSTOMER( CUS_ID, CUS_NAME, CUS_ADD , PHONE, DAY_OF_BIRTH, EMAIL, LOG_ID)
VALUES	('CUS00001', N'PHAN TRẦN THU PHƯƠNG', N'NGUYỄN ĐÌNH CHIỂU, VĨNH THỌ, NHA TRANG', '0587469321',  '2002/08/01', 'phuong@ntu.edu.vn', 'ID001'),
		('CUS00002', N'ĐOÀN NHƯ PHỤC', N'ĐOÀN TRẦN NGHIỆP, VĨNH THỌ, NHA TRANG', '0785693241' ,  '2002/06/01','phuC@ntu.edu.vn', 'ID002'),
		('CUS00003', N'NGUYỄN THỊ MAI ANH', N'PHƯỚC HUỆ, VĨNH HẢI, NHA TRANG', '0254879632' ,  '2002/02/06', 'anh@ntu.edu.vn', 'ID003'),
		('CUS00004', N'PHẠM HOÀNG LONG', N'PHẠM NGỌC THẠCH, VĨNH HẢI, NHA TRANG', '0245789632' ,  '2002/05/01', 'long@ntu.edu.vn', 'ID004'),
		('CUS00005', N'NGUYỄN THÀNH ĐẠT', N'LẠC THIỆN, VĨNH THỌ, NHA TRANG', '0475842369' ,  '2002/08/01','dat@ntu.edu.vn', 'ID005'),
		('CUS00006', N'LÊ NGỌC TÂN', N'TÔN THẤT TÙNG, VĨNH THỌ, NHA TRANG', '0365896321' ,  '2002/02/08','tan@ntu.edu.vn', 'ID006'),
		('CUS00007', N'LÊ HOÀNG VIỆT', N'BẮC SƠN, VĨNH HẢI, NHA TRANG', '0358999652' ,  '2002/02/09', 'viet@ntu.edu.vn', 'ID007'),
		('CUS00008', N'TRƯƠNG NGUYỄN GIA HƯNG', N'NGÔ ĐẾN, VĨNH PHƯỚC, NHA TRANG' , '0478775412',  '2002/02/04', 'hung@ntu.edu.vn', 'ID008'),
		('CUS00009', N'ĐÕ TUẤN KIỆT', N'ĐƯỜNG HAI THÁNG TƯ, VĨNH HẢI, NHA TRANG' , '0245788596',  '2002/02/01', 'kiet@ntu.edu.vn', 'ID009'),
		('CUS00010', N'ĐÀO TUẤN NGHĨA', N'NGUYỄN ĐÌNH CHIỂU,  VĨNH THỌ, NHA TRANG', '0457888965',  '2002/04/01', 'nghia@ntu.edu.vn', 'ID010'),
		('CUS00011', N'LÊ GIA HƯNG', N'HOÀNG DUNG, VĨNH HẢI, NHA TRANG', '0235699965',  '2002/02/03', 'hung1@ntu.edu.vn', 'ID011'),
		('CUS00012', N'HỒ MINH PHÚC', N'LAN LIÊU, VĨNH PHƯỚC, NHA TRANG', '0356666986',  '2002/02/07','phuc@ntu.edu.vn', 'ID012'),
		('CUS00013', N'HỒ ĐỨC THẮNG', N'NUYỄN XUYỂN, VĨNH HẢI, NHA TRANG', '0325444785',  '2002/02/09', 'thang@ntu.edu.vn', 'ID013'),
		('CUS00014', N'TÔN THẤT MINH THÀNH', N'ĐOÀN TRẦN NGHIỆP, VĨNH THỌ, NHA TRANG', '0352148754' , '2002/04/01','thanh@ntu.edu.vn', 'ID014'),
		('CUS00015', N'VŨ HOÀI THU', N'PHƯƠNG MAI, VĨNH PHƯỚC, NHA TRANG', '0325665542',  '2002/02/05', 'thu@ntu.edu.vn', 'ID015')

INSERT INTO STAFF( STAFF_ID, STAFF_NAME,  STAFF_ADD, PHONE,DAY_OF_BIRTH, EMAIL,  LOG_ID)
VALUES	('ST001', N'TRẦN XUÂN HIỆP', N'DIÊN KHÁNH, NHA TRANG', '0987546235',  '2002/04/03', N'hiep.tx@sell.com','IDS01'),
		('ST002', N'LÊ THỊ THANH NHÀN', N'DIÊN KHÁNH, NHA TRANG', '0987546235',  '2002/07/01', N'nhan.ltt@sell.com', 'IDS02'),
		('ST003', N'CAO BÁ VĂN', N'PHÚ HÒA, PHÚ YÊN', '0247856985',  '2002/04/09', N'van.cb@sell.com', 'IDS03'),
		('ST004', N'TRẦN MINH', N'TUY HÒA, PHÚ YÊN', '0856475212',  '2002/04/01', N'minh.t@sell.com', 'IDS04'),
		('ST005', N'TRẦN HUYỀN NHI', N'VĨNH THỌ, NHA TRANG', '0325857842',  '2002/04/04', N'nhi.th@sell.com', 'IDS05'),
		('ST006', N'NGUYỄN THỊ LAN ANH', N'DIÊN TÂN, NHA TRANG', '0987589535',  '2002/01/01', N'anh.ntl@sell.com', 'IDS06'),
		('ST007', N'NGUYỄN KIM ĐĂNG', N'TUY HÒA, PHÚ YÊN', '0589656985',  '2002/04/06', N'dang.nk@sell.com', 'IDS07'),
		('ST008', N'HUỲNH ĐỨC HUY', N'SƠN HÒA, PHÚ YÊN', '0985475212',  '2002/05/09', N'huy.hd@sell.com', 'IDS08')

INSERT INTO _ORDER( ORD_ID, CUS_ID,  STAFF_ID, ORD_DATE, STT)
VALUES	('ORD00001',  'CUS00010',  'ST002',  '2022/02/23', NULL),
		('ORD00002',  'CUS00010',  'ST005',  '2022/12/13', 'đang giao'),
		('ORD00003',  'CUS00005',  'ST006',  '2022/02/12', NULL),
		('ORD00004',  'CUS00015',  'ST007',  '2022/02/01', NULL),
		('ORD00005',  'CUS00015',  'ST005',  '2022/11/05','đã giao'),
		('ORD00006',  'CUS00002',  'ST006',  '2022/10/25',NULL),
		('ORD00008',  'CUS00004',  'ST002',  '2022/02/23',NULL),
		('ORD00007',  'CUS00010',  'ST001',  '2022/12/02','đang giao'),
		('ORD00009',  'CUS00004',  'ST008',  '2022/02/12',NULL),
		('ORD00010',  'CUS00005',  'ST001',  '2022/08/14',NULL),
		('ORD00011',  'CUS00002',  'ST004',  '2022/10/25','đang giao'),
		('ORD00012',  'CUS00005',  'ST003',  '2022/12/03', NULL)

INSERT INTO ORDER_DETAIL(ORD_ID,  FOOD_ID, AMOUNT,  VOUCHER)
VALUES	('ORD00001', 'FO011', 5,  0.2),
		('ORD00002', 'FO003', 7,  NULL),
		('ORD00003', 'FO004', 2,  NULL),
		('ORD00004', 'FO001', 7,  NULL),
		('ORD00005', 'FO007', 3,  0.1),
		('ORD00006', 'FO009', 1,  NULL),
		('ORD00007', 'FO008', 3,  0.1),
		('ORD00008', 'FO001', 8,  NULL),
		('ORD00009', 'FO012', 4,  0.2),
		('ORD00010', 'FO003', 10,  NULL),
		('ORD00011', 'FO007', 3,  NULL),
		('ORD00012', 'FO011', 3,  0.3)
		
INSERT INTO FEEDBACK( FB_ID, CUS_ID, ORD_ID, COMMENT)
VALUES	('FB01', 'CUS00010', 'ORD00001', N'Đồ ăn chất lượng lắm'),
		('FB02', 'CUS00010', 'ORD00002', N'Ngon lắm shop ơi. Nhưng hình như lần này shop quên kèm sốt cho em rồi :<'),
		('FB03', 'CUS00002', 'ORD00006', N'Giao hàng nhanh. đồ ăn ngon khỏi bàn'),
		('FB04', 'CUS00005', 'ORD00010', N'gà rán tuyệt vời lắm luôn, rất giòn, hàng giao còn nóng luôn nha'),
		('FB05', 'CUS00005', 'ORD00012', N'ngon lắm , cho 5 sao, tuyệt vời'),
		('FB06', 'CUS00004', 'ORD00008', N'Ngon nhưng mà cay quá huhuh...'),
		('FB07', 'CUS00002', 'ORD00011', N'món này chưa ok lắm, cá còn hơi tanh tanh'),
		('FB08', 'CUS00015', 'ORD00005', N'Thích món cánh gà chiên của cửa hàng lắm luôn, mãi ủng hộ nheeee')