-- Drop existing tables if they exist
DROP TABLE IF EXISTS BagItem;
DROP TABLE IF EXISTS PaperItemWarehouse;
DROP TABLE IF EXISTS Machine;
DROP TABLE IF EXISTS Warehouse;
DROP TABLE IF EXISTS Paper;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS CanBeProduced;
DROP TABLE IF EXISTS Quantity;
DROP TABLE IF EXISTS PaperItem;
DROP TABLE IF EXISTS BagType;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Client;

-- Create tables with improvements
CREATE TABLE Client 
(
    idClient INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) NOT NULL,
    emailAdress VARCHAR(255),
    phoneNumber VARCHAR(13),
    shippingAddress VARCHAR(255) NOT NULL
);

CREATE TABLE Orders
(
    idOrder INTEGER PRIMARY KEY AUTOINCREMENT,
    date DATE NOT NULL,
    status VARCHAR(255) CHECK (status IN ('Processing', 'Shipped', 'Delivered')),
    deliveryMethod VARCHAR(255) CHECK (deliveryMethod IN ('Standard', 'Express', 'Priority')),
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    idClient INTEGER NOT NULL,
    FOREIGN KEY (idClient) REFERENCES Client(idClient) ON DELETE CASCADE
);

CREATE TABLE BagType
(
    idBagType INTEGER PRIMARY KEY AUTOINCREMENT,
    dimensions VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    unitPrice DECIMAL(1,2) NOT NULL CHECK (unitPrice > 0),
    state VARCHAR(255) CHECK (state IN ('Available', 'Out of Stock', 'Discontinued')),
    designation VARCHAR(255),
    idPaper INTEGER NOT NULL,
    FOREIGN KEY (idPaper) REFERENCES Paper(idPaper)
);

CREATE TABLE PaperItem
(
    idPaperItem INTEGER PRIMARY KEY AUTOINCREMENT,
    idPaper INTEGER NOT NULL,
    idWarehouse INTEGER NOT NULL,
    FOREIGN KEY (idPaper) REFERENCES Paper(idPaper),
    FOREIGN KEY (idWarehouse) REFERENCES Warehouse(idWarehouse)
);

CREATE TABLE Quantity
(
    idOrder INTEGER NOT NULL,
    idBagType INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    PRIMARY KEY (idOrder, idBagType),
    FOREIGN KEY (idOrder) REFERENCES Orders(idOrder),
    FOREIGN KEY (idBagType) REFERENCES BagType(idBagType)
);

CREATE TABLE CanBeProduced
(
    idBagType INTEGER NOT NULL,
    idMachine INTEGER NOT NULL,
    PRIMARY KEY (idBagType, idMachine),
    FOREIGN KEY (idBagType) REFERENCES BagType(idBagType),
    FOREIGN KEY (idMachine) REFERENCES Machine(idMachine)
);

CREATE TABLE Employee
(
    name VARCHAR(255) NOT NULL,
    idEmployee INTEGER PRIMARY KEY AUTOINCREMENT,
    idWarehouse INTEGER NOT NULL,
    FOREIGN KEY (idWarehouse) REFERENCES Warehouse(idWarehouse)
);

CREATE TABLE Paper
(
    idPaper INTEGER PRIMARY KEY AUTOINCREMENT,
    reference VARCHAR(255),
    designation VARCHAR(255)
);

CREATE TABLE Warehouse
(
    idWarehouse INTEGER PRIMARY KEY AUTOINCREMENT,
    location VARCHAR(255) UNIQUE
);

CREATE TABLE Machine
(
    idMachine INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255),
    model VARCHAR(255),
    warranty BOOLEAN CHECK (warranty IN (0, 1)),
    idWarehouse INTEGER NOT NULL,
    FOREIGN KEY (idWarehouse) REFERENCES Warehouse(idWarehouse)
);

CREATE TABLE PaperItemWarehouse
(
    idPaperItem INTEGER NOT NULL,
    idWarehouse INTEGER NOT NULL,
    PRIMARY KEY (idPaperItem, idWarehouse),
    FOREIGN KEY (idPaperItem) REFERENCES PaperItem(idPaperItem),
    FOREIGN KEY (idWarehouse) REFERENCES Warehouse(idWarehouse)
);

CREATE TABLE BagItem
(
    idBagItem INTEGER PRIMARY KEY AUTOINCREMENT,
    idBagType INTEGER NOT NULL,
    idEmployee INTEGER NOT NULL,
    idWarehouse INTEGER NOT NULL,
    FOREIGN KEY (idBagType) REFERENCES BagType(idBagType),
    FOREIGN KEY (idEmployee) REFERENCES Employee(idEmployee),
    FOREIGN KEY (idWarehouse) REFERENCES Warehouse(idWarehouse)
);
