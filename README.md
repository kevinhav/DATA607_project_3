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

## ER Diagram

See [solution_architecture.md](docs/solution_architecture.md)

## Directory Structure

```
├── .cloud              # for storing cloud configuration files and templates (e.g. ARM, Terraform, etc)
├── .github
│   ├── ISSUE_TEMPLATE
│   │   ├── Ask.md
│   │   ├── Data.Aquisition.md
│   │   ├── Data.Create.md
│   │   ├── Experiment.md
│   │   ├── Explore.md
│   │   └── Model.md
│   ├── labels.yaml
│   └── workflows
├── .gitignore
├── README.md
├── code
│   ├── datasets        # code for creating or getting datasets
│   ├── deployment      # code for deploying models
│   ├── features        # code for creating features
│   └── models          # code for building and training models
├── data                # directory is for consistent data placement. contents are gitignored by default.
│   ├── README.md
│   ├── interim         # storing intermediate results (mostly for debugging)
│   ├── processed       # storing transformed data used for reporting, modeling, etc
│   └── raw             # storing raw data to use as inputs to rest of pipeline
├── docs
│   ├── code            # documenting everything in the code directory (could be sphinx project for example)
│   ├── data            # documenting datasets, data profiles, behaviors, column definitions, etc
│   ├── media           # storing images, videos, etc, needed for docs.
│   ├── references      # for collecting and documenting external resources relevant to the project
│   └── solution_architecture.md    # describe and diagram solution design and architecture
├── environments
├── notebooks
├── pipelines           # for pipeline orchestrators i.e. AzureML Pipelines, Airflow, Luigi, etc.
├── setup.py            # if using python, for finding all the packages inside of code.
└── tests               # for testing your code, data, and outputs
    ├── data_validation
    └── unit
```
