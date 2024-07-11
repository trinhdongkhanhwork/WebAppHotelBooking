CREATE DATABASE HotelBooking;

USE HotelBooking;

-- Bảng Roles
DROP TABLE IF EXISTS Roles;
CREATE TABLE Roles
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    createdDate DATETIME     NOT NULL,
    updatedDate DATETIME NULL,
    version     INT          NOT NULL
);

-- Bảng Users
DROP TABLE IF EXISTS Users;
CREATE TABLE Users
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    username    VARCHAR(50)  NOT NULL UNIQUE,
    password    VARCHAR(255) NOT NULL,
    email       TEXT         NOT NULL,
    fullname    VARCHAR(255) NOT NULL,
    address     TEXT         NOT NULL,
    phone       VARCHAR(15)  NOT NULL UNIQUE,
    gender      ENUM('MALE', 'FEMALE', 'OTHER') NOT NULL,
    birthday    DATE         NOT NULL,
    imgUrl      TEXT         NOT NULL, -- new
    isActived   BIT          NOT NULL DEFAULT 1,
    createdDate DATETIME     NOT NULL,
    updatedDate DATETIME NULL,
    version     INT          NOT NULL,
    roleId      INT          NOT NULL,
    FOREIGN KEY (roleId) REFERENCES Roles (id)
);

-- Bảng Hotel
DROP TABLE IF EXISTS Hotel;
CREATE TABLE Hotel
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(255) NOT NULL,
    imgUrl      TEXT NULL,
    address     TEXT         NOT NULL,
    phone       VARCHAR(15)  NOT NULL,
    email       TEXT         NOT NULL,
    createdDate DATETIME     NOT NULL,
    updatedDate DATETIME NULL,
    version     INT          NOT NULL
);

DROP TABLE IF EXISTS ImgHotel;
CREATE TABLE ImgHotel
(
	id			INT AUTO_INCREMENT PRIMARY KEY,
    hotelId     INT            NOT NULL,
	imgUrl      TEXT NULL,
    FOREIGN KEY (hotelId) REFERENCES Hotel (id)
);

-- Bảng Categories
DROP TABLE IF EXISTS Categories;
CREATE TABLE Categories
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    slug        VARCHAR(255) NOT NULL,
    isActived   BIT          NOT NULL DEFAULT 1,
    createdDate DATETIME     NOT NULL,
    updatedDate DATETIME NULL,
    version     INT          NOT NULL,
    imgUrl      TEXT NULL
);

-- Bảng Rooms
DROP TABLE IF EXISTS Rooms;
CREATE TABLE Rooms
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    hotelId     INT            NOT NULL,
    title       VARCHAR(255)   NOT NULL,
    imgUrl1     TEXT NULL,
    imgUrl2     TEXT NULL,
    imgUrl3     TEXT NULL,
    address     TEXT           NOT NULL,
    roomNumber  VARCHAR(50)    NOT NULL,
    bedType     VARCHAR(50)    NOT NULL,
    price       DECIMAL(10, 2) NOT NULL,
    statusRoom  enum('Trống','Đang dùng','Đã trả'),
    description TEXT           NOT NULL,
    categoryId  INT            NOT NULL,
    createdDate DATETIME       NOT NULL,
    updatedDate DATETIME NULL,
    version     INT            NOT NULL,
    FOREIGN KEY (hotelId) REFERENCES Hotel (id),
    FOREIGN KEY (categoryId) REFERENCES Categories (id)
);

DROP TABLE IF EXISTS ImgRooms; 
CREATE TABLE ImgRooms
(
	id			INT AUTO_INCREMENT PRIMARY KEY,
    roomId        INT,
	imgUrl      TEXT NULL,
    FOREIGN KEY (roomId) REFERENCES Rooms (id)
);

DROP TABLE IF EXISTS Service;
CREATE TABLE Service
(
    id             INT AUTO_INCREMENT PRIMARY KEY,
    nameService    BIT NOT NULL DEFAULT 0
);

DROP TABLE IF EXISTS ServiceHotel;
CREATE TABLE ServiceHotel
(
    id             INT AUTO_INCREMENT PRIMARY KEY,
    hotelId         INT,
    serviceId		int,
    FOREIGN KEY (hotelId) REFERENCES Hotel (id),
    FOREIGN KEY (serviceId) REFERENCES Service (id)
);

-- Bảng Bill
DROP TABLE IF EXISTS Bill;
CREATE TABLE Bill
(
    id            INT AUTO_INCREMENT PRIMARY KEY,
    userId        INT,
    roomId        INT,
    paymentMethod VARCHAR(50)    NOT NULL,
    title         VARCHAR(255)   NOT NULL,
    address       TEXT           NOT NULL,
    checkin       DATETIME       NOT NULL,
    checkout      DATETIME       NOT NULL,
    note          TEXT,
    statusBill	  enum('Chưa thanh toán','Đã thanh toán','Chờ xác nhận','Đã xác nhận','Hoàn thành','Đã hủy','Đã hoàn tiền'),
    FOREIGN KEY (userId) REFERENCES Users (id),
    FOREIGN KEY (roomId) REFERENCES Rooms (id)
);

-- Bảng ReportBill
DROP TABLE IF EXISTS ReportBill;
CREATE TABLE ReportBill
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    billId      INT,
    FOREIGN KEY (billId) REFERENCES Bill (id)
);

-- Bảng Report
DROP TABLE IF EXISTS Report;
CREATE TABLE Report
(
    id                   INT AUTO_INCREMENT PRIMARY KEY,
    groupName            VARCHAR(255)   NOT NULL,
    hotelId				 INT,
    billId      		 INT,
    FOREIGN KEY (billId) REFERENCES Bill (id),
    FOREIGN KEY (hotelId) REFERENCES Hotel (id)
);

-- Bảng Review
DROP TABLE IF EXISTS Review;
CREATE TABLE Review
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    rating      INT      NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment     TEXT,
    createdDate DATETIME NOT NULL,
    updatedDate DATETIME NULL,
    billId      INT,
    FOREIGN KEY (billId) REFERENCES Bill (id)
);

-- Bảng Promotion
DROP TABLE IF EXISTS Promotion;
CREATE TABLE Promotion
(
    id                 INT AUTO_INCREMENT PRIMARY KEY,
    title              VARCHAR(255)  NOT NULL,
    description        TEXT,
    discountPercentage DECIMAL(5, 2) NOT NULL,
    startDate          DATETIME      NOT NULL,
    endDate            DATETIME      NOT NULL,
    createdDate        DATETIME      NOT NULL,
    updatedDate        DATETIME NULL,
	hotelId			   INT,
    FOREIGN KEY (hotelId) REFERENCES Hotel (id)
);

-- Thêm dữ liệu vào các bảng
INSERT INTO Roles (description, createdDate, updatedDate, version)
VALUES ('Admin', '2024-05-21 10:00:00', '2024-05-21 10:30:00', 1),
       ('User', '2024-05-21 11:00:00', NULL, 1);

INSERT INTO Users (username, password, email, fullname, address, phone, gender, birthday,imgUrl, isActived, createdDate,
                   updatedDate, version, roleId)
VALUES ('admin', '$2a$12$SXgmVBYyynbtcpWcV4ROkuTQK0zPdy3IhURMQmtZCy59cMuNoRyGC', 'admin@example.com', 'User One', '75 Nguyen Binh Khiem, Tân Thới Nhất, Quận 12, Hồ Chí Minh', '1234567890', 'Male', '1990-01-01', null, 1, NOW(), null, 1, 1), 
       ('user2', '$2a$12$i/Xrjl1acnq4.8ZCTqQub.BPl9xYJ.tGg4z2rDBHRJeyp.ANTKV0S', 'user2@example.com', 'User Two', '2 Hong Ha, Tân Thới Nhất, Quận 12, Hồ Chí Minh', '0569154932', 'Female', '1995-05-05', null, 1, NOW(), null, 1, 2),
       ('thanhTai', '$2a$12$rXL4mNodS67mfGZ3df3nrOkv06xsg5y/zSG.4mvpEk/qnJyDIa4gC', 'taing1710@gmail.com', 'Nguyễn Thành Tài', '3/7, Đông Hưng Thuận, Quận 12, Hồ Chí Minh', '0948372849', 'Male', '2004-01-01', 'avt5.jpg', 1, NOW(), null, 1, 2), -- pass: thanhtai123
       ('trungKien', '$2a$12$NbaNLpicpiu4KLcdOmJI5eZ5YBmFAEc06xRhtfYkiRUum8Dy00ESC', 'lekien28122004@gmail.com', 'Lê Nguyễn Trung Kiên', '12/A1, Tân Thới Hiệp, Quận 12, Hồ Chí Minh', '0948291847', 'Male', '2004-01-01', 'avt4.jpg', 1, NOW(), null, 1, 2), -- pass: trungkien123
       ('dongkhanh', '$2a$12$fkQVzB.syXlG3K0F4kDEZeHUo2vhrYtC01thgF.xdIOfZCXpQbUt2', 'trinhdongkhanh.work@gmail.com', 'Trịnh Đồng Khánh', '7/B, Thới An, Quận 12, Hồ Chí Minh', '0284938471', 'Male', '2004-12-28', 'avt3.jpg', 1, NOW(), null, 1, 2), -- pass: dongkhanh123
       ('quocduy', '$2a$12$dOfybprJtJEIsmXOyO706uLVV7CjnRpL5ScwuA47Ka51CFp2OaiWS', 'quocduy5576@gmail.com', 'Đinh Quốc Duy', '19/23, Tân Chánh Hiệp, Quận 12, Hồ Chí Minh', '0127849583', 'Male', '2004-08-23', 'avt2.jpg', 1, NOW(), null, 1, 2), -- pass: quocduy123
       ('camvy', '$2a$12$l5ne/OVn0oE5zr7rEdVSlut6m5BRv6D.lWPR9hZCnagOCWlkh5t9q', 'vtvy050810@gmail.com', 'Phạm Thị Cẩm Vy', '13/2, Hiệp Bình, Thủ Đức, Hồ Chí Minh', '039590381', 'Female', '2000-01-01', 'avtmeo.jpg', 1, Now(), null, 1, 2); -- pass: camvy123

INSERT INTO Hotel (name, imgUrl, address, phone, email, createdDate, updatedDate, version) -- not run
VALUES ('Wink Hotel Saigon Centre', 'h1_1.jpg', '75 Nguyen Binh Khiem, Dakao Ward, District 1, TP. Hồ Chí Minh', '02838269999', 'winkhotel@gmail.com', '2011-01-06', null, 1), -- h1 = hotel1
	   ('Sunrise Central Hotel', 'h2_1.jpg', '137 Lý Tự Trọng, Phường Bến Thành, Quận 1, Hồ Chí Minh', '02838235260', 'sunrisehotel@gmail.com', '2008-07-12', null, 1),
       ('Liberty Central Saigon', 'h3_1.jpg', '179 Đ. Lê Thánh Tôn, Phường Bến Thành, Quận 1, Hồ Chí Minh', '02838239269', 'liberty@gmail.com', '2000-12-14', null, 1),
       ('Ibis Saigon Airport', 'h4_1.jpg', '2 Hong Ha, Phường 2, Quận Tân Bình, TP. Hồ Chí Minh', '02838485556', 'ibishotel@gmail.com', '2009-04-06', null, 1),
       ('Nicecy Saigon Hotel', 'h5_1.jpg', '4B - 4C Thi Sach, Ben Nghe Ward, Quận 1, TP. Hồ Chí Minh', '02836388838', 'nicecy@gmail.com', '1999-02-04', null, 1),
       ('VeeVoo Hotel', 'h6_1.jpg', '47 Phan Văn Trị, Phường Thắng Tam, Thành phố Vũng Tầu, Bà Rịa - Vũng Tàu', '0947586000', 'veevoohotel@gmail.com', '2007-08-23', null, 1),
       ('Sun Beach Hotel', 'h7_1.jpg', 'i1 Thái Văn Lung, Phường 2, Thành phố Vũng Tầu, Bà Rịa - Vũng Tàu', '0908380993', '@gmail.com', '2003-04-15', null, 1),
       ('Fati Boutique Hotel', 'h8_1.jpg', '112/3 Trần Phú, Phường 5, Thành phố Vũng Tầu, Bà Rịa - Vũng Tàu', '0794122122', '@gmail.com', '2008-09-15', null, 1),
       ('Rose Valley Hotel', 'h9_1.jpg', '34 Đ. Ngô Thì Sỹ, Phường 4, Thành phố Đà Lạt, Lâm Đồng', '0868507968', 'rosehotel@gmail.com', '2015-04-28', null, 1),
       ('Hotel Mely', 'h10_1.jpg', '21-23 P. Nhân Hòa, Thanh Xuân Trung, Thanh Xuân, Hà Nội', '0962518179', '@gmail.com', '2018-06-21', null, 1);
       
       
INSERT INTO Categories (description, slug, isActived, createdDate, updatedDate, version, imgUrl) -- not run
VALUES ('Deluxe', 'deluxe', 1, NOW(), NULL, 1, 'ks1_vip.jpg'),
       ('Standard', 'standard', 1, NOW(), NULL, 1, 'standard.jpg'),
       ('Suite', 'suite', 1, NOW(), NULL, 1, 'suite.jpg'),
       ('Family', 'family', 1, NOW(), NULL, 1, 'family.jpg'),
       ('VIP', 'vip', 1, NOW(), NULL, 1, 'vip.jpg');
       
-- INSERT INTO Rooms (hotelId, title, imgUrl1, imgUrl2, imgUrl3, address, roomNumber, roomType, bedType, price, statusRoom, checkin, checkout, description, categoryId, createdDate, updatedDate, version)
-- VALUES (, 
       
       
       
       
       
       
       
       
       
       
