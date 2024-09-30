# DATA 607 Project 3

>Create a short document, with the names of group members. You should briefly describe your collaboration tool(s) you’ll use as a group, including for communication, code sharing, and project documentation. You should have identified your data sources, where the data can be found, and how to load it. And you should have created at least a logical model for your normalized database, and produced an Entity-Relationship (ER) diagram documenting your database design.

## Assignment

See [project_assignment.pdf](docs/project_assignment.pdf)

## Project Team

**Team Name: <TBD>**

- Kevin Havis [kevinhav](https://github.com/kevinhav/)
- Kim Koon [koonkimb](https://github.com/koonkimb)
- Matthew Tillmawitz [Tillmawitz](https://github.com/Tillmawitz)

## Collaboration Tools

We will leverage GitHub and GitHub projects through this project.

### GitHub

We will work out of a shared repository with a common organization (see Repo Directory). Our branching strategy will be to create individual branches, periodically reviewing and then merging to the main branch. We will use industry standard GitHub practices to share code and maintain proper version control.

### GitHub Projects

To keep track of our progress, we will create a GitHub project. This project will use a minimal version of the [Data Science Lifecycle Process](https://github.com/dslp/dslp) as a framework.

This framework divides the project into phases; Ask, Data, Exploration, Experimentation, and Modeling. The framework emphasizes documenting the process at each stage, creating an audit trail.

We will use templated GitHub issues to track out work at each phase. These will be submitted along with our repo as part of our project submission.

### Communication

We will use Slack as our primary method of direct communication. We will schedule a weekly standup to monitor our progress and check in with each other.

### Project Documentation

As mentioned above, we will raise GitHub issues as templated documents for each stage of the project. This will record decisions made, questions answered, and overall serve as an audit to our thought process.

## Data Sources

We have identified three main sources of data for our project

### Market salaries and job posting descriptions

- Colarado / Washington / Colarado / New York must post salaries
    - Salary expectations
    - Use salary as a metric vs the skills listed in the job descriptions
    - Scraping Indeed.com, Monster, etc.

### Trends of self-paced learning resources

- Online courses - what courses are most popular?
    - Web scraping
        - LinkedIn Learning
        - Coursera
        - Degreed / Udemy
        - Rate of popularity?

### National labor data

[National Labor Data on Skills](https://www.bls.gov/emp/data/skills-data.htm)
[O*NET Data Files](https://www.onetcenter.org/database.html#individual-files)

## ER Diagram

See [solution_architecture.md](docs/solution_architecture.md)

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
