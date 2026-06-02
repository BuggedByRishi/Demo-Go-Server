# Tally Database Loader - PostgreSQL Setup Guide

## Objective

Configure and run the Tally Database Loader utility to export data from Tally Prime and import it into a PostgreSQL database.

---

# Prerequisites

Ensure the following are installed:

* PostgreSQL
* pgAdmin
* Tally Prime
* Node.js (if running the utility manually)

---

# Project Structure

```text
Utility/
│
├── config.json
├── database-structure.sql
├── tally-export-config.yaml
├── run.bat
├── run-gui.bat
│
└── dist/
    ├── index.mjs
    ├── database.mjs
    ├── tally.mjs
    └── ...
```

---

# Step 1: Create PostgreSQL Database

Open pgAdmin and create a database.

```sql
CREATE DATABASE tallydb;
```

---

# Step 2: Create Required Tables

Open the Query Tool in pgAdmin.

Execute:

```sql
database-structure.sql
```

This creates all tables required by the utility.

---

# Step 3: Configure Utility

Edit `config.json`.

Example PostgreSQL configuration:

```json
{
  "database": {
    "technology": "postgres",
    "server": "localhost",
    "port": 5432,
    "schema": "tallydb",
    "username": "postgres",
    "password": "your_password",
    "loadmethod": "insert"
  },
  "tally": {
    "definition": "tally-export-config.yaml",
    "server": "localhost",
    "port": 9000,
    "fromdate": "auto",
    "todate": "auto",
    "sync": "full",
    "batchsize": 5000,
    "frequency": 0,
    "company": ""
  }
}
```

---

# Step 4: Copy Configuration Files

The utility reads files from the `dist` folder.

Copy:

```text
config.json
tally-export-config.yaml
```

to:

```text
Utility/dist/
```

---

# Step 5: Configure Tally Prime

Open Tally Prime.

Navigate to:

```text
F1 → Settings → Connectivity
```

Enable:

```text
Enable HTTP Server = Both
Port = 9000
```

Ensure the company to be exported is open.

---

# Step 6: Run Utility

Open PowerShell.

Navigate to:

```powershell
cd C:\Utility\dist
```

Run:

```powershell
node index.mjs
```

---

# Step 7: Verify Import

Successful execution produces output similar to:

```text
Generating CSV files from Tally
Loading CSV files to database tables

mst_group: imported 28 rows
mst_ledger: imported 2 rows
mst_vouchertype: imported 24 rows

Import completed successfully
```

---

# Step 8: Verify Data in PostgreSQL

Example queries:

```sql
SELECT COUNT(*) FROM mst_group;
```

```sql
SELECT COUNT(*) FROM mst_ledger;
```

```sql
SELECT COUNT(*) FROM mst_vouchertype;
```

---

# Understanding Empty Tables

Some tables may show:

```text
imported 0 rows
```

This is expected if the corresponding data does not exist in Tally.

Examples:

| Table          | Required Tally Data     |
| -------------- | ----------------------- |
| mst_stock_item | Stock Items             |
| trn_voucher    | Sales/Purchase Vouchers |
| trn_inventory  | Inventory Transactions  |
| trn_bill       | Bills                   |
| mst_employee   | Employees               |

---

# Sample Data to Create in Tally

For complete testing create:

## Masters

* Cash Ledger
* Bank Ledger
* Sales Ledger
* Purchase Ledger
* Customer Ledger
* Supplier Ledger

## Inventory

* Unit of Measure
* Godown
* Stock Group
* Stock Category
* Stock Items

## Transactions

* Purchase Voucher
* Sales Voucher
* Receipt Voucher
* Payment Voucher
* Journal Voucher

After creating these records, rerun:

```powershell
node index.mjs
```

Additional tables will be populated automatically.

---