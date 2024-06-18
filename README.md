# Introduction
Dive into the data job market! Focusing on data analyst roles, this project explores top paying jobs, in demand skills, and where high demand meets high salary in data analytics.

SQL queries? Check them out here: 
[https://github.com/pythonsnatcher/sql_project_data_job_analysis/tree/main]()


# Background
Driven by a quest to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others' work to find optimal jobs.


### The questions I wanted to answer through my SQL queries were:
1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the optimal skills to learn?

# Tools I Used

For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- SQL: the backbone of my analysis, allowing me to query the database and unearth critical insights.
- PostgreSQL: the chosen database management system, ideal for handling the job posting data.
- Visual Studio Code: my go-to for database management and executing SQL queries.
- Git and GitHub: essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.



# The Analysis

### 1. Top Paying Data Analyst Jobs

To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high-paying opportunities in the field.


```sql
SELECT
    job_id,
    job_title,
    job_location,
    Job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name
FROM
    job_postings_fact
    left JOIN company_dim on company_dim.company_id = job_postings_fact.company_id
where
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg is not NULL
order BY
    salary_year_avg DESC
limit
    10
```

Top Salaries:

A Data Analyst role at Mantys offered the highest salary of $650,000.
Director of Analytics at Meta and Associate Director- Data Insights at AT&T offered $336,500 and $255,829.5 respectively.
Specializations and Remote Work:

Roles like Data Analyst, Marketing at Pinterest and Data Analyst (Hybrid/Remote) at Uclahealthcareers highlighted specialization and remote work options.
Principal Data Analyst (Remote) at SmartAsset and Director, Data Analyst - HYBRID at Inclusively underscored the trend towards remote roles.
Salary Range and Posting Dates:

Salaries ranged widely, with positions such as ERM Data Analyst at Get It Recruit offering $184,000.
Job postings spanned the year, indicating consistent demand throughout 2023.


### 2. Top Paying Job Skills

To identify the most lucrative skills in data analyst positions, I analyzed roles based on average yearly salary and associated skills. This query highlights skills that command high salaries in the field.


```sql

with top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg ,
        name
    FROM
        job_postings_fact
        left JOIN company_dim on company_dim.company_id = job_postings_fact.company_id
    where
        job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg is not NULL
    order BY
        salary_year_avg DESC
    limit
        10
)

select top_paying_jobs.*,
skills
from top_paying_jobs
inner join skills_job_dim on skills_job_dim.job_id = top_paying_jobs.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC
```
Common Skills: SQL, Python, R, Tableau, and Excel are frequently required skills.

High-Paying Skills: Azure, AWS, Databricks, Power BI, Snowflake, Pandas, and Git are associated with top salaries.

Companies: AT&T, Pinterest Job Advertisements, Uclahealthcareers, SmartAsset, Inclusively, and Motional are prominent.

Salary Range: Positions range from $184,000 to $255,829.5 annually.

Roles: Titles include Associate Director, Principal Data Analyst, and Director.

Understanding these points helps tailor skills for better career prospects in data analysis.


### 3 Top Demanded Skills
I've examined data analyst roles by average yearly salary and their respective skills to highlight the most sought-after skills in the field. This query identifies skills that are in high demand among employers.

```sql
select
    count(skills_job_dim.job_id) as demand_count,
    skills
from
    job_postings_fact
    inner join skills_job_dim on skills_job_dim.job_id = job_postings_fact.job_id
    inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where
    job_title_short = 'Data Analyst' AND job_location = 'Anywhere'
group BY
    skills
order by
    demand_count desc
limit
    5;
```

| demand_count | skills   |
|--------------|----------|
| 7291         | sql      |
| 4611         | excel    |
| 4330         | python   |
| 3745         | tableau  |
| 2609         | power bi |




Based on the data analyzed, SQL emerges as the most in-demand skill, mentioned 7291 times, underscoring its foundational role in data analysis. Excel follows closely behind with 4611 mentions, highlighting its widespread usage. Python is highly sought after with 4330 mentions, demonstrating its critical role in data analysis and scripting. Tableau is noted 3745 times, indicating its importance in data visualization. Power BI is also significant, mentioned 2609 times, suggesting its growing importance in data analysis and reporting. These insights reveal SQL's foundational status, Excel's ubiquitous use, Python and Tableau's essential roles in analysis and visualization, and the growing importance of Power BI in data analytics.


### 4. Top Paying Skills
To pinpoint the most lucrative skills for Data Analysts, I filtered positions by average yearly salary and remote work availability. This query emphasizes the skills that yield high pay in the field.

```sql
select
    skills,
    round(avg(salary_year_avg), 0) as avg_salary
from
    job_postings_fact
    inner join skills_job_dim on skills_job_dim.job_id = job_postings_fact.job_id
    inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where
    job_title_short = 'Data Analyst'
    and salary_year_avg is not NULL
    and job_location = 'Anywhere'
group by
    skills
order by
    avg_salary desc
limit
    25;
```

| Skills         | Avg Salary |
|----------------|------------|
| pyspark        | 208172     |
| bitbucket      | 189155     |
| couchbase      | 160515     |
| watson         | 160515     |
| datarobot      | 155486     |
| gitlab         | 154500     |
| swift          | 153750     |
| jupyter        | 152777     |
| pandas         | 151821     |
| elasticsearch | 145000     |
| golang         | 145000     |
| numpy          | 143513     |
| databricks     | 141907     |
| linux          | 136508     |
| kubernetes     | 132500     |
| atlassian      | 131162     |
| twilio         | 127000     |
| airflow        | 126103     |
| scikit-learn   | 125781     |
| jenkins        | 125436     |
| notion         | 125000     |
| scala          | 124903     |
| postgresql     | 123879     |
| gcp            | 122500     |
| microstrategy  | 121619     |


Here’s a closer look at the average salaries associated with some of the most sought-after skills in today’s job market. PySpark leads the pack with an impressive average salary of $208,172, highlighting its critical role in data processing and analysis. Following closely, Bitbucket and Couchbase both offer substantial compensation, with average salaries of $189,155 and $160,515 respectively, underscoring their importance in software development and database management. Similarly, Watson and DataRobot command competitive average salaries of $160,515 and $155,486, emphasizing their significant demand and value in cutting-edge technological applications. These skills not only meet high demand but also provide attractive financial rewards, making them pivotal choices for professionals aiming to thrive in the evolving job landscape.

### 5. Optimal Skills
To identify the most optimal skills, I analyzed roles based on both high salary and demand in remote job opportunities. This query highlights skills that are both highly lucrative and in high demand across various fields.

```sql
select
    skills_dim.skill_id,
    skills_dim.skills,
    count(skills_job_dim.job_id) as demand_count,
    round(avg(salary_year_avg), 0) as avg_salary
from
    job_postings_fact
    inner join skills_job_dim on skills_job_dim.job_id = job_postings_fact.job_id
    inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where
    job_work_from_home = true
    and salary_year_avg is not null
group by
    skills_dim.skill_id, skills_dim.skills
having
    count(skills_job_dim.job_id) > 10
order by
    avg_salary desc,
    demand_count desc
limit
    25;
```

| Skills       | Demand Count | Avg Salary |
|--------------|--------------|------------|
| Go           | 27           | $115,320   |
| Confluence   | 11           | $114,210   |
| Hadoop       | 22           | $113,193   |
| Snowflake    | 37           | $112,948   |
| Azure        | 34           | $111,225   |
| BigQuery     | 13           | $109,654   |
| AWS          | 32           | $108,317   |
| Java         | 17           | $106,906   |
| SSIS         | 12           | $106,683   |
| JIRA         | 20           | $104,918   |

Based on the data provided, several skills emerge as highly sought-after and lucrative in the field of data analysis, particularly in remote roles. Skills such as Go, Confluence, and Hadoop stand out with notable demand counts and high average salaries, indicating their critical importance and market value. Cloud platforms like Snowflake, Azure, and AWS also demonstrate strong demand coupled with competitive salaries, highlighting their pivotal role in modern data environments. Additionally, Java and JIRA showcase that proficiency in specific programming languages and project management tools can lead to lucrative opportunities in data analysis. These insights underscore the strategic advantage of acquiring these skills, aligning career aspirations with high-demand areas in the data analytics field.









# What I Learned

Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:
- **Complex query crafting:** Mastered the art of advanced SQL, merging tables like a pro and wielding WITH clauses for ninja-level temp table maneuvers. 🚀
- **Data aggregation:** Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing sidekicks. 📊
- **Analytical Wizardry:** Leveled up on my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries. 🔍

# Conclusions

## Insights

From the analysis, several general insights emerged:
1. Top-Paying Data Analyst Jobs: The highest-paying jobs for data analysts that allow remote work offer a wide range of salaries, the highest at $650,000!
2. Skills for Top-Paying Jobs: High-paying data analyst jobs require advanced proficiency in SQL, suggesting it's a critical skill for earning a top salary.
3. Most In-Demand Skills: SQL is also the most demanded skill in the data analyst job market, thus making it essential for job seekers.
4. Skills with Higher Salaries: Specialized skills, such as SVN and Solidity, are associated with the highest average salaries, indicating a premium on niche expertise.
5. Optimal Skills for Job Market Value: SQL leads in demand and offers a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.

# Closing Thoughts

This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics.
