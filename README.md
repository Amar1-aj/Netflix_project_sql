# Netflix_project_sql

![Netflix logo](https://github.com/Amar1-aj/Netflix_project_sql/blob/main/logo.png)

📊 Netflix Data Analysis Using SQL
📌 Overview
This project performs an in-depth data analysis of Netflix content using PostgreSQL. By running a series of SQL queries on a structured dataset, we explore trends, content distribution, viewer preferences, and key business insights. The analysis helps in answering various strategic and operational questions that could assist content providers, data analysts, and decision-makers at Netflix or similar OTT platforms.

🎯 Objectives
The main objectives of this project are:

To explore the distribution of content types (Movies vs. TV Shows).

To find the most common ratings and content categories.

To analyze content trends across countries and years.

To identify top-performing actors, directors, and genres.

To classify content based on themes like violence or crime.

To derive business insights from structured data for better content strategy.

A total of 15 business questions have been addressed using optimized SQL queries, ranging from simple filtering to complex aggregations and window functions.

📁 Dataset
The dataset used in this project is a Netflix content catalog. It includes metadata about movies and TV shows available on the platform.

Source: Netflix dataset (from Kaggle)
Size: ~7,800+ rows
Format: CSV (converted into a PostgreSQL table)

🗂️ SQL Schema (DDL)

DROP TABLE IF EXISTS netflix;

CREATE TABLE netflix (
    show_id VARCHAR(5),
    type VARCHAR(10),
    title VARCHAR(250),
    director VARCHAR(550),
    casts VARCHAR(1050),
    country VARCHAR(550),
    date_added VARCHAR(55),
    release_year INT,
    rating VARCHAR(55),
    duration VARCHAR(15),
    listed_in VARCHAR(250),
    description VARCHAR(550)
);

🧠 Topics Covered
The queries address questions such as:

Movie vs TV Show count

Most common ratings

Top producing countries

Longest movie duration

Year-wise additions

Director- and actor-specific content

Genre-based distribution

Sentiment tagging via description keywords

🛠️ Technologies Used
SQL (PostgreSQL dialect)

DB Tool: pgAdmin / DBeaver / PostgreSQL CLI

Data Source: Kaggle (Netflix Dataset)

Platform: Local PostgreSQL instance

✅ How to Use
Clone the repository.

Import the dataset into your PostgreSQL database.

Run the SQL script provided in netflix_analysis.sql.

Modify or extend the queries for deeper exploration.

📬 Contact
For questions, suggestions, or contributions, feel free to open an issue or reach out via GitHub.

Let me know if you'd like me to generate a netflix_analysis.sql file too for the repository!
