-- Create primary keys
ALTER TABLE customers
ADD PRIMARY KEY (customer_id);

ALTER TABLE orders
ADD PRIMARY KEY (order_id);

ALTER TABLE order_items
ADD COLUMN id SERIAL PRIMARY KEY;

-- Create foreign keys
ALTER TABLE orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

-- Fix timestamp type
ALTER TABLE orders
ALTER COLUMN order_purchase_timestamp
TYPE TIMESTAMP
USING order_purchase_timestamp::TIMESTAMP;

-- Fix financial precision
ALTER TABLE order_items
ALTER COLUMN price
TYPE NUMERIC(10,2)
USING ROUND(price::numeric, 2);
