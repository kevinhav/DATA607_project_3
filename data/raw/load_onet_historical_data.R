library(tidyverse)
library(curl)

# Function to download, unzip, and read specific TSV files from a zip
load_and_combine_tsv <- function(urls) {
  
  # Function to download and load data from a single zip file
  load_single_zip <- function(url) {
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
    tech <- read_tsv(tsv_files[34], show_col_types = FALSE)
    skills <- read_tsv(tsv_files[28], show_col_types = FALSE)
    abilities <- read_tsv(tsv_files[3], show_col_types = FALSE)
    knowledge <- read_tsv(tsv_files[17], show_col_types = FALSE)
    education <- read_tsv(tsv_files[9], show_col_types = FALSE)
    activities <- read_tsv(tsv_files[37], show_col_types = FALSE)
    
    # Clean up temporary files
    unlink(tmp_zip)
    unlink(tmp_dir, recursive = TRUE)
    
    # Return a list of data frames
    list(
      tech = tech,
      skills = skills,
      abilities = abilities,
      knowledge = knowledge,
      education = education,
      activities = activities
    )
  }
  
  # Apply the function over all URLs and combine data
  combined_data <- urls %>%
    map(load_single_zip) %>%
    reduce(function(x, y) {
      map2(x, y, bind_rows)
    })
  
  return(combined_data)
}

# Example usage with multiple URLs
historical_urls <- c(
  "https://www.onetcenter.org/dl_files/database/db_28_0_text.zip",
  "https://www.onetcenter.org/dl_files/database/db_27_0_text.zip"
)

# Load and combine the data
onet_historical <- load_and_combine_tsv(historical_urls)


print("Historical ONET data loaded")




