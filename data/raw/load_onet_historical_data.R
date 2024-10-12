library(tidyverse)
library(curl)

url_2024 =  "https://www.onetcenter.org/dl_files/database/db_29_0_text.zip"
url_2023 =  "https://www.onetcenter.org/dl_files/database/db_28_0_text.zip"
url_2022 = "https://www.onetcenter.org/dl_files/database/db_27_0_text.zip"

extract_year <- function(url) {
  case_when(
    str_detect(url, "db_29_") ~ 2024,
    str_detect(url, "db_28_") ~ 2023,
    str_detect(url, "db_27_") ~ 2022,
    TRUE ~ NA_real_  # Default in case no match
  )
}

load_historical_onet <- function(url){  
  
  year <- extract_year(url)
  
  # Create a temporary file for the zip
  tmp_zip <- tempfile(fileext = ".zip")
  
  # Download the zip file
  curl_download(url, tmp_zip)
  
  # Unzip into a temporary directory
  tmp_dir <- tempfile()
  unzip(tmp_zip, exdir = tmp_dir)
  
  # List all TSV files in the unzipped directory
  tsv_files <- list.files(tmp_dir, full.names = TRUE, recursive = TRUE)
  
  # Pattern matching to find relevant TSV files dynamically
  tech <- read_tsv(tsv_files[34],  show_col_types = FALSE) |> 
    clean_names()
  skills <- read_tsv(tsv_files[28],  show_col_types = FALSE)|> 
    clean_names()
  abilities <- read_tsv(tsv_files[3],  show_col_types = FALSE)|> 
    clean_names()
  knowledge <- read_tsv(tsv_files[17], show_col_types = FALSE)|> 
    clean_names()
  education <- read_tsv(tsv_files[9],  show_col_types = FALSE)|> 
    clean_names()
  activities <- read_tsv(tsv_files[37],  show_col_types = FALSE)|> 
    clean_names()
  
  
  onet <- list(
    tech = tech,
    skills = skills,
    abilities = abilities,
    knowledge = knowledge,
    education = education,
    activities = activities
  )  
  return(onet)
  
}

onet_24 <- load_historical_onet(url_2024)
onet_23 <- load_historical_onet(url_2023)
onet_22 <- load_historical_onet(url_2022)

combine_onet_element <- function(element_name, ...) {
  onet_lists <- list(...)
  
  # Extract the specified element from each list and bind them together
  combined <- onet_lists |>
    map(~ .x[[element_name]]) |>
    bind_rows(.id = "year")
  
  return(combined)
}

# Example: Combine the 'tech' data from all years
combined_tech <- combine_onet_element("tech", onet_24, onet_23, onet_22)

