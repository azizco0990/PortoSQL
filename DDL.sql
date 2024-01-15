-- Membuat database
CREATE DATABASE IF NOT EXISTS sales_2023;

-- Menggunakan database
USE sales_2023;

-- Tabel Customer
CREATE TABLE IF NOT EXISTS customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone_number VARCHAR(20)
);

-- Tabel Sales
CREATE TABLE IF NOT EXISTS sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    sale_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Mengisi tabel Customer
INSERT INTO customer (customer_id, customer_name, email, phone_number)
VALUES
    (1, 'Abdul', 'abdul@email.com', '123-456-7890'),
    (2, 'Aziz', 'aziz@email.com', '987-654-3210'),
    (3, 'Fathan', 'fathan@email.com', '555-123-4567');

-- Mengisi tabel Sales
INSERT INTO sales (sale_id, customer_id, sale_date, amount)
VALUES
    (101, 1, '2023-01-15', 500.00),
    (102, 2, '2023-02-20', 750.50),
    (103, 3, '2023-03-25', 1200.75);
    
-- Mengupdate data pada tabel Customer
UPDATE customer
SET email = 'baru.email@email.com'
WHERE customer_id = 1;

-- Mengupdate data pada tabel Sales
UPDATE sales
SET amount = 600.00
WHERE sale_id = 101;

-- Menghapus data dari tabel Customer
DELETE FROM customer
WHERE customer_id = 2;

-- Menghapus data dari tabel Sales
DELETE FROM sales
WHERE sale_id = 102;

-- Menambah kolom baru pada tabel Customer
ALTER TABLE customer
ADD COLUMN address VARCHAR(255);

-- Mengubah tipe data kolom pada tabel Sales
ALTER TABLE sales
MODIFY COLUMN amount DECIMAL(12, 2);
