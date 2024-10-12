
# Load raw data
source('data/raw/load_onet_data.R')
source('data/raw/load_onet_historical_data.R')


# Occupations of interest
soc_ids = c("15-2051",     # data science
            "15-2051.00",  # also data science
            "15-2041.00",  # statistician
            "15-2051.01",  # BI analyst
            "15-2051.02"   # Clinical data manager
            )

# Clean names
skills_df <- janitor::clean_names(skills_df)
abilities_df <- janitor::clean_names(abilities_df)
activities_df <- janitor::clean_names(activities_df)
alt_titles_df <- janitor::clean_names(alt_titles_df)
education_df <- janitor::clean_names(education_df)
knowledge_df <- janitor::clean_names(knowledge_df)
tech_df <- janitor::clean_names(tech_df)


# Filter for occupations of interest
label_filter_soc <- function(data, soc_code = o_net_soc_code, soc_ids = soc_ids){
  
  data |> 
    filter({{soc_code}} %in% soc_ids) |> 
    mutate(soc_name = case_when(
      {{soc_code}} == "15-2051"    ~ "data_scientist",
      {{soc_code}} == "15-2051.00" ~ "data_scientist",
      {{soc_code}} == "15-2041.00" ~ "statistician",
      {{soc_code}} == "15-2051.01" ~ "business_intelligence_analyst",
      {{soc_code}} == "15-2051.02" ~ "clinical_data_manager",
      TRUE                           ~ NA_character_
    ))
}


# Filter dataframes
abilities_df <- label_filter_soc(abilities_df, o_net_soc_code, soc_ids)
activities_df <- label_filter_soc(activities_df, o_net_soc_code, soc_ids)
alt_titles_df <- label_filter_soc(alt_titles_df, o_net_soc_code, soc_ids)
education_df <- label_filter_soc(education_df, o_net_soc_code, soc_ids)
knowledge_df <- label_filter_soc(knowledge_df, o_net_soc_code, soc_ids)
tech_df <- label_filter_soc(tech_df, o_net_soc_code, soc_ids)

print("Filtered & pre-processed O*NET data loaded!")
