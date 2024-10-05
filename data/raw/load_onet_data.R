library(tidyverse)
library(curl)


load_txt_file <- function(url){

tmp <- tempfile()
  
curl_download(url, tmp)

df <- read_tsv(tmp, show_col_types = FALSE)
  
return(df)
}

knowledge_url <- "https://www.onetcenter.org/dl_files/database/db_29_0_text/Knowledge.txt"
abilities_url <- "https://www.onetcenter.org/dl_files/database/db_29_0_text/Abilities.txt"
skills_url <- "https://www.onetcenter.org/dl_files/database/db_29_0_text/Skills.txt"
education_url <- "https://www.onetcenter.org/dl_files/database/db_29_0_text/Education%2C%20Training%2C%20and%20Experience.txt"
tech_url <- "https://www.onetcenter.org/dl_files/database/db_29_0_text/Technology%20Skills.txt"
activities_url <- "https://www.onetcenter.org/dl_files/database/db_29_0_text/Work%20Activities.txt"
alt_titles_url <- "https://www.onetcenter.org/dl_files/database/db_29_0_text/Alternate%20Titles.txt"

knowledge_df <- load_txt_file(knowledge_url)
abilities_df <- load_txt_file(abilities_url)
skills_df <- load_txt_file(skills_url)
education_df <- load_txt_file(education_url)
tech_df <- load_txt_file(tech_url)
activities_df <- load_txt_file(activities_url)
alt_titles_df <- load_txt_file(alt_titles_url)


print("O*NET Data loaded!")