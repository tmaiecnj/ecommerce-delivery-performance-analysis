CREATE TABLE customers(
	customer_id					TEXT PRIMARY KEY,
	customer_unique_id			TEXT,
	customer_zip_code_prefix	VARCHAR(5),
	customer_city				VARCHAR(60),
	customer_state				VARCHAR(2)
);

CREATE TABLE orders(
	order_id						TEXT PRIMARY KEY,
	customer_id						TEXT REFERENCES customers(customer_id),
	order_status					VARCHAR(15),
	order_purchase_timestamp		TIMESTAMPTZ,
	order_approved_at				TIMESTAMPTZ,
	order_delivered_carrier_date	TIMESTAMPTZ,
	order_delivered_customer_date	TIMESTAMPTZ,
	order_estimated_delivery_date	TIMESTAMPTZ
);


CREATE TABLE order_reviews(
	review_id					TEXT,
	order_id					TEXT REFERENCES orders(order_id),
	review_score				INT,
	review_comment_title		TEXT,
	review_comment_message		TEXT,
	review_creation_date		TIMESTAMPTZ,
	review_answer_timestamp		TIMESTAMPTZ
);


CREATE TABLE order_payments(
	order_id					TEXT REFERENCES orders(order_id),
	payment_sequential			INT,
	payment_type				VARCHAR(15),
	payment_installments		INT,
	payment_value				DECIMAL(10,2),
	PRIMARY KEY (order_id, payment_sequential)
);


CREATE TABLE product_category_name_translations(
	product_category_name			TEXT PRIMARY KEY,
	product_category_name_english	TEXT
);


CREATE TABLE products(
	product_id					TEXT PRIMARY KEY,
	product_category_name		VARCHAR(60),
	product_name_length			INT,
	product_description_length	INT,
	product_photos_qty			INT,
	product_weight_g			INT,
	product_length_cm			INT,
	product_height_cm			INT,
	product_width_cm			INT
);


CREATE TABLE sellers(
	seller_id					TEXT PRIMARY KEY,
	seller_zip_code_prefix		VARCHAR(5),
	seller_city					VARCHAR(60),
	seller_state				VARCHAR(2)
);


CREATE TABLE order_items(
	order_id					TEXT REFERENCES orders(order_id),
	order_item_id				INT,
	product_id					TEXT REFERENCES products(product_id),
	seller_id					TEXT REFERENCES sellers(seller_id),
	shipping_limit_date			TIMESTAMPTZ,
	price						DECIMAL(12,2),
	freight_value				DECIMAL(12,2),
	PRIMARY KEY (order_id, order_item_id)
);


CREATE TABLE geolocation(
	geolocation_zip_code_prefix		VARCHAR(5),
	geolocation_lat					DECIMAL(8,6),
	geolocation_long				DECIMAL(9,6),
	geolocation_city				VARCHAR(60),
	geolocation_state				VARCHAR(2)
);

