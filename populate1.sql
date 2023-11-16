PRAGMA foreign_keys = ON;

INSERT INTO Client (idClient, name, emailAdress, phoneNumber, shippingAddress) 
VALUES (1, 'John Doe', 'john.doe@example.com', '1234567890', '123 Main St');

INSERT INTO Orders (idOrder, date, status, deliveryMethod, price, idClient) 
VALUES (1, '2023-11-13', 'Shipped', 'Express', 50.00, 1);

INSERT INTO Paper (idPaper, reference, designation) 
VALUES (1, 'P123', 'Kraft Paper');

INSERT INTO BagType (idBagType, dimensions, description, unitPrice, state, designation, idPaper) 
VALUES (1, '10x15', 'Small Paper Bag', 1.50, 'Available', 'SmallBag', 1);

INSERT INTO Warehouse (idWarehouse, location) 
VALUES (1, 'Warehouse A');

INSERT INTO PaperItem (idPaperItem, idPaper, idWarehouse) 
VALUES (1, 1, 1);

INSERT INTO PaperItemWarehouse (idPaperItem, idWarehouse) 
VALUES (1, 1);

INSERT INTO Quantity (idOrder, idBagType, quantity) 
VALUES (1, 1, 5);

INSERT INTO Machine (idMachine, name, model, warranty, idWarehouse) 
VALUES (1, 'Machine1', 'Model123', 1, 1);

INSERT INTO CanBeProduced (idBagType, idMachine) 
VALUES (1, 1);

INSERT INTO Employee (name, idEmployee, idWarehouse) 
VALUES ('Alice', 1, 1);

INSERT INTO BagItem (idBagItem, idBagType, idEmployee, idWarehouse) 
VALUES (1, 1, 1, 1);

INSERT INTO Client (name, emailAdress, phoneNumber, shippingAddress) 
VALUES ('Jane Smith', 'jane.smith@example.com', '9876543210', '456 Oak St');

INSERT INTO Orders (date, status, deliveryMethod, price, idClient) 
VALUES ('2023-11-14', 'Processing', 'Standard', 30.00, 2);

INSERT INTO Paper (reference, designation) 
VALUES ('P456', 'Recycled Paper');

INSERT INTO BagType (dimensions, description, unitPrice, state, designation, idPaper) 
VALUES ('12x18', 'Medium Paper Bag', 2.00, 'Available', 'MediumBag', 2);

INSERT INTO Warehouse (location) 
VALUES ('Warehouse B');

INSERT INTO PaperItem (idPaperItem, idPaper, idWarehouse) 
VALUES (2, 2, 2);

INSERT INTO PaperItemWarehouse (idPaperItem, idWarehouse) 
VALUES (2, 2);

INSERT INTO Quantity (idOrder, idBagType, quantity) 
VALUES (2, 2, 8);

INSERT INTO Machine (name, model, warranty, idWarehouse) 
VALUES ('Machine2', 'Model456', 1, 2);

INSERT INTO CanBeProduced (idBagType, idMachine) 
VALUES (2, 2);

INSERT INTO Employee (name, idWarehouse) 
VALUES ('Bob', 2);

INSERT INTO BagItem (idBagType, idEmployee, idWarehouse) 
VALUES (2, 2, 2);

INSERT INTO BagItem (idBagType, idEmployee, idWarehouse)
VALUES (2,1,1);

INSERT INTO Orders(date, status, deliveryMethod, price, idClient)
VALUES ('2023-11-16', 'Awaits shippment', 'Sea', 25.00, 1);
