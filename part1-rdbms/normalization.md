## Anomaly Analysis

### Insert Anomaly
In the flat file `orders_flat.csv`, it is impossible to add a new product to the system unless an order is also placed for it. For example, if the company starts selling a new product called "Monitor" (P009), there is no way to record its name, category, or price in the spreadsheet without simultaneously creating a fake order for it. All product data is trapped inside the orders rows.

**Rows/Columns affected:** `product_id`, `product_name`, `category`, `unit_price` — these columns have no independent existence without an `order_id`.

---

### Update Anomaly
In the flat file, the same sales representative's details (name, email, office address) are repeated across every order they are associated with. For example, `SR01 - Deepak Joshi` appears in dozens of rows with `deepak@corp.com` and `Mumbai HQ, Nariman Point, Mumbai - 400021`. If Deepak Joshi's email changes, every single row containing his data must be updated. Missing even one row creates an inconsistency in the database.

**Rows/Columns affected:** `sales_rep_id`, `sales_rep_name`, `sales_rep_email`, `office_address` — duplicated across all rows for SR01 (e.g., ORD1003, ORD1006, ORD1010, etc.).

---

### Delete Anomaly
If all orders placed by customer `C003 - Amit Verma` are deleted from the flat file, all information about Amit Verma (his email `amit@gmail.com`, city `Bangalore`, customer ID `C003`) is permanently lost from the system. There is no separate customer record — the customer only exists through their orders.

**Rows/Columns affected:** `customer_id`, `customer_name`, `customer_email`, `customer_city` — deleting orders ORD1132, ORD1185, and others for C003 would erase all trace of this customer.

---

## Normalization Justification

Your manager argues that keeping everything in one table is simpler and that normalization is over-engineering. While this view is understandable for very small, static datasets, it breaks down quickly in a real retail business environment. The `orders_flat.csv` file is a clear example of why.

First, consider data integrity. In the flat file, the sales representative `Deepak Joshi` appears in over 60 rows with the same email and office address repeated every time. If his email changes, someone must update all 60+ rows manually. Miss one row and the data becomes inconsistent — two different emails for the same person. In a normalized schema, `sales_reps` is a separate table with one row per rep. One update fixes everything instantly.

Second, consider storage efficiency and redundancy. Customer `Neha Gupta` (C006) appears in over 30 rows, with her name, email, and city copied each time. In 3NF, her details are stored exactly once in the `customers` table and referenced by a foreign key. This is not over-engineering — it is basic efficiency.

Third, the flat file makes it impossible to store information that doesn't yet have a transaction. You cannot add a new product or a new sales rep to the system without creating a dummy order. In normalized tables, products and reps are independent entities that exist on their own.

Finally, as the business scales — more customers, more products, more reps — a single flat table becomes increasingly difficult to query, maintain, and audit. The normalized schema we designed separates concerns cleanly: `customers`, `products`, `sales_reps`, and `orders` each manage their own data. This is not over-engineering; it is the foundation of reliable, scalable data management.
