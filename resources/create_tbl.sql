CREATE TABLE iceberg.raw.demo_public_products (
   before ROW(product_id varchar, title varchar, category varchar, price_usd double, updated_at varchar),
   after ROW(product_id varchar, title varchar, category varchar, price_usd double, updated_at varchar),
   source ROW(version varchar, connector varchar, name varchar, ts_ms bigint, snapshot varchar, db varchar, sequence varchar, schema varchar, "table" varchar, txid bigint, lsn bigint, xmin bigint) NOT NULL,
   op varchar NOT NULL,
   ts_ms bigint,
   transaction ROW(id varchar, total_order bigint, data_collection_order bigint),
   kafka_offset bigint,
   kafka_partition integer,
   kafka_ts_ms timestamp(6) with time zone
)
WITH (
   compression_codec = 'ZSTD',
   format = 'PARQUET',
   format_version = 2,
   location = 's3a://iceberg/warehouse/raw.db/demo_public_products',
   partitioning = ARRAY['day(kafka_ts_ms)']
)

