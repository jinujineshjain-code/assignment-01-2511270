## Architecture Recommendation

For a fast-growing food delivery startup that collects GPS location logs, customer text reviews, payment transactions, and restaurant menu images, I would recommend a **Data Lake** architecture.

Here are three specific reasons for this choice:

**1. The data is multi-format and unstructured**
The startup collects four fundamentally different types of data — GPS logs (time-series), text reviews (unstructured text), payment transactions (structured), and menu images (binary/unstructured). A traditional Data Warehouse can only store structured, pre-modelled tabular data efficiently. It cannot natively handle raw text, images, or high-frequency GPS streams. A Data Lake, by contrast, stores data in its raw native format — CSVs, JSON, images, Parquet files — without requiring an upfront schema. This makes it the only architecture that can accommodate all four data types in one place.

**2. The startup is fast-growing and requirements will change**
A Data Warehouse requires a fixed schema defined before data is loaded (schema-on-write). For a startup whose data needs evolve rapidly — new features, new data sources, new business questions — this rigidity is a major liability. A Data Lake uses schema-on-read, meaning data is stored raw and structure is applied only when querying. This gives the startup the flexibility to explore data in new ways without costly schema migrations.

**3. Volume and cost at scale**
GPS location logs alone can generate millions of records per day across thousands of delivery partners. Storing this volume in a Data Warehouse like BigQuery or Redshift would be prohibitively expensive. A Data Lake built on object storage (e.g., AWS S3 or Google Cloud Storage) is significantly cheaper at scale and can store virtually unlimited raw data. Tools like DuckDB, Apache Spark, or AWS Athena can then query the lake directly without needing to move data into a warehouse first.

A Data Lakehouse (combining Data Lake storage with warehouse-style querying) would be the ideal long-term target architecture, but for an early-stage fast-growing startup, starting with a Data Lake provides the best balance of flexibility, scalability, and cost efficiency.
