-- DuckDB query to study the size of columns/row groups in a generated parquet file
SELECT
  row_group_id as rg,
  row_group_num_rows as records,
  row_group_bytes as size,
  column_id,
  path_in_schema as column,
  type,
  compression,
  encodings,
  index_page_offset as index_page,
  dictionary_page_offset as dict_page,
  data_page_offset as data_page,
  total_compressed_size as compressed,
  total_uncompressed_size as uncompressed, stats_min, stats_max
FROM parquet_metadata('output.parquet')