# DATA 607 Project 3

>Create a short document, with the names of group members. You should briefly describe your collaboration tool(s) you’ll use as a group, including for communication, code sharing, and project documentation. You should have identified your data sources, where the data can be found, and how to load it. And you should have created at least a logical model for your normalized database, and produced an Entity-Relationship (ER) diagram documenting your database design.

## Overview

See [project_assignment.pdf](docs/project_assignment.pdf)

See our [Ask Issue](https://github.com/kevinhav/DATA607_project_3/issues/1) for the latest project summary

## Project Team

**Team Name: <TBD>**

- Kevin Havis [kevinhav](https://github.com/kevinhav/)
- Kim Koon [koonkimb](https://github.com/koonkimb)
- Matthew Tillmawitz [Tillmawitz](https://github.com/Tillmawitz)

## Collaboration Tools

We will leverage GitHub and GitHub Projects through this project to share code, track progress, and coordinate on deliverables.

### GitHub

We will work out of a shared repository with a common organization (see Repo Directory). Our branching strategy will be to create individual branches, periodically reviewing and then merging to the main branch. We will use industry standard GitHub practices to share code and maintain proper version control.

### GitHub Projects

To keep track of our progress, we will create a GitHub project. This project will use a lightweight version of the [Data Science Lifecycle Process](https://github.com/dslp/dslp) as a framework.

This framework divides the project into phases; Ask, Data, Exploration, Experimentation, and Modeling. The framework emphasizes documenting the process at each stage, creating an audit trail.

We will use templated GitHub issues to track out work at each phase. These will be submitted along with our repo as part of our project submission.

### Communication

We will use Slack as our primary method of direct communication. We will schedule a weekly standup to monitor our progress and check in with each other.

### Project Documentation

As mentioned above, we will raise GitHub issues as templated documents for each stage of the project. This will record decisions made, questions answered, and overall serve as an audit to our thought process.

## Data Sources

We have identified three main sources of data for our project;

### Stackoverflow - Market salaries and job posting descriptions

Every year Stack Overflow conducts a survey of users of their products. This survey recruits respondents through various outreach channels including blog posts, onsite ads, and social media posts and is considered on of the best sources of information on tech jobs and trends due to the high engagement of tech workers with their products. 

We will use this data to cross reference salaries and skills in specific tech stacks, which we will tie back to data science via O\*NET Occupational Data (see below)


### Trends of self-paced learning resources

LinkedIn Learning is a skill development platform that offers online professional development courses. We will use information on course offerings to better understand where people are looking to "upskill" and compare that to skills used by incumbent data scientists using O\*NET data


### O*Net Occupational Data

The O*NET database includes information on skills, abilities, knowledges, work activities, and interests associated with occupations. This information can be used to facilitate career exploration, vocational counseling, and a variety of human resources functions, such as developing job orders and position descriptions and aligning training with current workplace needs. 

We will use the below O*NET data to form the baseline of our analysis; this data will help us define the occupation of a data scientist and the relevant skills, which we will then enrich with additional data to determine trends, the relative values of skills, and any future projections we'd like to estimate.

- Skills
- Abilities
- Work Activities
- Education
- Knowledge
- Technology Skills
- Alternate Titles

[National Labor Data on Skills](https://www.bls.gov/emp/data/skills-data.htm)
[O*NET Data Files](https://www.onetcenter.org/database.html#individual-files)

## Data Dictionary & ER Diagram

See [solution_architecture.md](https://github.com/kevinhav/DATA607_project_3/blob/main/docs/solution_architecture.md)

## Directory Structure

```
├── README.md
├── code
│   ├── datasets                    # Scripts to generate and/or clean datasets
│   ├── features                    # Scripts to generate features
│   └── models                      # Scripts to train / test models
├── data
│   ├── raw                         # Raw data as directly downloaded or sourced from code in /code/datasets
│   ├── iterim                      # Data that has not yet been fully processed
│   ├── processed                   # Fully processed data, ready for modeling
├── docs
│   ├── code                        # Documentation on code, likely not ot be used
│   ├── data                        # Data dictionaries, descriptions on the datasets
│   ├── media        
│   ├── project_assignment.pdf
│   ├── references                  # Reference to articles, papers, etc.
│   └── solution_architecture.md    # Entity relationship diagram
└── notebooks                       # Markdown files for presentation & publication
```
