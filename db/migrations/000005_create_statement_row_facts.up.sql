CREATE TABLE statement_row_facts (
    id uuid PRIMARY KEY,
    statement_row_id uuid REFERENCES statement_rows(id),
    stock_id uuid REFERENCES stocks(id),
    date TIMESTAMP,
    amount decimal,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
)