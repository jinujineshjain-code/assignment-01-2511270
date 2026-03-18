## Storage Systems

For the hospital's AI-powered data system with four goals, the following storage systems were chosen:

**Goal 1 — Predict patient readmission risk** using historical treatment data: A **Data Warehouse** (e.g., Google BigQuery or Amazon Redshift) is used to store cleaned, structured historical treatment records — diagnoses, medications, lab results, and discharge summaries. The warehouse enables the ML model to run batch queries over large volumes of structured data efficiently. OLAP-style aggregations (e.g., average readmission rate by diagnosis category) are fast and reliable here.

**Goal 2 — Allow doctors to query patient history in plain English**: A **Vector Database** (e.g., Pinecone or ChromaDB) is used alongside a large language model. Patient records and clinical notes are converted into embeddings and stored in the vector database. When a doctor asks "Has this patient had a cardiac event before?", the question is embedded and matched against stored vectors using cosine similarity, returning the most semantically relevant records instantly — even if exact keywords don't match.

**Goal 3 — Generate monthly reports** for hospital management: The same **Data Warehouse** serves this goal. Pre-aggregated fact tables (bed occupancy by department, costs by month) power dashboards and scheduled reports via BI tools like Tableau or Looker.

**Goal 4 — Stream and store real-time vitals** from ICU monitoring devices: A **Time-Series Database** (e.g., InfluxDB or Apache Kafka + Amazon Kinesis) is used for ingesting and storing high-frequency streaming data from ICU devices. These systems are optimised for write-heavy, time-stamped data and can trigger real-time alerts when vitals cross thresholds.

---

## OLTP vs OLAP Boundary

The **OLTP boundary** covers all real-time transactional operations — patient admissions, doctor assignments, prescription updates, billing, and appointment scheduling. These are handled by a relational database (e.g., MySQL or PostgreSQL) that ensures ACID compliance and data integrity for day-to-day hospital operations. Every time a nurse updates a patient's medication or a receptionist books an appointment, that is an OLTP transaction.

The **OLAP boundary** begins when data from the OLTP system is extracted, transformed, and loaded (ETL) into the Data Warehouse. This happens on a scheduled basis — typically nightly. The warehouse is used exclusively for analytical queries: readmission risk modelling, monthly cost reports, department-wise bed occupancy trends. These queries scan large volumes of historical data and are too slow and resource-intensive to run on the live OLTP database without affecting hospital operations.

The ETL pipeline is therefore the dividing line — raw operational data lives in MySQL (OLTP), cleaned analytical data lives in BigQuery (OLAP).

---

## Trade-offs

The most significant trade-off in this design is the **complexity of maintaining multiple specialised storage systems** — a relational database, a data warehouse, a vector database, and a time-series database all running simultaneously. Each system requires separate infrastructure, monitoring, and expertise. For a mid-sized hospital with a limited IT team, this operational overhead can be a serious challenge.

To mitigate this, the hospital could adopt a **Data Lakehouse architecture** (e.g., Databricks or AWS Lake Formation) as a long-term consolidation strategy. A Lakehouse combines the raw storage flexibility of a Data Lake with the structured querying power of a Data Warehouse in a single platform, reducing the number of systems to manage. The vector database and time-series database would still remain separate due to their specialised nature, but consolidating the warehouse and lake would significantly reduce complexity without sacrificing analytical capability.
