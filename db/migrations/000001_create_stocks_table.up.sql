CREATE TABLE stocks (
    id uuid PRIMARY KEY,
    code VARCHAR,
    name VARCHAR,
    listing_date TIMESTAMP,
    shares bigint,
    listing_board VARCHAR,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);
