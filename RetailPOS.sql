CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity_in_stock INT NOT NULL
);
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(20)
);
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    sale_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE sale_items (
    sale_item_id INT PRIMARY KEY,
    sale_id INT,
    product_id INT,
    quantity INT NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- Insert a product
INSERT INTO products (product_id, product_name, price, quantity_in_stock)
VALUES (1, 'Laptop', 899.99, 50);

-- Insert a customer
INSERT INTO customers (customer_id, customer_name, email, phone)
VALUES (1, 'John Doe', 'john.doe@yahoo.com', '+1-555-123-4567');
-- Create a sale
INSERT INTO sales (sale_id, customer_id, sale_date, total_amount)
VALUES (1, 1, '2024-01-27', 899.99);

-- Add items to the sale
INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, subtotal)
VALUES (1, 1, 1, 2, 1799.98);
-- Update product quantity after a sale
UPDATE products
SET quantity_in_stock = quantity_in_stock - 2
WHERE product_id = 1;
-- Get sales information with customer details
SELECT sales.sale_id, customers.customer_name, sales.sale_date, sales.total_amount
FROM sales
JOIN customers ON sales.customer_id = customers.customer_id;


-- List of Queries -- 

-- Get a list of sales, including customer details
SELECT sales.sale_id, customers.customer_name, sales.sale_date, sales.total_amount
FROM sales
JOIN customers ON sales.customer_id = customers.customer_id;

-- Retrieve Available Products
SELECT * FROM products WHERE quantity_in_stock > 0;

-- Adding a new product to the inventory 
INSERT INTO products (product_id, product_name, price, quantity_in_stock)
VALUES (2, 'Smartphone', 599.99, 30);

-- Update Customer information
UPDATE customers
SET phone = '+1-555-987-6543'
WHERE customer_id = 2; 
