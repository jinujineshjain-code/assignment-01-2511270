## Anomaly Analysis

### 1. Insert Anomaly
**Problem:** We cannot insert a new product's details into the database until a customer actually orders it. This is because the table requires an Order ID to create a new row.
**Example:** In `orders_flat.csv`, notice that all product information (like 'Product_Name' and 'Product_Category') is tied to an 'Order_ID'. If we want to add a new product called "Wireless Mouse" to our catalog, we can't do it until someone buys it.

### 2. Update Anomaly
**Problem:** When data is repeated in multiple rows, updating it in one place but not others leads to inconsistencies.
**Example:** Look at **Aarav Sharma** (Customer_ID: C001). His name and address are repeated in multiple rows (e.g., Row 2 and Row 3). If Aarav moves to a new house, we have to manually update the 'Customer_Address' in every single row he appears in. If we miss one row, the database will show two different addresses for the same person.

### 3. Delete Anomaly
**Problem:** Deleting a specific transaction might accidentally result in the permanent loss of unrelated but important data.
**Example:** Look at **Row 5** (Order_ID: 1004) for customer 'Ananya Iyer'. If we delete this order because she returned the product, and that was her only order in the system, we lose all her information (Name, Email, Address) entirely. We lose the customer just because we deleted a transaction.
