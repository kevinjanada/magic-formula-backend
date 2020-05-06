CREATE TABLE statement_rows (
    id uuid PRIMARY KEY,
    statement_id uuid REFERENCES statements(id),
    statement_row_title_id uuid REFERENCES statement_row_titles(id),
    "order" INT,
    description VARCHAR,
    properties VARCHAR,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
)