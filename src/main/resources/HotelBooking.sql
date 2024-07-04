CREATE DATABASE HotelBooking;

USE HotelBooking;

-- Bảng Roles
CREATE TABLE Roles
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    createdDate DATETIME     NOT NULL,
    updatedDate DATETIME NULL,
    version     INT          NOT NULL
);

-- Bảng Users
CREATE TABLE Users
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    username    VARCHAR(50)  NOT NULL UNIQUE,
    password    VARCHAR(255) NOT NULL,
    email       VARCHAR(255) NOT NULL,
    fullname    VARCHAR(255) NOT NULL,
    address     TEXT         NOT NULL,
    phone       VARCHAR(15)  NOT NULL UNIQUE,
    gender      ENUM('MALE', 'FEMALE', 'OTHER') NOT NULL,
    birthday    DATE         NOT NULL,
    isActived   BIT          NOT NULL DEFAULT 1,
    createdDate DATETIME     NOT NULL,
    updatedDate DATETIME NULL,
    version     INT          NOT NULL,
    roleId      INT          NOT NULL,
    FOREIGN KEY (roleId) REFERENCES Roles (id)
);

-- Bảng Hotel
CREATE TABLE Hotel
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(255) NOT NULL,
    address     TEXT         NOT NULL,
    phone       VARCHAR(15)  NOT NULL,
    email       VARCHAR(255) NOT NULL,
    createdDate DATETIME     NOT NULL,
    updatedDate DATETIME NULL,
    version     INT          NOT NULL
);

-- Bảng Categories
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
CREATE TABLE Rooms
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    hotelId     INT            NOT NULL,
    title       VARCHAR(255)   NOT NULL,
    img         TEXT           NOT NULL,
    address     TEXT           NOT NULL,
    roomNumber  VARCHAR(50)    NOT NULL,
    roomType    VARCHAR(50)    NOT NULL,
    bedType     VARCHAR(50)    NOT NULL,
    price       DECIMAL(10, 2) NOT NULL,
    statusRoom  BIT            NOT NULL DEFAULT 1,
    checkin     DATETIME       NOT NULL,
    checkout    DATETIME       NOT NULL,
    description TEXT           NOT NULL,
    categoryId  INT            NOT NULL,
    createdDate DATETIME       NOT NULL,
    updatedDate DATETIME NULL,
    version     INT            NOT NULL,
    FOREIGN KEY (hotelId) REFERENCES Hotel (id),
    FOREIGN KEY (categoryId) REFERENCES Categories (id)
);

-- Bảng ServiceRoom
CREATE TABLE ServiceRoom
(
    id             INT AUTO_INCREMENT PRIMARY KEY,
    userId         INT,
    roomService    BIT NOT NULL DEFAULT 0,
    laundryService BIT NOT NULL DEFAULT 0,
    airportShuttle BIT NOT NULL DEFAULT 0,
    wakeupService  BIT NOT NULL DEFAULT 0,
    FOREIGN KEY (userId) REFERENCES Users (id)
);

-- Bảng Bill
CREATE TABLE Bill
(
    id            INT AUTO_INCREMENT PRIMARY KEY,
    userId        INT,
    roomId        INT,
    totalAmount   DECIMAL(10, 2) NOT NULL,
    paymentMethod VARCHAR(50)    NOT NULL,
    title         VARCHAR(255)   NOT NULL,
    address       TEXT           NOT NULL,
    roomNumber    VARCHAR(50)    NOT NULL,
    roomType      VARCHAR(50)    NOT NULL,
    bedType       VARCHAR(50)    NOT NULL,
    price         DECIMAL(10, 2) NOT NULL,
    dayNumber     INT            NOT NULL,
    checkin       DATETIME       NOT NULL,
    checkout      DATETIME       NOT NULL,
    note          TEXT,
    userName      VARCHAR(255)   NOT NULL,
    FOREIGN KEY (userId) REFERENCES Users (id),
    FOREIGN KEY (roomId) REFERENCES Rooms (id)
);

-- Bảng ReportBill
CREATE TABLE ReportBill
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    billId      INT,
    userName    VARCHAR(255)   NOT NULL,
    phoneNumber VARCHAR(15)    NOT NULL,
    roomNumber  VARCHAR(50)    NOT NULL,
    roomType    VARCHAR(50)    NOT NULL,
    checkin     DATETIME       NOT NULL,
    checkout    DATETIME       NOT NULL,
    totalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (billId) REFERENCES Bill (id)
);

-- Bảng Report
CREATE TABLE Report
(
    id                   INT AUTO_INCREMENT PRIMARY KEY,
    groupName            VARCHAR(255)   NOT NULL,
    sum                  DECIMAL(15, 2) NOT NULL,
    count                INT            NOT NULL,
    countStatusRoomTrue  INT            NOT NULL,
    countStatusRoomFalse INT            NOT NULL
);

-- Bảng Review
CREATE TABLE Review
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    userId      INT      NOT NULL,
    roomId      INT      NOT NULL,
    rating      INT      NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment     TEXT,
    createdDate DATETIME NOT NULL,
    updatedDate DATETIME NULL,
    FOREIGN KEY (userId) REFERENCES Users (id),
    FOREIGN KEY (roomId) REFERENCES Rooms (id)
);

-- Bảng Promotion
CREATE TABLE Promotion
(
    id                 INT AUTO_INCREMENT PRIMARY KEY,
    title              VARCHAR(255)  NOT NULL,
    description        TEXT,
    discountPercentage DECIMAL(5, 2) NOT NULL,
    startDate          DATETIME      NOT NULL,
    endDate            DATETIME      NOT NULL,
    createdDate        DATETIME      NOT NULL,
    updatedDate        DATETIME NULL
);

-- Thêm dữ liệu vào các bảng
INSERT INTO Roles (description, createdDate, updatedDate, version)
VALUES ('Admin', '2024-05-21 10:00:00', '2024-05-21 10:30:00', 1),
       ('User', '2024-05-21 11:00:00', NULL, 1);

INSERT INTO Users (username, password, email, fullname, address, phone, gender, birthday, isActived, createdDate,
                   updatedDate, version, roleId)
VALUES ('admin', '$2a$12$SXgmVBYyynbtcpWcV4ROkuTQK0zPdy3IhURMQmtZCy59cMuNoRyGC', 'admin@example.com', 'User One',
        '123 Street, City', '1234567890', 'Male', '1990-01-01', 1, NOW(), NULL, 1, 1),
       ('user2', '$2a$12$i/Xrjl1acnq4.8ZCTqQub.BPl9xYJ.tGg4z2rDBHRJeyp.ANTKV0S', 'user2@example.com', 'User Two',
        '456 Avenue, Town', '0569154932', 'Female', '1995-05-05', 1, NOW(), NULL, 1, 2);

INSERT INTO Categories (description, slug, isActived, createdDate, updatedDate, version, imgUrl)
VALUES ('Deluxe', 'deluxe', 1, NOW(), NULL, 1, 'deluxe.jpg'),
       ('Standard', 'standard', 1, NOW(), NULL, 1, 'standard.jpg'),
       ('Suite', 'suite', 1, NOW(), NULL, 1, 'suite.jpg'),
       ('Family', 'family', 1, NOW(), NULL, 1, 'family.jpg'),
       ('VIP', 'vip', 1, NOW(), NULL, 1, 'vip.jpg');
