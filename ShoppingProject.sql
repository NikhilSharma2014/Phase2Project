create database Shopping;

use Shopping
go

create table Category(CategoryID int Identity(1,1) Primary Key, CategoryName varchar(100) not null, CategoryImageURL varchar(100) not null, IsActive bit not null, DateCreated DateTime not null);


create table SubCategory(SubCategoryID int Identity(1,1) Primary Key, CategoryName varchar(100) not null, CategoryId	int Foreign Key references Category(CategoryID) on delete cascade not null, IsActive bit not null, DateCreated DateTime not null);

create table Product(ProductID int identity(1,1) Primary Key, ProductName varchar(100) not null, Description varchar(200) null, Details varchar(max) null, AdditionalDetails varchar(max) null, Price Decimal(18,2) not null, Quantity int not null, CategoryID int Foreign Key references Category(CategoryID) on delete cascade not null, SubCategoryId int not null, sold int null, IsActive bit not null, DateCreated DateTime not null);

create table ProductImages(ImageID int identity(1,1) Primary Key, ImageURL varchar(max), ProductId int foreign key references Product(ProductId) on delete cascade not null, DefaultImage bit);

create table Roles(RoleID int Primary Key, RoleName varchar(50) not null);
insert into Roles Values(1,'Admin');
insert into Roles Values(2,'Customer');

create table Users(UserID int identity(1,1) Primary Key, UserName varchar(50) null unique, Mobile varchar(20) null, Email varchar(50) null, UserAddress varchar(max) null, PostCode varchar(50) null, Password varchar(50) null, ImageUrl varchar(max) null, RoleId int foreign key references Roles(RoleID) on delete cascade not null, DateCreated Datetime not null);

create table ProductReview(ReviewID int identity(1,1) Primary Key, Rating int  null, Comment varchar(max) null, ProductId int foreign key references Product(ProductId) on delete cascade not null, UserID int foreign key references Users(UserID) on delete cascade not null, DateCreated Datetime not null);

create table WhishList(WhishlistID int identity(1,1) Primary Key, ProductId int foreign key references Product(ProductId) on delete cascade not null, UserID int foreign key references Users(UserID) on delete cascade not null, DateCreated Datetime not null);

create table Cart(CartID int identity(1,1) Primary Key, ProductId int foreign key references Product(ProductId) on delete cascade not null, Quantity int,  UserID int foreign key references Users(UserID) on delete cascade not null, DateCreated Datetime not null);

create table Contact(ContactId int identity(1,1) Primary Key, UserName varchar(50) null, Email varchar(50) null, Subject varchar(200) null, Message varchar(max) null, DateCreated DateTime not null);

create table Payment(PaymentId int identity(1,1) Primary Key, Name varchar(50) null, CardNo varchar(50) null, ExpiryDate varchar(50) null, CVVNo int null, Address varchar(max) null, PaymentMode varchar(50) null);

create table Orders(OrderDetailsId int identity(1,1) Primary Key, OrderNo varchar(max) null, ProductId int foreign key references Product(ProductId) on delete cascade not null, Quantity int null, UserID int foreign key references Users(UserID) on delete cascade not null, Status varchar(50) null, PaymentId int foreign key references Payment(PaymentId) on delete cascade not null, OrderDate Datetime not null, IsCancel bit not null default 0);
