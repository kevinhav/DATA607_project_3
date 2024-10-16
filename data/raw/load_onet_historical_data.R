library(tidyverse)
library(curl)
library(janitor)

# URLs for each set of ONET data
url_2024 =  "https://www.onetcenter.org/dl_files/database/db_29_0_text.zip"
url_2022 = "https://www.onetcenter.org/dl_files/database/db_27_0_text.zip"

# Not using, has same data as db_29
# url_2023 =  "https://www.onetcenter.org/dl_files/database/db_28_0_text.zip"


# Occupations of interest
soc_ids = c("15-2051",     # data science
            "15-2051.00",  # also data science
            "15-2041.00",  # statistician
            "15-2051.01",  # BI analyst
            "15-2051.02"   # Clinical data manager
)

# Filter, clean, and add SOC names to each dataframe
preprocess <- function(data){
  
  data |> 
    clean_names() |> 
    filter(o_net_soc_code %in% soc_ids) |> 
    mutate(soc_name = case_when(
      o_net_soc_code == "15-2051"    ~ "data_scientist",
      o_net_soc_code == "15-2051.00" ~ "data_scientist",
      o_net_soc_code == "15-2041.00" ~ "statistician",
      o_net_soc_code == "15-2051.01" ~ "business_intelligence_analyst",
      o_net_soc_code == "15-2051.02" ~ "clinical_data_manager",
      TRUE                           ~ NA_character_
    ))
  
}


load_historical_onet <- function(url){  

  # Create a temporary file for the zip
  tmp_zip <- tempfile(fileext = ".zip")
  
  # Download the zip file from the url
  curl_download(url, tmp_zip)
  
  # Unzip into a temporary directory
  tmp_dir <- tempfile()
  unzip(tmp_zip, exdir = tmp_dir)
  
  # List all TSV files in the unzipped directory
  tsv_files <- list.files(tmp_dir, full.names = TRUE, recursive = TRUE)
  
  # Specify the file path for each dataset
  tech_path <- tsv_files[basename(tsv_files) == "Technology Skills.txt"]
  skills_path <- tsv_files[basename(tsv_files) == "Skills.txt"]
  abilities_path <- tsv_files[basename(tsv_files) == "Abilities.txt"]
  knowledge_path <- tsv_files[basename(tsv_files) == "Knowledge.txt"]
  education_path <- tsv_files[basename(tsv_files) == "Education, Training, and Experience.txt"]
  activities_path <- tsv_files[basename(tsv_files) == "Work Activities.txt"]
  
  
  # Get each data set we are interested in and preprocess
  tech <- read_tsv(tech_path,  show_col_types = FALSE) |> 
    preprocess()
  
  skills <- read_tsv(skills_path,  show_col_types = FALSE)|> 
    preprocess()
  
  abilities <- read_tsv(abilities_path,  show_col_types = FALSE)|> 
    preprocess()
    
  knowledge <- read_tsv(knowledge_path, show_col_types = FALSE)|> 
    preprocess()
  
  education <- read_tsv(education_path,  show_col_types = FALSE)|> 
    preprocess()
  
  activities <- read_tsv(activities_path,  show_col_types = FALSE)|> 
    preprocess()
  
  # Combine into a list of dataframes
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

# Load each years' data
onet_24 <- load_historical_onet(url_2024)
onet_22 <- load_historical_onet(url_2022)
