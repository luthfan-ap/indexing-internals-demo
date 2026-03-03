# 🔍 Database Indexing Internals Demo

A hands-on mini project to understand how database indexing works under the hood using PostgreSQL. This repository is the companion code for my Medium article released soon.

## What This Demo Does

1. Creates a simple `users` table in PostgreSQL
2. Populates it with **1 million rows** of random data
3. Runs `EXPLAIN ANALYZE` queries **before and after** adding an index — so you can see the performance difference yourself

## Prerequisites

- Python 3.x
- PostgreSQL (running locally or via Docker)

## Quick Start

### 1. Set Up the Database

Connect to your PostgreSQL instance and run `setup.sql` to create the table:

```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT,
    age INT
);
```

### 2. Install Dependencies

```bash
pip install -r requirements.txt
```

### 3. Generate Sample Data

Update the connection string in `generate_data.py` with your database credentials, then run:

```bash
python generate_data.py
```

This inserts **1,000,000** rows with random emails and ages into the `users` table.

### 4. Benchmark: Before vs After Indexing

Open `benchmark.sql` and follow the steps:

**Step 1** — Run the query *without* an index:

```sql
EXPLAIN ANALYZE
SELECT * FROM users WHERE email = 'randomvalue@example.com';
```

> You'll see a **Sequential Scan** — Postgres scans every row to find the match.

**Step 2** — Create the index:

```sql
CREATE INDEX idx_users_email ON users(email);
```

**Step 3** — Run the same query again:

```sql
EXPLAIN ANALYZE
SELECT * FROM users WHERE email = 'randomvalue@example.com';
```

> Now you'll see an **Index Scan** — Postgres jumps directly to the relevant row(s) using the B-Tree index.

## Project Structure

```
.
├── setup.sql          # Creates the users table
├── generate_data.py   # Inserts 1M random rows
├── benchmark.sql      # EXPLAIN ANALYZE queries (before & after index)
├── requirements.txt   # Python dependencies (psycopg2-binary)
└── README.md
```

## Key Takeaway

Without an index, Postgres performs a **full table scan** (O(n)). With a B-Tree index, lookups become **O(log n)** — a massive difference at scale.
