import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq

csv_path = "/Users/matttillman/School/DATA607_project_3/data/raw/stack-overflow-developer-survey-2024/survey_results_public.csv"
parquet_write_path = "/Users/matttillman/School/DATA607_project_3/data/raw/stack-overflow-developer-survey-2024/survey_results_public.parquet"

df = pd.read_csv(csv_path)
table = pa.Table.from_pandas(df)
pq.write_table(table, parquet_write_path)