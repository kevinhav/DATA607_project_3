import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq

csv_path = "/Users/matttillman/Downloads/Motor_Vehicle_Collisions_-_Crashes_20241018.csv"
parquet_write_path = "/Users/matttillman/Downloads/Motor_Vehicle_Collisions_-_Crashes_20241018.parquet"

df = pd.read_csv(csv_path, low_memory=False)
table = pa.Table.from_pandas(df)
pq.write_table(table, parquet_write_path)