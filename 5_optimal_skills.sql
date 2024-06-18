/*
 Question: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
 - Identify skills in high demand and associated with high average salaries for Data Analyst roles
 - Concentrate on remote positions with specified salaries
 - Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
   offering strategic insights for career development in data analysis
 */
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
    job_title_short = 'Data Analyst'
    and salary_year_avg is not null
    and job_work_from_home = true
group by
    skills_dim.skill_id, skills_dim.skills
having
    count(skills_job_dim.job_id) > 10
order by
    avg_salary desc,
    demand_count desc
limit
    25;

/*
### Insights into Top Skills for Data Analysts

1. **Python**: Python tops the list with the highest demand count of 236 and an average salary of $101,397. This underscores Python's critical role in data analysis and its strong demand in the job market.

2. **R**: R follows closely with 148 job postings mentioning it, indicating significant usage in data analytics projects. The average salary associated with R skills is $100,499.

3. **Looker**: Despite a lower demand count of 49, Looker stands out with an average salary of $103,795, suggesting it is a high-paying skill in demand among remote Data Analyst roles.

4. **SAS**: Both "SAS" and "sas" are listed separately, each with 63 mentions and an average salary of $98,902. This indicates a consistent demand for SAS skills across different job postings.

5. **Tableau**: With a demand count of 230 and an average salary of $99,288, Tableau remains a highly sought-after skill for data visualization and analysis.

6. **Java**: Java, with a demand count of 17 and an average salary of $106,906, shows that proficiency in this programming language can also lead to lucrative opportunities in data analysis.

7. **Snowflake**, **Azure**, **AWS**, and **BigQuery**: These cloud and database technologies show robust demand (ranging from 13 to 37 mentions) and competitive average salaries ranging from $108,317 to $112,948, reflecting their importance in modern data environments.

8. **Confluence**, **Hadoop**, **Oracle**, and **JIRA**: These skills, while having fewer mentions than some others, still command respectable average salaries (ranging from $101,414 to $114,210), indicating their specific niche value in data analysis roles.

Overall, the data highlights the diverse skill set valued in the data analyst field, with a clear emphasis on programming languages, data visualization tools, cloud technologies, and specialized data management systems. Candidates looking to enhance their marketability in this field should consider mastering these skills based on their career objectives and interests within data analysis.
*/
