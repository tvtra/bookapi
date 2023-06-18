CREATE DATABASE IF NOT EXISTS
book_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE book_db;

DROP TABLE IF EXISTS `Authors`;
CREATE TABLE `Authors` (
                              `authorID` varchar(100) NOT NULL,
                              `authorName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Authors` (`authorID`, `authorName`) VALUES
('A1', 'Nguyen Nhat Anh'),
('A2','Vu Trong Phung'),
('A3','Tran Dang Khoa'),
('A4','Nguyen Cong Hoan'),
('A5','To Hoai');


DROP TABLE IF EXISTS `Books`;
CREATE TABLE `Books` (
                            `bookID` varchar(100) NOT NULL,
                            `authorID` varchar(10) DEFAULT NULL,
                            `title` varchar(100) DEFAULT NULL,
                            `totalPages` int(10) DEFAULT NULL,
                            `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `Books` (`bookID`, `authorID`, `title`, `totalPages`, `price`) VALUES
('B1', 'A1', 'Kinh Van Hoa', 500, 120000),
('B2', 'A1', 'La Nam Trong La', 89, 85000),
('B3', 'A1', 'Toi Thay Hoa Vang Tren Co Xanh', 101, 100000),
('B4', 'A1', 'Cho Toi Xin Mot Ve Di Tuoi Tho', 80, 92000),
('B5', 'A2', 'Giong To', 120, 83000),
('B6', 'A2', 'So Do', 103, 72000),
('B7', 'A2', 'Lam Di', 55, 55000),
('B8', 'A4', 'Buoc Duong Cung', 70, 60000),
('B9', 'A5', 'De Men Phieu Luu Ky', 50, 42000),
('B10', 'A5', 'Chuyen Cu Ha Noi', 80, 740000);


ALTER TABLE `Authors` ADD PRIMARY KEY (`authorID`);

ALTER TABLE `Books` ADD PRIMARY KEY (`bookID`);

COMMIT;