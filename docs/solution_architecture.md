# Solution Architecture

## O\*NET Data

### Overview

O\*NET Data is sourced from a variety of sources, including analytics, interviews of incumbents, and surveys.

The data is then modeled into the [O\*NET Content Model](https://www.onetcenter.org/content.html), which pivots around the Standard Occupational Classification (SOC) code.

#### Standard Occupational Classification

SOCs are organized in a hierarchy of jobs based on the similarity of the work activities they perform. Taking the SOC for Data Scientists (15-2051), that hierarchy looks like this;

```         
15-0000  Computer and Mathematical Occupations   
    15-2000  Mathematical Science Occupations
        15-2040  Statisticians
            15-2041  Statisticians 
        15-2050  Data Scientists
            15-2051  Data Scientists 
                15-2051.00  Data Scientists 
                15-2051.01  Business Intelligence Analysts
                15-2051.02  Clinical Data Managers
```

For our purposes we will consider all occupations under the 15-2051 and 15-2041 SOCs as our scope.

#### Abilities

The Abilities data links SOCs with Abilities, such as "Reading Comprehension". These are broad categorizations of fundamental capabilities relevant to an occupation. The are rated by **Importance**, meaning how critical the ability is to performing the job, and **Level**, or the degree of expertise needed to perform the job.Both are rated from 0 to 6, with 6 being the most important or relevant.

| column_name        | type                   | column_content                                               |
|------------------|------------------|-------------------------------------|
| o_net_soc_code     | Character(10)          | O\*NET-SOC Code (see Occupation Data)                        |
| element_id         | Character Varying(20)  | Content Model Outline Position (see Content Model Reference) |
| element_name       | Character Varying(150) | Content Model Element Name (see Content Model Reference)     |
| scale_id           | Character Varying(3)   | Scale ID (see Scales Reference)                              |
| scale_name         | Character Varying(50)  | Scale Name (see Scales Reference)                            |
| data_value         | Float(5,2)             | Rating associated with the O\*NET-SOC occupation             |
| n                  | Integer(4)             | Sample size                                                  |
| standard_error     | Float(7,4)             | Standard Error                                               |
| lower_ci_bound     | Float(7,4)             | Lower 95% confidence interval bound                          |
| upper_ci_bound     | Float(7,4)             | Upper 95% confidence interval bound                          |
| recommend_suppress | Character(1)           | Low precision indicator (Y=yes, N=no)                        |
| not_relevant       | Character(1)           | Not relevant for the occupation (Y=yes, N=no)                |
| date               | Character(7)           | Date when data was updated                                   |
| domain_source      | Character Varying(30)  | Source of the data                                           |
| soc_name           | Character              | Title of SOC                                                 |

[Additional details](https://www.onetcenter.org/dictionary/29.0/excel/abilities.html)

#### Work Activities

Work activities describe the actual things that are done to get the job done, such as "Getting Information". Work activities are also the way that SOCs are organized and categorized. They are again rated by Level and Importance.

| column_name        | type                   | column_content                                               |
|------------------|------------------|-------------------------------------|
| o_net_soc_code     | Character(10)          | O\*NET-SOC Code (see Occupation Data)                        |
| element_id         | Character Varying(20)  | Content Model Outline Position (see Content Model Reference) |
| element_name       | Character Varying(150) | Content Model Element Name (see Content Model Reference)     |
| scale_id           | Character Varying(3)   | Scale ID (see Scales Reference)                              |
| data_value         | Float(5,2)             | Rating associated with the O\*NET-SOC occupation             |
| n                  | Integer(4)             | Sample size                                                  |
| standard_error     | Float(7,4)             | Standard Error                                               |
| lower_ci_bound     | Float(7,4)             | Lower 95% confidence interval bound                          |
| upper_ci_bound     | Float(7,4)             | Upper 95% confidence interval bound                          |
| recommend_suppress | Character(1)           | Low precision indicator (Y=yes, N=no)                        |
| not_relevant       | Character(1)           | Not relevant for the occupation (Y=yes, N=no)                |
| date               | Character(7)           | Date when data was updated                                   |
| domain_source      | Character Varying(30)  | Source of the data                                           |
| soc_name           | Character              | Title of SOC                                                 |

#### Alternate Titles

These are titles that O\*NET recognizes to be related to a given SOC. This is helpful to join or define occupations outside of the O\*NET data model.

| column_name     | type                   | column_content                                   |
|------------------|------------------|-----------------------------------|
| o_net_soc_code  | Character(10)          | O\*NET-SOC Code (see Occupation Data)            |
| alternate_title | Character Varying(250) | Alternate occupational title                     |
| short_title     | Character Varying(150) | Short version of alternate title (if applicable) |
| sources         | Character Varying(50)  | List of source codes — see below                 |
| soc_name        | Character              | Title of SOC                                     |

#### Education, Experience, and Training

O\*NET also maps data on relevant education and training to a given SOC. The `category` is ranked from 1-11 for all of education, experience, and training, with 11 being equivalent to 10+ years of experience and a Professional / Post-Master's level of education, and 1 representing no experience and less than a high school degree.

See the [Education, Training, and Experience Categories](https://www.onetcenter.org/dictionary/29.0/text/ete_categories.html) for full details.

| column_name        | type                   | column_content                                                                  |
|------------------|------------------|-----------------------------------|
| o_net_soc_code     | Character(10)          | O\*NET-SOC Code (see Occupation Data)                                           |
| title              | Character Varying(150) | O\*NET-SOC Title (see Occupation Data)                                          |
| element_id         | Character Varying(20)  | Content Model Outline Position (see Content Model Reference)                    |
| element_name       | Character Varying(150) | Content Model Element Name (see Content Model Reference)                        |
| scale_id           | Character Varying(3)   | Scale ID (see Scales Reference)                                                 |
| scale_name         | Character Varying(50)  | Scale Name (see Scales Reference)                                               |
| category           | Integer(3)             | Percent frequency category (see Education, Training, and Experience Categories) |
| data_value         | Float(5,2)             | Rating associated with the O\*NET-SOC occupation                                |
| n                  | Integer(4)             | Sample size                                                                     |
| standard_error     | Float(7,4)             | Standard Error                                                                  |
| lower_ci_bound     | Float(7,4)             | Lower 95% confidence interval bound                                             |
| upper_ci_bound     | Float(7,4)             | Upper 95% confidence interval bound                                             |
| recommend_suppress | Character(1)           | Low precision indicator (Y=yes, N=no)                                           |
| date               | Character(7)           | Date when data was updated                                                      |
| domain_source      | Character Varying(30)  | Source of the data                                                              |
| soc_name           | Character              | Title of SOC                                                                    |

#### Knowledge

Knowledge refers to domain knowledge, such as "telecommunications". It is again ranked per occupation by Level and Importance.

| column_name        | type                   | column_content                                               |
|------------------|------------------|-----------------------------------|
| o_net_soc_code     | Character(10)          | O\*NET-SOC Code (see Occupation Data)                        |
| title              | Character Varying(150) | O\*NET-SOC Title (see Occupation Data)                       |
| element_id         | Character Varying(20)  | Content Model Outline Position (see Content Model Reference) |
| element_name       | Character Varying(150) | Content Model Element Name (see Content Model Reference)     |
| scale_id           | Character Varying(3)   | Scale ID (see Scales Reference)                              |
| scale_name         | Character Varying(50)  | Scale Name (see Scales Reference)                            |
| data_value         | Float(5,2)             | Rating associated with the O\*NET-SOC occupation             |
| n                  | Integer(4)             | Sample size                                                  |
| standard_error     | Float(7,4)             | Standard Error                                               |
| lower_ci_bound     | Float(7,4)             | Lower 95% confidence interval bound                          |
| upper_ci_bound     | Float(7,4)             | Upper 95% confidence interval bound                          |
| recommend_suppress | Character(1)           | Low precision indicator (Y=yes, N=no)                        |
| not_relevant       | Character(1)           | Not relevant for the occupation (Y=yes, N=no)                |
| date               | Character(7)           | Date when data was updated                                   |
| domain_source      | Character Varying(30)  | Source of the data                                           |
| soc_name           | Character              | Title of SOC                                                 |

#### Skills

O\*NET skills are generalized and can be learned or taught. This is in contrast to Abilities which are considered more "innate".

Skills are rated by Level and Importance.

| column_name        | type                   | column_content                                               |
|------------------|------------------|-----------------------------------|
| o_net_soc_code     | Character(10)          | O\*NET-SOC Code (see Occupation Data)                        |
| element_id         | Character Varying(20)  | Content Model Outline Position (see Content Model Reference) |
| element_name       | Character Varying(150) | Content Model Element Name (see Content Model Reference)     |
| scale_id           | Character Varying(3)   | Scale ID (see Scales Reference)                              |
| data_value         | Float(5,2)             | Rating associated with the O\*NET-SOC occupation             |
| n                  | Integer(4)             | Sample size                                                  |
| standard_error     | Float(7,4)             | Standard Error                                               |
| lower_ci_bound     | Float(7,4)             | Lower 95% confidence interval bound                          |
| upper_ci_bound     | Float(7,4)             | Upper 95% confidence interval bound                          |
| recommend_suppress | Character(1)           | Low precision indicator (Y=yes, N=no)                        |
| not_relevant       | Character(1)           | Not relevant for the occupation (Y=yes, N=no)                |
| date               | Character(7)           | Date when data was updated                                   |
| domain_source      | Character Varying(30)  | Source of the data                                           |
| soc_name           | Character              | Title of SOC                                                 |

[Additional details](https://www.onetcenter.org/dictionary/29.0/text/skills.html)

#### Technology Skills

Technology skills refer to experience or ability with a specific set of technology tools, from Atlassian's Jira to Apache Airflow.

They are not quantitatively ranked per occupation, but are flagged as "In demand" or "Hot technology" to indicate their qualitative relevance.

| column_name     | type                   | column_content                                                              |
|------------------|------------------|-----------------------------------|
| o_net_soc_code  | Character(10)          | O\*NET-SOC Code (see Occupation Data)                                       |
| example         | Character Varying(150) | Technology skill example                                                    |
| commodity_code  | Integer(8)             | UNSPSC commodity code (see UNSPSC Reference)                                |
| commodity_title | Character Varying(150) | UNSPSC commodity title (see UNSPSC Reference)                               |
| hot_technology  | Character(1)           | Whether example is classified as a hot technology (Y=yes, N=no)             |
| in_demand       | Character(1)           | Whether example is classified as in demand for the occupation (Y=yes, N=no) |
| soc_name        | Character              | Title of SOC                                                                |

[Additional details](https://www.onetcenter.org/dictionary/29.0/text/technology_skills.html)

### Diagram

``` mermaid
---
title: Data Model Diagram
---
erDiagram
    OCCUPATIONS {
        o_net_soc_code Character
        soc_name Character
    }

    activities_df {
        o_net_soc_code Character
        element_id Character
        element_name Character
        scale_id Character
        data_value Float
        n Integer
        standard_error Float
        lower_ci_bound Float
        upper_ci_bound Float
        recommend_suppress Character
        not_relevant Character
        date Character
        domain_source Character
        soc_name Character
    }

    alt_titles_df {
        o_net_soc_code Character
        alternate_title Character
        short_title Character
        sources Character
        soc_name Character
    }

    education_df {
        o_net_soc_code Character
        title Character
        element_id Character
        element_name Character
        scale_id Character
        scale_name Character
        category Integer
        data_value Float
        n Integer
        standard_error Float
        lower_ci_bound Float
        upper_ci_bound Float
        recommend_suppress Character
        date Character
        domain_source Character
        soc_name Character
    }

    knowledge_df {
        o_net_soc_code Character
        title Character
        element_id Character
        element_name Character
        scale_id Character
        scale_name Character
        data_value Float
        n Integer
        standard_error Float
        lower_ci_bound Float
        upper_ci_bound Float
        recommend_suppress Character
        not_relevant Character
        date Character
        domain_source Character
        soc_name Character
    }

    skills_df {
        o_net_soc_code Character
        element_id Character
        element_name Character
        scale_id Character
        data_value Float
        n Integer
        standard_error Float
        lower_ci_bound Float
        upper_ci_bound Float
        recommend_suppress Character
        not_relevant Character
        date Character
        domain_source Character
        soc_name Character
    }

    tech_df {
        o_net_soc_code Character
        example Character
        commodity_code Integer
        commodity_title Character
        hot_technology Character
        in_demand Character
        soc_name Character
    }

    OCCUPATIONS ||--o| activities_df : has
    OCCUPATIONS ||--o| alt_titles_df : has
    OCCUPATIONS ||--o| education_df : has
    OCCUPATIONS ||--o| knowledge_df : has
    OCCUPATIONS ||--o| skills_df : has
    OCCUPATIONS ||--o| tech_df : has
```
