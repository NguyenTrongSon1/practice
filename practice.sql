--1.
CREATE DATABASE MyBlog
use MyBlog

--2 
CREATE TABLE Users(UserID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
                   UserName varchar(20) NOT NULL,
				   Password varchar(30) NOT NULL,
				   Email varchar(30) NOT NULL UNIQUE,
				   Address nvarchar(200))

CREATE TABLE Posts(PostID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
				   Title nvarchar(200) NOT NULL,
				   Content nvarchar(MAX) NOT NULL,
				   Tag nvarchar(100) NULL,
				   Status bit,
				   CreateTime datetime DEFAULT(getdate()),
				   UpdateTime datetime,
				   UserID int,
				   FOREIGN KEY(UserID) REFERENCES Users(UserID)
)

CREATE TABLE Comments(CommentID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
					  Content nvarchar(500),
					  Status bit,
					  CreateTime datetime DEFAULT(getdate()),
					  Author nvarchar(30),
					  Email varchar(50) NOT NULL,
					  PostID int,
					  FOREIGN KEY(PostID) REFERENCES Posts(PostID)
)
--3
ALTER TABLE Comments ADD CHECK (Email like '%@%')
GO
ALTER TABLE Users ADD CHECK (Email like '%@%')
GO

--4
CREATE INDEX IX_UserName ON Users(UserName)

--5

INSERT INTO Users VALUES ('Son1','123','abc@gmail.com','phu luong')
INSERT INTO Users VALUES ('Sonn','456','riven@gmail.com','dong hung')
INSERT INTO Users VALUES ('Sonnn','789','123@gmail.com','thai binh')

INSERT INTO Posts VALUES ('tieu de1', N'Nội Dung 1', 'hihi', 'true', getdate(),getdate(), 1 )
INSERT INTO Posts VALUES ('tieu de2', N'nội dung 2', 'hello', 'true', getdate(),getdate(), 2 )
INSERT INTO Posts VALUES ('tieu de3', N'nội dung 3', 'hello2', 'true', getdate(),getdate(), 3 )

INSERT INTO Comments VALUES ('Chao tat ca cac ban','true', getdate()+5, 'yasuo','leesin@gmail.com', 1)
INSERT INTO Comments VALUES ('Hello anh em','true', getdate()-4, 'yone','akali@gmail.com', 2)
INSERT INTO Comments VALUES ('Chao tat ca ','true', getdate()-40, 'riven','zed@gmail.com', 3)

--6
SELECT * FROM Posts WHERE Tag = 'Social'

--7
SELECT * FROM Posts WHERE UserID in (SELECT UserID From Users WHERE Email='abc@gmail.com')

--8
SELECT COUNT(*) as Count FROM Comments

