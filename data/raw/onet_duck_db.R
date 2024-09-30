library(DBI)
library(readxl)
library(curl)
library(janitor)
library(duckdb)

# Function to read and clean Excel file from a URL
read_and_clean_excel <- function(url) {
  # Create a temporary file to store the downloaded Excel file
  temp_file <- tempfile(fileext = ".xlsx")
  
  # Download the file from the URL to the temporary file
  curl_download(url, temp_file)
  
  # Read the Excel file and clean column names
  data <- clean_names(read_excel(temp_file))
  
  # Return the cleaned data
  return(data)
}

know_url <- "https://www.onetcenter.org/dl_files/database/db_29_0_excel/Knowledge.xlsx"
knowledge <- read_and_clean_excel(know_url)

skills_url <- "https://www.onetcenter.org/dl_files/database/db_29_0_excel/Skills.xlsx"
skills <- read_and_clean_excel(skills_url)

abil_url <- "https://www.onetcenter.org/dl_files/database/db_29_0_excel/Abilities.xlsx"
abilities <- read_and_clean_excel(abil_url)

# Getting http 403 error using curl, so doing this for now
ep <- clean_names(read_excel("data/raw/us_bol_employment_skills.xlsx", skip = 1))

# Connect to DuckDB
con <- dbConnect(duckdb::duckdb(), "data/raw/onet.db")

# Read and execute the SQL file
dbWriteTable(con, "skills", skills)
dbWriteTable(con, "abilities", abilities)
dbWriteTable(con, "knowledge", knowledge)
dbWriteTable(con, "employment_projections", ep)

# Close the connection
dbDisconnect(con)
