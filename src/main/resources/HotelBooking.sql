CREATE TABLE Users (
                       idUsers INT PRIMARY KEY AUTO_INCREMENT,
                       NameUsers VARCHAR(MAX),
    PhoneNumber VARCHAR(MAX),
    Email VARCHAR(MAX),
    PasswordUsers VARCHAR(MAX),
    Adress VARCHAR(MAX),
    CCCD VARCHAR(MAX),
    RoleE BOOLEAN,
    Activated BOOLEAN,
    otpGeneratedTime DATETIME,
    otp VARCHAR(MAX)
);

CREATE TABLE ServiceRoom (
                             idServiceRoom INT PRIMARY KEY AUTO_INCREMENT,
                             IdUsers INT,
                             FOREIGN KEY (IdUsers) REFERENCES Users(idUsers),
                             RoomService BOOLEAN,
                             LaundryService BOOLEAN,
                             Airpot BOOLEAN,
                             Wakeup BOOLEAN
);

CREATE TABLE Rooms (
                       IdRooms INT PRIMARY KEY AUTO_INCREMENT,
                       IdUsers INT,
                       Title VARCHAR(MAX),
    Img VARCHAR(MAX),
    Adress VARCHAR(MAX),
    RoomNumber VARCHAR(MAX),
    RoomType VARCHAR(MAX),
    BedType VARCHAR(MAX),
    Price FLOAT,
    StatusRoom BOOLEAN,
    Checkin VARCHAR(MAX),
    Checkout VARCHAR(MAX),
    DescriptionRooms VARCHAR(MAX),
    CategoryId VARCHAR(MAX),
    FOREIGN KEY (IdUsers) REFERENCES Users(idUsers),
    FOREIGN KEY (CategoryId) REFERENCES Categories(id)
);

CREATE TABLE Bill (
                      IdBill INT PRIMARY KEY AUTO_INCREMENT,
                      IdUsers INT,
                      IdRooms INT,
                      TotalAmount FLOAT,
                      PaymentMethod VARCHAR(MAX),
    Title VARCHAR(MAX),
    Adress VARCHAR(MAX),
    RoomNumber VARCHAR(MAX),
    RoomType VARCHAR(MAX),
    BedType VARCHAR(MAX),
    Price FLOAT,
    DayNumber INT,
    Checkin VARCHAR(MAX),
    Checkout VARCHAR(MAX),
    Note VARCHAR(MAX),
    NameUser VARCHAR(MAX),
    FOREIGN KEY (IdUsers) REFERENCES Users(idUsers),
    FOREIGN KEY (IdRooms) REFERENCES Rooms(IdRooms)
);

CREATE TABLE ReportBill (
                            IdBill INT PRIMARY KEY,
                            NameUsers VARCHAR(MAX),
    PhoneNumber VARCHAR(MAX),
    RoomNumber VARCHAR(MAX),
    RoomType VARCHAR(MAX),
    CheckIn VARCHAR(MAX),
    CheckOut VARCHAR(MAX),
    TotalAmount FLOAT
);

CREATE TABLE Report (
                        GroupName VARCHAR(MAX) PRIMARY KEY,
    Sum DOUBLE,
    Count LONG,
    CountStatusRoomTrue LONG,
    CountStatusRoomFalse LONG
);

CREATE TABLE Categories (
                            Id VARCHAR(MAX) PRIMARY KEY,
    Name VARCHAR(MAX)
);


INSERT INTO Users (NameUsers, PhoneNumber, Email, PasswordUsers, Adress, CCCD, RoleE, Activated, otpGeneratedTime, otp)
VALUES
    ('trinhdongkhanh', '1234567890', 'trinhdongkhanh.work@gmail.com', 'khanh123', '123 Main Street', '123456789', TRUE, TRUE, '2024-06-12 12:00:00', '123456'),
    ('trungKien', '0987654321', 'jane.smith@gmail.com', 'kien123', '456 Elm Street', '987654321', FALSE, TRUE, '2024-06-12 11:00:00', '654321'),
    ('thanhTai', '1357924680', 'alice.johnson@gmail.com', 'tai123', '789 Oak Street', '135792468', TRUE, FALSE, '2024-06-12 10:00:00', '789456'),
    ('Bob Brown', '2468013579', 'bob.brown@gmail.com', 'passwordabc', '246 Pine Street', '246801357', FALSE, TRUE, '2024-06-12 09:00:00', 'abc123'),
    ('Emily Davis', '9876543210', 'emily.davis@gmail.com', 'passworddef', '987 Maple Street', '9876543210', TRUE, TRUE, '2024-06-12 08:00:00', 'def456'),
    ('Michael Wilson', '6543210987', 'michael.wilson@gmail.com', 'passwordghi', '654 Cedar Street', '654321098', FALSE, FALSE, '2024-06-12 07:00:00', 'ghi789'),
    ('Olivia Martinez', '3216549870', 'olivia.martinez@gmail.com', 'passwordjkl', '321 Oak Street', '321654987', TRUE, TRUE, '2024-06-12 06:00:00', 'jkl012');

INSERT INTO ServiceRoom (IdUsers, RoomService, LaundryService, Airpot, Wakeup)
VALUES
    (1, TRUE, FALSE, TRUE, TRUE),
    (2, TRUE, TRUE, FALSE, TRUE),
    (3, FALSE, TRUE, TRUE, FALSE),
    (4, TRUE, TRUE, TRUE, TRUE),
    (5, TRUE, FALSE, FALSE, FALSE),
    (6, FALSE, TRUE, TRUE, TRUE),
    (7, TRUE, FALSE, FALSE, TRUE),
    (8, FALSE, TRUE, FALSE, FALSE),
    (9, TRUE, TRUE, TRUE, TRUE),
    (10, FALSE, FALSE, TRUE, TRUE);

INSERT INTO Rooms (IdUsers, Title, Img, Adress, RoomNumber, RoomType, BedType, Price, StatusRoom, Checkin, Checkout, DescriptionRooms, CategoryId)
VALUES
    (1, 'Deluxe Room', 'deluxe_room.jpg', '123 Main Street', '101', 'Deluxe', 'King', 100.0, TRUE, '2024-06-12', '2024-06-15', 'Spacious room with king-size bed.', '1'),
    (2, 'Standard Room', 'standard_room.jpg', '456 Elm Street', '201', 'Standard', 'Queen', 80.0, TRUE, '2024-06-13', '2024-06-16', 'Cozy room with queen-size bed.', '2'),
    (3, 'Suite Room', 'suite_room.jpg', '789 Oak Street', '301', 'Suite', 'King', 150.0, TRUE, '2024-06-14', '2024-06-17', 'Luxurious suite with king-size bed and living area.', '3'),
    (4, 'Family Room', 'family_room.jpg', '246 Pine Street', '401', 'Family', 'Queen', 120.0, TRUE, '2024-06-15', '2024-06-18', 'Spacious room ideal for families with queen-size beds.', '4'),
    (5, 'VIP Room', 'vip_room.jpg', '987 Maple Street', '501', 'VIP', 'King', 200.0, TRUE, '2024-06-16', '2024-06-19', 'Exclusive room with king-size bed and luxury amenities.', '5');

INSERT INTO Bill (IdUsers, IdRooms, TotalAmount, PaymentMethod, Title, Adress, RoomNumber, RoomType, BedType, Price, DayNumber, Checkin, Checkout, Note, NameUser)
VALUES
    (1, 1, 300.0, 'Credit Card', 'Booking Confirmation', '123 Main Street', '101', 'Deluxe', 'King', 100.0, 3, '2024-06-12', '2024-06-15', 'Special request: extra towels', 'John Doe'),
    (2, 2, 240.0, 'Cash', 'Booking Confirmation', '456 Elm Street', '201', 'Standard', 'Queen', 80.0, 3, '2024-06-13', '2024-06-16', '', 'Jane Smith'),
    (3, 3, 450.0, 'Credit Card', 'Booking Confirmation', '789 Oak Street', '301', 'Suite', 'King', 150.0, 3, '2024-06-14', '2024-06-17', '', 'Alice Johnson'),
    (4, 4, 360.0, 'Cash', 'Booking Confirmation', '246 Pine Street', '401', 'Family', 'Queen', 120.0, 3, '2024-06-15', '2024-06-18', '', 'Bob Brown'),
    (5, 5, 600.0, 'Credit Card', 'Booking Confirmation', '987 Maple Street', '501', 'VIP', 'King', 200.0, 3, '2024-06-16', '2024-06-19', '', 'Emily Davis'),
    (6, 1, 200.0, 'Cash', 'Booking Confirmation', '654 Cedar Street', '101', 'Deluxe', 'King', 100.0, 2, '2024-06-10', '2024-06-12', 'Early check-in request', 'Michael Wilson'),
    (7, 2, 160.0, 'Credit Card', 'Booking Confirmation', '321 Oak Street', '201', 'Standard', 'Queen', 80.0, 2, '2024-06-11', '2024-06-13', '', 'Olivia Martinez'),
    (8, 3, 300.0, 'Cash', 'Booking Confirmation', '135 Pine Street', '301', 'Suite', 'King', 150.0, 2, '2024-06-12', '2024-06-14', '', 'Jack Black'),
    (9, 4, 240.0, 'Credit Card', 'Booking Confirmation', '753 Elm Street', '401', 'Family', 'Queen', 120.0, 2, '2024-06-13', '2024-06-15', '', 'Sarah Green'),
    (10, 5, 400.0, 'Cash', 'Booking Confirmation', '852 Cedar Street', '501', 'VIP', 'King', 200.0, 2, '2024-06-14', '2024-06-16', '', 'Chris White');

INSERT INTO ReportBill (idBill, nameUsers, phoneNumber, roomNumber, roomType, checkIn, checkOut, totalAmount)
VALUES
    (1, 'John Doe', '1234567890', '101', 'Deluxe', '2024-06-12', '2024-06-15', 300.0),
    (2, 'Jane Smith', '0987654321', '201', 'Standard', '2024-06-13', '2024-06-16', 240.0),
    (3, 'Alice Johnson', '1357924680', '301', 'Suite', '2024-06-14', '2024-06-17', 450.0),
    (4, 'Bob Brown', '2468013579', '401', 'Family', '2024-06-15', '2024-06-18', 360.0),
    (5, 'Emily Davis', '9876543210', '501', 'VIP', '2024-06-16', '2024-06-19', 600.0),
    (6, 'Michael Wilson', '6543210987', '101', 'Deluxe', '2024-06-10', '2024-06-12', 200.0),
    (7, 'Olivia Martinez', '3216549870', '201', 'Standard', '2024-06-11', '2024-06-13', 160.0),
    (8, 'Jack Black', '9871236540', '301', 'Suite', '2024-06-12', '2024-06-14', 300.0),
    (9, 'Sarah Green', '4567891230', '401', 'Family', '2024-06-13', '2024-06-15', 240.0),
    (10, 'Chris White', '9876541230', '501', 'VIP', '2024-06-14', '2024-06-16', 400.0);

INSERT INTO Report (GroupName, Sum, Count, CountStatusRoomTrue, CountStatusRoomFalse)
VALUES
    ('Report January', 50000000, 50, 30, 20),
    ('Report February', 60000000, 60, 35, 25),
    ('Report March', 70000000, 70, 40, 30),
    ('Report April', 80000000, 80, 45, 35),
    ('Report May', 90000000, 90, 50, 40),
    ('Report June', 100000000, 100, 55, 45),
    ('Report July', 110000000, 110, 60, 50),
    ('Report August', 120000000, 120, 65, 55),
    ('Report September', 130000000, 130, 70, 60),
    ('Report October', 140000000, 140, 75, 65);

INSERT INTO Categories (Id, Name)
VALUES
    ('1', 'Area 1, New York'),
    ('2', 'Area 2, Los Angeles'),
    ('3', 'Area 3, Chicago'),
    ('4', 'Area 4, Houston'),
    ('5', 'Area 5, Philadelphia');



