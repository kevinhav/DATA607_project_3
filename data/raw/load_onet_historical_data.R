library(tidyverse)
library(curl)

url_2023 <- "https://www.onetcenter.org/dl_files/database/db_28_0_text.zip"
url_2022 <- "https://www.onetcenter.org/dl_files/database/db_27_0_text.zip"
url_2021 <- "https://www.onetcenter.org/dl_files/database/db_26_0_text.zip"
url_2020 <- "https://www.onetcenter.org/dl_files/database/db_24_0_text.zip"


# Create a temporary file to store the downloaded zip
tmp_zip <- tempfile(fileext = ".zip")

# Download the zip file using curl
curl_download(url_202, tmp_zip)

# Unzip the file into a temporary directory
tmp_dir <- tempfile()
unzip(tmp_zip, exdir = tmp_dir)

# Find the unzipped file (assuming there's only one file)
tsv_file <- list.files(tmp_dir, full.names = TRUE, recursive = TRUE)

tech_file <- tsv_file[34]

txt <- read_tsv(tech_file)

# Read the TSV file
df <- read_tsv(tsv_file, show_col_types = FALSE)

# Clean up: remove temp files
unlink(tmp_zip)
unlink(tmp_dir, recursive = TRUE)


df <- load_txt_file(url)
